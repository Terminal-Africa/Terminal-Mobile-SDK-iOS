//
//  ClaimsRemote.swift
//  
//
//  Created by maxSpane on 01/03/2023.
//

class ClaimsRemote: NetworkService{
    
    func fileClaim(request: FileClaimRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<FileClaimResponse, Error>) -> Void){
        self.request(route: Route.fileClaim, method: Method.post, requestBody: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<FileClaimResponse>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func getClaim(id: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<Claim, Error>) -> Void){
        self.request(route: Route.claim(id), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Claim>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
