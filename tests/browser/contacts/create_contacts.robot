*** Settings ***

Resource        tests/HEDA.robot
Suite Setup     Open Test Browser
Suite Teardown  Delete Records and Close Browser

*** Test Cases ***

Create Contact With Name Only
    ${contact_id} =  Create And Return Contact
    &{contact} =  Salesforce Get  Contact  ${contact_id} 
    #Header Field Value    Account Name    &{contact}[LastName] Household
    Go To Object Home         Contact
    Verify Record    &{contact}[FirstName] &{contact}[LastName]

    
Create Contact With Name and Email
    [tags]  unstable
    ${contact_id} =  Create And Return Contact with Email
    &{contact} =  Salesforce Get  Contact  ${contact_id}
    #Header Field Value    Account Name    &{contact}[LastName] Household
    #Header Field Value    Email    dshattuck@salesforce.com
    Go To Object Home         Contact
    Verify Record    &{contact}[FirstName] &{contact}[LastName]

    
Create Contact with Name and Address
    ${contact_id} =  Create And Return Contact with Address
    &{contact} =  Salesforce Get  Contact  ${contact_id}
    #Header Field Value    Account Name    &{contact}[LastName] Household
    Select Tab    Details 
    Page Should Contain    5544 Highland Avenue  
    Go To Object Home         Contact
    Verify Record    &{contact}[FirstName] &{contact}[LastName]

         