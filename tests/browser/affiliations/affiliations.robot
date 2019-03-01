*** Settings ***

Resource        tests/HEDA.robot
Suite Setup     Open Test Browser
Suite Teardown  Delete Records and Close Browser

*** Test Cases ***

Validate Edit Mode For Affiliations, Settings
    [tags]  unstable
    Go To Heda Settings
    Wait Until Element Is visible	//a[contains(text(),'Affiliations')]
    Click Link				//a[contains(text(),'Affiliations')]

    #Select Affiliation Mappings tabs and change settings
    Click Link                      //a[contains(@class, 'affl-mappings-menulink') and contains(text(),'Affiliation Mappings')]
    Click Element                   //div[@class='slds-button-group']//span[contains(text(), 'Edit')]
    Wait Until Element Is visible   //div[@class='slds-button-group']//span[contains(text(), 'Save')]
    Click Element                   //span[contains(text(), 'Academic Program')]/following::span[contains(text(), 'Primary Academic Program')]/following::label[contains(@class, 'slds-checkbox')]
    Input Text                      //input[contains(@class, 'mapping-enroll-status') and @type='text']     Current
    Input Text                      //input[contains(@class, 'mapping-enroll-role') and @type='text']     Student
    Click Element                   //div[@class='slds-button-group']//span[contains(text(), 'Save')]
    # Textfield Value Should Be       //div[@class='slds-tabs--scoped']//input[@type='text']      StatusTest1

*** Keywords ***




