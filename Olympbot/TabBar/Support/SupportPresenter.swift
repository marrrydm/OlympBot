import UIKit

protocol SupportViewProtocol: AnyObject {
    func setQuestion(arrayTtiles: [String], topic: [[LearningModel]])
}

protocol SupportViewPreseneterProtocol: AnyObject {
    init(view: SupportViewProtocol, model: LearningModel)
    func showData()
}

class SupportPresenter: SupportViewPreseneterProtocol {
    private let view: SupportViewProtocol
    private var model: LearningModel

    required init(view: SupportViewProtocol, model: LearningModel) {
        self.view = view
        self.model = model
    }

    func showData() {
        view.setQuestion(arrayTtiles: arrayTtiles, topic: topicsFirst)
    }

    private let arrayTtiles = ["Trading", "Robot", "Account"]

    private let topicsFirst = [
        [
            LearningModel(topic: "What is trading?", text: LearningInfo(
                text: """
                Trading helps to make money from asset price fluctuations. In OlympRobot, you will see a graph of these prices: they can rise or fall. If the line on the chart goes up, then the price rises, when the line goes down, the price falls.
                """, image: [UIImage(named: "forex")], id: 0))
        ],
        [
            LearningModel(topic: "How to set up the duration for the robot?", text: LearningInfo(
                text: """
                    At OlympRobot, you can open trades with fixed durations of 1, 5 and 15 minutes Most OlympRobot users open trades for 1 minute
                    """, image: [UIImage(named: "forex")], id: 0)),
            LearningModel(topic: "Which asset to choose?", text: LearningInfo(
                text: """
                    Assets differ in percentage of return. The higher the percentage, the more you earn in case of a successful order. Automatic selection of assets helps vou not to search for them manually, OlympRobot will do it for you.
                    """, image: [UIImage(named: "forex")], id: 1)),
            LearningModel(topic: "Which strategy to choose?", text: LearningInfo(
                text: """
                    OlympRobot offers 4 strategies with different levels of risk and profit. The more conservative the strategy, the more cautiously the robot trades by opening trades with small amounts. Aggressive strategies carry a lot of risk, but they allow you to make money faster.
                    """, image: [UIImage(named: "forex")], id: 2))
        ],
        [
            LearningModel(topic: "What is demo account", text: LearningInfo(
                text: """
                    This is a training account and you do not need to deposit money to use it. Everything works the same as in real account, but you cannot withdraw demo money.
                    """, image: [UIImage(named: "forex")], id: 0)),
            LearningModel(topic: "How to activate my account?", text: LearningInfo(
                text: """
                    If you have an account created through OlympRobot, you need to make a deposit to activate it. If you logged in with your Olymp Trade account, please create a new account through OlympRobot. Your old one won't be blocked and you will unlock new features here to boost your revenue.
                    """, image: [UIImage(named: "forex")], id: 1)),
            LearningModel(topic: "Which Olymp Trade accounts are suitable for auto trading?", text: LearningInfo(
                text: """
                    You can test the robot on a demo account with a login and password from the Olymp Trade platform. However, due to the technical features of the integration with the platform, you cannot trade on a live account and use all OlympRobot benefits. If you register an account through OlympRobot, the restrictions will be removed.
                    """, image: [UIImage(named: "forex")], id: 2)),
            LearningModel(topic: "How to verify my account?", text: LearningInfo(
                text: """
                    The verification process is regulated by the Olymp Trade platform. If you haven't received an automated verification request from Olymp Trade, then you don't need to verify your account.
                    """, image: [UIImage(named: "forex")], id: 3)),
            LearningModel(topic: "Can a robot be used on the platform?", text: LearningInfo(
                text: """
                    This robot is not restricted by the Olymp Trade and is safe to use. The robot completely copies the trade of a real person, so you won't have any problems with the Olymp Trade platform.
                    """, image: [UIImage(named: "forex")], id: 4))
        ],
    ]
}
