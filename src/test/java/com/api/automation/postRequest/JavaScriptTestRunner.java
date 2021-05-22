package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;

public class JavaScriptTestRunner {
    @Karate.Test
    public Karate runTest(){
        return Karate.run("javaScriptExicuter").relativeTo(getClass());
    }
}
