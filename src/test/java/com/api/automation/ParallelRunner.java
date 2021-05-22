package com.api.automation;


import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import java.util.Random;

import static com.intuit.karate.Runner.parallel;

public class ParallelRunner {
    @Test
    public void executeKarateTest(){
       //Runner.parallel(getClass(),5);
        Runner.Builder aRanner = new Runner.Builder();
        aRanner.path("classpath:com/api/automation");
        aRanner.parallel(5);
      //  parallel(aRanner);
    }
}
