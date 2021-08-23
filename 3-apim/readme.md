# Overview
Integration with API Management.

# Challenges

1. Enable telemetry for the API using Application Insights.

    * The number of times each function was run in the past hour

    * The average duration of each function in that hour

    * There should be one row for each of the three Ratings functions your team created earlier

2. Create a uniform URL with API Management

    Create a uniformly addressed version of the entire API. This includes the `GetUser`, `GetProduct` and `GetProducts` APIs that already existed, and all the production functions your team created: `CreateRating`, `GetRating`, and `GetRatings`. Your team should expose all of these operations under the same base URL, as they currently are under different base URLs.

3. Create Product suites

    Create 3 suites of APIs. One for each of the use cases: Mobile Application, Internal business users and External Partners. The team will need to configure the products so that only the required operations are exposed to the different product suites. Those requirements are as follows:

    A. **Mobile Applications**: Requires access to all of the APIs. Each of them is required for different areas of the application's UX. So the operations that need to be configured for this product suite are as follows:

    * GetUser
    * GetProduct
    * GetProducts
    * CreateRating
    * GetRating
    * GetRatings

    B. **Internal business users**: Use the APIs for reporting purposes.  Need access to the product and rating information but shouldn't be using the user operation or be able to create ratings.  So the operations that should be exposed to this product suite are as follows:

    * GetProduct
    * GetProducts
    * GetRating
    * GetRatings

    C. **External Partners**: The External Partners use case is to be able to see products that BYFOC has to offer, so should only have the product operations exposed to them. So this product suite should only have the following operations exposed to them:

    * GetProduct
    * GetProducts

# Reference

* [Monitor Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-monitoring)

* [Azure Monitor Log Queries](https://docs.microsoft.com/azure/azure-monitor/log-query/log-query-overview)

* [Azure API Management Overview](https://docs.microsoft.com/azure/api-management/api-management-key-concepts)

* [Azure API Management Tiers](https://docs.microsoft.com/azure/api-management/api-management-features)

* [Azure API Management Policies](https://docs.microsoft.com/azure/api-management/set-edit-policies)

* [Azure API Management Access Restriction Policies](https://docs.microsoft.com/azure/api-management/api-management-access-restriction-policies)

* [CI/CD for API Management using Azure Resource Manager templates](https://docs.microsoft.com/en-us/azure/api-management/devops-api-development-templates)

* [Azure API Management DevOps Resource Kit](https://github.com/Azure/azure-api-management-devops-resource-kit)