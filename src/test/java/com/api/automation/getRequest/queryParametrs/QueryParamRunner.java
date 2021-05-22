package com.api.automation.getRequest.queryParametrs;

import com.intuit.karate.junit5.Karate;

public class QueryParamRunner {
    @Karate.Test
    public Karate runJsonPath(){
        return Karate.run("queryParametr").relativeTo(getClass());
    }
}
