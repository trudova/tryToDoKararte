Feature: GET end point response validation

  Background: set up Base path
    Given url 'https://jobportalkarate.herokuapp.com'

  @ignore
  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200


  @ignore
  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response

  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response ==
    """
    [
    {
        "jobId": 1,
        "jobTitle": "Software Engg",
        "jobDescription": "To develop andriod application",
        "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
        ],
        "project": [
            {
                "projectName": "Movie App",
                "technology": [
                    "Kotlin",
                    "SQL Lite",
                    "Gradle"
                ]
            }
        ]
    }
]
    """


  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response ==
    """
<List>
    <item>
        <jobId>1</jobId>
        <jobTitle>Software Engg</jobTitle>
        <jobDescription>To develop andriod application</jobDescription>
        <experience>
            <experience>Google</experience>
            <experience>Apple</experience>
            <experience>Mobile Iron</experience>
        </experience>
        <project>
            <project>
                <projectName>Movie App</projectName>
                <technology>
                    <technology>Kotlin</technology>
                    <technology>SQL Lite</technology>
                    <technology>Gradle</technology>
                </technology>
            </project>
        </project>
    </item>
</List>
    """

  @ignore
  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    And match response contains deep {"jobDescription": "To develop andriod application"}
    And match response contains deep {"project":[{"projectName": "Movie App"}]}
    And match header Content-Type =='application/json'
    And match header Connection =='keep-alive'
