//
//  HSCodeRemote.swift
//  
//
//  Created by maxSpane on 22/08/2023.
//

class HSCodeRemote: NetworkService {
    
    /// This gets HS Code chapters on the TShip API.
    /// - Parameters:
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread.
    ///   - completion: The completion handler to call, passing along the response status and response data.
    func getHSCodeChapters(runCompletionOnUIThread: Bool, completion: @escaping(Result<[HSCodeChapter], Error>) -> Void){
        self.request(route: Route.getHSCodeChapters, method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
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
        
        let request: [String: String]? = {
            if let chapterId = chapterId {
                return ["chapter": chapterId]
            }else{
                return nil
            }
        }()
        
        self.request(route: Route.getHSCodeCategories, method: Method.get, queryParameters: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[HSCodeCategory]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func searchHSCode(request: SearchHSCodeRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<SearchHSCodesResponseData, Error>) -> Void){
        
        self.request(route: Route.searchHSCode, method: Method.get, queryParameters: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<SearchHSCodesResponseData>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
