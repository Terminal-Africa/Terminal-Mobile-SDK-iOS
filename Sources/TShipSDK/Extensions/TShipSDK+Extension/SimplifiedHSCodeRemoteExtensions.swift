//
//  SimplifiedHSCodeRemoteExtensions.swift
//  
//
//  Created by maxSpane on 10/12/2023.
//

import Foundation

public extension TShipSDK {
    
    /// Fetches chapters from the simplified HS code catalogue.
    func getSimplifiedHSCodeChapters(runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCodeChapter], Error>) -> Void){
        simplifiedHSCodeRemote.getHSCodeChapters(runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches simplified HS code categories, optionally restricted to a chapter.
    /// - Parameter chapterId: The chapter identifier to filter by, or `nil` for every category.
    func getSimplifiedHSCodeCategories(chapterId: String? = nil, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCodeCategory], Error>) -> Void){
        simplifiedHSCodeRemote.getHSCodeCategories(chapterId: chapterId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Searches the simplified HS code catalogue using the supplied query and pagination.
    func searchSimplifiedHSCodes(request: SearchHSCodeRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<SearchHSCodesResponseData, Error>) -> Void){
        simplifiedHSCodeRemote.searchHSCodes(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches a page of simplified HS codes.
    func getSimplifiedHSCodes(request: GetHSCodesRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<GetHSCodesResponseData, Error>) -> Void){
        simplifiedHSCodeRemote.getHSCodes(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches the simplified HS code records associated with an identifier.
    /// - Parameter hsCodeId: The identifier of the HS code to retrieve.
    func getSimplifiedHSCodeDetails(hsCodeId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCode], Error>) -> Void){
        simplifiedHSCodeRemote.getHSCodeDetails(hsCodeId: hsCodeId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
