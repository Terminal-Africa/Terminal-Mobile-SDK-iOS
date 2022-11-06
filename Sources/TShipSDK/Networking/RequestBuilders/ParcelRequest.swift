/// This class is used to make Create and Update requests for Parcels.
public class ParcelRequest<T: Codable>: Codable {
    
    /// A short description with details about the Parcel and it's content.
    public var description: String
    
    /// The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    public var packagingId: String
    
    /// The unit used to measure the weight of the packaging. Only 'kg' is supported at this time.
    public var weightUnit: String
    
    /// The currency the value of the items are stored in. The default value for this is Nigerian Naira.
    public var currency: String
    
    /// Additional metadata you want to attach to the Parcel.
    public var metadata: T? = nil
    
    /// The items that are in the Parcel.
    private(set) public var items: [ParcelItem] = []
    
    /// Default initializer taking in the details required to create a Parcel.
    /// - Parameters:
    ///   - description: A short description with details about the Parcel and it's content.
    ///   - packagingId: The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    ///   - currency: The currency the value of the items are stored in.
    ///   - weightUnit: The unit used to measure the weight of the packaging. The default value, 'kg', is the only weight unit supported at this time.
    public init(description: String, packagingId: String, currency: Currency, weightUnit: WeightUnit = .kg) {
        self.description = description
        self.packagingId = packagingId
        self.weightUnit = weightUnit.rawValue
        self.currency = currency.rawValue
    }
    
    /// This function adds an Item to the Parcel.
    /// - Parameters:
    ///   - name: The name used to identify the Item.
    ///   - description: A short description of the item.
    ///   - quantity: The quantity of the item in the parcel.
    ///   - value: The total monetary value of the item. Note that this is the cost per item multiplied by the quantity.
    ///   - weight: The weight of the item. Note that this is the weight per item multiplied by the quantity.
    /// - Returns: The Instance of the ParcelRequest.
    public func withItem(name: String, description: String, quantity: Int, value: Double, weight: Double) -> ParcelRequest{
        self.items.append(
            ParcelItem(
                description: description, name: name, currency: currency, quantity: quantity, value: value, weight: weight
            )
        )
        return self
    }
    
    /// This function removes an Item from the Parcel.
    /// - Parameters:
    ///   - index: The index of the item to be removed in the items array.
    /// - Returns: The Instance of the ParcelRequest.
    public func removeItemAt(index: Int) -> ParcelRequest{
        self.items.remove(at: index)
        return self
    }
    
    /// This function adds metadata to attach to the parcel object.
    /// - Parameters:
    ///   - metadata: The metadata to attach to the parcel.
    /// - Returns: The Instance of the ParcelRequest.
    public func withMetadata(_ metadata: T) -> ParcelRequest{
        self.metadata = metadata
        return self
    }
    
    /// This function updates the Parcel's details. If any of the parameters is set to nil the parameter is not updated. The default values are set to nil, so you can ignore parameters you don't want to update.
    /// - Parameters:
    ///   - description: A short description with details about the Parcel and it's content.
    ///   - packagingId: The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    ///   - currency: The currency the value of the items are stored in.
    ///   - weightUnit: The unit used to measure the weights in the packaging. The unit 'kg' is the only weight unit supported at this time.
    public func with(description: String? = nil, packagingId: String? = nil, currency: Currency? = nil, weightUnit: WeightUnit? = nil) -> ParcelRequest {
        if let description = description {
            self.description = description
        }
        if let packagingId = packagingId {
            self.packagingId = packagingId
        }
        if let weightUnit = weightUnit {
            self.weightUnit = weightUnit.rawValue
        }
        if let currency = currency {
            self.currency = currency.rawValue
        }
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case description, items, currency, metadata
        case packagingId = "packaging"
        case weightUnit = "weight_unit"
    }
    
}
