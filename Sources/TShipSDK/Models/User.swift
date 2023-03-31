/// Data model representing information about a User.
open class User: Codable {
    
    /// The name of the user's company.
    public let companyName: String
    
    /// The country the user's company is based in.
    public let country: String
    
    /// The user's email address.
    public let email: String
    
    /// The user's firstname.
    public let firstName: String
    
    /// The user's lastname.
    public let lastName: String
    
    /// Extra data about the user relating to terminal africa.
    public let metadata: UserMetadata
    
    /// The user's phone number.
    public let phoneNumber: String
    
    /// The user's wallet id.
    public let walletId: String
    
    /// The unique string used to identify the user.
    public let userId: String
    
    /// The time the user's profile was created.
    public let createdAt: String
    
    /// The category the user's category falls into.
    public let businessCategory: String
    
    /// The state the user's company is based in.
    public let state: String
    
    /// The ids of carriers enabled for a user
    public let enabledCarriers: EnabledCarriers
    
    public let accountActive: Bool
    
    public let walletEnabled: Bool
    
    public init(companyName: String, country: String, email: String, firstName: String, lastName: String, metadata: UserMetadata, phoneNumber: String, walletId: String, userId: String, createdAt: String, businessCategory: String, state: String, enabledCarriers: EnabledCarriers, accountActive: Bool, walletEnabled: Bool) {
        self.companyName = companyName
        self.country = country
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.metadata = metadata
        self.phoneNumber = phoneNumber
        self.walletId = walletId
        self.userId = userId
        self.createdAt = createdAt
        self.businessCategory = businessCategory
        self.state = state
        self.enabledCarriers = enabledCarriers
        self.accountActive = accountActive
        self.walletEnabled = walletEnabled
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case companyName = "company_name"
        
        case firstName = "first_name"
        
        case lastName = "last_name"
        
        case phoneNumber = "phone"
        
        case walletId = "wallet"
        
        case userId = "user_id"
        
        case createdAt = "created_at"
        
        case businessCategory = "business_category"
        
        case state = "country_state"
        
        case enabledCarriers = "carriers"
        
        case accountActive = "account_active"
        
        case walletEnabled = "wallet_enabled"
        
        case country, email, metadata
    }
    
}
