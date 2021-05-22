package com.api.automation.getRequest;

import com.intuit.karate.junit5.Karate;


public class TestGetRunner {
    @Karate.Test
    public Karate runTest() {
      return   Karate.run("getRequest","responseMatcher",
              "responseMatcherJSON","complexFuzzyMatcher","validateResponsFile",
              "validateResponsFile").tags("~@ignore").relativeTo(getClass());
    }
    @Karate.Test
    public Karate runTestPath(){
       return Karate.run("classpath:com/api/automation/getRequest/variablesInKarate.feature");
    }
}
