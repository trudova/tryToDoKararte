Feature: GET end point response validation

  Background: set up Base path
    Given url 'https://jobportalkarate.herokuapp.com'

  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == 1
    And match response.[0].experience[0] == 'Google'
    And match response.[0].project[0].technology[2] == 'Gradle'
    #validate size of arr
    And match response.[0].experience == '#[3]'
    And match response.[0].project[0].technology == '#[3]'
    #validate the whole array using [*]- wiled card char
    And match response.[0].experience[*] == [ "Google","Apple","Mobile Iron"]
    And  match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
    # part of array using contains key word
    And match response.[0].project[0].technology[*] contains ["SQL Lite"]
    And match response.[0].experience[*] contains ["Google","Apple"]

    # same thing but in xml format in case of XML index starts from 0 and
  #we use absolute XPath


  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response/List/item/jobId == "1"
    And match response/List/item/experience/experience[1] == "Google"
    And match response/List/item/project/project/technology/technology[2] == "SQL Lite"
# skip response keyword still will do validation
    And match /List/item/project/project/technology/technology[2] == "SQL Lite"
    # we can use dot operator instead of slash . ->/
    # but the index in this case will start from 0
    And match response.List.item.project.project.technology.technology[1] == "SQL Lite"


    # fuzzy matchers giving more flexibility and validate the data structure or data type
  #or the notNull or is present

  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == '#present'
    And match response.[0].experience[0] == '#notnull'
    And match response.[0].project[0].projectName == '#ignore'
    And match response.[0].project[0].technology[2] == '#string'
    And match response.[0].project[0].technology =='#array'
    And match response.[0].jobId == '#number'

    #fuzzy matchers for XML format
  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And print response
    And match response/List/item/jobId == "#notnull"
    And match response/List/item/experience/experience[1] == "#string"
    And match response/List/item/experience/experience == "#array"
    And match response/List/item/project/project/technology/technology[2] == "#string"
# skip response keyword still will do validation
    And match /List/item/project/project/technology/technology[2] == "#present"
    # we can use dot operator instead of slash . ->/
    # but the index in this case will start from 0
    And match response.List.item.project.project.technology.technology[1] == "#ignore"