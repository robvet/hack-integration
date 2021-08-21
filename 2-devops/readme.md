# Overview
Creating and deploying the Program Feedback API with GitHub and Actions.

Azure Functions lets you connect Azure services and other resources to functions without having to write your own integration code.  These bindings, which represent both input and output, are declared within the function definition. Data from bindings is provided to the function as parameters.  A trigger is a special type of input binding.  Although a function has only one trigger, it can have multiple input and output bindings.

> **NOTE**: You will require information about Users and Products. Three APIs have already been created for getting info about Users and Products:
> * [Get Products](https://serverlessohapi.azurewebsites.net/api/GetProducts)
> * [Get Product](https://serverlessohapi.azurewebsites.net/api/GetProduct?productId=75542e38-563f-436f-adeb-f426f1dabb5c) (expects `productId` query parameter)
> * [Get Users](https://serverlessohapi.azurewebsites.net/api/GetUsers)
> * [Get User](https://serverlessohapi.azurewebsites.net/api/GetUser?userId=cc20a6fb-a91f-4192-874d-132493685376) (expects a `userId` query parameter)

# Challenges

1. Implement source control and a CI/CD solution.  The solution should deploy the Program Feedback API when there is a change to the "main" branch and the build is successful.

2. Create the Feedback API

    Create and deploy three new Functions in the Function App.

    A. CreateRating Function

    * **Verb**: POST

    * **Payload**:
        ```JSON
        {
        "userId": "cc20a6fb-a91f-4192-874d-132493685376",
        "productId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
        "locationName": "Sample ice cream shop",
        "rating": 5,
        "userNotes": "I love the subtle notes of orange in this ice cream!"
        }
        ```

    * **Requirements**
        * Validate both `userId` and `productId` by calling the existing API endpoints. You can find a user id to test with from the sample payload above
        * Add a property called `id` with a GUID value
        * Add a property called `timestamp` with the current UTC date time
        * Validate that the `rating` field is an integer from 0 to 5
        * Use a data service to store the ratings information to the backend
        * Return the entire review JSON payload with the newly created `id` and `timestamp`

    * **Output**:
        ```JSON
        {
        "id": "79c2779e-dd2e-43e8-803d-ecbebed8972c",
        "userId": "cc20a6fb-a91f-4192-874d-132493685376",
        "productId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
        "timestamp": "2018-05-21 21:27:47Z",
        "locationName": "Sample ice cream shop",
        "rating": 5,
        "userNotes": "I love the subtle notes of orange in this ice cream!"
        }
        ```

    B. GetRating Function

    * **Verb**: GET

    * **Input**: The `ratingId` as a query string or route parameter

    * **Requirements**
        * Get the rating from your database and return the entire JSON payload for the review identified by the id
        * Additional route parameters or query string values may be used if necessary.

    * **Output**:
        ```JSON
        {
        "id": "79c2779e-dd2e-43e8-803d-ecbebed8972c",
        "userId": "cc20a6fb-a91f-4192-874d-132493685376",
        "productId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
        "timestamp": "2018-05-21 21:27:47Z",
        "locationName": "Sample ice cream shop",
        "rating": 5,
        "userNotes": "I love the subtle notes of orange in this ice cream!"
        }
        ```

    C. GetRatings Function

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
            "userId": "cc20a6fb-a91f-4192-874d-132493685376",
            "productId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
            "timestamp": "2018-05-21 21:27:47Z",
            "locationName": "Sample ice cream shop",
            "rating": 5,
            "userNotes": "I love the subtle notes of orange in this ice cream!"
        },
        {
            "id": "8947f7cc-6f4c-49ed-a7aa-62892eac8f31",
            "userId": "cc20a6fb-a91f-4192-874d-132493685376",
            "productId": "e4e7068e-500e-4a00-8be4-630d4594735b",
            "timestamp": "2018-05-20 09:02:30Z",
            "locationName": "Another Sample Shop",
            "rating": 4,
            "userNotes": "I really enjoy this grape ice cream!"
        }
        ]
        ```

3. (Optional) Create a "Blue Green" deployment approach with GitHub actions.

# Reference


https://resources.github.com/devops/

https://martinfowler.com/bliki/BlueGreenDeployment.html

### OLD
* [What is Continuous Integration?](https://docs.microsoft.com/devops/develop/what-is-continuous-integration)

* [What is Continuous Delivery?](https://docs.microsoft.com/devops/deliver/what-is-continuous-delivery)

* [Continuous deployment for Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-continuous-deployment)

* [Azure DevOps Pipelines](https://docs.microsoft.com/azure/devops/pipelines/get-started/?view=azure-devops)

* [Git Actions Azure Functions Action](https://github.com/marketplace/actions/azure-functions-action)

* [Deploy Azure Functions with Jenkins](https://docs.microsoft.com/azure/jenkins/jenkins-azure-functions-deploy)

* [Deploy Azure Functions with Octopus Deploy](https://octopus.com/blog/azure-functions)

* [Supported languages in Azure Functions](https://docs.microsoft.com/azure/azure-functions/supported-languages)

* [Azure Functions triggers and bindings concepts](https://docs.microsoft.com/azure/azure-functions/functions-triggers-bindings)

* [Introduction to Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction)

* [Azure Cosmos DB bindings for Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-bindings-cosmosdb-v2)

* [Azure Functions HTTP and webhook bindings](https://docs.microsoft.com/azure/azure-functions/functions-bindings-http-webhook)

* [Store unstructured data using Azure Functions and Azure Cosmos DB](https://docs.microsoft.com/azure/azure-functions/functions-integrate-store-unstructured-data-cosmosdb)

* [Getting started with JSON features in Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-json-features)

* [Azure Table storage overview](https://docs.microsoft.com/azure/cosmos-db/table-storage-overview)