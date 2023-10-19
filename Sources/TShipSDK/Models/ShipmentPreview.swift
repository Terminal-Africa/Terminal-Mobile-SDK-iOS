//
//  ElasticShipment.swift
//  
//
//  Created by maxSpane on 19/09/2023.
//

public struct ShipmentPreview: Decodable{
    
    public let addressTo: String
    
    public let addressFrom: String
    
    public let addressReturn: String
    
    public let parcelId: String?
    
    public let parcelIds: [String]?
    
    public let pickupDate: String?
    
    public let cancellationRequest: Bool?
    
    public let cancellationReason: String?
    
    public let shipmentCostCurrency: Currency?
    
    public let shipmentPurpose: ShipmentPurpose
    
    public let status: ShipmentStatus
    
    public let userId: String
    
    public let shipmentId: String
    
    public let createdAt: String
    
    public let updatedAt: String
    
    public let userEmail: String
    
    public let userPhone: String
    
    public let userCompanyName: String
    
    public let userName: String
    
    public let pickupEmail: String
    
    public let deliveryEmail: String
    
    public let returnEmail: String
    
    public let pickupName: String
    
    public let deliveryName: String
    
    public let returnName: String
    
    public let pickupCity: String
    
    public let deliveryCity: String
    
    public let returnCity: String
    
    public let pickupState: String
    
    public let deliveryState: String
    
    public let returnState: String
    
    public let pickupCountry: String
    
    public let deliveryCountry: String
    
    public let returnCountry: String
    
    public let pickupZipCode: String
    
    public let deliveryZipCode: String
    
    public let returnZipCode: String
    
    public let pickupLine1: String
    
    public let deliveryLine1: String
    
    public let returnLine1: String
    
    public let carrierName: String?
    
    public let carrierLogo: String?
    
    public let carrierSlug: String?
    
    public let carrierId: String?
    
    public let amount: Double?
    
    public let events: [ShipmentEvent]?
    
    public let deliveryArranged: String?
    
    public let rateId: String?
    
    public let shipmentCost: Double?
    
    public let trackingNumber: String?
    
    public let transactionReference: String?
    
//    public let reference: String?
    
    public let carrierTrackingUrl: String?
    
    public let shippingLabelUrl: String?
    
    public let commercialInvoiceUrl: String?
    
    public let trackingUrl: String?
    
    public let type: ShipmentType
    
    private enum CodingKeys: String, CodingKey {
        
        case addressTo = "address_to"
        
        case addressFrom = "address_from"
        
        case addressReturn = "address_return"
        
        case parcelId = "parcel"
        
        case parcelIds = "parcels"
        
        case pickupDate = "pickup_date"
        
        case cancellationRequest = "cancellation_request"
        
        case cancellationReason = "cancellation_reason"
        
        case shipmentCostCurrency = "shipment_cost_currency"
        
        case shipmentPurpose = "shipment_purpose"
        
        case userId = "user"
        
        case shipmentId = "shipment_id"
        
        case createdAt = "created_at"
        
        case updatedAt = "updated_at"
        
        case userEmail = "user_email"
        
        case carrierId = "carrier"
        
        case deliveryArranged = "delivery_arranged"
        
        case rateId = "rate"
        
        case shipmentCost = "shipment_cost"
        
        case trackingNumber = "tracking_number"
        
        case userPhone = "user_phone"
        
        case userCompanyName = "user_company_name"
        
        case userName = "user_name"
        
        case pickupEmail = "pickup_email"
        
        case deliveryEmail = "delivery_email"
        
        case returnEmail = "return_email"
        
        case pickupName = "pickup_name"
        
        case deliveryName = "delivery_name"
        
        case returnName = "return_name"
        
        case pickupCity = "pickup_city"
        
        case deliveryCity = "delivery_city"
        
        case returnCity = "return_city"
        
        case pickupState = "pickup_state"
        
        case deliveryState = "delivery_state"
        
        case returnState = "return_state"
        
        case pickupCountry = "pickup_country"
        
        case deliveryCountry = "delivery_country"
        
        case returnCountry = "return_country"
        
        case pickupZipCode = "pickup_zip"
        
        case deliveryZipCode = "delivery_zip"
        
        case returnZipCode = "return_zip"
        
        case pickupLine1 = "pickup_line1"
        
        case deliveryLine1 = "delivery_line1"
        
        case returnLine1 = "return_line1"
        
        case carrierName = "carrier_name"
        
        case carrierLogo = "carrier_logo"
        
        case carrierSlug = "carrier_slug"
        
        case carrierTrackingUrl = "carrier_tracking_url"
        
        case shippingLabelUrl = "shipping_label_url"
        
        case commercialInvoiceUrl = "commercial_invoice_url"
        
        case trackingUrl = "tracking_url"
        
        case transactionReference = "transaction_reference"
        
        case status, events, amount, type
        
    }
    
}
