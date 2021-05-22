package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.checkerframework.checker.units.qual.C;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ParallelBuilderWithCucumberReport {
    @Test
    public void executeKarateTest() {
        Builder aRanner = new Builder();
        aRanner.path(ConfigurationReader.getProperty("classPath"));
        aRanner.tags("@smoke");
      Results results= aRanner.parallel(5);
        generateCucumberReport(results.getReportDir());

        // Assertions.assertEquals(0,results.getScenariosFailed(),"there are some failed scenario");
       // /Users/liubovtrudova/Desktop/IntelliJ_Project/tryToDoKararte/target/surefire-reports
    }
    public void generateCucumberReport(String reportDirLocation){
        File reportDir = new File(reportDirLocation);
     Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[]{"json"}, true);

        List<String > jsonFiles = new ArrayList<>();
        jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
        Configuration configuration = new Configuration(reportDir,"KARATE PROJ");

        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles,configuration);
        reportBuilder.generateReports();
    }
}
