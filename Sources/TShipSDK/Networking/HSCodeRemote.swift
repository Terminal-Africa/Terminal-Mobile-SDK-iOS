//
//  HSCodeRemote.swift
//  
//
//  Created by maxSpane on 22/08/2023.
//

class HSCodeRemote: NetworkService {
    
    /// This creates an Address on the TShip API.
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
    
}
