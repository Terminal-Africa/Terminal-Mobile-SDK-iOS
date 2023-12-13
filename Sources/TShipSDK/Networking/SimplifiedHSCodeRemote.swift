//
//  SimplifiedHSCodeRemote.swift
//
//
//  Created by maxSpane on 08/12/2023.
//

class SimplifiedHSCodeRemote: NetworkService {
    
    /// This gets HS Code chapters on the TShip API.
    /// - Parameters:
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getHSCodeChapters(runCompletionOnUIThread: Bool, completion: @escaping(Result<[HSCodeChapter], Error>) -> Void){
        self.request(route: Route.simplifiedHSCodeChapters, method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[HSCodeChapter]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    /// This gets HS Code categoreis on the TShip API.
    /// - Parameters:
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getHSCodeCategories(chapterId: String? = nil, runCompletionOnUIThread: Bool, completion: @escaping(Result<[HSCodeCategory], Error>) -> Void){
        
        let request: GetHSCodeCategoriesRequest? = {
            if let chapterId = chapterId {
                return GetHSCodeCategoriesRequest(chapterId: chapterId)
            }else{
                return nil
            }
        }()
        
        self.request(route: Route.simplifiedHSCodeCategories, method: Method.get, queryParameters: request?.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[HSCodeCategory]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func searchHSCodes(request: SearchHSCodeRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<SearchHSCodesResponseData, Error>) -> Void){
        
        self.request(route: Route.searchSimplifiedHSCodes, method: Method.get, queryParameters: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<SearchHSCodesResponseData>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func getHSCodes(request: GetHSCodesRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<GetHSCodesResponseData, Error>) -> Void){
        
        self.request(route: Route.simplifiedHSCodes(), method: Method.get, queryParameters: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetHSCodesResponseData>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func getHSCodeDetails(hsCodeId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<[HSCode], Error>) -> Void){
        
        self.request(route: Route.simplifiedHSCodes(hsCodeId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[HSCode]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}

