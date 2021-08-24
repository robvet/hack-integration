# Overview
Event Hubs with Logic Apps or Functions

Azure Event Hubs is a big data streaming platform and event ingestion service. It can receive and process millions of events per second. Data sent to an event hub can be transformed and stored by using any real-time analytics provider or batching/storage adapters.  The following scenarios are some of the scenarios where you can use Event Hubs:

* Anomaly detection (fraud/outliers)
* Application logging
* Analytics pipelines, such as clickstreams
* Live dashboarding
* Archiving data
* Transaction processing
* User telemetry processing
* Device telemetry streaming

# Challenges

1. Create an Event Hub.

    Create an Event Hubs namespace with default values in your Azure
    Subscription, then create a new Event Hub in it **with 32 partitions**.
    Then identify and copy the following information:

    * A shared access key connection string with Send permissions from the
    shared access policies of your Event Hubs **namespace** (not the Event
    Hub in the namespace)

    * The Event Hub name that you created inside your Event Hubs namespace

2. Create an event sender.

    **Payload**:

    ```JSON
    {
        "header": {
            "salesNumber": "0c423398-3c7c-0682-7519-4701c445ed7a",
            "dateTime": "2019-09-11T06:04:43.6819622-07:00",
            "locationId": "00d8ea6f-935c-2cca-9bbc-f56b5a091621",
            "locationName": "Lorena's Ice Cream Parlor",
            "locationAddress": "865 Olson Cape",
            "locationPostcode": "03030",
            "totalCost": "123.40",
            "totalTax": "12.34",
            "receiptUrl": "https://serverlessohsales.blob.core.windows.net/TheReceipt.pdf"
        },
        "details":
        [
            {
                "productId": "65ab124a-9b2c-4294-a52d-18839364ef15",
                "quantity": "10",
                "unitCost": "10.40",
                "totalCost": "104.00",
                "totalTax": "10.40",
                "productName": "Durian Durian",
                "productDescription": "Smells suspect but tastes... also suspect."
            },
            {
                "productId": "75542e38-563f-436f-adeb-f426f1dabb5c",
                "quantity": "1",
                "unitCost": "3.40",
                "totalCost": "3.40",
                "totalTax": "0.34",
                "productName": "Starfruit Explosion",
                "productDescription": "This starfruit ice cream is out of this world!"
            },
            {
                "productId": "80bab959-ef8b-4ae3-8bf2-e876d77277b6",
                "quantity": "2",
                "unitCost": "8.00",
                "totalCost": "16.00",
                "totalTax": "1.60",
                "productName": "French Vanilla",
                "productDescription": "It's vanilla ice cream."
            }
        ]
    }
    ```

2. Trigger a Function that receives these events from Event Hubs **in batches**, loops through each of them (debatching), and then saves **one entry per sale event** into the same database from the previous challenge. Note: if using CosmosDB this can be in a separate collection.

# Reference

* [What is Event Hubs?](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-about)

* [Scaling with Event Hubs](https://docs.microsoft.com/azure/event-hubs/event-hubs-scalability)

* [Azure Event Hubs bindings for Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-bindings-event-hubs)

* [Functions Event Hubs Trigger Scaling](https://docs.microsoft.com/azure/azure-functions/functions-bindings-event-hubs#trigger---scaling)

* [Azure Event Hubs Event Processor Host overview](https://docs.microsoft.com/azure/event-hubs/event-hubs-event-processor-host)

* [Processing 100,000 Events Per Second on Azure Functions](https://blogs.msdn.microsoft.com/appserviceteam/2017/09/19/processing-100000-events-per-second-on-azure-functions/)

* [A tour of Analytics in Application Insights](https://docs.microsoft.com/azure/application-insights/app-insights-analytics-tour)

* [Azure Functions scale and hosting](https://docs.microsoft.com/azure/azure-functions/functions-scale)