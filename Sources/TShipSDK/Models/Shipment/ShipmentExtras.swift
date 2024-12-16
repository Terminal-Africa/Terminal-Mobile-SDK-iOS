/// Extra information that can be used to track the Shipment with the Carrier.
public struct ShipmentExtras: Codable {
    
    /// Url to view the shipment tracking information on the Carrier's website.
    public let carrierTrackingUrl: String?
    
    /// Booking reference id used to identify the shipment on the Carrier's website.
//    public let bookingReference: Int?
    
    /// URL liinking to the shipping label.
    public let shippingLabelURL: String?
    
    /// Url to view the shipment tracking information on Terminal's website.
    public let trackingUrl: String
    
    /// Number used to track the shipment on the carrier's website.
    public let carrierTrackingNumber: String?
    
    /// URL to the commercial invoice generated for the shipment items by TShip.
    public let commercialInvoiceUrl: String?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.carrierTrackingUrl = try? container.decodeIfPresent(String.self, forKey: .carrierTrackingUrl)
        self.shippingLabelURL = try? container.decodeIfPresent(String.self, forKey: .shippingLabelURL)
        self.trackingUrl = try container.decode(String.self, forKey: .trackingUrl)
        self.carrierTrackingNumber = try? container.decodeIfPresent(String.self, forKey: .carrierTrackingNumber)
        self.commercialInvoiceUrl = try? container.decodeIfPresent(String.self, forKey: .commercialInvoiceUrl)
    }
    
    private enum CodingKeys: String, CodingKey {
        case carrierTrackingUrl = "carrier_tracking_url"
//        case bookingReference = "reference"
        case shippingLabelURL = "shipping_label_url"
        case trackingUrl = "tracking_url"
        case carrierTrackingNumber = "tracking_number"
        case commercialInvoiceUrl = "commercial_invoice_url"
    }
    
}
