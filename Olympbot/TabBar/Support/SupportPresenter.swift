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
            LearningModel(topic: "What is an Olymp robot, and how it works?", text: LearningInfo(
                text: """
                    Olymp robot is a fully automated, AI-based algorithmic trading software that helps traders of any level learn best trading practices.
                    """, image: [UIImage(named: "forex")], id: 0)),
            LearningModel(topic: "Which asset to choose?", text: LearningInfo(
                text: """
                    Currencies are the most commonly traded asset class in the forex market. These are the world's major currencies, including the US dollar, the euro, the British pound, the Japanese yen, and the Swiss franc. You can choose any you prefer.
                    """, image: [UIImage(named: "forex")], id: 0)),
            LearningModel(topic: "Which strategy to choose?", text: LearningInfo(
                text: """
                    Our Robot offers two essential strategies: One - is a fully automated AI base choice of indicators. The second one is custom, that you can adjust completely for your preferences. Also, for every strategy - you can set 2 risk limits: optimal or more aggressive.
                    """, image: [UIImage(named: "forex")], id: 1))
        ],
        [
            LearningModel(topic: "What is demo account", text: LearningInfo(
                text: """
                    This is a training account and you do not need to deposit money to use it. Everything works the same as in real account, but you cannot withdraw demo money.
                    """, image: [UIImage(named: "forex")], id: 0))
        ],
    ]
}
