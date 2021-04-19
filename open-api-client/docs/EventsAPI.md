# EventsAPI

All URIs are relative to *https://localhost:5001*

Method | HTTP request | Description
------------- | ------------- | -------------
[**eventsGet**](EventsAPI.md#eventsget) | **GET** /Events/{id} | GetEventDetail
[**eventsGetAll**](EventsAPI.md#eventsgetall) | **GET** /Events | GetEventsList


# **eventsGet**
```swift
    open class func eventsGet(id: String, completion: @escaping (_ data: EventDetailModel?, _ error: Error?) -> Void)
```

GetEventDetail

Returns the details for a specific event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | 

// GetEventDetail
EventsAPI.eventsGet(id: id) { (response, error) in
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
 **id** | **String** |  | 

### Return type

[**EventDetailModel**](EventDetailModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **eventsGetAll**
```swift
    open class func eventsGetAll(completion: @escaping (_ data: [EventListModel]?, _ error: Error?) -> Void)
```

GetEventsList

Returns a list of events

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// GetEventsList
EventsAPI.eventsGetAll() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

[**[EventListModel]**](EventListModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

