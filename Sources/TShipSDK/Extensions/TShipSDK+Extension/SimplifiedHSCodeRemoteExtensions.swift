//
//  SimplifiedHSCodeRemoteExtensions.swift
//  
//
//  Created by maxSpane on 10/12/2023.
//

import Foundation

public extension TShipSDK {
    
    func getSimplifiedHSCodeChapters(runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCodeChapter], Error>) -> Void){
        simplifiedHSCodeRemote.getHSCodeChapters(runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getSimplifiedHSCodeCategories(chapterId: String? = nil, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCodeCategory], Error>) -> Void){
        simplifiedHSCodeRemote.getHSCodeCategories(chapterId: chapterId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func searchSimplifiedHSCodes(request: SearchHSCodeRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<SearchHSCodesResponseData, Error>) -> Void){
        simplifiedHSCodeRemote.searchHSCodes(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getSimplifiedHSCodes(request: GetHSCodesRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetHSCodesResponseData, Error>) -> Void){
        simplifiedHSCodeRemote.getHSCodes(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getSimplifiedHSCodeDetails(hsCodeId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCode], Error>) -> Void){
        simplifiedHSCodeRemote.getHSCodeDetails(hsCodeId: hsCodeId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
