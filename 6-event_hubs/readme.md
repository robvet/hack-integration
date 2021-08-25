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


attribute1
2. Create an event sender.

    **Payload**:

    ```JSON
    {
        "header": {
            "attribute1": "abc",
            "attribute2": "time",
            "attribute3": "description",
        },
        "details":
        [
            {   "attribute1": "10",
                "attribute2": "10.40",
                "attribute3": "14.00",
            },
            {
                "attribute1": "21",
                "attribute2": "376.40",
                "attribute3": "31.40",
            },
            {
                "attribute1": "7",
                "attribute2": "8.00",
                "attribute3": "",
            }
        ]
    }
    ```

2. Trigger a Function or Logic App that receives these events from Event Hubs **in batches**, loops through each of them (debatching), and then saves **one entry per event** into the same database from the previous challenge. Note: if using CosmosDB this can be in a separate collection.

# Reference

* [Azure Event Hubs — A big data streaming platform and event ingestion service](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-about)

* [Scaling with Event Hubs](https://docs.microsoft.com/azure/event-hubs/event-hubs-scalability)

* [Azure Event Hubs trigger and bindings for Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-bindings-event-hubs)

* [Functions Event Hubs Trigger Scaling](https://docs.microsoft.com/azure/azure-functions/functions-bindings-event-hubs#trigger---scaling)

* [Processing 100,000 Events Per Second on Azure Functions](https://blogs.msdn.microsoft.com/appserviceteam/2017/09/19/processing-100000-events-per-second-on-azure-functions/)
