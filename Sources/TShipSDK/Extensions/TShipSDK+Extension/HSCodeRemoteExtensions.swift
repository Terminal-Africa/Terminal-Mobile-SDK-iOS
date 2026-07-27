//
//  TShipSDK+HSCodeRemoteExtensions.swift
//  
//
//  Created by maxSpane on 22/08/2023.
//

public extension TShipSDK {
    
    /// Fetches the chapters in the Harmonized System classification.
    /// - Parameters:
    ///   - runCompletionOnUIThread: Whether to invoke `completion` on the main thread.
    ///   - completion: Receives the available chapters or an error.
    func getHSCodeChapters(runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCodeChapter], Error>) -> Void){
        hsCodeRemote.getHSCodeChapters(runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Fetches HS code categories, optionally restricted to a chapter.
    /// - Parameters:
    ///   - chapterId: The chapter identifier to filter by, or `nil` for every category.
    ///   - runCompletionOnUIThread: Whether to invoke `completion` on the main thread.
    ///   - completion: Receives the matching categories or an error.
    func getHSCodeCategories(chapterId: String? = nil, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCodeCategory], Error>) -> Void){
        hsCodeRemote.getHSCodeCategories(chapterId: chapterId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// Searches the HS code catalogue.
    /// - Parameters:
    ///   - request: The search term and pagination options.
    ///   - runCompletionOnUIThread: Whether to invoke `completion` on the main thread.
    ///   - completion: Receives the paginated search results or an error.
    func searchHSCodes(request: SearchHSCodeRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<SearchHSCodesResponseData, Error>) -> Void){
        hsCodeRemote.searchHSCode(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }

    /// Uses the AI-assisted search endpoint to suggest HS codes.
    /// - Parameters:
    ///   - request: A description of the item to classify.
    ///   - runCompletionOnUIThread: Whether to invoke `completion` on the main thread.
    ///   - completion: Receives the suggested codes or an error.
    func searchHSCodesWithAI(request: SearchHSCodesAIRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[AIHSCode], Error>) -> Void) {
        hsCodeRemote.searchHSCodesWithAI(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }

}
