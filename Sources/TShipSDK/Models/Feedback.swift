//
//  Feedback.swift
//  
//
//  Created by maxSpane on 16/06/2023.
//

public struct Feedback: Decodable {
    
    public let overallRating: Double
    
    public let comment: String
    
    private enum CodingKeys: String, CodingKey {
        case overallRating = "overall_rating"
        case comment
    }
    
}
