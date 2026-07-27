//
//  ElasticShipment.swift
//  
//
//  Created by maxSpane on 19/09/2023.
//

/// A flattened shipment summary returned by the version 2 listing endpoint.
///
/// Required text and enum fields fall back to empty or default values when
/// their response fields are absent or malformed.
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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.addressTo = (try? container.decode(String.self, forKey: .addressTo)) ?? ""
        self.addressFrom = (try? container.decode(String.self, forKey: .addressFrom)) ?? ""
        self.addressReturn = (try? container.decode(String.self, forKey: .addressReturn)) ?? ""
        self.parcelId = try? container.decodeIfPresent(String.self, forKey: .parcelId)
        self.parcelIds = try? container.decodeIfPresent([String].self, forKey: .parcelIds)
        self.pickupDate = try? container.decodeIfPresent(String.self, forKey: .pickupDate)
        self.cancellationRequest = try? container.decodeIfPresent(Bool.self, forKey: .cancellationRequest)
        self.cancellationReason = try? container.decodeIfPresent(String.self, forKey: .cancellationReason)
        self.shipmentCostCurrency = try? container.decodeIfPresent(Currency.self, forKey: .shipmentCostCurrency)
        self.shipmentPurpose = (try? container.decode(ShipmentPurpose.self, forKey: .shipmentPurpose)) ?? .personal
        self.userId = (try? container.decode(String.self, forKey: .userId)) ?? ""
        self.shipmentId = (try? container.decode(String.self, forKey: .shipmentId)) ?? ""
        self.createdAt = (try? container.decode(String.self, forKey: .createdAt)) ?? ""
        self.updatedAt = (try? container.decode(String.self, forKey: .updatedAt)) ?? ""
        self.status = (try? container.decode(ShipmentStatus.self, forKey: .status)) ?? .pending
        self.shipmentCost = try? container.decodeIfPresent(Double.self, forKey: .shipmentCost)
        self.trackingNumber = try? container.decodeIfPresent(String.self, forKey: .trackingNumber)
        self.carrierTrackingUrl = try? container.decodeIfPresent(String.self, forKey: .carrierTrackingUrl)
        self.shippingLabelUrl = try? container.decodeIfPresent(String.self, forKey: .shippingLabelUrl)
        self.transactionReference = try? container.decodeIfPresent(String.self, forKey: .transactionReference)
        self.commercialInvoiceUrl = try? container.decodeIfPresent(String.self, forKey: .commercialInvoiceUrl)
        self.trackingUrl = try? container.decodeIfPresent(String.self, forKey: .trackingUrl)
        self.type = (try? container.decode(ShipmentType.self, forKey: .type)) ?? .terminal
        self.userEmail = (try? container.decode(String.self, forKey: .userEmail)) ?? ""
        self.userPhone = (try? container.decode(String.self, forKey: .userPhone)) ?? ""
        self.userCompanyName = (try? container.decode(String.self, forKey: .userCompanyName)) ?? ""
        self.userName = (try? container.decode(String.self, forKey: .userName)) ?? ""
        self.pickupEmail = (try? container.decode(String.self, forKey: .pickupEmail)) ?? ""
        self.deliveryEmail = (try? container.decode(String.self, forKey: .deliveryEmail)) ?? ""
        self.returnEmail = (try? container.decode(String.self, forKey: .returnEmail)) ?? ""
        self.pickupName = (try? container.decode(String.self, forKey: .pickupName)) ?? ""
        self.deliveryName = (try? container.decode(String.self, forKey: .deliveryName)) ?? ""
        self.returnName = (try? container.decode(String.self, forKey: .returnName)) ?? ""
        self.pickupCity = (try? container.decode(String.self, forKey: .pickupCity)) ?? ""
        self.deliveryCity = (try? container.decode(String.self, forKey: .deliveryCity)) ?? ""
        self.returnCity = (try? container.decode(String.self, forKey: .returnCity)) ?? ""
        self.pickupState = (try? container.decode(String.self, forKey: .pickupState)) ?? ""
        self.deliveryState = (try? container.decode(String.self, forKey: .deliveryState)) ?? ""
        self.returnState = (try? container.decode(String.self, forKey: .returnState)) ?? ""
        self.pickupCountry = (try? container.decode(String.self, forKey: .pickupCountry)) ?? ""
        self.deliveryCountry = (try? container.decode(String.self, forKey: .deliveryCountry)) ?? ""
        self.returnCountry = (try? container.decode(String.self, forKey: .returnCountry)) ?? ""
        self.pickupZipCode = (try? container.decode(String.self, forKey: .pickupZipCode)) ?? ""
        self.deliveryZipCode = (try? container.decode(String.self, forKey: .deliveryZipCode)) ?? ""
        self.returnZipCode = (try? container.decode(String.self, forKey: .returnZipCode)) ?? ""
        self.pickupLine1 = (try? container.decode(String.self, forKey: .pickupLine1)) ?? ""
        self.deliveryLine1 = (try? container.decode(String.self, forKey: .deliveryLine1)) ?? ""
        self.returnLine1 = (try? container.decode(String.self, forKey: .returnLine1)) ?? ""
        self.carrierName = try? container.decodeIfPresent(String.self, forKey: .carrierName)
        self.carrierLogo = try? container.decodeIfPresent(String.self, forKey: .carrierLogo)
        self.carrierSlug = try? container.decodeIfPresent(String.self, forKey: .carrierSlug)
        self.carrierId = try? container.decodeIfPresent(String.self, forKey: .carrierId)
        self.amount = try? container.decodeIfPresent(Double.self, forKey: .amount)
        self.events = try? container.decodeIfPresent([ShipmentEvent].self, forKey: .events)
        self.deliveryArranged = try? container.decodeIfPresent(String.self, forKey: .deliveryArranged)
        self.rateId = try? container.decodeIfPresent(String.self, forKey: .rateId)
    }
    
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
