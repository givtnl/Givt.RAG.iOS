# ParticipantsAPI

All URIs are relative to *http://givt-debug-rag-api.westeurope.azurecontainer.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getParticipantDetail**](ParticipantsAPI.md#getparticipantdetail) | **GET** /events/{eventId}/participants/{id} | 
[**getParticipantsList**](ParticipantsAPI.md#getparticipantslist) | **GET** /events/{eventId}/participants | 
[**participantsFinish**](ParticipantsAPI.md#participantsfinish) | **PATCH** /events/{eventId}/participants/{id}/finish | FinishEventForParticipant
[**registerParticipant**](ParticipantsAPI.md#registerparticipant) | **POST** /events/{eventId}/participants | 
[**startEventForParticipant**](ParticipantsAPI.md#starteventforparticipant) | **PATCH** /events/{eventId}/participants/{id}/start | 


# **getParticipantDetail**
```swift
    open class func getParticipantDetail(eventId: String, id: String, completion: @escaping (_ data: ParticipantDetailModel?, _ error: Error?) -> Void)
```



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let id = "id_example" // String | 

ParticipantsAPI.getParticipantDetail(eventId: eventId, id: id) { (response, error) in
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
 **id** | **String** |  | 

### Return type

[**ParticipantDetailModel**](ParticipantDetailModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getParticipantsList**
```swift
    open class func getParticipantsList(eventId: String, completion: @escaping (_ data: [ParticipantListModel]?, _ error: Error?) -> Void)
```



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 

ParticipantsAPI.getParticipantsList(eventId: eventId) { (response, error) in
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

### Return type

[**[ParticipantListModel]**](ParticipantListModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **participantsFinish**
```swift
    open class func participantsFinish(eventId: String, id: String, finishParticipantCommand: FinishParticipantCommand, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

FinishEventForParticipant

Updates the status for a given participant for a given event to Finished

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let id = "id_example" // String | 
let finishParticipantCommand = FinishParticipantCommand(distanceInMeters: 123) // FinishParticipantCommand | 

// FinishEventForParticipant
ParticipantsAPI.participantsFinish(eventId: eventId, id: id, finishParticipantCommand: finishParticipantCommand) { (response, error) in
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
 **id** | **String** |  | 
 **finishParticipantCommand** | [**FinishParticipantCommand**](FinishParticipantCommand.md) |  | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerParticipant**
```swift
    open class func registerParticipant(eventId: String, registerParticipantCommand: RegisterParticipantCommand, completion: @escaping (_ data: ParticipantDetailModel?, _ error: Error?) -> Void)
```



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let registerParticipantCommand = RegisterParticipantCommand(name: "name_example", goals: [RegisterParticipantGoalCommand(type: ParticipantGoalType(), value: "value_example")]) // RegisterParticipantCommand | 

ParticipantsAPI.registerParticipant(eventId: eventId, registerParticipantCommand: registerParticipantCommand) { (response, error) in
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
 **registerParticipantCommand** | [**RegisterParticipantCommand**](RegisterParticipantCommand.md) |  | 

### Return type

[**ParticipantDetailModel**](ParticipantDetailModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startEventForParticipant**
```swift
    open class func startEventForParticipant(eventId: String, id: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let id = "id_example" // String | 

ParticipantsAPI.startEventForParticipant(eventId: eventId, id: id) { (response, error) in
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
 **id** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

