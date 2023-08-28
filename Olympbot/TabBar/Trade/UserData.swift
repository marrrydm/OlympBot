import Foundation

final class UserData {

    public enum SettingsKeys: String, CaseIterable {
        case showedOnboarding
        case balance
        case currencies
        case pairs
        case strategy
        case risk
        case profit
        case dateAlgorithmStart
        case userId
        case pairVal
        case sumProfitAfterActive
        case profitAfterActive
        case isWork
        case isWorkSignal
        case showedTrade
        case showedAuth
        case login
    }

    static var showedAuth: Bool {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.showedAuth.rawValue) as? Bool else { return false }
            return savedData
        }
    }

    static var showedTrade: Bool {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.showedTrade.rawValue) as? Bool else { return false }
            return savedData
        }
    }

    static var isWork: Bool {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.isWork.rawValue) as? Bool else { return false }
            return savedData
        }
    }

    static var isWorkSignal: Bool {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.isWorkSignal.rawValue) as? Bool else { return false }
            return savedData
        }
    }

    static var profitAfterActive: Int {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.profitAfterActive.rawValue) as? Int else { return 0 }
            return savedData
        }
    }

    static var sumProfitAfterActive: Int {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.sumProfitAfterActive.rawValue) as? Int else { return 0 }
            return savedData
        }
    }

    static var pairVal: String {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.pairVal.rawValue) as? String else { return "" }
            return savedData
        }
    }

    static var login: String {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.login.rawValue) as? String else { return "" }
            return savedData
        }
    }

    static var dateAlgorithmStart: Date? {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.dateAlgorithmStart.rawValue) as? Date else { return nil }
            return savedData
        }
    }

    static var profit: String {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.profit.rawValue) as? String else { return "" }
            return savedData
        }
    }

    static var risk: String {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.risk.rawValue) as? String else { return "" }
            return savedData
        }
    }

    static var strategy: String {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.strategy.rawValue) as? String else { return "" }
            return savedData
        }
    }

    static var userId: Int {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.userId.rawValue) as? Int else { return 0 }
            return savedData
        }
    }

    static var showedOnboarding: Bool {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.showedOnboarding.rawValue) as? Bool else { return false }
            return savedData
        }
    }

    static var balance: Int {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingsKeys.balance.rawValue) as? Int else { return 1000 }
            return savedData
        }
    }

    static var currencies: [String: Double] {
        get {
            if let saved = UserDefaults.standard.object(forKey: SettingsKeys.currencies.rawValue) as? [String: Double] {
                return saved
            }

            return [
                "EUR": 0.0,
                "USD": 1.0,
                "AUD": 0.0,
                "GBP": 0.0,
                "CAD": 0.0,
                "JPY": 0.0,
                "NZD": 0.0,
                "CHF": 0.0
            ]
        }
    }

    static var pairs: [String: Double] {
        get {
            if let saved = UserDefaults.standard.object(forKey: SettingsKeys.pairs.rawValue) as? [String: Double] {
                return saved
            }

            return [
                "EURUSD": 0.0,
                "EURCAD": 0.0,
                "AUDUSD": 0.0,
                "GBPUSD": 0.0,
                "GBPJPY": 0.0,
                "EURGBP": 0.0,
                "CADJPY": 0.0,
                "CADCHF": 0.0,
                "NZDJPY": 0.0,
                "USDJPY": 0.0,
                "EURCHF": 0.0,
                "EURJPY": 0.0,
                "USDCAD": 0.0,
                "USDCHF": 0.0,
                "GBPAUD": 0.0,
                "GBPCHF": 0.0,
                "NZDUSD": 0.0,
                "AUDCAD": 0.0,
                "AUDJPY": 0.0
            ]
        }
    }
}
