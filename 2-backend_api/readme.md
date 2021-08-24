# Overview
Creating and deploying the Program Feedback API

Azure Functions lets you connect Azure services and other resources to functions without having to write your own integration code.  These bindings, which represent both input and output, are declared within the function definition. Data from bindings is provided to the function as parameters.  A trigger is a special type of input binding.  Although a function has only one trigger, it can have multiple input and output bindings.

> **NOTE**: You will require information about Users and Programs. Three APIs have already been created for getting info about Users and Programs:
> * [Get Programs](https://hack.azure-api.net/api/GetPrograms)
> * [Get Program](https://hack.azure-api.net/api/GetProgram?programId=1cd8cf30-e821-44cf-b3ac-44cf6b4f2b19) (expects `programId` query parameter)
> * [Get Users](https://hack.azure-api.net/api/GetUsers)
> * [Get User](https://hack.azure-api.net/api/GetUser?userId=2c82e013-2166-47ba-b5d6-b427e814802a) (expects a `userId` query parameter)

# Challenges
1. Create the Feedback API

    Create and deploy three new Functions in the Function App.

    A. SubmitFeedback Function

    * **Verb**: POST

    * **Payload**:
        ```JSON
        {
        "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
        "programId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
        "followup": "False",
        "rating": 5,
        "userNotes": "Great Program"
        }
        ```

    * **Requirements**
        * Validate both `userId` and `programId` by calling the existing API endpoints. You can find a user id to test with from the sample payload above
        * Add a property called `id` with a GUID value
        * Add a property called `timestamp` with the current UTC date time
        * Validate that the `rating` field is an integer from 0 to 5
        * Validate the `rating` 
        * Use a data service to store the ratings information to the backend
        * Return the entire review JSON payload with the newly created `id` and `timestamp`

    * **Output**:
        ```JSON
        {
        "id": "79c2779e-dd2e-43e8-803d-ecbebed8972c",
        "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
        "programId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
        "timestamp": "2018-05-21 21:27:47Z",
        "followup": "False",
        "rating": 5,
        "userNotes": "Great Program"
        }
        ```

    B. GetFeedback Function

    * **Verb**: GET

    * **Input**: The Feedback `feedbackId` as a query string or route parameter

    * **Requirements**
        * Get the rating from your database and return the entire JSON payload for the review identified by the id
        * Additional route parameters or query string values may be used if necessary.

    * **Output**:
        ```JSON
        {
        "id": "79c2779e-dd2e-43e8-803d-ecbebed8972c",
        "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
        "programId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
        "timestamp": "2018-05-21 21:27:47Z",
        "followup": "True",
        "rating": 5,
        "userNotes": "Bad experiance"
        }
        ```

    C. GetUserFeedback Function

    * **Verb**: GET

    * **Input**: The `userId` as a query string or route parameter

    * **Requirements**
        * Get the ratings for the user from your database and return the entire JSON payload for the reviews for the user identified by the id.
        * Additional route parameters or query string values may be used if necessary.
        
    * **Output**:
        ``` JSON
        [
        {
            "id": "79c2779e-dd2e-43e8-803d-ecbebed8972c",
            "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
            "programId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
            "timestamp": "2018-05-21 21:27:47Z",
            "followup": "False",
            "rating": 5,
            "userNotes": "Love it"
        },
        {
            "id": "8947f7cc-6f4c-49ed-a7aa-62892eac8f31",
            "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
            "programId": "e4e7068e-500e-4a00-8be4-630d4594735b",
            "timestamp": "2018-05-20 09:02:30Z",
            "followup": "True",
            "rating": 4,
            "userNotes": "Needs some work"
        }
        ]
        ```

# Reference

* [Supported languages in Azure Functions](https://docs.microsoft.com/azure/azure-functions/supported-languages)

* [Azure Functions triggers and bindings concepts](https://docs.microsoft.com/azure/azure-functions/functions-triggers-bindings)

* [Azure Functions HTTP and webhook bindings](https://docs.microsoft.com/azure/azure-functions/functions-bindings-http-webhook)

* [Introduction to Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction)

* [Azure Cosmos DB bindings for Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-bindings-cosmosdb-v2)

* [Store unstructured data using Azure Functions and Azure Cosmos DB](https://docs.microsoft.com/azure/azure-functions/functions-integrate-store-unstructured-data-cosmosdb)

* [Getting started with JSON features in Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-json-features)

* [Azure Table storage overview](https://docs.microsoft.com/azure/cosmos-db/table-storage-overview)
