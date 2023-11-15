import Foundation

/// Geographical Coordinates of a location, usually an address.
public class Coordinates: Codable{
    public let lat, lng: Double
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = (try? container.decodeIfPresent(Double.self, forKey: .lat)) ?? 0
        lng = (try? container.decodeIfPresent(Double.self, forKey: .lng)) ?? 0
    }
    
    private enum CodingKeys: CodingKey {
        case lat
        case lng
    }
    
//    public static func == (lhs: Coordinates, rhs: Coordinates) -> Bool {
//        return lhs == rhs
//    }
}
