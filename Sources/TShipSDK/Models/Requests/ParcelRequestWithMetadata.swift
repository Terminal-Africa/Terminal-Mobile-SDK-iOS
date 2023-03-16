/// This class is used to make Create and Update requests for Parcels.
public class ParcelRequestWithMetadata<T: Codable>: Codable {
    
    /// A short description with details about the Parcel and it's content.
    public var description: String
    
    /// The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    public var packagingId: String
    
    /// The unit used to measure the weight of the packaging. Only 'kg' is supported at this time.
    public var weightUnit: String
    
    /// The currency the value of the items are stored in. The default value for this is Nigerian Naira.
    public var currency: Currency
    
    public var proofOfPayments: [String]
    
    /// Additional metadata you want to attach to the Parcel.
    public var metadata: T? = nil
    
    /// The items that are in the Parcel.
    public var items: [ParcelItem] = []
    
    /// Default initializer taking in the details required to create a Parcel.
    /// - Parameters:
    ///   - description: A short description with details about the Parcel and it's content.
    ///   - packagingId: The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    ///   - currency: The currency the value of the items are stored in.
    ///   - weightUnit: The unit used to measure the weight of the packaging. The default value, 'kg', is the only weight unit supported at this time.
    public init(description: String, packagingId: String, currency: Currency, weightUnit: WeightUnit = .kg, proofOfPayments: [String] = []) {
        self.description = description
        self.packagingId = packagingId
        self.weightUnit = weightUnit.rawValue
        self.currency = currency
        self.proofOfPayments = proofOfPayments
    }
    
    /// Initializer taking in a Parcel whose details you want to copy in order to update or clone it.
    /// - Parameters:
    ///   -  from: The Parcel you are trying to update or Clone.
    public init(from parcel: Parcel<T>) {
        self.description = parcel.description
        
        if let parcelWithout = parcel as? ParcelWithoutPackagingData {
            self.packagingId = parcelWithout.packagingId
        } else if let parcelWith = parcel as? ParcelWithPackagingData {
            self.packagingId = parcelWith.packaging.packagingId
        } else {
            self.packagingId = ""
        }
        
        self.weightUnit = parcel.weightUnit
        self.currency = parcel.currency ?? Currency.NGN
        self.items = parcel.items
        self.metadata = parcel.metadata
        self.proofOfPayments = parcel.proofOfPayments
    }
    
    /// This function adds an Item to the Parcel.
    /// - Parameters:
    ///   - name: The name used to identify the Item.
    ///   - description: A short description of the item.
    ///   - quantity: The quantity of the item in the parcel.
    ///   - value: The total monetary value of the item. Note that this is the cost per item multiplied by the quantity.
    ///   - weight: The weight of the item. Note that this is the weight per item multiplied by the quantity.
    /// - Returns: The Instance of the ParcelRequest.
    public func withItem(name: String, description: String, quantity: Int, value: Double, weight: Double) -> ParcelRequestWithMetadata{
        self.items.append(
            ParcelItem(
                description: description, name: name, currency: currency, quantity: quantity, value: value, weight: weight
            )
        )
        return self
    }
    
    public func withItem(_ parcelItem: ParcelItem) -> ParcelRequestWithMetadata{
        self.items.append(parcelItem)
        return self
    }
    
    /// This function removes an Item from the Parcel.
    /// - Parameters:
    ///   - index: The index of the item to be removed in the items array.
    /// - Returns: The Instance of the ParcelRequest.
    public func removeItemAt(index: Int) -> ParcelRequestWithMetadata{
        self.items.remove(at: index)
        return self
    }
    
    /// This function adds metadata to attach to the parcel object.
    /// - Parameters:
    ///   - metadata: The metadata to attach to the parcel.
    /// - Returns: The Instance of the ParcelRequest.
    public func withMetadata(_ metadata: T) -> ParcelRequestWithMetadata{
        self.metadata = metadata
        return self
    }
    
    /// This function updates the Parcel's details. If any of the parameters is set to nil the parameter is not updated. The default values are set to nil, so you can ignore parameters you don't want to update.
    /// - Parameters:
    ///   - description: A short description with details about the Parcel and it's content.
    ///   - packagingId: The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    ///   - currency: The currency the value of the items are stored in.
    ///   - weightUnit: The unit used to measure the weights in the packaging. The unit 'kg' is the only weight unit supported at this time.
    public func with(description: String? = nil, packagingId: String? = nil, currency: Currency? = nil, weightUnit: WeightUnit? = nil) -> ParcelRequestWithMetadata {
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
            self.currency = currency
        }
        return self
    }
    
    public func withProofOfPayments(_ proofOfPayments: [String]){
        self.proofOfPayments = proofOfPayments
    }
    
    public func getSumOfItemsWeight() -> Double{
        var sum: Double = 0
        for item in items {
            sum += item.weight
        }
        return sum
    }
    
    enum CodingKeys: String, CodingKey {
        case description, items, currency, metadata
        case packagingId = "packaging"
        case weightUnit = "weight_unit"
        case proofOfPayments = "proof_of_payments"
    }
    
}
