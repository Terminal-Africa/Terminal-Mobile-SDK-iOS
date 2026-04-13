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
    
    public var hsCode: String?
    
    public var hsCodeId: String?
    
    public var type: ParcelItemType?
    
    public var manufacturerCountry: String?
    
    public var scientificName: String?
    
    public init(description: String, name: String, currency: Currency, quantity: Int, value: Double, weight: Double, hsCode: String? = nil, hsCodeId: String? = nil, type: ParcelItemType, manufacturerCountry: String?, scientificName: String?) {
        self.description = description
        self.name = name
        self.currency = currency
        self.quantity = quantity
        self.value = value
        self.weight = weight
        self.hsCode = hsCode
        self.hsCodeId = hsCodeId
        self.type = type
        self.manufacturerCountry = manufacturerCountry
        self.scientificName = scientificName
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.currency = (try? container.decode(Currency.self, forKey: .currency)) ?? .NGN
        self.quantity = (try? container.decode(Int.self, forKey: .quantity)) ?? 0
        self.value = (try? container.decode(Double.self, forKey: .value)) ?? 0
        self.weight = (try? container.decode(Double.self, forKey: .weight)) ?? 0
        self.hsCode = try? container.decode(String.self, forKey: .hsCode)
        self.hsCodeId = try? container.decode(String.self, forKey: .hsCodeId)
        self.type = (try? container.decode(ParcelItemType.self, forKey: .type)) ?? .parcel
        self.manufacturerCountry = try? container.decode(String.self, forKey: .manufacturerCountry)
        self.scientificName = try? container.decode(String.self, forKey: .scientificName)
    }
    
    public static func == (lhs: ParcelItem, rhs: ParcelItem) -> Bool {
        return lhs.description == rhs.description && lhs.name == rhs.name && lhs.currency == rhs.currency && lhs.quantity == rhs.quantity && lhs.value == rhs.value && lhs.weight == rhs.weight && lhs.hsCode == rhs.hsCode && lhs.hsCodeId == rhs.hsCodeId && lhs.type == rhs.type && lhs.manufacturerCountry == rhs.manufacturerCountry && lhs.scientificName == rhs.scientificName
    }
    
    private enum CodingKeys: String, CodingKey {
        case description, name, currency, quantity, value, weight, type
        case hsCode = "hs_code"
        case manufacturerCountry = "manufacturer_country"
        case hsCodeId = "hs_code_id"
        case scientificName = "scientific_name"
    }
    
}
