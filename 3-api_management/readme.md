# Overview
Integration with API Management.

API Management helps organizations publish APIs to external, partner, and internal developers to unlock the potential of their data and services. Businesses everywhere are looking to extend their operations as a digital platform, creating new channels, finding new customers, and driving deeper engagement with existing ones. API Management provides the core competencies to ensure a successful API program through developer engagement, business insights, analytics, security, and protection. You can use Azure API Management to take any backend and launch a full-fledged API program based on it.

# Challenges

1. Enable telemetry for the API using Application Insights.

    * The number of times each function was run in the past hour

    * The average duration of each function in that hour

    * There should be one row for each of the functions created earlier

2. Create a uniform URL with API Management

    Create a uniformly addressed version of the entire API. This includes the `GetUser`, `GetProgram` and `GetPrograms` APIs that already existed, and all the production functions your team created: `SubmitFeedback`, `GetFeedback`, and `GetUserFeedback`. Your team should expose all of these operations under the same base URL, as they currently are under different base URLs.

3. Create Product suites

    Create 3 suites of APIs. One for each of the use cases: Mobile Application, Internal business users and External Partners. The team will need to configure the products so that only the required operations are exposed to the different product suites. Those requirements are as follows:

    A. **Mobile Applications**: Requires access to all of the APIs. Each of them is required for different areas of the application's UX.  The operations that need to be configured for this product suite are as follows:

    * GetUser
    * GetProgram
    * GetPrograms
    * SubmitFeedback
    * GetFeedback
    * GetUserFeedback

    B. **Internal business users**: Use the APIs for reporting purposes.  Need access to the program and feedback information but shouldn't be using the user operation or be able to create feedback.  The operations that should be exposed to this product suite are as follows:

    * GetProgram
    * GetPrograms
    * GetFeedback
    * GetUserFeedback

    C. **External Partners**: The External Partners use case is to be able to see programs that that are offered and should only have the program operations exposed to them.  This product suite should only have the following operations exposed to them:

    * GetProgram
    * GetPrograms

4. (Optional) Create a new revision and a new version of the API.

    * Make sure the External Partners product suite is configured to use the first version of the API.
    
    * Configure a default API version if an identifier was not selected.

5. (Optional) Verify the Developer Portal is active, and the correct Products and API are shown.  Create a test account to invite for and assign one of the product suites.

6. (Optional) Secure the API Management service

    * Integrate the API and the API Management into a Virtual Network (VNet) and use an Application Gateway for external access. Note: This is a major change and will affect how your access and manage the service.

    * Review and Implement the recommendations in the security baseline for API Management.

    * Review and implement Azure Policies for API Management.

    * Use Transformation Policies to help protect your API.

# Reference

* [Monitor Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-monitoring)

* [Azure Monitor Log Queries](https://docs.microsoft.com/azure/azure-monitor/log-query/log-query-overview)

* [Azure API Management Overview](https://docs.microsoft.com/azure/api-management/api-management-key-concepts)

* [Azure API Management Tiers](https://docs.microsoft.com/azure/api-management/api-management-features)

* [Azure API Management Policies](https://docs.microsoft.com/azure/api-management/set-edit-policies)

* [Azure API Management Access Restriction Policies](https://docs.microsoft.com/azure/api-management/api-management-access-restriction-policies)

* [CI/CD for API Management using Azure Resource Manager templates](https://docs.microsoft.com/en-us/azure/api-management/devops-api-development-templates)

* [Azure API Management DevOps Resource Kit](https://github.com/Azure/azure-api-management-devops-resource-kit)

* [Integrate API Management in an internal virtual network with Application Gateway](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-integrate-internal-vnet-appgateway)

* [Overview of the developer portal](https://docs.microsoft.com/en-us/azure/api-management/api-management-howto-developer-portal)

* [Subscriptions in Azure API Management](https://docs.microsoft.com/en-us/azure/api-management/api-management-subscriptions)

* [Azure security baseline for API Management](https://docs.microsoft.com/en-us/security/benchmark/azure/baselines/api-management-security-baseline?toc=/azure/api-management/TOC.json)

* [Azure Policy Regulatory Compliance controls for Azure API Management](https://docs.microsoft.com/en-us/azure/api-management/security-controls-policy)

* [Transformation Policies to protect API](https://docs.microsoft.com/en-us/azure/api-management/transform-api)
