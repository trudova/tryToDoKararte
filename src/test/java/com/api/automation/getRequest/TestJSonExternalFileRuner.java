package com.api.automation.getRequest;

import com.intuit.karate.junit5.Karate;

public class TestJSonExternalFileRuner {
    @Karate.Test
    public Karate runTest() {
        return  Karate.run("validateResponsFile").relativeTo(getClass());
    }
}
