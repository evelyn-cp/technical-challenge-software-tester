*** Settings ***
Variables    ../../resources/test_data/pet_data.py

*** Variables ***
# URLs
${Url}    https://demoqa.com/login
${ProfileUrl}    https://demoqa.com/profile
${ApiUrl}    https://petstore.swagger.io/v2

# Browser
${Browser}    Chrome

# Pet Store
${PetStatus1}    available
${PetStatus2}    pending
${PetStatus3}    sold
${ValidPetId}    ${VALID_PET['id']}
${PetName}    ${VALID_PET['name']}