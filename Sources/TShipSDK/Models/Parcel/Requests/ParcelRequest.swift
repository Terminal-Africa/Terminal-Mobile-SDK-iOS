//
//  ParcelRequest.swift
//  
//
//  Created by maxSpane on 26/12/2022.
//

open class ParcelRequest: ParcelRequestWithMetadata<EmptyMetadata> {
    
    override public func withItem(name: String, description: String, quantity: Int, value: Double, weight: Double, type: ParcelItemType, manufacturerCountry: String?, scientificName: String? = nil) -> ParcelRequest{
        super.withItem(name: name, description: description, quantity: quantity, value: value, weight: weight, type: type, manufacturerCountry: manufacturerCountry, scientificName: scientificName)
        return self
    }
    
    override public func withItem(_ parcelItem: ParcelItem) -> ParcelRequest{
        super.withItem(parcelItem)
        return self
    }
    
    /// This function removes an Item from the Parcel.
    /// - Parameters:
    ///   - index: The index of the item to be removed in the items array.
    /// - Returns: The Instance of the ParcelRequest.
    override public func removeItemAt(index: Int) -> ParcelRequest{
        super.removeItemAt(index: index)
        return self
    }
    
    /// This function updates the Parcel's details. If any of the parameters is set to nil the parameter is not updated. The default values are set to nil, so you can ignore parameters you don't want to update.
    /// - Parameters:
    ///   - description: A short description with details about the Parcel and it's content.
    ///   - packagingId: The unique Id used to identify the Packaging used to keep the Items in the Parcel.
    ///   - currency: The currency the value of the items are stored in.
    ///   - weightUnit: The unit used to measure the weights in the packaging. The unit 'kg' is the only weight unit supported at this time.
    override public func with(description: String? = nil, packagingId: String? = nil, currency: Currency? = nil, weightUnit: WeightUnit? = nil) -> ParcelRequest {
        super.with(description: description, packagingId: packagingId, currency: currency, weightUnit: weightUnit)
        return self
    }
    
    override public func withProofOfPayments(_ proofOfPayments: [String]) -> ParcelRequest {
        super.withProofOfPayments(proofOfPayments)
        return self
    }
    
    override public func withProofOfWeights(_ proofOfWeights: [String]) -> ParcelRequest {
        super.withProofOfWeights(proofOfWeights)
        return self
    }
    
}
 
