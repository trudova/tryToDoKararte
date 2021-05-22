package com.api.automation.secure.getRequest;

import com.intuit.karate.junit5.Karate;

public class authorisedGetRunner {
    @Karate.Test
    public Karate runTests(){
        return Karate.run("secureGetRequest","secureWithToken").relativeTo(getClass());
    }
}
