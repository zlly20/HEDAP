*** Settings ***

Resource        tests/HEDA.robot
Suite Setup     Open Test Browser
Suite Teardown  Delete Records and Close Browser

*** Test Cases ***

Validate Edit Mode For Affiliations, Settings
    [tags]  unstable
    Go To Heda Settings
    Wait Until Element Is visible	//a[contains(text(),'Affiliations')]
    Click Link			            //a[contains(text(),'Affiliations')]

    #Select Affiliation Mappings tabs and change settings
    Click Link                      //a[contains(@class, 'affl-mappings-menulink') and contains(text(),'Affiliation Mappings')]

    #Click on 'Edit' button to go into edit mode
    Click Element                   //div[@class='slds-button-group']//span[contains(text(), 'Edit')]
    Wait Until Element Is visible   //div[@class='slds-button-group']//span[contains(text(), 'Save')]
    Click Element                   //span[contains(text(), 'Academic Program')]/following::span[contains(text(), 'Primary Academic Program')]/following::label[contains(@class, 'slds-checkbox')]

    Input Text                      //input[contains(@class, 'mapping-enroll-status') and @type='text']     Current
    Input Text                      //input[contains(@class, 'mapping-enroll-role') and @type='text']     Student

    
    # Textfield Value Should Be       //div[@class='slds-tabs--scoped']//input[@type='text']      StatusTest1

    #Note:  we are still in 'Edit' mode 
    Click Link                      //a[contains(@class, 'affl-settings-menulink') and contains(text(),'Settings')]

    Select From List By Value       //select[contains(@class, 'affiliation-role-picklist-input-select')]    Student
    Select From List By Value       //select[contains(@class, 'affiliation-status-picklist-input-select')]    Current

    #Save
    Click Element                   //div[@class='slds-button-group']//span[contains(text(), 'Save')]
    Wait Until Element Is visible   //div[@class='slds-button-group']//span[contains(text(), 'Edit')]


#Create a new contact
Add New Contact to Household With Different LastName 
    &{contact1} =  API Create And Return Contact    Email=dshattuck@robot.com
    Go To Record Home  &{contact1}[AccountId]
    #Create a new contact under HouseHold Validation
    ${contact_id2} =  New And Return Contact for HouseHold
    &{contact2} =  Salesforce Get  Contact  ${contact_id2}
    Header Field Value    Account Name    &{contact1}[LastName] and &{contact2}[LastName] Household

    Sleep   3

    #Create a  Contact
    
    #Create a  Term
    #Create a  Course
    #Create a  Course Offering
    #Create a  Program Plan
    #Create a  Program Enrollment
    


*** Keywords ***




