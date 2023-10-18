//
//  ShipmentsV2Remote.swift
//
//
//  Created by maxSpane on 26/09/2023.
//

class ShipmentsV2Remote: NetworkService {
    
    func getShipmentPreviews(request: GetShipmentsRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<GetShipmentPreviewsResponse, Error>) -> Void){
        self.request(route: Route.shipments(), method: Method.get, queryParameters: request.build(),runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<GetShipmentsV2>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(GetShipmentPreviewsResponse(from: response.data)))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
}
