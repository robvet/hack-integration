# Overview
DevOps for Logic Apps, Azure Functions, and API Management

DevOps is about speed: faster application development, faster updates and continuous development, and faster shipments, all of which lead to shortened systems development lifecycles. Recent research shows that high-performing DevOps teams recover from downtime 96 times faster, have a five times lower change failure rate, and deploy code 46 times more frequently. In short, successful DevOps teams can deploy code and recover in a matter of hours, not weeks.

# Challenges

1. Implement source control and a CI/CD solution.

2. The solution should deploy the Program Feedback API when there is a change to the "main" branch, and the build is successful.

3. Successful builds should require approval before being pushed to Azure.

4. Create a "Blue Green" deployment approach with GitHub actions.

5. Build and deploy other branches to dev/test environments.

# Reference
* [DevOps](https://resources.github.com/devops/)

* [CI/CD for API Management using Azure Resource Manager templates](https://docs.microsoft.com/en-us/azure/api-management/devops-api-development-templates)

* [Azure API Management DevOps Resource Kit](https://github.com/Azure/azure-api-management-devops-resource-kit)

* [BlueGreen](https://martinfowler.com/bliki/BlueGreenDeployment.html)

* [Functions - Continuous delivery by using GitHub Action](https://docs.microsoft.com/en-us/azure/azure-functions/functions-how-to-github-actions)

* [What is Continuous Integration?](https://docs.microsoft.com/devops/develop/what-is-continuous-integration)

* [What is Continuous Delivery?](https://docs.microsoft.com/devops/deliver/what-is-continuous-delivery)