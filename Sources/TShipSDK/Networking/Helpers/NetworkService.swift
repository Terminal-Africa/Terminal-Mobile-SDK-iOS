//
//  NetworkService.swift
//
//  Created by Mohammed Adetunji on 13/10/2022.
//

import Foundation

class NetworkService {
    
    func request<T: Codable>(
        route: Route,
        method: Method,
        bearerToken: String? = nil,
        queryParameters: [String: Any]? = nil,
        requestBody: [String: Any]? = nil,
        runCompletionOnUIThread: Bool,
        completion: @escaping(Result<T, Error>) -> Void
    ) {
        guard let request = createRequest(route: route, method: method, bearerToken: bearerToken, queryParameters: queryParameters, requestBody: requestBody) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if runCompletionOnUIThread {
                DispatchQueue.main.async {
                    self.handleResponse(response: response, data: data, completion: completion)
                }
            }else{
                self.handleResponse(response: response, data: data, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Codable>(response: URLResponse?, data: Data?,
                                              completion: (Result<T, Error>) -> Void) {
        guard let response = response else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        switch((response as? HTTPURLResponse)?.statusCode){
        case HttpStatusCode.OK.rawValue, HttpStatusCode.CREATED.rawValue:
            
            if let data = data {
                let decoder = JSONDecoder()
                guard let response = try? decoder.decode(T.self, from: data) else {
                    completion(.failure(AppError.errorDecoding))
                    return
                }
                completion(.success(response))
            }else{
                completion(.failure(AppError.unknownError))
            }
            
        case HttpStatusCode.BAD_REQUEST.rawValue:
            
            if let data = data {
                let decoder = JSONDecoder()
                guard let response = try? decoder.decode(TShipResponseWithoutData.self, from: data) else {
                    completion(.failure(AppError.errorDecoding))
                    return
                }
                completion(.failure(AppError.serverError(response.message)))
            }else{
                completion(.failure(AppError.unknownError))
            }
            
        default:
            completion(.failure(AppError.unknownError))
            
        }
        
    }
    
    /// This function helps us to generate a urlRequest
    /// - Parameters:
    ///   - route: the path the the resource in the backend
    ///   - method: type of request to be made
    ///   - queryParameters: query parameters you need to pass to the backend
    ///   - requestBody: request body you need to pass to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               bearerToken: String? = nil,
                               queryParameters: [String: Any]? = nil,
                               requestBody: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
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
    
}
