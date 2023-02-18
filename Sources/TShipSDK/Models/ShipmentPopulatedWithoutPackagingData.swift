/// Data model containing information about a Shipment populated with details for addresses, carriers and parcel without the packaging details.
public class ShipmentPopulatedWithoutPackagingData<ParcelMetadata: Codable>: ShipmentPopulated {
    
    //TODO: This should be optional not the values inside the object
    /// Contains details about the parcel excuding the Packaging details but containing the packaging id.
    public let parcel: ParcelWithoutPackagingData<ParcelMetadata>?
    
//    public let parcels: [ParcelWithoutPackagingData<ParcelMetadata>]?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parcel = try container.decodeIfPresent(ParcelWithoutPackagingData.self, forKey: .parcel)
//        parcels = try container.decodeIfPresent([ParcelWithoutPackagingData].self, forKey: .parcels)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey {
        case parcel
//        , parcels
    }
    
}
