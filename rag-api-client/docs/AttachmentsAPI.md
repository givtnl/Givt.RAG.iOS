# AttachmentsAPI

All URIs are relative to *http://givt-debug-rag-api.westeurope.azurecontainer.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAttachmentDetail**](AttachmentsAPI.md#getattachmentdetail) | **GET** /events/{eventId}/participants/{participantId}/attachments | Returns a detail of an single attachment for a participant


# **getAttachmentDetail**
```swift
    open class func getAttachmentDetail(eventId: String, participantId: String, completion: @escaping (_ data: AttachmentDetailModel?, _ error: Error?) -> Void)
```

Returns a detail of an single attachment for a participant

Returns the attachment for a single participant who participated in a single event

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let participantId = "participantId_example" // String | 

// Returns a detail of an single attachment for a participant
AttachmentsAPI.getAttachmentDetail(eventId: eventId, participantId: participantId) { (response, error) in
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

[**AttachmentDetailModel**](AttachmentDetailModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

