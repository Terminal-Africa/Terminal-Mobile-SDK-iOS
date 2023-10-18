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
    
    func getTerminalReferenceAddress(tShopId: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<Address, Error>) -> Void){
        self.request(route: Route.terminalReferenceAddress(tShopId), method: Method.get, runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<Address>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func getRate(request: GetTShopRateRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<[Rate], Error>) -> Void){
        self.request(route: Route.tShopRate, method: Method.post, queryParameters: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[Rate]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func chargeShipment(request: ChargeTShopShipmentRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<ChargeTShopShipmentResponse, Error>) -> Void){
        self.request(route: Route.tShopChargeShipment, method: Method.post, requestBody: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<ChargeTShopShipmentResponse>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func verifyReferralCodeUsed(referralCode: String, runCompletionOnUIThread: Bool, completion: @escaping(Result<VerifyReferralCodeUsedResponse, Error>) -> Void){
        self.request(route: Route.verifyReferralCodeUsed, method: Method.post, requestBody: ["referral_code": referralCode], runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<VerifyReferralCodeUsedResponse>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getQuote(request: GetTShopQuickQuoteRequest, runCompletionOnUIThread: Bool, completion: @escaping(Result<[Rate], Error>) -> Void){
        self.request(route: Route.tShopQuote, method: Method.post, requestBody: request.toDict(), runCompletionOnUIThread: runCompletionOnUIThread) {
            (result: Result<GenericTShipResponse<[Rate]>, Error>) in
            switch(result) {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
