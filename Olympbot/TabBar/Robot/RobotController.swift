import UIKit

class RobotController: UIViewController, UIScrollViewDelegate {
    private let titleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = UIColor(red: 0.918, green: 0.933, blue: 0.925, alpha: 1)
        labelTitle.text = "tabbar.robot".localize()
        labelTitle.font = .systemFont(ofSize: 18, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var balanceView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.layer.cornerRadius = 8

        return view
    }()

    private let balanceTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "trade.balance".localize()
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let balanceValueLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "1000"
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let userImg = UIImageView(image: UIImage(named: "user"))

    private lazy var pairView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.layer.cornerRadius = 8
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapPair)))

        return view
    }()

    private let pairLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "EUR/USD"
        view.font = .systemFont(ofSize: 13, weight: .bold)

        return view
    }()

    private let assetLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Trading asset".localize()
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let arrowImg = UIImageView(image: UIImage(named: "toRight"))

    private let strategyLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Trading Strategy".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let question1Img = UIImageView(image: UIImage(named: "question"))

    private lazy var autoView: GrdientView = {
        let view = GrdientView()
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        return view
    }()

    private lazy var customView: UIButton = {
        let view = UIButton()
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1).cgColor

        return view
    }()

    private let check1Img = UIImageView(image: UIImage(named: "check 1"))
    private let check2Img = UIImageView(image: UIImage(named: "unCheck"))

    private let autoLabel1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Auto".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let customLabel1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Custom".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let autoLabel2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Auto1".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let customLabel2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Custom1".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private lazy var autoView2: UIButton = {
        let view = UIButton()
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1).cgColor

        return view
    }()

    private lazy var customView2: GrdientView = {
        let view = GrdientView()
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        return view

    }()

    private let check5Img = UIImageView(image: UIImage(named: "unCheck"))
    private let check6Img = UIImageView(image: UIImage(named: "check 1"))

    private let autoLabel12: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Auto".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let customLabel12: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Custom".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let autoLabel22: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Auto1".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let customLabel22: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Custom1".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let riskLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Risk Management".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let question2Img = UIImageView(image: UIImage(named: "question"))

    private lazy var optimalView: GrdientView = {
        let view = GrdientView()
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        return view
    }()

    private lazy var aggressiveView: UIButton = {
        let view = UIButton()
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1).cgColor

        return view
    }()

    private let check3Img = UIImageView(image: UIImage(named: "check 1"))
    private let check4Img = UIImageView(image: UIImage(named: "unCheck"))

    private let optimalLabel1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Optimal".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let aggressiveLabel1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Aggressive".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let optimalLabel2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Optimal1".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let aggressiveLabel2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Aggressive1".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private lazy var optimalView2: UIButton = {
        let view = UIButton()
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1).cgColor

        return view
    }()

    private lazy var aggressiveView2: GrdientView = {
        let view = GrdientView()
        view.isUserInteractionEnabled = true
        view.addTarget(self, action: #selector(tapOnView), for: .touchUpInside)
        return view
    }()

    private let check7Img = UIImageView(image: UIImage(named: "unCheck"))
    private let check8Img = UIImageView(image: UIImage(named: "check 1"))

    private let optimalLabel12: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Optimal".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let aggressiveLabel12: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Aggressive".localize()
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let optimalLabel22: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Optimal1".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let aggressiveLabel22: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Aggressive1".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private lazy var profitView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.layer.cornerRadius = 8

        return view
    }()

    private lazy var profitLabel: UITextField = {
        let view = UITextField()
        view.textColor = .white
        view.text = "120"
        view.font = .systemFont(ofSize: 13, weight: .bold)
        view.keyboardType = .decimalPad
//        view.addDoneButtonOnKeyboard1()
        view.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        return view
    }()

    private let profitsLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Profit limit".localize()
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private lazy var switchControl: UISwitch = {
        var switchControl = UISwitch()
        switchControl.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        return switchControl
    }()

    private let turnLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "turn".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isUserInteractionEnabled = true

        return scrollView
    }()

    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Start trading".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(startTradingTap), for: .touchUpInside)

        return nextButton
    }()

    private lazy var confirmButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Confirm".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(goNext), for: .touchUpInside)

        return nextButton
    }()

    private lazy var close: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private let viewConfirm: UIView = {
        let line1 = UIView()
        line1.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        line1.layer.cornerRadius = 20

        return line1
    }()

    private let viewForItems: UIView = {
        let line1 = UIView()
        line1.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        line1.layer.cornerRadius = 20

        return line1
    }()

    private let line1: UIView = {
        let line1 = UIView()
        line1.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.33, alpha: 1)

        return line1
    }()

    private let line2: UIView = {
        let line1 = UIView()
        line1.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.33, alpha: 1)

        return line1
    }()

    private let line3: UIView = {
        let line1 = UIView()
        line1.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.33, alpha: 1)

        return line1
    }()

    private let conformationTitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Conformation".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let strategyLblConfirm: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Strategy".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .medium)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let indicatorsLblConfirm: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Indicators".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .medium)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let riskLblConfirm: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Risk management".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .medium)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let profitLblConfirm: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Profit limit".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .medium)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let strategyLblConfirmVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Auto"
        labelTitle.font = .systemFont(ofSize: 13, weight: .medium)
        labelTitle.textAlignment = .right

        return labelTitle
    }()

    private let indicatorsLblConfirmVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "AI Base trading strategy"
        labelTitle.font = .systemFont(ofSize: 13, weight: .medium)
        labelTitle.textAlignment = .right

        return labelTitle
    }()

    private let riskLblConfirmVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Optimal"
        labelTitle.font = .systemFont(ofSize: 13, weight: .medium)
        labelTitle.textAlignment = .right

        return labelTitle
    }()

    private let profitLblConfirmVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "20 Đ"
        labelTitle.font = .systemFont(ofSize: 13, weight: .medium)
        labelTitle.textAlignment = .right

        return labelTitle
    }()

    private let lastView: UIView = {
        let lastView = UIView()
        lastView.backgroundColor = .clear

        return lastView
    }()

    private let viewDark: UIView = {
        let viewDark = UIView()
        viewDark.backgroundColor = .black.withAlphaComponent(0.8)

        return viewDark
    }()

    private var activityIndicator: UIActivityIndicatorView = {
        var activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        return activityIndicator
    }()


    private lazy var closeSelection: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private let viewAccount: UIView = {
        let line1 = UIView()
        line1.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        line1.layer.cornerRadius = 20

        return line1
    }()

    private let accountTitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Account selection".localize()
        labelTitle.font = .systemFont(ofSize: 18, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var viewSignal: UIView = {
        let line1 = UIView()
        line1.backgroundColor = .clear
        line1.layer.cornerRadius = 10
        line1.layer.borderWidth = 1
        line1.layer.borderColor = UIColor(red: 0.176, green: 0.275, blue: 0.392, alpha: 1).cgColor
        line1.tag = 1
        line1.isUserInteractionEnabled = true
        line1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goRobot)))

        return line1
    }()

    private lazy var viewBot: UIView = {
        let line1 = UIView()
        line1.backgroundColor = .clear
        line1.layer.cornerRadius = 10
        line1.layer.borderWidth = 1
        line1.layer.borderColor = UIColor(red: 0.176, green: 0.275, blue: 0.392, alpha: 1).cgColor
        line1.tag = 2
        line1.isUserInteractionEnabled = true
        line1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goRobot)))

        return line1
    }()

    private let signalTitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Signals account".localize()
        labelTitle.font = .systemFont(ofSize: 15, weight: .regular)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let botTitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Bot account".localize()
        labelTitle.font = .systemFont(ofSize: 15, weight: .regular)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private var signalImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "signals")

        return close
    }()

    private var botImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "bot")

        return close
    }()

    private var pair = OlympContent.shared.pairs.first
    private var titleTopic = "Auto".localize()
    private var riskTopic = "Optimal".localize()

    weak var delegate: TitleDelegate?
    private var topic = ""

    private func hourBetween(start: Date, end: Date) -> Int {
        Calendar.current.dateComponents([.hour], from: start, to: end).hour!
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.layoutIfNeeded()
        scrollView.updateContentView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDark.isHidden = true
        viewConfirm.isHidden = true
    }

    override func loadView() {
        super.loadView()
        if UserData.isWorkSignal {
            let date1 = Date()
            let date2 = UserData.dateAlgorithmStart ?? Date()
            let between = abs(hourBetween(start: date1, end: date2))
            if between < 1 {
                DispatchQueue.main.async { [self] in
                    viewDark.isHidden = false
                    activityIndicator.startAnimating()
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                    let vc = SignalController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }

        if UserData.isWork {
            let date1 = Date()
            let date2 = UserData.dateAlgorithmStart ?? Date()
            let between = abs(hourBetween(start: date1, end: date2))
            if between < 1 {
                DispatchQueue.main.async { [self] in
                    viewDark.isHidden = false
                    activityIndicator.startAnimating()
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                    let vc = BotController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } else {
                var balance = UserData.balance
                if UserData.profit == "-" {
                    balance += Int.random(in: 20...200)
                } else {
                    var balance = UserData.balance
                    balance += Int(UserData.sumProfitAfterActive)
                }
                UserDefaults.standard.set(balance, forKey: UserData.SettingsKeys.balance.rawValue)
                UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWork.rawValue)
                UserDefaults.standard.set(nil, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
                UserDefaults.standard.set(0, forKey: UserData.SettingsKeys.profitAfterActive.rawValue)
                UserDefaults.standard.set(0, forKey: UserData.SettingsKeys.sumProfitAfterActive.rawValue)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.stopAnimating()
        balanceValueLabel.text = "\(UserData.balance)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)
        topic = "Auto".localize()
        scrollView.delegate = self
        check1Img.layer.cornerRadius = 10
        check1Img.clipsToBounds = true
        check3Img.layer.cornerRadius = 10
        check3Img.clipsToBounds = true
        check5Img.layer.cornerRadius = 10
        check5Img.clipsToBounds = true
        check6Img.layer.cornerRadius = 10
        check6Img.clipsToBounds = true
        check7Img.layer.cornerRadius = 10
        check7Img.clipsToBounds = true
        check8Img.layer.cornerRadius = 10
        check8Img.clipsToBounds = true
        autoView2.isHidden = true
        customView2.isHidden = true
        optimalView2.isHidden = true
        aggressiveView2.isHidden = true
        addDoneButtonOnKeyboard()

        question2Img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnRisk)))
        question2Img.isUserInteractionEnabled = true

        question1Img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOnStrategy)))
        question1Img.isUserInteractionEnabled = true

        view.addSubviews(scrollView)
        scrollView.addSubviews(titleLabel, balanceView, pairView, assetLabel, strategyLabel, question1Img, autoView, customView, autoView2, customView2, riskLabel, question2Img, optimalView, aggressiveView, optimalView2, aggressiveView2, profitView, profitsLabel, turnLabel, nextButton, lastView)
        balanceView.addSubviews(balanceTitleLabel, balanceValueLabel, userImg)
        pairView.addSubviews(pairLabel, arrowImg)
        autoView.addSubviews(check1Img, autoLabel1, autoLabel2)
        customView.addSubviews(check2Img, customLabel1, customLabel2)
        autoView2.addSubviews(check5Img, autoLabel12, autoLabel22)
        customView2.addSubviews(check6Img, customLabel12, customLabel22)
        optimalView.addSubviews(check3Img, optimalLabel1, optimalLabel2)
        aggressiveView.addSubviews(check4Img, aggressiveLabel1, aggressiveLabel2)
        optimalView2.addSubviews(check7Img, optimalLabel12, optimalLabel22)
        aggressiveView2.addSubviews(check8Img, aggressiveLabel12, aggressiveLabel22)
        profitView.addSubviews(profitLabel, switchControl)

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(5)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        balanceView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(56)
        }

        userImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(12)
            make.height.width.equalTo(27)
        }

        balanceTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(userImg.snp.centerY).offset(-5)
            make.leading.equalTo(userImg.snp.trailing).offset(10)
        }

        balanceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(userImg.snp.centerY)
            make.leading.equalTo(userImg.snp.trailing).offset(10)
        }

        assetLabel.snp.makeConstraints { make in
            make.top.equalTo(balanceView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        pairView.snp.makeConstraints { make in
            make.top.equalTo(assetLabel.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(56)
        }

        pairLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }

        arrowImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(24)
        }

        strategyLabel.snp.makeConstraints { make in
            make.top.equalTo(pairView.snp.bottom).offset(17)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        question1Img.snp.makeConstraints { make in
            make.centerY.equalTo(strategyLabel.snp.centerY)
            make.leading.equalTo(strategyLabel.snp.trailing).offset(12)
            make.height.width.equalTo(20)
        }

        autoView.snp.makeConstraints { make in
            make.top.equalTo(strategyLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(view.snp.centerX).offset(-5.5)
            make.bottom.equalTo(customView.snp.bottom)
        }

        customView.snp.makeConstraints { make in
            make.top.equalTo(strategyLabel.snp.bottom).offset(12)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(view.snp.centerX).offset(5.5)
            make.bottom.equalTo(customLabel2.snp.bottom).offset(12)
        }

        check1Img.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(20)
        }

        check2Img.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(20)
        }

        autoView2.snp.makeConstraints { make in
            make.top.equalTo(strategyLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(view.snp.centerX).offset(-5.5)
            make.bottom.equalTo(customView.snp.bottom)
        }

        customView2.snp.makeConstraints { make in
            make.top.equalTo(strategyLabel.snp.bottom).offset(12)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(view.snp.centerX).offset(5.5)
            make.bottom.equalTo(customLabel2.snp.bottom).offset(12)
        }

        check5Img.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(20)
        }

        check6Img.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(20)
        }

        riskLabel.snp.makeConstraints { make in
            make.top.equalTo(autoView.snp.bottom).offset(17)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        question2Img.snp.makeConstraints { make in
            make.centerY.equalTo(riskLabel.snp.centerY)
            make.leading.equalTo(riskLabel.snp.trailing).offset(12)
            make.height.width.equalTo(20)
        }

        autoLabel1.snp.makeConstraints { make in
            make.top.equalTo(autoView.snp.centerY)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        autoLabel2.snp.makeConstraints { make in
            make.top.equalTo(autoLabel1.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        customLabel1.snp.makeConstraints { make in
            make.top.equalTo(customView.snp.centerY)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        customLabel2.snp.makeConstraints { make in
            make.top.equalTo(customLabel1.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        autoLabel12.snp.makeConstraints { make in
            make.top.equalTo(autoView.snp.centerY)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        autoLabel22.snp.makeConstraints { make in
            make.top.equalTo(autoLabel1.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        customLabel12.snp.makeConstraints { make in
            make.top.equalTo(customView.snp.centerY)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        customLabel22.snp.makeConstraints { make in
            make.top.equalTo(customLabel1.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        optimalView.snp.makeConstraints { make in
            make.top.equalTo(riskLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(view.snp.centerX).offset(-5.5)
            make.bottom.equalTo(optimalLabel2.snp.bottom).offset(12)
        }

        aggressiveView.snp.makeConstraints { make in
            make.top.equalTo(riskLabel.snp.bottom).offset(12)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(view.snp.centerX).offset(5.5)
            make.bottom.equalTo(aggressiveLabel2.snp.bottom).offset(12)
        }

        check3Img.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(20)
        }

        check4Img.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(20)
        }

        optimalLabel1.snp.makeConstraints { make in
            make.top.equalTo(optimalView.snp.centerY)
            make.leading.equalToSuperview().inset(12)
        }

        optimalLabel2.snp.makeConstraints { make in
            make.top.equalTo(optimalLabel1.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        aggressiveLabel1.snp.makeConstraints { make in
            make.top.equalTo(aggressiveView.snp.centerY)
            make.leading.equalToSuperview().inset(12)
        }

        aggressiveLabel2.snp.makeConstraints { make in
            make.top.equalTo(aggressiveLabel1.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        optimalView2.snp.makeConstraints { make in
            make.top.equalTo(riskLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(view.snp.centerX).offset(-5.5)
            make.bottom.equalTo(optimalLabel2.snp.bottom).offset(12)
        }

        aggressiveView2.snp.makeConstraints { make in
            make.top.equalTo(riskLabel.snp.bottom).offset(12)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(view.snp.centerX).offset(5.5)
            make.bottom.equalTo(aggressiveLabel2.snp.bottom).offset(12)
        }

        check7Img.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(20)
        }

        check8Img.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(20)
        }

        optimalLabel12.snp.makeConstraints { make in
            make.top.equalTo(optimalView.snp.centerY)
            make.leading.equalToSuperview().inset(12)
        }

        optimalLabel22.snp.makeConstraints { make in
            make.top.equalTo(optimalLabel1.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        aggressiveLabel12.snp.makeConstraints { make in
            make.top.equalTo(aggressiveView.snp.centerY)
            make.leading.equalToSuperview().inset(12)
        }

        aggressiveLabel22.snp.makeConstraints { make in
            make.top.equalTo(aggressiveLabel1.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(18)
        }

        profitsLabel.snp.makeConstraints { make in
            make.top.equalTo(optimalView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        profitView.snp.makeConstraints { make in
            make.top.equalTo(profitsLabel.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(56)
        }

        profitLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(switchControl.snp.leading).offset(-16)
        }

        switchControl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(51)
            make.height.equalTo(31)
        }

        turnLabel.snp.makeConstraints { make in
            make.top.equalTo(profitView.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(turnLabel.snp.bottom).offset(11)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.width.equalTo(50)
        }

        lastView.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.bottom).offset(2)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.width.equalTo(20)
        }

        view.addSubviews(viewConfirm, viewDark, activityIndicator)
        viewConfirm.isHidden = true
        viewConfirm.addSubviews(viewForItems, close, confirmButton, conformationTitleLabel)
        viewForItems.addSubviews(line1, line2, line3, strategyLblConfirm, strategyLblConfirmVal, indicatorsLblConfirm, indicatorsLblConfirmVal, riskLblConfirm, riskLblConfirmVal, profitLblConfirm, profitLblConfirmVal)

        view.addSubviews(viewAccount)
        viewAccount.addSubviews(accountTitleLabel, closeSelection, viewSignal, viewBot)
        viewSignal.addSubviews(signalTitleLabel, signalImg)
        viewBot.addSubviews(botTitleLabel, botImg)
        viewAccount.isHidden = true

        signalTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(signalImg.snp.trailing).offset(11)
            make.centerY.equalTo(signalImg.snp.centerY)
        }

        signalImg.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(20)
        }

        botTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(botImg.snp.trailing).offset(11)
            make.centerY.equalTo(botImg.snp.centerY)
        }

        botImg.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(20)
        }

        viewAccount.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(accountTitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }

        closeSelection.snp.makeConstraints { make in
            make.bottom.equalTo(viewSignal.snp.top).offset(-18)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        accountTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(closeSelection.snp.centerY)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(viewSignal.snp.top).offset(-18)
        }

        viewSignal.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(viewBot.snp.top).offset(-8)
        }

        viewBot.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.bottom.equalTo(viewAccount.snp.bottom).offset(-30)
        }

        viewDark.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        activityIndicator.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }

        confirmButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        viewForItems.snp.makeConstraints { make in
            make.bottom.equalTo(confirmButton.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(strategyLblConfirm.snp.top).offset(-13)
        }

        profitLblConfirm.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-13)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(viewConfirm.snp.centerX)
        }

        profitLblConfirmVal.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-13)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(viewConfirm.snp.centerX)
        }

        line3.snp.makeConstraints { make in
            make.bottom.equalTo(profitLblConfirmVal.snp.top).offset(-13)
            make.height.equalTo(1)
            make.trailing.leading.equalToSuperview()
        }

        riskLblConfirm.snp.makeConstraints { make in
            make.bottom.equalTo(line3.snp.top).offset(-13)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(viewConfirm.snp.centerX)
        }

        riskLblConfirmVal.snp.makeConstraints { make in
            make.bottom.equalTo(line3.snp.top).offset(-13)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(viewConfirm.snp.centerX)
        }

        line2.snp.makeConstraints { make in
            make.bottom.equalTo(riskLblConfirmVal.snp.top).offset(-13)
            make.height.equalTo(1)
            make.trailing.leading.equalToSuperview()
        }

        indicatorsLblConfirm.snp.makeConstraints { make in
            make.bottom.equalTo(line2.snp.top).offset(-13)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(viewConfirm.snp.centerX)
        }

        indicatorsLblConfirmVal.snp.makeConstraints { make in
            make.bottom.equalTo(line2.snp.top).offset(-13)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(viewConfirm.snp.centerX)
        }

        line1.snp.makeConstraints { make in
            make.bottom.equalTo(indicatorsLblConfirmVal.snp.top).offset(-13)
            make.height.equalTo(1)
            make.trailing.leading.equalToSuperview()
        }

        strategyLblConfirm.snp.makeConstraints { make in
            make.bottom.equalTo(line1.snp.top).offset(-13)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(viewConfirm.snp.centerX)
        }

        strategyLblConfirmVal.snp.makeConstraints { make in
            make.bottom.equalTo(line1.snp.top).offset(-13)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(viewConfirm.snp.centerX)
        }

        close.snp.makeConstraints { make in
            make.bottom.equalTo(viewForItems.snp.top).offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        conformationTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(close.snp.centerY)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalTo(viewForItems.snp.top).offset(-11)
        }

        viewConfirm.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(conformationTitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension RobotController: StrategyDelegate {
    func updateStrategy(_ value: String?) {
        autoLabel1.text = value
        autoLabel12.text = value
        autoLabel2.text = ""
        autoLabel22.text = ""
        titleTopic = value!
    }
}

extension RobotController: PairDelegate {
    func updatePair(_ value: String?) {
        pairLabel.text = (value?.prefix(3))! + "/" + (value?.suffix(3))!
    }
}

extension RobotController {
    @objc func textFieldDidChange(_ textField: UITextField) {
        profitLabel.text = textField.text
    }

    @objc private func switchAction(sender: UISwitch) {
        sender.isOn ? (profitLabel.text = "120") : (profitLabel.text = "-")
    }

    @objc private func goNext() {
        viewAccount.isHidden = false
        viewConfirm.isHidden = true
    }

    @objc private func goRobot(sender: UITapGestureRecognizer) {
        viewDark.isHidden = false
        viewAccount.isHidden = true
        activityIndicator.startAnimating()


        switch sender.view!.tag {
        case 1:
            UserDefaults.standard.set(true, forKey: UserData.SettingsKeys.isWorkSignal.rawValue)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let vc = SignalController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 2:
            UserDefaults.standard.set(true, forKey: UserData.SettingsKeys.isWork.rawValue)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let vc = BotController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        default: break
        }
    }

    @objc private func startTradingTap() {
        viewConfirm.isHidden = false
        strategyLblConfirmVal.text = titleTopic
        profitLblConfirmVal.text = profitLabel.text
        riskLblConfirmVal.text = riskTopic
        switchControl.isOn ? (profitLblConfirmVal.text = profitLabel.text) : (profitLblConfirmVal.text = "-")
        UserDefaults.standard.set(strategyLblConfirmVal.text, forKey: UserData.SettingsKeys.strategy.rawValue)
        UserDefaults.standard.set(profitLblConfirmVal.text, forKey: UserData.SettingsKeys.profit.rawValue)
        UserDefaults.standard.set(riskLblConfirmVal.text, forKey: UserData.SettingsKeys.risk.rawValue)
        UserDefaults.standard.set(pairLabel.text, forKey: UserData.SettingsKeys.pairVal.rawValue)
    }

    @objc private func closePage() {
        viewConfirm.isHidden = true
        viewAccount.isHidden = true
    }

    @objc private func tapOnStrategy() {
        let vc = StrategyController()
        self.delegate = vc
        delegate?.updateTitle(result: topic)
        vc.titleTopic = titleTopic
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: false)
    }

    @objc private func tapOnRisk() {
        let vc = OptimalController()
        vc.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *) {
            if let sheet = vc.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
            }
        }
        present(vc, animated: true)
    }

    @objc private func tapPair() {
        let vc = PairViewController()
        vc.pair = pair?.key
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: false)
    }

    @objc private func tapOnView(_ sender: UIButton) {
        switch (sender) {
        case autoView:
            autoView2.isHidden = true
            customView2.isHidden = true
            autoView.isHidden = false
            customView.isHidden = false
            titleTopic = autoLabel1.text!
            topic = autoLabel1.text!
        case autoView2:
            autoView2.isHidden = true
            autoView.isHidden = false
            customView2.isHidden = true
            customView.isHidden = false
            titleTopic = autoLabel1.text!
            topic = autoLabel1.text!
        case customView:
            autoView2.isHidden = false
            autoView.isHidden = true
            customView2.isHidden = false
            customView.isHidden = true
            titleTopic = customLabel1.text!
        case customView2:
            autoView2.isHidden = true
            autoView.isHidden = false
            customView2.isHidden = true
            customView.isHidden = false
            titleTopic = customLabel1.text!
        case optimalView:
            optimalView2.isHidden = true
            aggressiveView2.isHidden = true
            optimalView.isHidden = false
            aggressiveView.isHidden = false
            riskTopic = optimalLabel1.text!
        case optimalView2:
            optimalView2.isHidden = true
            optimalView.isHidden = false
            aggressiveView2.isHidden = true
            aggressiveView.isHidden = false
            riskTopic = optimalLabel1.text!
        case aggressiveView:
            optimalView2.isHidden = false
            optimalView.isHidden = true
            aggressiveView2.isHidden = false
            aggressiveView.isHidden = true
            riskTopic = aggressiveLabel1.text!
        case aggressiveView2:
            optimalView2.isHidden = true
            optimalView.isHidden = false
            aggressiveView2.isHidden = true
            aggressiveView.isHidden = false
            riskTopic = aggressiveLabel1.text!
        default: break
        }
    }

    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done".localize(), style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        profitLabel.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction() {
        if let text = profitLabel.text, let num = Int(text) {
            if num < 120 {
                profitLabel.text = "120"
            }
        }
        profitLabel.resignFirstResponder()
    }
}

extension UIScrollView {
    func updateContentView() {
        contentSize = CGSize(width: contentSize.width, height: (subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? 1000) )
    }
}

protocol TitleDelegate: AnyObject {
    func updateTitle(result: String)
}
