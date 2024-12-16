/// Data model containing information about a Carrier.
public struct Carrier: Codable {
    
    /// The Carrier's name.
    public let name: String?
    
    /// A Url to the carrier's logo.
    public let logo: String?
    
    /// A unique slug used to identify the carrier.
    public let slug: String?
    
    /// A unique string used to identify the carrier.
    public let carrierId: String?
    
    /// Indicates whether the carrier offers domestic shipments.
    public let domestic: Bool?
    
    /// Indicates whether the carrier offers regional shipments.
    public let regional: Bool?
    
    /// Indicates whether the carrier offers international shipments.
    public let international: Bool?
    
    /// Indicates whether the carrier requires that the commercial invoice is attached to the parcel to be shipped.
    public let requiresInvoice: Bool?
    
    /// Indicates whether the carrier requires that the waybill is attached to the parcel to be shipped
    public let requiresWaybill: Bool?
    
    /// List of countries(ISO2) that the carrier is available in.
    public let availableCountries: [String]?
    
    /// Indicates whether if the carrier is active
    public let active: Bool?
    
    public let contact: Contact?
    
    private enum CodingKeys: String, CodingKey {
        case carrierId = "carrier_id"
        case requiresInvoice = "requires_invoice"
        case requiresWaybill = "requires_waybill"
        case availableCountries = "available_countries"
        case name, logo, slug, domestic, regional, international, contact, active
    }
    
}

public struct Contact: Codable {
    
    public let email: String?
    
    public let phone: String?
    
}
