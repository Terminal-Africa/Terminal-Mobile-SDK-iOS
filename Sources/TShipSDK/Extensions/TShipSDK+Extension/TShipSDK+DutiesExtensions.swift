//
//  TShipSDK+DutiesExtensions.swift
//  TShipSDK
//
//  Created by Mohammed Adetunji on 04/12/2025.
//

public extension TShipSDK {
    
    func calculateDutyFee(request: CalculateDutyFeeRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<CustomDuty, Error>) -> Void) {
        dutiesRemote.calculateDutyFee(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
