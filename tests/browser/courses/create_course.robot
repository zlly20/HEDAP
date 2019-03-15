*** Settings ***

Resource        tests/HEDA.robot
Suite Setup     Open Test Browser
Suite Teardown  Delete Records and Close Browser

*** Test Cases ***

# Create A New Course

#     Click Page Button       Next
#     ${account_id} =  API Create Specific Organization Account      Test

#      &{account} =  API Create Organization Account   
#      ${course} =  API Create And Return Specific Course     ${account_id}   History
    
Create A Contact


    Go To Object Home                       Contact

    Wait Until Element Is visible           //a[@title='New']//div[@title='New']
    Click Element                           //a[@title='New']//div[@title='New']

    Wait Until Element Is visible           //input[contains(@class,'firstName')]
    Click Element                           //input[contains(@class,'firstName')]

    

    Input Text                              //input[contains(@class,'firstName')]    firstName

    Click Element                           //input[contains(@class,'lastName')]
    Input Text                              //input[contains(@class,'lastName')]     lastName

    Click Element                           //button[@title='Save']

    Click Element                           (//following::div[@class='slds-no-flex']//div[@class='actionsContainer']//div[@title='New'])[4]

    Wait Until Element Is visible           //div[@class='autocompleteWrapper slds-grow']//input[@class=' default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input uiInput uiAutocomplete uiInput--default uiInput--lookup']
    Populate Field                          Program    lastName Administrative Account

    #Input Text                              //div[@class='autocompleteWrapper slds-grow']//input[@class=' default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input uiInput uiAutocomplete uiInput--default uiInput--lookup']     ENTER
    #Sleep                                   10
    #Press Keys                              //div[@class='autocompleteWrapper slds-grow']//input[@class=' default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input uiInput uiAutocomplete uiInput--default uiInput--lookup']    ARROW_DOWN
    #Press Keys                              //div[@class='autocompleteWrapper slds-grow']//input[@class=' default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input uiInput uiAutocomplete uiInput--default uiInput--lookup']    ARROW_DOWN
    #Press Keys                              //div[@class='autocompleteWrapper slds-grow']//input[@class=' default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input uiInput uiAutocomplete uiInput--default uiInput--lookup']    ARROW_DOWN
    #Press Keys                              //div[@class='autocompleteWrapper slds-grow']//input[@class=' default input uiInput uiInputTextForAutocomplete uiInput--default uiInput--input uiInput uiAutocomplete uiInput--default uiInput--lookup']    ENTER


    Click Element                           //span[@title='New Account']
    Wait Until Element Is visible           //button[@class='slds-button slds-button--neutral uiButton--default uiButton--brand uiButton']//span[@class=' label bBody']
    Click Element                           //button[@class='slds-button slds-button--neutral uiButton--default uiButton--brand uiButton']//span[@class=' label bBody']

    Wait Until Element Is visible           //input[@class='input uiInput uiInputText uiInput--default uiInput--input']
    Populate Field                          Account Name    Robot Account

    Wait Until Element Is visible           (//button[@class='slds-button slds-button--neutral uiButton--default uiButton--brand uiButton forceActionButton']//span[contains(text(), 'Save')])[2]
    Click Element                           (//button[@class='slds-button slds-button--neutral uiButton--default uiButton--brand uiButton forceActionButton']//span[contains(text(), 'Save')])[2]

    Wait Until Element Is visible           //div[@class='modal-footer slds-modal__footer']//button[@title='Save']
    Click Element                           //div[@class='modal-footer slds-modal__footer']//button[@title='Save']

    Sleep                                   10

#Create Contact With Name Only

#    ${contact_id} =  Create And Return Contact
#    &{contact} =     Salesforce Get  Contact  ${contact_id} 
#    #Header Field Value    Account Name    &{contact}[LastName] Household
#    Go To Object Home         Contact
#    Verify Record    &{contact}[FirstName] &{contact}[LastName]

#Create A Program Enrollment
