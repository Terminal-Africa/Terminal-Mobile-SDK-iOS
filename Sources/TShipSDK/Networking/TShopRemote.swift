//
//  TShopRemote.swift
//  
//
//  Created by maxSpane on 14/04/2023.
//

class TShopRemote: NetworkService {
    
    func getAvailableAddresses(runCompletionOnUIThread: Bool, completion: @escaping(Result<[TShopAddress], Error>) -> Void){
        self.request(route: Route.tShopCountries, method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[TShopAddress]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
