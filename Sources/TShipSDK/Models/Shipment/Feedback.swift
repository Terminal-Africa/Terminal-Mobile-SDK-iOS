//
//  Feedback.swift
//  
//
//  Created by maxSpane on 16/06/2023.
//

public struct Feedback: Decodable {
    
    public let overallRating: Double
    
    public let comment: String
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.overallRating = (try? container.decode(Double.self, forKey: .overallRating)) ?? 0
        self.comment = (try? container.decode(String.self, forKey: .comment)) ?? ""
    }
    
    private enum CodingKeys: String, CodingKey {
        case overallRating = "overall_rating"
        case comment
    }
    
}
