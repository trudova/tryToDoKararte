package com.api.automation.deletRequest;

import com.intuit.karate.junit5.Karate;

public class DeleteRequestRunner {
    @Karate.Test
    public Karate runJsonPath(){
        return Karate.run("deleteRequest").relativeTo(getClass());
    }
}
