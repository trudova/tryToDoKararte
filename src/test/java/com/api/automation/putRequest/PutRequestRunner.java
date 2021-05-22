package com.api.automation.putRequest;

import com.intuit.karate.junit5.Karate;

public class PutRequestRunner {
    @Karate.Test
    public Karate runTest(){
        return Karate.run("putRequest").relativeTo(getClass());
    }
    @Karate.Test
    public Karate runTestDynamicID(){
        return Karate.run("putRequestWithDynamicID").relativeTo(getClass());
    }
}
