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
    public let businessCategory: String?
    
    /// The state the user's company is based in.
    public let state: String
    
    /// The ids of carriers enabled for a user
    public let enabledCarriers: EnabledCarriers
    
    public let accountActive: Bool
    
    public let walletEnabled: Bool
    
    public var accountType: AccountType?
    
    public var referredBy: String?
    
    public var isPassCodeSet: Bool?
    
    public var staffNumber: Int?
    
    public var businessType: String?
    
    public var referralCode: String?
    
    public init(companyName: String, country: String, email: String, firstName: String, lastName: String, metadata: UserMetadata, phoneNumber: String, walletId: String, userId: String, createdAt: String, businessCategory: String?, state: String, enabledCarriers: EnabledCarriers, accountActive: Bool, walletEnabled: Bool, accountType: AccountType?, referredBy: String?, isPassCodeSet: Bool?, staffNumber: Int?, businessType: String?, referralCode: String?) {
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
        self.accountType = accountType
        self.referredBy = referredBy
        self.isPassCodeSet = isPassCodeSet
        self.staffNumber = staffNumber
        self.businessType = businessType
        self.referralCode = referralCode
    }
    
    required public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyName = (try? container.decode(String.self, forKey: .companyName)) ?? ""
        self.firstName = (try? container.decode(String.self, forKey: .firstName)) ?? ""
        self.lastName = (try? container.decode(String.self, forKey: .lastName)) ?? ""
        self.phoneNumber = (try? container.decode(String.self, forKey: .phoneNumber)) ?? ""
        self.walletId = (try? container.decode(String.self, forKey: .walletId)) ?? ""
        self.userId = (try? container.decode(String.self, forKey: .userId)) ?? ""
        self.createdAt = (try? container.decode(String.self, forKey: .createdAt)) ?? ""
        self.businessCategory = (try? container.decodeIfPresent(String.self, forKey: .businessCategory)) ?? ""
        self.state = (try? container.decode(String.self, forKey: .state)) ?? ""
        self.enabledCarriers = (try? container.decode(EnabledCarriers.self, forKey: .enabledCarriers)) ?? EnabledCarriers(domestic: [], regional: [], international: [])
        self.accountActive = (try? container.decode(Bool.self, forKey: .accountActive)) ?? false
        self.walletEnabled = (try? container.decode(Bool.self, forKey: .walletEnabled)) ?? false
        self.accountType = (try? container.decodeIfPresent(AccountType.self, forKey: .accountType))
        self.staffNumber = (try? container.decodeIfPresent(Int.self, forKey: .staffNumber))
        self.businessType = (try? container.decodeIfPresent(String.self, forKey: .businessType)) ?? ""
        self.country = (try? container.decode(String.self, forKey: .country)) ?? ""
        self.email = (try? container.decode(String.self, forKey: .email)) ?? ""
        self.metadata = (try? container.decode(UserMetadata.self, forKey: .metadata)) ?? UserMetadata(totalShipment: nil, totalShipmentAmount: nil, storeId: "")
        self.referredBy = (try? container.decodeIfPresent(String.self, forKey: .referredBy)) ?? ""
        self.isPassCodeSet = (try? container.decodeIfPresent(Bool.self, forKey: .isPassCodeSet))
        self.referralCode = (try? container.decodeIfPresent(String.self, forKey: .referralCode)) ?? ""
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
        
        case accountType = "account_type"
        
        case staffNumber = "staff_number"
        
        case businessType = "business_type"
        
        case country, email, metadata, referredBy, isPassCodeSet, referralCode
    }
    
}
