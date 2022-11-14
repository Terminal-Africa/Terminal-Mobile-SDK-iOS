/// An enum representing all the valid shipment purposes you can set when creating a shipment.
public enum ShipmentPurpose: String, Codable {
    
    /// Used if you are shipping for personal reasons.
    case personal = "personal"
    
    /// Used if you are shipping for commercial/business reasons
    case commercial = "commercial"
    
    /// Used if you are shipping a sample product to a customer
    case sample = "sample"
    
    /// Used if you are shipping a product back to customer after repair
    case returnAfterRepair = "return-after-repair"
    
    /// Used if you are shipping a product for repair
    case returnForRepair = "return-for-repair"
    
}
