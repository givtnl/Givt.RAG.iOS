# BackersAPI

All URIs are relative to *http://givt-debug-rag-api.westeurope.azurecontainer.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBackerDetail**](BackersAPI.md#getbackerdetail) | **GET** /events/{eventId}/participants/{participantId}/backers/{id} | Returns a detail of a single backer
[**getBackersList**](BackersAPI.md#getbackerslist) | **GET** /events/{eventId}/participants/{participantId}/backers | Returns a list of backers
[**registerBacker**](BackersAPI.md#registerbacker) | **POST** /events/{eventId}/participants/{participantId}/backers | Registers a new backer for a given participant


# **getBackerDetail**
```swift
    open class func getBackerDetail(eventId: String, participantId: String, id: String, completion: @escaping (_ data: BackerDetailModel?, _ error: Error?) -> Void)
```

Returns a detail of a single backer

Returns the backer identified by the id path parameter

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let participantId = "participantId_example" // String | 
let id = "id_example" // String | 

// Returns a detail of a single backer
BackersAPI.getBackerDetail(eventId: eventId, participantId: participantId, id: id) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String** |  | 
 **participantId** | **String** |  | 
 **id** | **String** |  | 

### Return type

[**BackerDetailModel**](BackerDetailModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBackersList**
```swift
    open class func getBackersList(eventId: String, participantId: String, completion: @escaping (_ data: [BackerListModel]?, _ error: Error?) -> Void)
```

Returns a list of backers

Returns the backers for a given parcipant for a given event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let participantId = "participantId_example" // String | 

// Returns a list of backers
BackersAPI.getBackersList(eventId: eventId, participantId: participantId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String** |  | 
 **participantId** | **String** |  | 

### Return type

[**[BackerListModel]**](BackerListModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerBacker**
```swift
    open class func registerBacker(eventId: String, participantId: String, registerBackerCommand: RegisterBackerCommand, completion: @escaping (_ data: BackerDetailModel?, _ error: Error?) -> Void)
```

Registers a new backer for a given participant

Registers a new backer who is backing the giving participant who participates in an given event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let participantId = "participantId_example" // String | 
let registerBackerCommand = RegisterBackerCommand(name: "name_example", emailAddress: "emailAddress_example", amount: 123) // RegisterBackerCommand | 

// Registers a new backer for a given participant
BackersAPI.registerBacker(eventId: eventId, participantId: participantId, registerBackerCommand: registerBackerCommand) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **String** |  | 
 **participantId** | **String** |  | 
 **registerBackerCommand** | [**RegisterBackerCommand**](RegisterBackerCommand.md) |  | 

### Return type

[**BackerDetailModel**](BackerDetailModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

