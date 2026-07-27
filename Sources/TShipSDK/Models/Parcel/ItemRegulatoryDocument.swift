/// Regulatory document requirement attached to a parcel item by the rate engine
/// (e.g. an FDA Prior Notice form required by certain carriers).
public struct ItemRegulatoryDocument: Codable, Equatable {

    public let type: String

    public let name: String

    public let carrierSlugs: [String]

    public let appliesToAllCarriers: Bool

    public init(type: String, name: String, carrierSlugs: [String], appliesToAllCarriers: Bool) {
        self.type = type
        self.name = name
        self.carrierSlugs = carrierSlugs
        self.appliesToAllCarriers = appliesToAllCarriers
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = (try? container.decode(String.self, forKey: .type)) ?? ""
        self.name = (try? container.decode(String.self, forKey: .name)) ?? ""
        self.carrierSlugs = (try? container.decode([String].self, forKey: .carrierSlugs)) ?? []
        self.appliesToAllCarriers = (try? container.decode(Bool.self, forKey: .appliesToAllCarriers)) ?? false
    }

    private enum CodingKeys: String, CodingKey {
        case type, name
        case carrierSlugs = "carrier_slugs"
        case appliesToAllCarriers = "applies_to_all_carriers"
    }
}
