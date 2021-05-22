package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;

public class PostRequestRunner {
    @Karate.Test
    public Karate runTest(){
        return Karate.run("createJobEntryPostRequest", "scimaValidation").relativeTo(getClass());
    }
}
