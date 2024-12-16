/// This class houses the parameters required for a carriers paginated request.
public class GetCarriersRequest: PaginatedRequestBuilder {
    
    /// If true, only active carriers will be returned. If set to false, only disabled carriers will be returned. If nil, all carriers will be returned.
    public var active: Bool?
    
    /// Set if you want carriers that offer a specific service type. If nil all carriers are returned.
    public var type: CarrierServiceType?
    
    /// Default initializer that optionally takes in the parameters for getting carriers.
    /// - Parameters:
    ///   - perPage: The number of items to return in the response per request. The default number is 15.
    ///   - page: The page number of the paginated request. This starts from 1. The default value is 1.
    ///   - active: If true, only active carriers will be returned. If set to false, only disabled carriers will be returned. If nil, all carriers will be returned. It is nil by default.
    ///   - type: Set if you want carriers that offer a specific service type. If nil all carriers are returned. It is nil by default.
    public init(perPage: Int = 15, page: Int = 1, active: Bool? = nil, type: CarrierServiceType? = nil){
        self.active = active
        self.type = type
        super.init(perPage: perPage, page: page)
    }
    
    /// This function updates the active parameter in the request, determining whether to only return active carriers.
    /// - Parameters:
    ///   - active: If true, only active carriers will be returned. If set to false, only disabled carriers will be returned. If nil, all carriers will be returned.
    public func isActive(_ active: Bool?) -> GetCarriersRequest{
        self.active = active
        return self
    }
    
    /// This function updates the type parameter in the request, determining whether to return carriers that offer a specific service type.
    /// - Parameters:
    ///   - type: Set if you want carriers that offer a specific service type. If nil all carriers are returned.
    public func withType(_ type: CarrierServiceType?) -> GetCarriersRequest{
        self.type = type
        return self
    }
    
    private enum CodingKeys: String, CodingKey {
        case type, active
    }
    
    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(active, forKey: .active)
        try super.encode(to: encoder)
    }
    
}
