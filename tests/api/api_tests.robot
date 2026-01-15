*** Settings ***
Library    RequestsLibrary
Variables    ../../resources/test_data/pet_data.py
Resource     ../../resources/config/variables.robot

*** Test Cases ***
GET Pet by Status Available
    ${response}=    GET    ${ApiUrl}/pet/findByStatus    params=${{ {"status": "${PetStatus1}"} }}   expected_status=200
    Log    ${response.json()}
    Log    Status Code: ${response.status_code}

POST Add New Pet
    ${response}=    POST    ${ApiUrl}/pet    json=${VALID_PET}    expected_status=200
    Log    The pet ${PetName} was created successfully.
    Log    ${response.json()}
    Log    Status Code: ${response.status_code}

DELETE Pet by ID
    ${response}=    DELETE    ${ApiUrl}/pet/${ValidPetId}    expected_status=200
    Log    The pet ${PetName} was deleted successfully.
    Log    Pet Id: ${ValidPetId}
    Log    ${response.json()}
    Log    Status Code: ${response.status_code}

GET Pet by ID
    ${response}=    GET    ${ApiUrl}/pet/${ValidPetId}    expected_status=404
    Log    Pet not found.
    Log    ${response.json()}
    Log    Status Code: ${response.status_code}