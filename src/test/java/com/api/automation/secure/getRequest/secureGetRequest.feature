Feature: to test GET end point with basic auth

  Background: set up Base path
    Given url 'https://jobportalkarate.herokuapp.com'
    And print 'background gets accused'

  Scenario: verify basic authentication works as accepted
      Given path '/secure/webapi/all'
      And headers {Accept: 'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ=='}
      When  method get
      Then status 200
      And match response =='#notnull'

  Scenario: verify functionality works properly
    Given path '/secure/webapi/all'
    And headers {Accept: 'application/json'}
    When  method get
    Then status 401
    And match response =='#notnull'

  Scenario: verify basic authentication with wrong credentials
    Given path '/secure/webapi/all'
    And headers {Accept: 'application/json', Authorization: 'Basic YXV0aHRvcjp3ZWxjb21l'}
    When  method get
    Then status 401
    And match response =='#notnull'

#  Scenario: To access the GET end point with basic auth via js function
#    Given path '/secure/webapi/all'
#    * def auth = call read('../../basicAuth.js') {username:'admin',password:'welcome'}
#    And print "This is Encoded string ==> ", auth
#    And headers {Accept:'application/json', Authorization:'#(auth)'}
#    When method get
#    Then status 200
#    And match response == '#notnull'