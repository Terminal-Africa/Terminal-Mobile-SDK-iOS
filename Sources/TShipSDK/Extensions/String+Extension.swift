import Foundation

extension String {
    ///Initializes a URL with the String
    var asUrl: URL? {
        return URL(string: self)
    }
}
