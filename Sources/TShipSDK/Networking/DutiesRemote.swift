//
//  DutiesRemote.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 04/12/2025.
//

class DutiesRemote: NetworkService {
    
    func calculateDutyFee(request: CalculateDutyFeeRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<CustomDuty, Error>) -> Void){
        self.request(route: .calculateDuty, method: .post, requestBody: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<CustomDuty>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
