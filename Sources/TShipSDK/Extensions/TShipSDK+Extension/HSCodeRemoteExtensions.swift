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
    
}
