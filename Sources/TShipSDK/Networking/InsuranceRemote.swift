//
//  InsuranceRemote.swift
//  
//
//  Created by maxSpane on 04/01/2023.
//

class InsuranceRemote: NetworkService {
    
    func getInsurancePremium(request: GetInsurancePremiumRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<InsurancePremium, Error>) -> Void){
        self.request(route: Route.insurancePremium, method: Method.get, queryParameters: request.toDict(),runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<InsurancePremium>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
