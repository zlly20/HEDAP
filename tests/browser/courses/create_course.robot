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



Create Contact With Name Only
    ${contact_id} =  Create And Return Contact
    &{contact} =  Salesforce Get  Contact  ${contact_id} 
    #Header Field Value    Account Name    &{contact}[LastName] Household
    Go To Object Home         Contact
    Verify Record    &{contact}[FirstName] &{contact}[LastName]

#Create A Program Enrollment
