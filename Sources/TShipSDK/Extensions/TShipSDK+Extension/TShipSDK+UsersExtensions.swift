/// Extensions for Users remote methods on TShipSDK
public extension TShipSDK {
    
    /// This function fetches details of a User's account.
    /// - Parameters:
    ///   - userId: The unique string used to identify the user on the TShip API.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the user's profile if no error occurred.
    func getUserProfile(userId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<User, Error>) -> Void){
        usersRemote.getUserProfile(userId: userId, runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
    /// This function fetches details about a user's wallet.
    /// - Parameters:
    ///   - userId: The unique string used to identify the user on the TShip API.
    ///   - runCompletionOnUIThread: Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.
    ///   - completion: The completion handler to call, passing along the response status and the user's wallet details if no error occurred.
    func getUserWallet(userId: String, runCompletionOnUIThread: Bool = true, completion: @escaping(Result<Wallet, Error>) -> Void){
        usersRemote.getUserWallet(request: GetUserWalletRequest(userId: userId), runCompletionOnUIThread: runCompletionOnUIThread, completion: completion)
    }
    
}
