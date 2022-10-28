import Foundation

/**
 The Network Service makes making API calls easier by creating the requests and handling the responses. You can create an instance of it or extend it in your Remote classes.
 */
class NetworkService {
    
    /// Base url to use to make requests to routes
    private let baseUrl: String
    
    /// The bearer token for API access. Usually access token or a secret/public key. 'Bearer' is added for you so you need only provide the key/token.
    private let bearerToken: String
    
    /// Initialises the NetworkService with the baseUrl
    /// - Parameters:
    ///  - baseUrl: Base url to use to make requests to routes
    ///  - bearerToken: The bearer token for API access. Usually access token or a secret/public key. 'Bearer' is added for you so you need only provide the key/token.
    init(baseUrl: String, bearerToken: String) {
        self.baseUrl = baseUrl
        self.bearerToken = bearerToken
    }
    
    /// This function makes an API request.
    /// - Parameters:
    ///   - route: The path the the resource in the backend.
    ///   - method: Type of request to be made.
    ///   - queryParameters: Query parameters you need to pass to the backend.
    ///   - requestBody: Request body you need to pass to the backend.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    /// - Returns: URLRequest
    func request<T: Codable>(
        route: Route,
        method: Method,
        queryParameters: [String: Any]? = nil,
        requestBody: [String: Any]? = nil,
        runCompletionOnUIThread: Bool,
        completion: @escaping(Result<T, Error>) -> Void
    ) {
        guard let request = createRequest(route: route, method: method, bearerToken: bearerToken, queryParameters: queryParameters, requestBody: requestBody) else {
            completion(.failure(TShipSDKError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            self.runInBackgroundOrUIThread(runOnUIThread: runCompletionOnUIThread) {
                if let data = data {
                    let response = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                    print(response)
                } else {
                    print("No data returned")
                }
                self.handleResponse(response: response, data: data, completion: completion)
            }
        }.resume()
    }
    
    /// This function generates a urlRequest.
    /// - Parameters:
    ///   - route: The path the the resource in the backend.
    ///   - method: Type of request to be made.
    ///   - bearerToken: The bearer token for API access. Usually access token or a secret/public key. 'Bearer' is added for you so you need only provide the key/token.
    ///   - queryParameters: Query parameters you need to pass to the backend.
    ///   - requestBody: Request body you need to pass to the backend.
    /// - Returns: URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               bearerToken: String? = nil,
                               queryParameters: [String: Any]? = nil,
                               requestBody: [String: Any]? = nil) -> URLRequest? {
        let urlString = baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let bearerToken = bearerToken {
            urlRequest.addValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        }
        
        if let parameters = queryParameters {
            var urlComponent = URLComponents(string: urlString)
            urlComponent?.queryItems = parameters.map { URLQueryItem(name: $0, value: "\($1)") }
            urlRequest.url = urlComponent?.url
        }
        
        if let body = requestBody {
            let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
            urlRequest.httpBody = bodyData
        }
        
        return urlRequest
    }
    
    /// This function handles responses gotten from the server, calling the completion handler when it is done. This function is tuned to be friendlier to the error data model used in the TShip API by decoding the error data with TShipResponseWithoutData struct so it is easier to get and pass along the error messages from BAD_REQUESTs(400) since the data it returns is not consistent and is not being used for now.
    /// - Parameters:
    ///   - response: The response  gotten from running URLSession.dataTask or .data.
    ///   - data: Data gotten from running URLSession.dataTask or .data.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    private func handleResponse<T: Codable>(response: URLResponse?, data: Data?,
                                              completion: (Result<T, Error>) -> Void) {
        guard let response = response else {
            completion(.failure(TShipSDKError.unknownError))
            return
        }
        
        switch((response as? HTTPURLResponse)?.statusCode){
        case HttpStatusCode.OK.rawValue, HttpStatusCode.CREATED.rawValue:
            
            if let data = data {
                let decoder = JSONDecoder()
                guard let response = try? decoder.decode(T.self, from: data) else {
                    completion(.failure(TShipSDKError.errorDecoding))
                    return
                }
                completion(.success(response))
            }else{
                completion(.failure(TShipSDKError.unknownError))
            }
            
        case HttpStatusCode.BAD_REQUEST.rawValue:
            
            if let data = data {
                let decoder = JSONDecoder()
                guard let response = try? decoder.decode(TShipResponseWithoutData.self, from: data) else {
                    completion(.failure(TShipSDKError.errorDecoding))
                    return
                }
                completion(.failure(TShipSDKError.serverError(response.message)))
            }else{
                completion(.failure(TShipSDKError.unknownError))
            }
            
        default:
            completion(.failure(TShipSDKError.unknownError))
            
        }
        
    }
    
    func runInBackgroundOrUIThread(runOnUIThread: Bool, toRun: @escaping() -> Void){
        if runOnUIThread {
            DispatchQueue.main.async {
                toRun()
            }
        }else{
            toRun()
        }
    }
    
}
