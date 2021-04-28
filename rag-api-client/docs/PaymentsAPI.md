# PaymentsAPI

All URIs are relative to *http://givt-debug-rag-api.westeurope.azurecontainer.io*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pay**](PaymentsAPI.md#pay) | **POST** /events/{eventId}/participants/{participantId}/backers/{backerId} | Creates an paymentrequest with the paymentprovider


# **pay**
```swift
    open class func pay(eventId: String, participantId: String, backerId: String, checkoutBackerCommand: CheckoutBackerCommand, completion: @escaping (_ data: BackerPaymentRequestModel?, _ error: Error?) -> Void)
```

Creates an paymentrequest with the paymentprovider

Creates an paymentrequest with the paymentprovider and returns the URL to the user to finish the payment

### Example 
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let eventId = "eventId_example" // String | 
let participantId = "participantId_example" // String | 
let backerId = "backerId_example" // String | 
let checkoutBackerCommand = CheckoutBackerCommand(totalAmount: 123, currency: "currency_example", description: "description_example", redirectUrl: "redirectUrl_example", locale: "locale_example") // CheckoutBackerCommand | 

// Creates an paymentrequest with the paymentprovider
PaymentsAPI.pay(eventId: eventId, participantId: participantId, backerId: backerId, checkoutBackerCommand: checkoutBackerCommand) { (response, error) in
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
 **backerId** | **String** |  | 
 **checkoutBackerCommand** | [**CheckoutBackerCommand**](CheckoutBackerCommand.md) |  | 

### Return type

[**BackerPaymentRequestModel**](BackerPaymentRequestModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

