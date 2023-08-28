import UIKit
import Lottie

protocol ResultSignalDelegate: AnyObject {
    func updateResult(result: Int)
}

class SignalController: UIViewController, UIScrollViewDelegate {
    private let titleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = UIColor(red: 0.918, green: 0.933, blue: 0.925, alpha: 1)
        labelTitle.text = "tabbar.robot".localize()
        labelTitle.font = .systemFont(ofSize: 18, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0.95, green: 0.32, blue: 0.19, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Stop the robot".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(stopRobot), for: .touchUpInside)

        return nextButton
    }()

    private lazy var viewForItems: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.layer.cornerRadius = 10

        return view
    }()

    private let pairLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "EUR/USD"
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let profitLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Signal".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private let balanceLbl: PaddingLabel = {
        let view = PaddingLabel()
        view.textColor = .white
        view.text = "ANALYZING...".localize()
        view.backgroundColor = UIColor(red: 0.176, green: 0.275, blue: 0.392, alpha: 1)
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.font = .systemFont(ofSize: 13, weight: .bold)

        return view
    }()

    private var animationSignal: LottieAnimationView = {
        var animation = LottieAnimationView(name: "Signal")

        return animation
    }()

    private var animationTimer: LottieAnimationView = {
        var animation = LottieAnimationView(name: "Timer")
        animation.animationSpeed = 1

        return animation
    }()

    private let statusImg = UIImageView(image: UIImage(named: "statusIcon"))

    private let statusLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Status".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textAlignment = .left

        return view
    }()

    private let statusLabelVal: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        view.text = "Searching".localize()
        view.font = .systemFont(ofSize: 13, weight: .bold)
        view.textAlignment = .right

        return view
    }()

    private let strategyImg = UIImageView(image: UIImage(named: "strIcon"))

    private let strategyLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Strategy".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textAlignment = .left

        return view
    }()

    private let strategyLabelVal: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Auto"
        view.font = .systemFont(ofSize: 13, weight: .bold)
        view.textAlignment = .right

        return view
    }()

    private let indicatorsImg = UIImageView(image: UIImage(named: "indiIcon"))

    private let indicatorsLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Indicators".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textAlignment = .left

        return view
    }()

    private let indicatorsLabelVal: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "AI Base trading strategy"
        view.font = .systemFont(ofSize: 13, weight: .bold)
        view.textAlignment = .right

        return view
    }()

    private let riskImg = UIImageView(image: UIImage(named: "riskIcon"))

    private let riskLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Risk management".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textAlignment = .left

        return view
    }()

    private let riskLabelVal: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Optimal"
        view.font = .systemFont(ofSize: 13, weight: .bold)
        view.textAlignment = .right

        return view
    }()

    private let line: UIView = {
        let line1 = UIView()
        line1.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.33, alpha: 1)

        return line1
    }()

    private let timeTitle: UILabel = {
        let timeTitle = UILabel()
        timeTitle.textColor = .white
        timeTitle.font = .systemFont(ofSize: 11, weight: .bold)
        timeTitle.textAlignment = .left

        return timeTitle
    }()

    private let viewCancel: UIView = {
        let viewDark = UIView()
        viewDark.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        viewDark.layer.cornerRadius = 20
        viewDark.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        viewDark.isHidden = true

        return viewDark
    }()

    private let imgOption = UIImageView(image: UIImage(named: "imgOption"))
    private let imgClose = UIImageView(image: UIImage(named: "imgClose"))

    private let optionLbl: UILabel = {
        let timeTitle = UILabel()
        timeTitle.textColor = .white
        timeTitle.font = .systemFont(ofSize: 18, weight: .bold)
        timeTitle.textAlignment = .center
        timeTitle.text = "doneBot".localize()
        timeTitle.numberOfLines = 0
        timeTitle.lineBreakMode = .byWordWrapping

        return timeTitle
    }()

    private lazy var confirmButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0.95, green: 0.32, blue: 0.19, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Confirm".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(goResult), for: .touchUpInside)

        return nextButton
    }()

    private lazy var cancelButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Cancel".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(cancelRobot), for: .touchUpInside)

        return nextButton
    }()

    private var timer = Timer()
    private var imgStatusRnd = UIImage()
    private var timerCount = 63
    private var isStep = false
    private var elem = ""
    private let arr = ["BUY".localize(), "SELL".localize(), "STRONG BUY".localize(), "STRONG SELL".localize()]

    weak var delegate: ResultSignalDelegate?

    private var checkTimer: Bool = true {
        didSet {
            switch (checkTimer) {
            case true:
                timerCount = 59
                timer.invalidate()
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
                if String(timerCount).count == 1 {
                    timeTitle.text = "00:0\(timerCount)"
                } else {
                    timeTitle.text = "00:\(timerCount)"
                }
                timerCount = 63
                imgStatusRnd = (Bool.random() ? UIImage(named: "signalSell") : UIImage(named: "signalBuy"))!

                elem = arr.randomElement()!
                // Отключение через час
                let date1 = Date()
                if UserData.dateAlgorithmStart == nil {
                    UserDefaults.standard.set(date1, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
                }
                let date2 = UserData.dateAlgorithmStart!
                let between = abs(hourBetween(start: date1, end: date2))

                if between >= 1 {
                    if UserData.dateAlgorithmStart != nil {
                        UserDefaults.standard.set(nil, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
                        goResult()
                        UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWork.rawValue)
                    }
                }
            case false:
                timerCount -= 1
                if String(timerCount).count == 1 {
                    timeTitle.text = "00:0\(timerCount)"
                } else {
                    timeTitle.text = "00:\(timerCount)"
                }
            }
        }
    }

    private func hourBetween(start: Date, end: Date) -> Int {
        Calendar.current.dateComponents([.hour], from: start, to: end).hour!
    }

    @objc func update() {
        switch timerCount {
        case 70: break
        case 61...63:
            animationSignal.play()
            animationTimer.stop()
            statusLabelVal.text = "Searching".localize()
            balanceLbl.text = "ANALYZING...".localize()
            balanceLbl.backgroundColor = UIColor(red: 0.176, green: 0.275, blue: 0.392, alpha: 1)
            statusLabelVal.textColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
            statusImg.image = UIImage(named: "statusIcon")
            checkTimer = false
            timeTitle.isHidden = true
            animationSignal.isHidden = false
        case 60:
            animationSignal.stop()
            animationTimer.play()
            checkTimer = false
        case 1...59:
            statusLabelVal.text = "Active".localize()
            statusLabelVal.textColor = UIColor(red: 0.13, green: 0.75, blue: 0.45, alpha: 1)
            statusImg.image = imgStatusRnd
            switch elem {
            case "BUY".localize():
                balanceLbl.backgroundColor = UIColor(red: 0.125, green: 0.745, blue: 0.455, alpha: 1)
            case "SELL".localize():
                balanceLbl.backgroundColor = UIColor(red: 0.949, green: 0.318, blue: 0.192, alpha: 1)
            case "STRONG BUY".localize():
                balanceLbl.backgroundColor = UIColor(red: 0.125, green: 0.745, blue: 0.455, alpha: 1)
            case "STRONG SELL".localize():
                balanceLbl.backgroundColor = UIColor(red: 0.949, green: 0.318, blue: 0.192, alpha: 1)
            default: break
            }
            balanceLbl.isHidden = false
            balanceLbl.text = elem
            checkTimer = false
            animationTimer.isHidden = false
            timeTitle.isHidden = false
            animationSignal.isHidden = true
        default:
            checkTimer = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)
        view.addSubviews(titleLabel, nextButton, viewForItems, viewCancel)
        viewForItems.addSubviews(pairLabel , animationTimer, animationSignal, profitLabel, balanceLbl, statusImg, statusLabel, statusLabelVal, line, strategyImg, strategyLabel, strategyLabelVal, indicatorsImg, indicatorsLabel, indicatorsLabelVal, riskImg, riskLabel, riskLabelVal)
        animationTimer.addSubview(timeTitle)
        viewCancel.addSubviews(imgClose, imgOption, optionLbl, cancelButton, confirmButton)
        animationTimer.isHidden = true
        imgClose.isUserInteractionEnabled = true
        imgClose.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelRobot)))

        viewCancel.snp.makeConstraints { make in
            make.top.equalTo(imgClose.snp.top).offset(-28)
            make.bottom.trailing.leading.equalToSuperview()
        }

        cancelButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(viewCancel.snp.centerX).offset(-5.5)
            make.height.equalTo(50)
        }

        confirmButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.trailing.equalToSuperview().offset(-16)
            make.leading.equalTo(viewCancel.snp.centerX).offset(5.5)
            make.height.equalTo(50)
        }

        optionLbl.snp.makeConstraints { make in
            make.bottom.equalTo(confirmButton.snp.top).offset(-16)
            make.trailing.leading.equalToSuperview().inset(16)
        }

        imgOption.snp.makeConstraints { make in
            make.bottom.equalTo(optionLbl.snp.top).offset(-8)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(40)
        }

        imgClose.snp.makeConstraints { make in
            make.bottom.equalTo(imgOption.snp.top).offset(-12)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        viewForItems.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(riskImg.snp.bottom).offset(13)
        }

        statusImg.snp.makeConstraints { make in
            make.top.equalTo(animationSignal.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(18)
        }

        statusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(statusImg.snp.centerY)
            make.leading.equalTo(statusImg.snp.trailing).offset(7)
        }

        statusLabelVal.snp.makeConstraints { make in
            make.centerY.equalTo(statusImg.snp.centerY)
            make.trailing.equalToSuperview().offset(-16)
        }

        line.snp.makeConstraints { make in
            make.top.equalTo(statusImg.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }

        strategyImg.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(18)
        }

        strategyLabel.snp.makeConstraints { make in
            make.centerY.equalTo(strategyImg.snp.centerY)
            make.leading.equalTo(strategyImg.snp.trailing).offset(7)
        }

        strategyLabelVal.snp.makeConstraints { make in
            make.centerY.equalTo(strategyImg.snp.centerY)
            make.trailing.equalToSuperview().offset(-16)
        }

        indicatorsImg.snp.makeConstraints { make in
            make.top.equalTo(strategyImg.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(18)
        }

        indicatorsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(indicatorsImg.snp.centerY)
            make.leading.equalTo(indicatorsImg.snp.trailing).offset(7)
        }

        indicatorsLabelVal.snp.makeConstraints { make in
            make.centerY.equalTo(indicatorsImg.snp.centerY)
            make.trailing.equalToSuperview().offset(-16)
        }

        riskImg.snp.makeConstraints { make in
            make.top.equalTo(indicatorsImg.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(18)
        }

        riskLabel.snp.makeConstraints { make in
            make.centerY.equalTo(riskImg.snp.centerY)
            make.leading.equalTo(riskImg.snp.trailing).offset(7)
        }

        riskLabelVal.snp.makeConstraints { make in
            make.centerY.equalTo(riskImg.snp.centerY)
            make.trailing.equalToSuperview().offset(-16)
        }

        animationSignal.snp.makeConstraints { make in
            make.top.equalTo(pairLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        }

        animationTimer.snp.makeConstraints { make in
            make.top.equalTo(pairLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        }

        balanceLbl.snp.makeConstraints { make in
            make.top.equalTo(animationSignal.snp.centerY).offset(2)
            make.leading.equalTo(animationSignal.snp.trailing).offset(12)
        }

        profitLabel.snp.makeConstraints { make in
            make.bottom.equalTo(animationSignal.snp.centerY).offset(-5)
            make.leading.equalTo(animationSignal.snp.trailing).offset(12)
        }

        pairLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalToSuperview().offset(16)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.width.equalTo(50)
        }

        timeTitle.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }

        strategyLabelVal.text = UserData.strategy
        riskLabelVal.text = UserData.risk
        pairLabel.text = UserData.pairVal

        let date = Date()
        if UserData.dateAlgorithmStart == nil {
            UserDefaults.standard.set(date, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
        }

        isStep = false
        checkTimer = true
    }
}

extension SignalController {
    @objc private func stopRobot() {
        viewCancel.isHidden = false
    }

    @objc private func goResult() {
        let vc = ResultSignal()
        checkTimer = false
        navigationController?.pushViewController(vc, animated: false)
        UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWorkSignal.rawValue)
    }

    @objc private func cancelRobot() {
        viewCancel.isHidden = true
    }
}
