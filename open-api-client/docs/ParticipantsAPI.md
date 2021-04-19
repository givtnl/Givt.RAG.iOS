# ParticipantsAPI

All URIs are relative to *https://localhost:5001*

Method | HTTP request | Description
------------- | ------------- | -------------
[**participantsGet**](ParticipantsAPI.md#participantsget) | **GET** /events/{eventId}/participants/{id} | GetParticipantDetail
[**participantsGetAll**](ParticipantsAPI.md#participantsgetall) | **GET** /events/{eventId}/participants | GetParticipantsList
[**participantsPost**](ParticipantsAPI.md#participantspost) | **POST** /events/{eventId}/participants | RegisterParticipant


# **participantsGet**
```swift
    open class func participantsGet(eventId: String, id: String, completion: @escaping (_ data: ParticipantDetailModel?, _ error: Error?) -> Void)
```

GetParticipantDetail

Returns the detail of a participant for a given event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let id = "id_example" // String | 

// GetParticipantDetail
ParticipantsAPI.participantsGet(eventId: eventId, id: id) { (response, error) in
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

# **participantsGetAll**
```swift
    open class func participantsGetAll(eventId: String, completion: @escaping (_ data: [ParticipantListModel]?, _ error: Error?) -> Void)
```

GetParticipantsList

Returns a list of participants for a given event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 

// GetParticipantsList
ParticipantsAPI.participantsGetAll(eventId: eventId) { (response, error) in
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

# **participantsPost**
```swift
    open class func participantsPost(eventId: String, registerParticipantCommand: RegisterParticipantCommand, completion: @escaping (_ data: ParticipantDetailModel?, _ error: Error?) -> Void)
```

RegisterParticipant

Registers a participant for a given event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let registerParticipantCommand = RegisterParticipantCommand(eventId: "eventId_example", name: "name_example") // RegisterParticipantCommand | 

// RegisterParticipant
ParticipantsAPI.participantsPost(eventId: eventId, registerParticipantCommand: registerParticipantCommand) { (response, error) in
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

