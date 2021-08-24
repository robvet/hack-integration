# Overview
Integration with Service Bus and Event Grid

Microsoft Azure Service Bus is a fully managed enterprise message broker with message queues and publish-subscribe topics. Service Bus is used to decouple applications and services from each other, providing the following benefits:

 * Load-balancing work across competing workers
 * Safely routing and transferring data and control across service and application boundaries
 * Coordinating transactional work that requires a high-degree of reliability

# Challenges

1. Your first challenge is to modify the Azure Function to send the specified information to a pub/sub messaging system. Using the feedback data sent, create a new JSON document with a structure similar to the example below that will be sent to your pub/sub messaging system.

```JSON
{
    "totalItems": 8,
    "totalCost": 123.40,
    "salesNumber": "0c423398-3c7c-0682-7519-4701c445ed7a",
    "salesDate": "09/11/2019 06:04:43",
    "storeLocation": "00d8ea6f-935c-2cca-9bbc-f56b5a091621",

}
```

Next, you will need to create a process(es) which is able to filter based on the total cost in each message, and accomplish the following tasks:

    If the total cost is greater than or equal to $100:

    retrieve the PDF file of the receipt using the receiptUrl value
    base64 encode the PDF
    create a JSON object which includes the receipt data, along with the base64 encoded version of the receipt
    save the JSON object with a unique name to the "receipts-high-value" container within the provided Azure Storage account (accessible only from the virtual network)
    The format for the saved data should be as follows:

    {
        "Store": "00d8ea6f-935c-2cca-9bbc-f56b5a091621",
        "SalesNumber": "0c423398-3c7c-0682-7519-4701c445ed7a",
        "TotalCost": 123.40,
        "Items": 8,
        "SalesDate": "09/11/2019 06:04:43",
        "ReceiptImage":"V2VsY29tZSB0byBTZXJ2ZXJsZXNzIE9wZW5IYWNrIQ=="
    }

    If the total cost is less than $100:

    create a JSON object which includes the receipt data
    save the JSON object with a unique name to the "receipts" container within the provided Azure Storage account (accessible only from the provided virtual network)
    The format for the saved data should be as follows:

    {
        "Store": "00d8ea6f-935c-2cca-9bbc-f56b5a091621",
        "SalesNumber": "0c423398-3c7c-0682-7519-4701c445ed7a",
        "TotalCost": 6.58,
        "Items": 1,
        "SalesDate": "09/02/2019 10:36:17"
    }

# Reference

~
https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-to-event-grid-integration-example

https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-to-event-grid-integration-function

