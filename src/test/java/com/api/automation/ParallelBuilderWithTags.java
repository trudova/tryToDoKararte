package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ParallelBuilderWithTags {
    @Test
    public void executeKarateTest() {
        Builder aRanner = new Builder();
        aRanner.path(ConfigurationReader.getProperty("classPath"));
        aRanner.tags("@smoke");
        aRanner.parallel(5);

        // Assertions.assertEquals(0,results.getScenariosFailed(),"there are some failed scenario");
    }
}
