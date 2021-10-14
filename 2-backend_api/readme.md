# Overview
Creating and deploying the Program Feedback API

Azure Functions lets you connect Azure services and other resources to functions without having to write your own integration code.  These bindings, which represent both input and output, are declared within the function definition. Data from bindings is provided to the function as parameters.  A trigger is a special type of input binding.  Although a function has only one trigger, it can have multiple input and output bindings.

> **NOTE**: You will require information about Users and Programs. Three APIs have already been created for getting info about Users and Programs:
> * [Get Programs](https://hack.azure-api.net/api/GetPrograms)
> * [Get Program](https://hack.azure-api.net/api/GetProgram?programId=1cd8cf30-e821-44cf-b3ac-44cf6b4f2b19) (expects `programId` query parameter)
> * [Get Users](https://hack.azure-api.net/api/GetUsers)
> * [Get User](https://hack.azure-api.net/api/GetUser?userId=2c82e013-2166-47ba-b5d6-b427e814802a) (expects a `userId` query parameter)

# Challenges
1. Create the Feedback API

    Create and deploy three new Functions in the Function App.

    A. SubmitFeedback Function

    * **Verb**: POST

    * **Payload**:
        ```JSON
        {
        "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
        "programId": "1cd8cf30-e821-44cf-b3ac-44cf6b4f2b19",
        "followup": "False",
        "rating": 5,
        "userNotes": "Great Program"
        }
        ```

    * **Requirements**
        * Validate both `userId` and `programId` by calling the existing API endpoints. You can find a user id to test with from the sample payload above
        * Add a property called `id` with a GUID value
        * Add a property called `timestamp` with the current UTC date time
        * Validate that the `rating` field is an integer from 0 to 5
        * Validate the `followup` is true/false
        * Use a data service to store the feedback information to the backend
        * Return the entire review JSON payload with the newly created `id` and `timestamp`

    * **Output**:
        ```JSON
        {
        "id": "79c2779e-dd2e-43e8-803d-ecbebed8972c",
        "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
        "programId": "1cd8cf30-e821-44cf-b3ac-44cf6b4f2b19",
        "timestamp": "2018-05-21 21:27:47Z",
        "followup": "False",
        "rating": 5,
        "userNotes": "Great Program"
        }
        ```

    B. GetFeedback Function

    * **Verb**: GET

    * **Input**: The Feedback `feedbackId` as a query string or route parameter

    * **Requirements**
        * Get the feedback from your database and return the entire JSON payload for the review identified by the id
        * Additional route parameters or query string values may be used if necessary.

    * **Output**:
        ```JSON
        {
        "id": "79c2779e-dd2e-43e8-803d-ecbebed8972c",
        "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
        "programId": "1cd8cf30-e821-44cf-b3ac-44cf6b4f2b19",
        "timestamp": "2018-05-21 21:27:47Z",
        "followup": "True",
        "rating": 5,
        "userNotes": "Great experiance"
        }
        ```

    C. GetUserFeedback Function

    * **Verb**: GET

    * **Input**: The `userId` as a query string or route parameter

    * **Requirements**
        * Get the feedback for a single user from your database and return the entire JSON payload for the reviews for the user identified by the id.
        * Additional route parameters or query string values may be used if necessary.
        
    * **Output**:
        ``` JSON
        [
        {
            "id": "79c2779e-dd2e-43e8-803d-ecbebed8972c",
            "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
            "programId": "4c25613a-a3c2-4ef3-8e02-9c335eb23204",
            "timestamp": "2018-05-21 21:27:47Z",
            "followup": "False",
            "rating": 5,
            "userNotes": "Love it"
        },
        {
            "id": "8947f7cc-6f4c-49ed-a7aa-62892eac8f31",
            "userId": "2c82e013-2166-47ba-b5d6-b427e814802a",
            "programId": "9f180777-f850-42b7-8ef7-0ff38ca90336",
            "timestamp": "2018-05-20 09:02:30Z",
            "followup": "True",
            "rating": 2,
            "userNotes": "let's talk about some new ideas"
        }
        ]
        ```

# Reference

* [Supported languages in Azure Functions](https://docs.microsoft.com/azure/azure-functions/supported-languages)

* [Azure Functions triggers and bindings concepts](https://docs.microsoft.com/azure/azure-functions/functions-triggers-bindings)

* [Azure Functions HTTP and webhook bindings](https://docs.microsoft.com/azure/azure-functions/functions-bindings-http-webhook)

* [Introduction to Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction)

* [Azure Cosmos DB bindings for Azure Functions](https://docs.microsoft.com/azure/azure-functions/functions-bindings-cosmosdb-v2)

* [Store unstructured data using Azure Functions and Azure Cosmos DB](https://docs.microsoft.com/azure/azure-functions/functions-integrate-store-unstructured-data-cosmosdb)

* [Getting started with JSON features in Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-json-features)

* [Azure Table storage overview](https://docs.microsoft.com/azure/cosmos-db/table-storage-overview)

## Example Code

### Testing the API

Using PowerShell to test the API locally.

```PowerShell
# GetProgramQuery local
$uri =  'http://localhost:7071/api/GetProgramQuery'
$body = '{"programId" : "1cd8cf30-e821-44cf-b3ac-44cf6b4f2b19"}'
# Invoke-WebRequest -Uri $uri -Method POST -Body $body
Invoke-WebRequest -Uri $uri -Method POST -Body $body | select Content

# GetProgramBody local
$uri =  'http://localhost:7071/api/GetProgramBody'
$body = '{"programId" : "1cd8cf30-e821-44cf-b3ac-44cf6b4f2b19"}'
# Invoke-WebRequest -Uri $uri -Method POST -Body $body
Invoke-WebRequest -Uri $uri -Method POST -Body $body | select Content

# SubmitFeedback local
$uri =  'http://localhost:7071/api/SubmitFeedback'
$body='{
"userId" : "2c82e013-2166-47ba-b5d6-b427e814802a",
"programId" : "1cd8cf30-e821-44cf-b3ac-44cf6b4f2b19",
"followup" : "False",
"rating" : 5,
"userNotes" : "Great Program"
}'
Invoke-WebRequest -Uri $uri -Method POST -Body $body
```

### C# SubmitFeedback API Example

```CSharp SubmitFeedback API
public static class SubmitFeedback
    {
        private static readonly HttpClient _httpClient = new HttpClient();

        [FunctionName("SubmitFeedback")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "post", Route = null)] HttpRequest req,
            [CosmosDB(
                databaseName: "ProgramData",
                collectionName: "Feedback",
                ConnectionStringSetting = "FEEDBACK_DB_CONNECTION")]
            IAsyncCollector<FeedbackModel> feedbackOutput,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");

            string _userid = null; string _programid = null;
            var requestBody = await new StreamReader(req.Body).ReadToEndAsync();
            dynamic data = JsonConvert.DeserializeObject(requestBody);

            _userid = _userid ?? data?.userId;
            _programid = _programid ?? data?.programId;
            log.LogInformation("userId: " + _userid);
            log.LogInformation("programId:" + _programid);

            var result = await _httpClient.GetAsync($"https://hack.azure-api.net/api/GetUser/?userid={_userid}");
            var resultContent = await result.Content.ReadAsStringAsync();
            log.LogInformation("GetUserAPI result :" + result);
            log.LogInformation("GetUserAPI content:" + resultContent);

            if (result.IsSuccessStatusCode)
            {
                var resultProgram = await _httpClient.GetAsync($"https://hack.azure-api.net/api/GetProgram?programId={_programid}");
                var resultProgramContent = await result.Content.ReadAsStringAsync();
                log.LogInformation("GetProgram result:" + resultProgram);
                log.LogInformation("GetProgram content:" + resultProgramContent);

                if (resultProgram.IsSuccessStatusCode)
                {
                    var feedbackGuid = Guid.NewGuid().ToString();
                    var _programFeedback = new FeedbackModel
                    {
                        id = feedbackGuid,
                        userId = _userid,
                        programId = _programid,
                        followup = data?.followup,
                        rating = data?.rating,
                        userNotes = data?.userNotes,
                        timeStamp = DateTime.Now.ToString()
                    };

                    await feedbackOutput.AddAsync(_programFeedback);
                    return new OkObjectResult(feedbackGuid);
                }
            }

            return new BadRequestResult();
        }
    }
```

```CSharp FeedbackModel
    public class FeedbackModel
    {
        public string id { get; set; }
        public string userId { get; set; }
        public string programId { get; set; }
        public DateTime timestamp { get; set; }
        public string timeStamp { get; internal set; }
        public string followup { get; set; }
        public int rating { get; set; }
        public string userNotes { get; set; }
    }
```