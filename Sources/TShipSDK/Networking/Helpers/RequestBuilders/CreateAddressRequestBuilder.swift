//
//  CreateAddressRequestBuilder.swift
//  
//
//  Created by Mac on 14/10/2022.
//

import Foundation

public class CreateAddressRequestBuilder {
    
    var request = [String: Any]()
    
    public init (city: String, country: String, state: String){
        request[PARAM_CITY] = city
        request[PARAM_COUNTRY] = country
        request[PARAM_STATE] = state
    }
    
    @discardableResult
    public func withDetailsForUserAtAddress(firstName: String, lastName: String, email: String, phone: String) -> CreateAddressRequestBuilder {
        request[PARAM_EMAIL] = email
        request[PARAM_FIRST_NAME] = firstName
        request[PARAM_LAST_NAME] = lastName
        request[PARAM_PHONE] = phone
        return self
    }
    
    @discardableResult
    public func withAddressLines(line1: String, line2: String? = nil) -> CreateAddressRequestBuilder {
        request[PARAM_LINE1] = line1
        request[PARAM_LINE2] = line2
        return self
    }
    
    @discardableResult
    public func withZipCode(_ zipCode: String) -> CreateAddressRequestBuilder {
        request[PARAM_ZIP] = zipCode
        return self
    }
    
    @discardableResult
    public func isResidential(_ isResidential: Bool) -> CreateAddressRequestBuilder {
        request[PARAM_IS_RESIDENTIAL] = isResidential
        return self
    }
    
    @discardableResult
    public func withMetaData(_ metadata: [String: Any]) -> CreateAddressRequestBuilder {
        request[PARAM_METADATA] = metadata
        return self
    }
    
    public func build() -> [String: Any] {
        return request
    }
    
    private let PARAM_IS_RESIDENTIAL = "is_residential"
    private let PARAM_CITY = "city"
    private let PARAM_STATE = "state"
    private let PARAM_COUNTRY = "country"
    private let PARAM_EMAIL = "email"
    private let PARAM_FIRST_NAME = "first_name"
    private let PARAM_LAST_NAME = "last_name"
    private let PARAM_LINE1 = "line1"
    private let PARAM_LINE2 = "line2"
    private let PARAM_NAME = "name"
    private let PARAM_PHONE = "phone"
    private let PARAM_ZIP = "zip"
    private let PARAM_METADATA = "metadata"
    
}
