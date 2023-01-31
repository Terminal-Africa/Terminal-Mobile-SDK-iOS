/// An enum representing the valid Packaging types on TShip
public enum PackagingType: String, Codable {
    
    /// Represents the box Packaging type.
    case box
    
    /// Represents the envelope Packaging type.
    case envelope
    
    /// Represents the soft Packaging type.
    case softPackaging = "soft-packaging"
    
}
