//
//  AIHSCode.swift
//
//

/// An HS code suggested by the AI-assisted classification endpoint.
public struct AIHSCode: Decodable {

    public let hsCode: String

    public let hsCodeId: String

    public let description: String

    public let tags: [String]

    public let scientificName: String?
    
    public var regulatoryDocuments: [ItemRegulatoryDocument]?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hsCode = (try? container.decode(String.self, forKey: .hsCode)) ?? ""
        self.hsCodeId = (try? container.decode(String.self, forKey: .hsCodeId)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.tags = (try? container.decode([String].self, forKey: .tags)) ?? []
        self.scientificName = try? container.decode(String.self, forKey: .scientificName)
        self.regulatoryDocuments = try? container.decode([ItemRegulatoryDocument].self, forKey: .regulatoryDocuments)
    }

    private enum CodingKeys: String, CodingKey {
        case hsCode = "hs_code"
        case hsCodeId = "hs_code_id"
        case description
        case tags
        case scientificName = "scientific_name"
        case regulatoryDocuments = "regulatory_documents"
    }

}
