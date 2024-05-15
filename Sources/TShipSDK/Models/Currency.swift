/// An enum representing the currency types supported by the TShip API.
public enum Currency: String, Codable, CaseIterable {
    
    /// United Arab Emirates Dirham
    case AED
    
    /// Australian Dollar
    case AUD
    
    /// Canadian Dollar
    case CAD
    
    /// Chinese Yuan
    case CNY
    
    /// Euro
    case EUR
    
    /// Pound sterling
    case GBP
    
    /// Ghanaian Cedi
    case GHS
    
    /// Hong Kong Dollar
    case HKD
    
    /// Kenyan Shilling
    case KES
    
    /// Nigerian Naira
    case NGN
    
    /// Tanzanian Shilling
    case TZS
    
    /// Ugandan Shilling
    case UGX
    
    /// United States Dollar
    case USD
    
    /// South African Rand
    case ZAR
    
    public var name: String {
        switch self {
        case .AED: return "United Arab Emirates Dirham"
        case .AUD: return "Australian Dollar"
        case .CAD: return "Canadian Dollar"
        case .CNY: return "Chinese Yuan"
        case .EUR: return "Euro"
        case .GBP: return "Pound sterling"
        case .GHS: return "Ghanaian Cedi"
        case .HKD: return "Hong Kong Dollar"
        case .KES: return "Kenyan Shilling"
        case .NGN: return "Nigerian Naira"
        case .TZS: return "Tanzanian Shilling"
        case .UGX: return "Ugandan Shilling"
        case .USD: return "United States Dollar"
        case .ZAR: return "South African Rand"
        }
    }
    
    public var symbol: String {
        switch self {
        case .AED: return "د.إ"
        case .AUD: return "$"
        case .CAD: return "$"
        case .CNY: return "¥"
        case .EUR: return "€"
        case .GBP: return "£"
        case .GHS: return "₵"
        case .HKD: return "$"
        case .KES: return "KSh"
        case .NGN: return "₦"
        case .TZS: return "TSh"
        case .UGX: return "USh"
        case .USD: return "$"
        case .ZAR: return "R"
        }
    }
}
