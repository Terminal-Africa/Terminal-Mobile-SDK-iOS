//
//  PackagingDimensions.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 17/02/2026.
//

public struct PackagingDimensions: Codable {
    public var type: PackagingType = .box
    public var height: Double
    public var width: Double
    public var length: Double
    public var sizeUnit: SizeUnit = .cm
    public var weight: Double?
    public var weightUnit: WeightUnit = .kg
    
    public init(type: PackagingType, height: Double, width: Double, length: Double, weight: Double? = nil, sizeUnit: SizeUnit = .cm, weightUnit: WeightUnit = .kg) {
        self.type = type
        self.height = height
        self.width = width
        self.length = length
        self.sizeUnit = sizeUnit
        self.weight = weight
        self.weightUnit = weightUnit
    }
    
    enum CodingKeys: String, CodingKey {
        case type, weight, height, width, length
        case sizeUnit = "size_unit"
        case weightUnit = "weight_unit"
    }
    
}
