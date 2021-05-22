package com.api.automation.postRequest.dataDrivin;

import com.intuit.karate.junit5.Karate;
import org.checkerframework.checker.units.qual.K;

public class DataDrivenRunner {
    @Karate.Test
    public Karate runSOutline(){
        return Karate.run("postDataDrivin").relativeTo(getClass());
    }
}
