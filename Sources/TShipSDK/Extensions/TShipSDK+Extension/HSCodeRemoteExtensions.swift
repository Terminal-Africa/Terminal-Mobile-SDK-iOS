//
//  TShipSDK+HSCodeRemoteExtensions.swift
//  
//
//  Created by maxSpane on 22/08/2023.
//

public extension TShipSDK {
    
    func getHSCodeChapters(runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCodeChapter], Error>) -> Void){
        hsCodeRemote.getHSCodeChapters(runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func getHSCodeCategories(chapterId: String? = nil, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<[HSCodeCategory], Error>) -> Void){
        hsCodeRemote.getHSCodeCategories(chapterId: chapterId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    func searchHSCodes(request: SearchHSCodeRequest, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<SearchHSCodesResponseData, Error>) -> Void){
        hsCodeRemote.searchHSCode(request: request, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
