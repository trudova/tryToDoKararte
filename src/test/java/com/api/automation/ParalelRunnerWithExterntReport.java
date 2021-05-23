package com.api.automation;

import com.api.automation.config.report.CustomExtentReport;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class ParalelRunnerWithExterntReport {
    @Test
    public void executeKarateTest() {
        Runner.Builder aRanner = new Runner.Builder();
        aRanner.path("classpath:com/api/automation");
        Results results = aRanner.parallel(5);
        CustomExtentReport extentReport = new CustomExtentReport()
                .withKarateResult(results)
                .withReportDir(results.getReportDir())
                .withReportTitle("Karate test execution Report");
               extentReport.generateExtentReport();
    }
}
