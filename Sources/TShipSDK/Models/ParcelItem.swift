/// Data model containing the details about an Item.
public struct ParcelItem: Codable {
    
    /// A short description of the item.
    public var description: String
    
    /// The name used to identify the Item.
    public var name: String
    
    /// The currency the value of the item is stored in.
    internal(set) public var currency: String
    
    /// The quantity of the item in the parcel.
    public var quantity: Int
    
    /// The total monetary value of the item. Note that this is the cost per item multiplied by the quantity.
    public var value: Double
    
    /// The weight of the item. Note that this is the weight per item multiplied by the quantity.
    public var weight: Double
    
}
