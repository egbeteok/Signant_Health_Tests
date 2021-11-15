*** Settings ***
Documentation   Test that user can register on the portal, login and review user details
Resource    ../resources/resource_demo_app_user.robot


*** Test Cases ***
Register as a new user through web portal
    Launch browser and open web portal
    Register new user with personal details
    Assert that new user is successfully registered


Review my own user information from the main view
    Launch browser and open web portal
    Login with user details
    Assert that user information is displayed on main view






