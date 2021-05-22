Feature: To send the get request with JWT token
  GET https://jobapplicationjwt.herokuapp.com/auth/webapi/all

  Scenario: verify sign in functionality
  with token authentication works as expected
    * def token = call read('../../getToken.feature') { username:'user', password: 'user'}
    Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
    And headers {Accept: 'application/json', Authorization: '#("Bearer " + token.authToken)'}
    When method get
    Then status 200

  Scenario: verify sign in functionality with no token
  with token authentication works as expected
    * def token = call read('../../getToken.feature') { username:'user', password: 'user'}
    Given url 'https://jobapplicationjwt.herokuapp.com/auth/webapi/all'
    And headers {Accept: 'application/json'}
    When method get
    Then status 401