import AppsFlyerLib
import OneSignal
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppsFlyerLib.shared().appsFlyerDevKey = "FdioTwJVfJUuzEwprgjaYi"
        AppsFlyerLib.shared().appleAppID = "6447921042"
        AppsFlyerLib.shared().delegate = self
        AppsFlyerLib.shared().isDebug = true

        NotificationCenter.default.addObserver(self, selector: NSSelectorFromString("sendLaunch"), name: UIApplication.didBecomeActiveNotification, object: nil)

        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
        OneSignal.initWithLaunchOptions(launchOptions)

        OneSignal.setAppId("set")

        return true
    }

    @objc func sendLaunch() {
        AppsFlyerLib.shared().start()
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

extension AppDelegate: AppsFlyerLibDelegate {
    func onConversionDataSuccess(_ conversionInfo: [AnyHashable : Any]) {
        print("onConversionDataSuccess data:")

        for (key, value) in conversionInfo {
            print(key, ":", value)
        }

        if let status = conversionInfo["af_status"] as? String {
            if (status == "Non-organic") {
                if let sourceID = conversionInfo["media_source"],
                   let campaign = conversionInfo["campaign"] {
                    print("This is a Non-Organic install. Media source: \(sourceID)  Campaign: \(campaign)")
                }
            } else {
                print("This is an organic install.")
            }

            if let is_first_launch = conversionInfo["is_first_launch"] as? Bool, is_first_launch {
                print("First Launch")
            } else {
                print("Not First Launch")
            }
        }
    }

    func onConversionDataFail(_ error: Error) {
        print("\(error)")
    }
}
