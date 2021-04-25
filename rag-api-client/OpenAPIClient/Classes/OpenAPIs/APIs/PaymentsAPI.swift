//
// PaymentsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

open class PaymentsAPI {
    /**
     Creates an paymentrequest with the paymentprovider
     
     - parameter eventId: (path)  
     - parameter participantId: (path)  
     - parameter backerId: (path)  
     - parameter checkoutBackerCommand: (body)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func pay(eventId: String, participantId: String, backerId: String, checkoutBackerCommand: CheckoutBackerCommand, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: BackerPaymentRequestModel?, _ error: Error?) -> Void)) {
        payWithRequestBuilder(eventId: eventId, participantId: participantId, backerId: backerId, checkoutBackerCommand: checkoutBackerCommand).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Creates an paymentrequest with the paymentprovider
     - POST /events/{eventId}/participants/{participantId}/backers/{backerId}
     - Creates an paymentrequest with the paymentprovider and returns the URL to the user to finish the payment
     - parameter eventId: (path)  
     - parameter participantId: (path)  
     - parameter backerId: (path)  
     - parameter checkoutBackerCommand: (body)  
     - returns: RequestBuilder<BackerPaymentRequestModel> 
     */
    open class func payWithRequestBuilder(eventId: String, participantId: String, backerId: String, checkoutBackerCommand: CheckoutBackerCommand) -> RequestBuilder<BackerPaymentRequestModel> {
        var path = "/events/{eventId}/participants/{participantId}/backers/{backerId}"
        let eventIdPreEscape = "\(APIHelper.mapValueToPathItem(eventId))"
        let eventIdPostEscape = eventIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{eventId}", with: eventIdPostEscape, options: .literal, range: nil)
        let participantIdPreEscape = "\(APIHelper.mapValueToPathItem(participantId))"
        let participantIdPostEscape = participantIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{participantId}", with: participantIdPostEscape, options: .literal, range: nil)
        let backerIdPreEscape = "\(APIHelper.mapValueToPathItem(backerId))"
        let backerIdPostEscape = backerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{backerId}", with: backerIdPostEscape, options: .literal, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: checkoutBackerCommand)

        let url = URLComponents(string: URLString)

        let nillableHeaders: [String: Any?] = [
            :
        ]

        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<BackerPaymentRequestModel>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, headers: headerParameters)
    }

}
