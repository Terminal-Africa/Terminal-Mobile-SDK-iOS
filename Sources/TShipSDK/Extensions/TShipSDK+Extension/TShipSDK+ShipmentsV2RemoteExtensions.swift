//
//  TShipSDK+ShipmentsV2RemoteExtensions.swift
//
//
//  Created by maxSpane on 03/10/2023.
//

public extension TShipSDK {
    
    func getShipmentPreviews(request: GetShipmentsRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetShipmentPreviewsResponse, Error>) -> Void){
        shipmentsV2Remote.getShipmentPreviews(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
