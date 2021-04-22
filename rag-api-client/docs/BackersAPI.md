# BackersAPI

All URIs are relative to *http://givt-debug-rag-api.westeurope.azurecontainer.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBackerDetail**](BackersAPI.md#getbackerdetail) | **GET** /events/{eventId}/participants/{participantId}/backers/{id} | 
[**getBackersList**](BackersAPI.md#getbackerslist) | **GET** /events/{eventId}/participants/{participantId}/backers | 
[**registerBacker**](BackersAPI.md#registerbacker) | **POST** /events/{eventId}/participants/{participantId}/backers | 


# **getBackerDetail**
```swift
    open class func getBackerDetail(eventId: String, participantId: String, id: String, completion: @escaping (_ data: BackerDetailModel?, _ error: Error?) -> Void)
```



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let participantId = "participantId_example" // String | 
let id = "id_example" // String | 

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



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let participantId = "participantId_example" // String | 

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



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let participantId = "participantId_example" // String | 
let registerBackerCommand = RegisterBackerCommand(name: "name_example", emailAddress: "emailAddress_example", amount: 123) // RegisterBackerCommand | 

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

