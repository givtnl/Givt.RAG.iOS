# ParticipantsAPI

All URIs are relative to *http://givt-debug-rag-api.westeurope.azurecontainer.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**finishEventForParticipant**](ParticipantsAPI.md#finisheventforparticipant) | **PATCH** /events/{eventId}/participants/{id}/finish | Marks a given participation in an event as Finished
[**getParticipantDetail**](ParticipantsAPI.md#getparticipantdetail) | **GET** /events/{eventId}/participants/{id} | Returns a detail of a single participant
[**getParticipantsList**](ParticipantsAPI.md#getparticipantslist) | **GET** /events/{eventId}/participants | Returns a list of participants
[**registerParticipant**](ParticipantsAPI.md#registerparticipant) | **POST** /events/{eventId}/participants | Registers a new participant for a given event
[**startEventForParticipant**](ParticipantsAPI.md#starteventforparticipant) | **PATCH** /events/{eventId}/participants/{id}/start | Marks a given participation in an event as Started


# **finishEventForParticipant**
```swift
    open class func finishEventForParticipant(eventId: String, id: String, finishParticipantCommand: FinishParticipantCommand, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Marks a given participation in an event as Finished

Marks the given participant for the given event as Finished so backers can be notified of the new status

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let id = "id_example" // String | 
let finishParticipantCommand = FinishParticipantCommand(distanceInMeters: 123) // FinishParticipantCommand | 

// Marks a given participation in an event as Finished
ParticipantsAPI.finishEventForParticipant(eventId: eventId, id: id, finishParticipantCommand: finishParticipantCommand) { (response, error) in
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

# **getParticipantDetail**
```swift
    open class func getParticipantDetail(eventId: String, id: String, completion: @escaping (_ data: ParticipantDetailModel?, _ error: Error?) -> Void)
```

Returns a detail of a single participant

Returns the participant identified by the id path parameter

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let id = "id_example" // String | 

// Returns a detail of a single participant
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

Returns a list of participants

Returns the participants for a given event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 

// Returns a list of participants
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

# **registerParticipant**
```swift
    open class func registerParticipant(eventId: String, registerParticipantCommand: RegisterParticipantCommand, completion: @escaping (_ data: ParticipantDetailModel?, _ error: Error?) -> Void)
```

Registers a new participant for a given event

Registers a new participant who participates in the given event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let registerParticipantCommand = RegisterParticipantCommand(name: "name_example", targets: [RegisterEventTargetCommand(type: EventTargetType(), value: "value_example")]) // RegisterParticipantCommand | 

// Registers a new participant for a given event
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

Marks a given participation in an event as Started

Marks the given participant for the given event as Started so backers can be notified of the new status

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let id = "id_example" // String | 

// Marks a given participation in an event as Started
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

