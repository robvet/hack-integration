# Overview
Integration with Service Bus and Event Grid

Microsoft Azure Service Bus is a fully managed enterprise message broker with message queues and publish-subscribe topics. Service Bus is used to decouple applications and services from each other, providing the following benefits:

 * Load-balancing work across competing workers
 * Safely routing and transferring data and control across service and application boundaries
 * Coordinating transactional work that requires a high-degree of reliability

 Azure Event Grid allows you to easily build applications with event-based architectures. First, select the Azure resource you would like to subscribe to, and then give the event handler or WebHook endpoint to send the event to. Event Grid has built-in support for events coming from Azure services, like storage blobs and resource groups. Event Grid also has support for your own events, using custom topics.

 ![Event Sources](https://docs.microsoft.com/en-us/azure/event-grid/media/overview/functional-model-big.png)

# Challenges

1. Modify the Azure Function to send the specified information to a pub/sub messaging system. Using the feedback data sent, create a new JSON document with a structure like the example below that will be sent to your pub/sub messaging system.

    ```JSON
    {
        "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
        "programId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
        "followup": "False",
        "rating": 5,
        "userNotes": "Great Program"
    }
    ```

2. Create a process(es) which is able to filter based on the total cost in each message, and accomplish the following tasks:

    If the follow-up request is "true" create a JSON object save the JSON object with a unique name to the "for-followup" container within a Azure Storage account
    
    If the follow-up request is "false" create a JSON object save the JSON object with a unique name to the "feedback" container within a Azure Storage account

    The format for the saved data should be as follows:

    ```JSON
    {
        "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
        "programId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
        "followup": "True",
        "rating": 3,
        "userNotes": "Have some ideas"
    }
    ```

# Reference

[Tutorial: Respond to Azure Service Bus events received via Azure Event Grid by using Azure Logic Apps](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-to-event-grid-integration-example)

[Tutorial: Respond to Azure Service Bus events received via Azure Event Grid by using Azure Functions](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-to-event-grid-integration-function)