# Overview

Welcome to the Azure Integration Services hackathon

The challenges in the hack are derived from real world scenarios, along with the [Basic enterprise integration on Azure](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/enterprise-integration/basic-enterprise-integration) and the [Enterprise integration using queues and events](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/enterprise-integration/queues-events) from the Azure Architecture Center.

# Content Modules

0. [Setting up the Development Environment](./0-dev_environment/readme.md): This module will cover the basic developer environment setup for Windows, Ubuntu, and macOS.

1. [Integration Basics with Functions and Logic Apps](./1-integration_basics/readme.md): This module provides important integration basics when using Azure Functions and Logic Apps.  The challenges in this module demonstrate common use cases when integrating different services.  Note, depending on the solution the hacker decides to implement, the Function App and Logic Apps created here will be used throughout the hackathon.

2. [Creating the backend API](./2-backend_api/readme.md): This module extends the Function App with additional functions to create a fictitious "Program Feedback API".  The challenges in this module represent a common scenario when customers are integrating existing systems and services into new services.

3. [Managing the API](./3-api_management/readme.md):  This module introduces a key integration tool, API Management.  The challenges in this module demonstrate important use cases when using APIM.

4. [Enterprise Messaging with Service Bus and Event Grid](./4-messaging/readme.md):  This module adds two components that help make the system more reliable and scalable, Service Bus and Event Grid.  Asynchronous communication using a message broker provides a number of advantages over making direct, synchronous calls to backend services.

5. [Source control and CI/CD for Azure Integration Solutions](./5-devops/readme.md):  This is an optional module, but one of the most important topics to understand for any organization that wants the potential to deploy services better... faster, more securely, with less downtime, and faster recovery from potential downtime, etc.  Please note, while the challenges in this module focuses on the toolset, DevOps is much more than a set of tools, it's an important cultural change that facilitates an improved way of working together and build services that can benefit the organization.