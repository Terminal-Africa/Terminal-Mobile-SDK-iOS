/// Data model containing the details about an Item.
public struct ParcelItem: Codable, Equatable {
    
    /// A short description of the item.
    public var description: String
    
    /// The name used to identify the Item.
    public var name: String
    
    /// The currency the value of the item is stored in.
    public var currency: Currency = .NGN
    
    /// The quantity of the item in the parcel.
    public var quantity: Int
    
    /// The total monetary value of the item. Note that this is the cost per item multiplied by the quantity.
    public var value: Double
    
    /// The weight of the item. Note that this is the weight per item multiplied by the quantity.
    public var weight: Double
    
    public var hscode: String?
    
    public init(description: String, name: String, currency: Currency, quantity: Int, value: Double, weight: Double, hscode: String? = nil) {
        self.description = description
        self.name = name
        self.currency = currency
        self.quantity = quantity
        self.value = value
        self.weight = weight
        self.hscode = hscode
    }
    
    public static func == (lhs: ParcelItem, rhs: ParcelItem) -> Bool {
        return lhs.description == rhs.description && lhs.name == rhs.name && lhs.currency == rhs.currency && lhs.quantity == rhs.quantity && lhs.value == rhs.value && lhs.weight == rhs.weight && lhs.hscode == rhs.hscode
    }
    
}
