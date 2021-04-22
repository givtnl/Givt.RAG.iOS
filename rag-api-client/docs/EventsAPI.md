# EventsAPI

All URIs are relative to *http://givt-debug-rag-api.westeurope.azurecontainer.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getEventDetail**](EventsAPI.md#geteventdetail) | **GET** /Events/{id} | 
[**getEventsList**](EventsAPI.md#geteventslist) | **GET** /Events | 


# **getEventDetail**
```swift
    open class func getEventDetail(id: String, completion: @escaping (_ data: EventDetailModel?, _ error: Error?) -> Void)
```



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | 

EventsAPI.getEventDetail(id: id) { (response, error) in
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

# **getEventsList**
```swift
    open class func getEventsList(completion: @escaping (_ data: [EventListModel]?, _ error: Error?) -> Void)
```



### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


EventsAPI.getEventsList() { (response, error) in
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

