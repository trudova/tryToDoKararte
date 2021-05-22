Feature: uploade API functionality using karate

  Background: create and initialise base URL
    Given url "https://jobportalkarate.herokuapp.com"
  Scenario: upload the file
    Given path '/normal/webapi/upload'
    # need to specify location of the file
      # name f the file, content-type header value
    And multipart file file = {read:'file.txt', filename: 'file.txt', Content-Type: 'multipart/form-data;' }
    When method post
    Then status 200
    And print response

  Scenario: upload the file fron different location
    Given path '/normal/webapi/upload'
    # need to specify location of the file
      # name f the file, content-type header value
    * def fileLocation = 'com/api/automation/postRequest/posrData/jobEntry.json'
    And multipart file file = {read:'#(fileLocation)', filename: 'jobEntry.json, Content-Type: 'multipart/form-data;' }
    When method post
    Then status 200
    And print response
    And match response.message contains 'jobEntry.json'