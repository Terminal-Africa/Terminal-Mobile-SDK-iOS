/// This class helps create the request body needed to create and update a packaging. All parameters are required to create a Packaging.
public class PackagingRequest{
    
    /// The built request body for creating an address.
    var request = [String: Any]()
    
    public init() {
    }
    
    /// This function adds the name of the packaging to the request.
    ///  - Parameters:
    ///     - name: Name the user can use to identify the packaging
    /// - returns the instance of PackagingRequestBuilder
    @discardableResult
    public func withName(_ name: String) -> PackagingRequest
    {
        request[PARAM_NAME] = name
        return self
    }
    
    /// This function adds the type of the packaging to the request.
    ///  - Parameters:
    ///     - type: the type of the packaging
    /// - returns the instance of PackagingRequest
    @discardableResult
    public func withType(_ type: PackagingType) -> PackagingRequest
    {
        request[PARAM_TYPE] = type.rawValue
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
            request[PARAM_HEIGHT] = height
        }
        
        if let width {
            request[PARAM_WIDTH] = width
        }
        
        if let length {
            request[PARAM_LENGTH] = length
        }
        
        request[PARAM_SIZE_UNIT] = sizeUnit.rawValue
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
        request[PARAM_WEIGHT] = weight
        request[PARAM_WEIGHT_UNIT] = weightUnit.rawValue
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
    
    /// This function checks whether all the parameters required to create a Packaging have been added to the request.
    /// - returns a string with an error message based on the parameter that was discovered missing first. It returns nil if all the required parameters have been added to the request
    func anyRequiredCreateParametersMissing() -> String?{
        let requestKeys = request.keys
        
        if !requestKeys.contains(PARAM_NAME){
            return "Packaging Name is required to create a Packaging"
        }
        
        if !requestKeys.contains(PARAM_TYPE){
            return "Packaging Type is required to create a Packaging"
        }
        
        if !requestKeys.contains(PARAM_HEIGHT){
            return "Packaging Height is required to create a Packaging"
        }
        
        if !requestKeys.contains(PARAM_WIDTH){
            return "Packaging Width is required to create a Packaging"
        }
        
        if !requestKeys.contains(PARAM_LENGTH){
            return "Packaging Length is required to create a Packaging"
        }
        
        if !requestKeys.contains(PARAM_SIZE_UNIT){
            return "The unit used for the Packaging sizes is required to create a Packaging"
        }
        
        if !requestKeys.contains(PARAM_WEIGHT){
            return "The Packaging Weight is required to create a Packaging"
        }
        
        if !requestKeys.contains(PARAM_WEIGHT_UNIT){
            return "The unit used for the Packaging weight is required to create a Packaging"
        }
        
        return nil
    }
    
}
