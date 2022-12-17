/// Contains the parameters required to enable a request.
public class EnableCarrierRequest: Encodable {
    
    /// Indicates whether to enable the carrier for domestic shipments.
    public var enableForDomesticShipments: Bool
    
    /// Indicates whether to enable the carrier for regional shipments.
    public var enableForRegionalShipments: Bool
    
    /// Indicates whether to enable the carrier for international shipments.
    public var enableForInternationalShipments: Bool
    
    /// Default Initializer taking in the parameters required to enable a request.
    /// - Parameters:
    ///   - enableForDomesticShipments: Indicates whether to enable the carrier for domestic shipments. This is false by default.
    ///   - enableForRegionalShipments: Indicates whether to enable the carrier for regional shipments. This is false by default.
    ///   - enableForInternationalShipments: Indicates whether to enable the carrier for international shipments. This is false by default.
    public init(enableForDomesticShipments: Bool = false, enableForRegionalShipments: Bool = false, enableForInternationalShipments: Bool = false) {
        self.enableForDomesticShipments = enableForDomesticShipments
        self.enableForRegionalShipments = enableForRegionalShipments
        self.enableForInternationalShipments = enableForInternationalShipments
    }
    
    private enum CodingKeys: String, CodingKey {
        case enableForDomesticShipments = "domestic"
        case enableForRegionalShipments = "regional"
        case enableForInternationalShipments = "international"
    }
    
}
