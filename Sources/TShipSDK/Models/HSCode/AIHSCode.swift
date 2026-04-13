//
//  AIHSCode.swift
//
//

public struct AIHSCode: Decodable {

    public let hsCode: String

    public let hsCodeId: String

    public let description: String

    public let tags: [String]

    public let scientificName: String?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hsCode = (try? container.decode(String.self, forKey: .hsCode)) ?? ""
        self.hsCodeId = (try? container.decode(String.self, forKey: .hsCodeId)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.tags = (try? container.decode([String].self, forKey: .tags)) ?? []
        self.scientificName = try? container.decode(String.self, forKey: .scientificName)
    }

    private enum CodingKeys: String, CodingKey {
        case hsCode = "hs_code"
        case hsCodeId = "hs_code_id"
        case description
        case tags
        case scientificName = "scientific_name"
    }

}
