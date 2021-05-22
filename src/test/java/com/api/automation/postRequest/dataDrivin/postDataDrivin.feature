Feature: test the same end point against different data

  Background: red the data from csv
    * def testdata = read("testData.csv")

  Scenario Outline: test the same end point against different data <method>
    Given print '<url>'
    Then print '<path>'
    When print '<method>'
    And print '<status>'
    Examples:
      | url                                   | path               | method | status |
      | https://jobportalkarate.herokuapp.com | /normal/webapi/all | get    | 200    |
      | https://jobportalkarate.herokuapp.com | /normal/webapi/add | post   | 201    |

  Scenario Outline: job description entry verification <jobId>
    Given url 'https://jobportalkarate.herokuapp.com'
    And path "/normal/webapi/add"
    And request { "jobId": '#(jobId)', "jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)', "experience": [ "Google", "Apple", "Mobile Iron", "comcast"], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite", "Gradle" ] } ] }
    And headers {Accept: "application/json", Content-Type: "application/json" }
    When method post
    Then status <status>
    Examples:
      | jobId | jobTitle      | jobDescription                 | status |
      | 456   | Software Engg | To develop andriod application | 201    |
      | id    | Software Engg | To develop andriod application | 400    |
      | false | Software Engg | To develop andriod application | 400    |


  Scenario Outline: job description entry verification using csv file <jobId>
    Given url 'https://jobportalkarate.herokuapp.com'
    And path "/normal/webapi/add"
    And request { "jobId": '#(jobId)', "jobTitle": '#(jobTitle)', "jobDescription": '#(jobDescription)', "experience": [ "Google", "Apple", "Mobile Iron", "comcast"], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite", "Gradle" ] } ] }
    And headers {Accept: "application/json", Content-Type: "application/json" }
    When method post
    And status <status>
    Examples:
     # | testdata |
      | read("testData.csv") |


