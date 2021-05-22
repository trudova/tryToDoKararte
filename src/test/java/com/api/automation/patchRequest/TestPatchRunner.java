package com.api.automation.patchRequest;

import com.intuit.karate.junit5.Karate;


public class TestPatchRunner {
    @Karate.Test
    public Karate runTest() {
      return   Karate.run("patchRequest").relativeTo(getClass());
    }
    @Karate.Test
    public Karate runTestPath(){
       return Karate.run("classpath:com/api/automation/getRequest/variablesInKarate.feature");
    }
}
