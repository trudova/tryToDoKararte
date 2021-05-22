package com.api.automation.postRequest.fileUpload;

import com.intuit.karate.junit5.Karate;

public class fileUplodeRunner {

    @Karate.Test
    public Karate runUpload(){
        return Karate.run("fileUploadFunctionality").relativeTo(getClass());
    }
}
