# Overview
Integration basics with Logic Apps and Functions.

When you build workflows using Azure Logic Apps, you can use connectors to help you quickly and easily access data, events, and resources in other apps, services, systems, protocols, and platforms - often without writing any code.  A connector provide prebuilt operations that you can use as steps in your workflows.  Azure Logic Apps provide hundreds of connectors that you can use.  If no connector is available for the resource that you want to access, you can use the generic HTTP operation to communicate with the service, or you can create a custom connector.

The Functions and Logic Apps created in this module will be leveraged throughout the hackathon.  Each hacker should deploy to different Resource Groups and use unique Function App and Logic App names.  The Function should be created and tested in your development environment before deploying to Azure.

# Challenges

1. Create an HTTP triggered Function with the following configuration:
    
    * **Verb**: GET

    * **Input**: The `programId` parameter value as a query parameter or an HTTP route

    * **Result**: "The program name for your program id {the id passed into the function} is Program A"
    
    > Note, parameter names are case sensitive.
    
2. Verify the Function is working correctly, then deploy to Azure.

3. Create an HTTP triggered Logic App (When a HTTP request is received) with the following configuration:

    * **Verb**: POST

    * **Payload**:

        ```JSON
        {
            "programId": "d9fcabea-7f10-4fb1-81dd-47c5f467a05b"
        }
        ```

3. Add an action to the Logic App action to call the Azure Function, passing the example payload to the `programId` parameter. The response should include the program Id, program name, and program description.

# Reference

## Azure Functions

* [Introduction to Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-overview)

* [Supported languages in Azure Functions](https://docs.microsoft.com/azure/azure-functions/supported-languages)

### Local Development with VS Code, Ubuntu (wsl), and Node.js

* [QuickStart: Create a JavaScript function in Azure using Visual Studio Code](https://docs.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-node)

* [Develop JavaScript Functions with Visual Studio Code](https://docs.microsoft.com/en-us/azure/azure-functions/functions-develop-vs-code?tabs=nodejs)

* [Work with Azure Functions Core Tools on Linux](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=linux)

* [Strategies for testing JavaScript in VS Code](https://docs.microsoft.com/en-us/azure/azure-functions/functions-test-a-function#javascript-in-vs-code)

### Local Development with Visual Studio and C#

* [QuickStart: Create your first C# function in Azure using Visual Studio](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-your-first-function-visual-studio)

* [Develop Azure Functions using Visual Studio](https://docs.microsoft.com/en-us/azure/azure-functions/functions-develop-vs)

* [Work with Azure Functions Core Tools on Windows](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=windows)

* [Strategies for testing C# in Visual Studio](https://docs.microsoft.com/en-us/azure/azure-functions/functions-test-a-function#c-in-visual-studio)

## Logic Apps

* [Introduction to Logic Apps](https://docs.microsoft.com/azure/logic-apps/logic-apps-overview)  

* [Connectors Overview](https://docs.microsoft.com/en-us/azure/connectors/apis-list)  

* [QuickStart: Create and manage logic app workflow definitions with multi-tenant Azure Logic Apps and Visual Studio Code](https://docs.microsoft.com/en-us/azure/logic-apps/quickstart-create-logic-apps-visual-studio-code)  

* [QuickStart: Create automated integration workflows with multi-tenant Azure Logic Apps and Visual Studio](https://docs.microsoft.com/en-us/azure/logic-apps/quickstart-create-logic-apps-with-visual-studio)

* [Logic Apps Call, trigger, or nest workflows with HTTP endpoints in Logic Apps](https://docs.microsoft.com/azure/logic-apps/logic-apps-http-endpoint)

