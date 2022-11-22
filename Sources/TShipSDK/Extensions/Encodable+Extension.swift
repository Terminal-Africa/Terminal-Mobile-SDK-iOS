import Foundation
//
extension Encodable {
    
    /// This function converts any class that comforms to the Encodable protocol to a dictionary, which can then be used to make API requests
    func toDict() -> [String : AnyObject] {
        var object: [String : AnyObject] = [String : AnyObject]()
        do {
            if let dataFromObject = try? JSONEncoder().encode(self) {
                object = try JSONSerialization.jsonObject(with: dataFromObject, options: []) as! [String : AnyObject]
            }
        } catch (let error) {
            print("\nError Encoding Parameter Model Object \n \(error.localizedDescription)\n")
        }
        return object
    }
 
}
