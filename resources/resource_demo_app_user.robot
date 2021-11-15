*** Settings ***
Documentation   Test that user can register on the portal, login and review user details
Library     SeleniumLibrary
Library  FakerLibrary



*** Variables ***
${URL}                  http://localhost:8080/
${BROWSER}              Headless Chrome
${REGISTRATION}         xpath:/html/body/nav/ul/li[1]/a
${LOGIN}                xpath:/html/body/nav/ul/li[2]/a
${USERNAME}             okechukwu
${PASSWORD}             0987654321
${USERNAME_FIELD}       id:username
${PASSWORD_FIELD}       id:password
${FIRSTNAME_FIELD}      name:firstname
${FAMILYNAME_FIELD}     id:lastname
${FIRSTNAME}            Okechukwu
${FAMILYNAME}           Egbete
${PHONE_FIELD}          id:phone
${PHONE_NUMBER}         0446667777
${REGISTER}             xpath:/html/body/section/form/input[6]
${SignIn}               xpath:/html/body/section/form/input[3]



*** Keywords ***
Launch browser and open web portal
    Open Browser    ${URL}    ${BROWSER}
Register new user with personal details
    Click element   ${REGISTRATION}
    Input text      ${USERNAME_FIELD}       ${USERNAME}
    Input text      ${PASSWORD_FIELD}       ${PASSWORD}
    Input text      ${FIRSTNAME_FIELD}      ${FIRSTNAME}
    Input text      ${FAMILYNAME_FIELD}     ${FAMILYNAME}
    Input text      ${PHONE_FIELD}          ${PHONE_NUMBER}
    Click element   ${REGISTER}
Assert that new user is successfully registered
    Page should contain     Log In
Login with user details
    Open Browser    ${URL}    ${BROWSER}
    Click element   ${LOGIN}
    Input text      ${USERNAME_FIELD}       ${USERNAME}
    Input text      ${PASSWORD_FIELD}       ${PASSWORD}
    Click element   ${SignIn}

Assert that user information is displayed on main view
    Page should contain     ${USERNAME}
    Page should contain     ${FIRSTNAME}
    Page should contain     ${FAMILYNAME}
    Page should contain     ${PHONE_NUMBER}