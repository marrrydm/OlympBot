import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.tabBar.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        self.tabBar.tintColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        self.tabBar.barTintColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        self.tabBar.layer.backgroundColor = UIColor(red: 0.11, green: 0.122, blue: 0.176, alpha: 1).cgColor

        let appearance = UITabBarItem.appearance()
        let attributes = [
            NSAttributedString.Key.font:
                UIFont.systemFont(ofSize: 12, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        ]

        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)

        let attributesSelected = [
            NSAttributedString.Key.font:
                UIFont.systemFont(ofSize: 12, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.216, green: 0.502, blue: 0.937, alpha: 1)
        ]

        appearance.setTitleTextAttributes(attributesSelected as [NSAttributedString.Key : Any], for: .selected)
    }

    private func getController() -> UIViewController {
        return UserData.showedTrade ? TradeViewController() : StartTradeVC()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navBar = UINavigationController(rootViewController: getController())
        navBar.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navBar.navigationBar.shadowImage = UIImage()
        navBar.navigationBar.isTranslucent = true
        let tradeControllerItem = UITabBarItem(title: "tabbar.platform".localize(), image: UIImage(named: "trade")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "trade_selected")?.withRenderingMode(.alwaysOriginal))

        navBar.tabBarItem = tradeControllerItem

        let robotController = UINavigationController(rootViewController: RobotController())
        robotController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        robotController.navigationBar.shadowImage = UIImage()
        robotController.navigationBar.isTranslucent = true
        let robotControllerItem = UITabBarItem(title: "tabbar.robot".localize(), image: UIImage(named: "robot")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "robot_selected")?.withRenderingMode(.alwaysOriginal))

        robotController.tabBarItem = robotControllerItem

        let supportModel = LearningModel(topic: "", text: LearningInfo(text: "", image: [UIImage(named: "f")],  id: 0))
        let supportView = SupportController()
        let supportPresenter = SupportPresenter(view: supportView, model: supportModel)
        supportView.eduPresenter = supportPresenter

        let supportController = UINavigationController(rootViewController: supportView)
        supportController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        supportController.navigationBar.shadowImage = UIImage()
        supportController.navigationBar.isTranslucent = true
        let supportControllerItem = UITabBarItem(title: "tabbar.support".localize(), image: UIImage(named: "support")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "support_selected")?.withRenderingMode(.alwaysOriginal))

        supportController.tabBarItem = supportControllerItem

        let accountController = AccountViewController()
        let accountControllerItem = UITabBarItem(title: "tabbar.account".localize(), image: UIImage(named: "account")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "account_selected")?.withRenderingMode(.alwaysOriginal))

        accountController.tabBarItem = accountControllerItem

        self.viewControllers = [robotController, navBar, supportController, accountController]
    }
}
