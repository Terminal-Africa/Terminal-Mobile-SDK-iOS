/// Contains the parameters required to disable a request.
public class DisableCarrierRequest: Encodable {
    
    /// Indicates whether to disable the carrier for domestic shipments.
    public var disableForDomesticShipments: Bool
    
    /// Indicates whether to disable the carrier for regional shipments.
    public var disableForRegionalShipments: Bool
    
    /// Indicates whether to disable the carrier for international shipments.
    public var disableForInternationalShipments: Bool
    
    /// Default Initializer taking in the parameters required to disable a request.
    /// - Parameters:
    ///   - disableForDomesticShipments: Indicates whether to disable the carrier for domestic shipments. This is false by default.
    ///   - disableForRegionalShipments: Indicates whether to disable the carrier for regional shipments. This is false by default.
    ///   - disableForInternationalShipments: Indicates whether to disable the carrier for international shipments. This is false by default.
    public init(disableForDomesticShipments: Bool = false, disableForRegionalShipments: Bool = false, disableForInternationalShipments: Bool = false) {
        self.disableForDomesticShipments = disableForDomesticShipments
        self.disableForRegionalShipments = disableForRegionalShipments
        self.disableForInternationalShipments = disableForInternationalShipments
    }
    
    private enum CodingKeys: String, CodingKey {
        case disableForDomesticShipments = "domestic"
        case disableForRegionalShipments = "regional"
        case disableForInternationalShipments = "international"
    }
    
}
