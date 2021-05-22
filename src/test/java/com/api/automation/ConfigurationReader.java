package com.api.automation;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ConfigurationReader {

    /// implementing from configuration.properties file
    //
    private static Properties properties = new Properties();

    static {
        try {
            FileInputStream file =new FileInputStream("configuration.properties");
            properties.load(file);
            //closing file in JVM memory
            file.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public static String getProperty(String keyWord){
        return properties.getProperty(keyWord);
    }
    //
}
