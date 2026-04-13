/// This class helps create the request body needed to create and update a packaging. All parameters are required to create a Packaging.
public class PackagingRequest: Codable {
    
    public var type: PackagingType = .box
    public var height: Double?
    public var width: Double?
    public var length: Double?
    public var sizeUnit: SizeUnit = .cm
    public var name: String?
    public var weight: Double?
    public var weightUnit: WeightUnit = .kg
    
    public init() {
    }
    
    public init( type: PackagingType, height: Double, length: Double, width: Double) {
        self.type = type
        self.height = height
        self.length = length
        self.width = width
    }
    
    /// This function adds the name of the packaging to the request.
    ///  - Parameters:
    ///     - name: Name the user can use to identify the packaging
    /// - returns the instance of PackagingRequestBuilder
    @discardableResult
    public func withName(_ name: String) -> PackagingRequest
    {
        self.name = name
        return self
    }
    
    /// This function adds the type of the packaging to the request.
    ///  - Parameters:
    ///     - type: the type of the packaging
    /// - returns the instance of PackagingRequest
    @discardableResult
    public func withType(_ type: PackagingType) -> PackagingRequest
    {
        self.type = type
        return self
    }
    
    /// This function adds the dimensions of the packaging to the request.
    ///  - Parameters:
    ///     - height: the height of the packaging
    ///     - width: the width of the packaging
    ///     - length: the length of the packaging
    ///     - sizeUnit: the unit used to measure the size dimensions of the packaging. The default value for this is cm which is also the only suppported size unit for now.
    /// - returns the instance of PackagingRequest
    @discardableResult
    public func withSizeDimensions(height: Double? = nil, width: Double? = nil, length: Double? = nil, sizeUnit: SizeUnit = .cm) -> PackagingRequest
    {
        if let height {
            self.height = height
        }
        
        if let width {
            self.width = width
        }
        
        if let length {
            self.length = length
        }
        
        self.sizeUnit = sizeUnit
        return self
    }
    
    /// This function adds the weight of the packaging to the request.
    ///  - Parameters:
    ///     - weight: the weight of the packaging.
    ///     - weightUnit: the weight unit used for the size dimensions of the packaging. The default value for this is cm which is also the only suppported weight unit for now.
    /// - returns the instance of PackagingRequest
    @discardableResult
    public func withWeight(weight: Double, weightUnit: WeightUnit = .kg) -> PackagingRequest
    {
        self.weight = weight
        self.weightUnit = weightUnit
        return self
    }
    
    private let PARAM_NAME = "name"
    private let PARAM_TYPE = "type"
    private let PARAM_HEIGHT = "height"
    private let PARAM_WIDTH = "width"
    private let PARAM_LENGTH = "length"
    private let PARAM_SIZE_UNIT = "size_unit"
    private let PARAM_WEIGHT = "weight"
    private let PARAM_WEIGHT_UNIT = "weight_unit"
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case height = "height"
        case width = "width"
        case length = "length"
        case sizeUnit = "size_unit"
        case weight = "weight"
        case weightUnit = "weight_unit"
    }
    
    /// This function checks whether all the parameters required to create a Packaging have been added to the request.
    /// - returns a string with an error message based on the parameter that was discovered missing first. It returns nil if all the required parameters have been added to the request
    func anyRequiredCreateParametersMissing() -> String?{
        if name?.isEmpty == false{
            return "Packaging Name is required to create a Packaging"
        }
        
        if (height ?? 0) > 0 {
            return "Packaging Height is required to create a Packaging"
        }
        
        if (width ?? 0) > 0 {
            return "Packaging Width is required to create a Packaging"
        }
        
        if (length ?? 0) > 0 {
            return "Packaging Length is required to create a Packaging"
        }
        
        if (weight ?? 0) > 0 {
            return "The Packaging Weight is required to create a Packaging"
        }
        
        return nil
    }
    
}
