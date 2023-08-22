import UIKit
import Lottie

protocol ResultDelegate: AnyObject {
    func updateResult(result: Int)
}

class BotController: UIViewController, UIScrollViewDelegate {
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
        view.text = "Profit:"
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private let profitLabelVal: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "0,00 Đ"
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private let balanceLbl: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "1000 Đ"
        view.font = .systemFont(ofSize: 18, weight: .bold)

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

    private let amountImg = UIImageView(image: UIImage(named: "amountIcon"))

    private let amountLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Amount".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textAlignment = .left

        return view
    }()

    private let amountLabelVal: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "10 Đ"
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

    private let profitImg = UIImageView(image: UIImage(named: "profitIcon"))

    private let profitLabels: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Profit limit".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)
        view.textAlignment = .left

        return view
    }()

    private var profitLabelsVal: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "20 Đ "
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
    private var minProfitVal = 10.0
    private var profitAfterActive = 0.0
    private var sumProfitAfterActive = 0.0
    private var amountAfterActive = 0.0
    private var stopBalance = 0
    private var resultNum = 0
    private var isStep = false
    private var profitIsNil = false

    weak var delegate: ResultDelegate?

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

                var balance = UserData.balance

                if isStep && !profitIsNil {
                    let percent = (Double(UserData.profit) ?? 1.0) / 100
                    amountAfterActive = Double.random(in: (percent * 10)...Double(percent * 30))
                    amountLabelVal.text = "\(Int(amountAfterActive))"

                    let sign = Bool.random() ? 1.0 : -1.0
                    if sign == 1.0 {
                        profitAfterActive = amountAfterActive * Double.random(in: 0.25..<0.45) + amountAfterActive
                    } else {
                        profitAfterActive = amountAfterActive - amountAfterActive * Double.random(in: 0.05..<0.15)
                    }
                    sumProfitAfterActive += profitAfterActive
                    UserDefaults.standard.set(Int(sumProfitAfterActive), forKey: UserData.SettingsKeys.sumProfitAfterActive.rawValue)
                    UserDefaults.standard.set(Int(profitAfterActive), forKey: UserData.SettingsKeys.profitAfterActive.rawValue)

                    profitLabelVal.text = "\(Int(sumProfitAfterActive)) Đ"
                    balance = UserData.balance + Int(sumProfitAfterActive)
                    balanceLbl.text = "\(balance)"

                    if UserData.profit != "-" {
                        if sumProfitAfterActive >= Double(UserData.profit)! {
                            goResult()
                            timerCount = 70
                        }
                    }
                } else if isStep && profitIsNil {
                    // Отключение через час
                    let date1 = Date()

                    if UserData.dateAlgorithmStart == nil {
                        UserDefaults.standard.set(date1, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
                    }

                    let date2 = UserData.dateAlgorithmStart!

                    let between = abs(hourBetween(start: date1, end: date2))

                    amountAfterActive = Double.random(in: 10..<50)
                    amountLabelVal.text = "\(Int(amountAfterActive))"

                    let sign = Bool.random() ? 1.0 : -1.0
                    if sign == 1.0 {
                        profitAfterActive = amountAfterActive * Double.random(in: 0.25..<0.45) + amountAfterActive
                    } else {
                        profitAfterActive = amountAfterActive - amountAfterActive * Double.random(in: 0.05..<0.15)
                    }

                    sumProfitAfterActive += profitAfterActive
                    UserDefaults.standard.set(Int(sumProfitAfterActive), forKey: UserData.SettingsKeys.sumProfitAfterActive.rawValue)

                    UserDefaults.standard.set(Int(profitAfterActive), forKey: UserData.SettingsKeys.profitAfterActive.rawValue)

                    profitLabelVal.text = "\(Int(sumProfitAfterActive)) Đ"
                    balance = UserData.balance + Int(sumProfitAfterActive)
                    balanceLbl.text = "\(balance)"

                    if between >= 1 {
                        if UserData.dateAlgorithmStart != nil {
                            UserDefaults.standard.set(nil, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
                        }
                        if profitIsNil {
                            goResult()
                            timerCount = 70
                            UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWork.rawValue)
                        } else {
                            balance += Int(UserData.profit)!
                        }
                    }
                } else {
                    isStep = true
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
        viewForItems.addSubviews(pairLabel , animationTimer, animationSignal, profitLabel, profitLabelVal, balanceLbl, statusImg, statusLabel, statusLabelVal, amountImg, amountLabel, amountLabelVal, line, strategyImg, strategyLabel, strategyLabelVal, indicatorsImg, indicatorsLabel, indicatorsLabelVal, riskImg, riskLabel, riskLabelVal, profitImg, profitLabels, profitLabelsVal)
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
            make.bottom.equalTo(profitImg.snp.bottom).offset(13)
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

        amountImg.snp.makeConstraints { make in
            make.top.equalTo(statusImg.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(18)
        }

        amountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(amountImg.snp.centerY)
            make.leading.equalTo(amountImg.snp.trailing).offset(7)
        }

        amountLabelVal.snp.makeConstraints { make in
            make.centerY.equalTo(amountImg.snp.centerY)
            make.trailing.equalToSuperview().offset(-16)
        }

        line.snp.makeConstraints { make in
            make.top.equalTo(amountImg.snp.bottom).offset(14)
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

        profitImg.snp.makeConstraints { make in
            make.top.equalTo(riskImg.snp.bottom).offset(14)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(18)
        }

        profitLabels.snp.makeConstraints { make in
            make.centerY.equalTo(profitImg.snp.centerY)
            make.leading.equalTo(profitImg.snp.trailing).offset(7)
        }

        profitLabelsVal.snp.makeConstraints { make in
            make.centerY.equalTo(profitImg.snp.centerY)
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

        profitLabelVal.snp.makeConstraints { make in
            make.bottom.equalTo(animationSignal.snp.centerY).offset(-5)
            make.leading.equalTo(profitLabel.snp.trailing).offset(2)
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
        profitLabelsVal.text = UserData.profit
        pairLabel.text = UserData.pairVal

        if UserData.profitAfterActive == 0 {
            profitLabelVal.text = "0" + " Đ"
        } else {
            profitLabelVal.text = "\(UserData.sumProfitAfterActive)"
        }

        if UserData.sumProfitAfterActive != 0 {
            let balance = UserData.balance + UserData.sumProfitAfterActive
            balanceLbl.text = "\(balance)"
        } else {
            balanceLbl.text = "\(UserData.balance)"
        }

        sumProfitAfterActive = Double(UserData.sumProfitAfterActive)

        if profitLabelsVal.text != "-" {
            profitAfterActive = Double(profitLabelsVal.text!)!
            resultNum = Int(UserData.profit)!
            stopBalance = UserData.balance + Int(UserData.profit)!
            profitIsNil = false
            isStep = false
            resultNum = Int(UserData.profit)!
            let percent = resultNum / 100
            amountAfterActive = Double.random(in: Double((percent * 10))..<Double((percent * 30)))
            amountLabelVal.text = "\(Int(amountAfterActive))"
        } else {
            profitIsNil = true
            profitLabelsVal.text = "-"
            if UserData.sumProfitAfterActive != 0 {
                stopBalance = UserData.balance + UserData.sumProfitAfterActive
                balanceLbl.text = "\(stopBalance)"
            }
            isStep = false
        }
        let date = Date()
        if UserData.dateAlgorithmStart == nil {
            UserDefaults.standard.set(date, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
        }

        if UserData.sumProfitAfterActive != 0 {
            let balance = UserData.balance + UserData.sumProfitAfterActive
            balanceLbl.text = "\(balance)"
            profitLabelVal.text = "\(UserData.sumProfitAfterActive)"
            if profitLabelsVal.text == "-" {
                resultNum = UserData.sumProfitAfterActive
            } else {
                if UserData.sumProfitAfterActive < resultNum {
                    balanceLbl.text = "\(balance)"
                }
            }
        }

        isStep = false
        checkTimer = true
    }
}

extension BotController {
    @objc private func stopRobot() {
        viewCancel.isHidden = false
    }

    @objc private func goResult() {
        let vc = ResultVC()
        timerCount = 70
        checkTimer = false
        UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWork.rawValue)
        self.delegate = vc
        if profitLabelsVal.text == "-" {
            resultNum = UserData.sumProfitAfterActive
        } else {
            if UserData.sumProfitAfterActive >= Int(UserData.profit) ?? 0 {
                resultNum = Int(UserData.profit) ?? 0
            } else {
                resultNum = UserData.sumProfitAfterActive
            }
        }

        self.delegate?.updateResult(result: resultNum)
        UserDefaults.standard.set(nil, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
        UserDefaults.standard.set(0, forKey: UserData.SettingsKeys.profitAfterActive.rawValue)
        UserDefaults.standard.set(0, forKey: UserData.SettingsKeys.sumProfitAfterActive.rawValue)
        navigationController?.pushViewController(vc, animated: false)
    }

    @objc private func cancelRobot() {
        viewCancel.isHidden = true
    }
}
