import UIKit

final class OlympContent {
    static let shared = OlympContent()
    private(set) var pairs = UserData.pairs
    private var currencies = UserData.currencies

    private init() {
        getCurrencies()
    }

    private func getCurrencies() {
        let url = "http://api.apilayer.com/currency_data/live?currencies=EUR,AUD,GBP,CAD,JPY,NZD,CHF&apikey=0pcNVMLkLbVGxyXj1v0zrXm3hwS5bIvh"
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                if let data = data {
                    if let currencyResponse = try? JSONDecoder().decode(CurrencyResponse.self, from: data) as CurrencyResponse {
                        currencyResponse.quotes.forEach({ currency in
                            self.currencies[String(currency.key.suffix(3))] = 1.0 / currency.value
                        })

                        UserDefaults.standard.set(self.currencies, forKey: UserData.SettingsKeys.currencies.rawValue)

                        self.pairs.keys.forEach { symbol in
                            let value = (self.currencies[String(symbol.prefix(3))] ?? 1.0) / (self.currencies[String(symbol.suffix(3))] ?? 1.0)
                            self.pairs[symbol] = round(value * 1000) / 1000.0
                        }

                        UserDefaults.standard.set(self.pairs, forKey: UserData.SettingsKeys.pairs.rawValue)
                    }
                }
            }.resume()
        }
    }
}

struct CurrencyResponse: Codable {
    var quotes: [String: Double]
}
