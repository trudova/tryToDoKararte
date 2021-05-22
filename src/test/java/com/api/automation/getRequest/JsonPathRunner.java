package com.api.automation.getRequest;

import com.intuit.karate.junit5.Karate;

public class JsonPathRunner {
    @Karate.Test
    public Karate runJsonPath(){
        return Karate.run("jsonPathExprasion").relativeTo(getClass());
    }
}
