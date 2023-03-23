/// Data model containing details about a Shipment, including the details about the packaging.
public class ShipmentPopulatedWithPackagingData<ParcelMetadata: Codable>: ShipmentPopulated {
    
    /// Contains details about the parcel containing the Packaging details.
    public var parcel: ParcelWithPackagingData<ParcelMetadata>?
    
//    public let parcels: [ParcelWithPackagingData<ParcelMetadata>]?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parcel = try? container.decodeIfPresent(ParcelWithPackagingData.self, forKey: .parcel)
//        parcels = try container.decodeIfPresent([ParcelWithPackagingData].self, forKey: .parcels)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcel
//        , parcels
    }
    
}
