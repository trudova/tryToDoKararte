package com.api.automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {
    @Test
    public void executeKarateTest() {
        Builder aRanner = new Builder();
        aRanner.path("classpath:com/api/automation");
        Results results = aRanner.parallel(5);
        System.out.println("TOTAL FEATURE"+results.getFeaturesTotal());
        System.out.println(results.getScenariosTotal());
        System.out.println(results.getScenariosFailed());
        Assertions.assertEquals(0,results.getScenariosFailed(),"there are some failed scenario");
    }
}
