//
//  AddressesRemote.swift
//  
//
//  Created by Mac on 14/10/2022.
//

import Foundation

class AddresssesRemote: NetworkService {
    
    func createAddress(secretKey: String, request: [String: Any], runCompletionOnUIThread: Bool, completion: @escaping(Result<Address, Error>) -> Void){
        self.request(route: Route.createAddress, method: Method.post, bearerToken: secretKey, requestBody: request, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Address>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
