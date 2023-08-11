import UIKit
import WebKit

class TradeViewController: UIViewController, UITextFieldDelegate {
    private lazy var chart = WKWebView()

    private lazy var labelBalance: UITextField = {
        let labelBalance = UITextField()
        labelBalance.text = "\(UserData.balance)"
        labelBalance.textAlignment = .left
        labelBalance.keyboardType = .decimalPad
        labelBalance.textColor = .white
        labelBalance.font = .systemFont(ofSize: 18, weight: .bold)

        return labelBalance
    }()

    private let titleBalance: UILabel = {
        let titleBalance = UILabel()
        titleBalance.textAlignment = .left
        titleBalance.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 0.6)
        titleBalance.font = .systemFont(ofSize: 11, weight: .medium)
        titleBalance.text = "trade.balance".localize()

        return titleBalance
    }()

    private lazy var pairLabel: UILabel = {
        let pairLabel = UILabel()
        pairLabel.textAlignment = .center
        pairLabel.textColor = .white
        pairLabel.font = .systemFont(ofSize: 18, weight: .bold)
        pairLabel.isUserInteractionEnabled = true
        pairLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapPair)))

        return pairLabel
    }()

    private lazy var imgArrowRight: UIImageView = {
        let imgArrowRight = UIImageView()
        imgArrowRight.image = UIImage(named: "rightTrade")
        imgArrowRight.contentMode = .scaleAspectFit
        imgArrowRight.isUserInteractionEnabled = true
        imgArrowRight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapPair)))

        return imgArrowRight
    }()

    private let timerView: UIView = {
        let timerView = UIView()
        timerView.layer.cornerRadius = 6
        timerView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)

        return timerView
    }()

    private var timerVal: UITextField = {
        var timerVal = UITextField()
        timerVal.textAlignment = .center
        timerVal.isUserInteractionEnabled = false
        timerVal.keyboardType = .numbersAndPunctuation
        timerVal.textColor = .white
        timerVal.font = .systemFont(ofSize: 16, weight: .semibold)
        timerVal.text = "01:00"

        return timerVal
    }()

    private lazy var plusTime: UIButton = {
        let plusTime = UIButton()
        plusTime.isUserInteractionEnabled = true
        plusTime.setImage(UIImage(named: "plus"), for: .normal)
        plusTime.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusTime.layer.cornerRadius = 6
        plusTime.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusTime.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)

        return plusTime
    }()

    private lazy var minusTime: UIButton = {
        let minusTime = UIButton()
        minusTime.isUserInteractionEnabled = true
        minusTime.layer.cornerRadius = 6
        minusTime.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusTime.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusTime.setImage(UIImage(named: "minus"), for: .normal)
        minusTime.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)

        return minusTime
    }()

    private let investment: UIView = {
        let investment = UIView()
        investment.layer.cornerRadius = 6
        investment.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)

        return investment
    }()

    private let investmentVal: UITextField = {
        let investmentVal = UITextField()
        investmentVal.textAlignment = .center
        investmentVal.isUserInteractionEnabled = false
        investmentVal.keyboardType = .numbersAndPunctuation
        investmentVal.textColor = .white
        investmentVal.font = .systemFont(ofSize: 16, weight: .semibold)
        investmentVal.text = "100"

        return investmentVal
    }()

    private lazy var plusInv: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)

        return plusInv
    }()

    private lazy var minusInv: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)

        return minusInv
    }()

    private lazy var sellView: UIView = {
        let sellView = UIView()
        sellView.layer.cornerRadius = 6
        sellView.backgroundColor = UIColor(red: 0.95, green: 0.32, blue: 0.19, alpha: 1)
        let gestureSell = UITapGestureRecognizer(target: self, action: #selector(sellAction))
        sellView.addGestureRecognizer(gestureSell)
        sellView.isUserInteractionEnabled = true

        return sellView
    }()

    private let sellLbl: UILabel = {
        let sellLbl = UILabel()
        sellLbl.textAlignment = .left
        sellLbl.textColor = .white
        sellLbl.font = .systemFont(ofSize: 14, weight: .bold)
        sellLbl.text = "trade.down".localize()

        return sellLbl
    }()

    private let sellImg: UIImageView = {
        let sellImg = UIImageView()
        sellImg.contentMode = .scaleAspectFit
        sellImg.image = UIImage(named: "downImg")

        return sellImg
    }()

    private lazy var buyView: UIView = {
        let buyView = UIView()
        buyView.backgroundColor = UIColor(red: 0.12, green: 0.75, blue: 0.46, alpha: 1)
        buyView.layer.cornerRadius = 6
        let gestureBuy = UITapGestureRecognizer(target: self, action: #selector(buyAction))
        buyView.addGestureRecognizer(gestureBuy)
        buyView.isUserInteractionEnabled = true

        return buyView
    }()

    private let buyLbl: UILabel = {
        let buyLbl = UILabel()
        buyLbl.textAlignment = .left
        buyLbl.textColor = .white
        buyLbl.font = .systemFont(ofSize: 14, weight: .bold)
        buyLbl.text = "trade.up".localize()

        return buyLbl
    }()

    private let buyImg: UIImageView = {
        let buyImg = UIImageView()
        buyImg.contentMode = .scaleAspectFit
        buyImg.image = UIImage(named: "upImg")

        return buyImg
    }()

    private lazy var chartView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)
        return view
    }()

    private var pair = OlympContent.shared.pairs.first
    private var initialState = true
    private var timer: Timer?
    private var price = 0.0

    private var timerValue = 1
    private var invValue = 100.0
    private var timeArr = [1, 3, 5]
    private var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)
        navigationController?.navigationBar.isHidden = true
        setupViews()
        makeConstraints()

        addDoneButtonOnKeyboard()

        labelBalance.text = "\(UserData.balance)"
        guard let pair = pair else { return }
        pairLabel.text = pair.key.prefix(3) + "/" + pair.key.suffix(3)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if initialState, let pair = pair {
            let content = TradingView(width: chart.frame.width - 20.0, height: view.safeAreaLayoutGuide.layoutFrame.height - 290.0, symbol: pair.0).getHTMLContent()
            chart.loadHTMLString(content, baseURL: nil)
            initialState = false
        }

        if timer == nil {
            animationStart()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelBalance.text = "\(UserData.balance)"
    }

    private func setupViews() {
        view.addSubviews(chart, chartView)
        view.addSubviews(titleBalance, timerView, investment, sellView, buyView, labelBalance, pairLabel, imgArrowRight)
        timerView.addSubviews(timerVal, plusTime, minusTime)
        investment.addSubviews(investmentVal, plusInv, minusInv)
        sellView.addSubviews(sellLbl, sellImg)
        buyView.addSubviews(buyLbl, buyImg)
    }

    private func makeConstraints() {
        sellView.translatesAutoresizingMaskIntoConstraints = false
        sellView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5.5).isActive = true
        sellView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        sellView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        sellView.heightAnchor.constraint(equalToConstant: 37).isActive = true

        sellImg.translatesAutoresizingMaskIntoConstraints = false
        sellImg.centerYAnchor.constraint(equalTo: sellView.centerYAnchor).isActive = true
        sellImg.trailingAnchor.constraint(equalTo: sellView.trailingAnchor, constant: -17).isActive = true
        sellImg.widthAnchor.constraint(equalToConstant: 22).isActive = true
        sellImg.heightAnchor.constraint(equalToConstant: 22).isActive = true

        sellLbl.translatesAutoresizingMaskIntoConstraints = false
        sellLbl.centerYAnchor.constraint(equalTo: sellView.centerYAnchor).isActive = true
        sellLbl.trailingAnchor.constraint(equalTo: sellView.trailingAnchor, constant: -30).isActive = true
        sellLbl.leadingAnchor.constraint(equalTo: sellView.leadingAnchor, constant: 16).isActive = true

        buyView.translatesAutoresizingMaskIntoConstraints = false
        buyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        buyView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5.5).isActive = true
        buyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        buyView.heightAnchor.constraint(equalToConstant: 37).isActive = true

        buyImg.translatesAutoresizingMaskIntoConstraints = false
        buyImg.centerYAnchor.constraint(equalTo: buyView.centerYAnchor).isActive = true
        buyImg.trailingAnchor.constraint(equalTo: buyView.trailingAnchor, constant: -17).isActive = true
        buyImg.widthAnchor.constraint(equalToConstant: 22).isActive = true
        buyImg.heightAnchor.constraint(equalToConstant: 22).isActive = true

        buyLbl.translatesAutoresizingMaskIntoConstraints = false
        buyLbl.centerYAnchor.constraint(equalTo: buyView.centerYAnchor).isActive = true
        buyLbl.trailingAnchor.constraint(equalTo: buyView.trailingAnchor, constant: -30).isActive = true
        buyLbl.leadingAnchor.constraint(equalTo: buyView.leadingAnchor, constant: 16).isActive = true

        plusInv.translatesAutoresizingMaskIntoConstraints = false
        plusInv.centerYAnchor.constraint(equalTo: investment.centerYAnchor).isActive = true
        plusInv.trailingAnchor.constraint(equalTo: investment.trailingAnchor).isActive = true
        plusInv.topAnchor.constraint(equalTo: investment.topAnchor).isActive = true
        plusInv.bottomAnchor.constraint(equalTo: investment.bottomAnchor).isActive = true
        plusInv.widthAnchor.constraint(equalToConstant: 30).isActive = true

        minusInv.translatesAutoresizingMaskIntoConstraints = false
        minusInv.centerYAnchor.constraint(equalTo: investment.centerYAnchor).isActive = true
        minusInv.leadingAnchor.constraint(equalTo: investment.leadingAnchor).isActive = true
        minusInv.topAnchor.constraint(equalTo: investment.topAnchor).isActive = true
        minusInv.bottomAnchor.constraint(equalTo: investment.bottomAnchor).isActive = true
        minusInv.widthAnchor.constraint(equalToConstant: 30).isActive = true

        investment.translatesAutoresizingMaskIntoConstraints = false
        investment.bottomAnchor.constraint(equalTo: sellView.topAnchor, constant: -23).isActive = true
        investment.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5.5).isActive = true
        investment.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        investment.heightAnchor.constraint(equalToConstant: 37).isActive = true

        investmentVal.translatesAutoresizingMaskIntoConstraints = false
        investmentVal.centerYAnchor.constraint(equalTo: investment.centerYAnchor).isActive = true
        investmentVal.leadingAnchor.constraint(equalTo: investment.leadingAnchor, constant: 30).isActive = true
        investmentVal.trailingAnchor.constraint(equalTo: investment.trailingAnchor, constant: -30).isActive = true

        plusTime.translatesAutoresizingMaskIntoConstraints = false
        plusTime.centerYAnchor.constraint(equalTo: timerView.centerYAnchor).isActive = true
        plusTime.trailingAnchor.constraint(equalTo: timerView.trailingAnchor).isActive = true
        plusTime.topAnchor.constraint(equalTo: timerView.topAnchor).isActive = true
        plusTime.bottomAnchor.constraint(equalTo: timerView.bottomAnchor).isActive = true
        plusTime.widthAnchor.constraint(equalToConstant: 30).isActive = true

        minusTime.translatesAutoresizingMaskIntoConstraints = false
        minusTime.centerYAnchor.constraint(equalTo: timerView.centerYAnchor).isActive = true
        minusTime.leadingAnchor.constraint(equalTo: timerView.leadingAnchor).isActive = true
        minusTime.topAnchor.constraint(equalTo: timerView.topAnchor).isActive = true
        minusTime.bottomAnchor.constraint(equalTo: timerView.bottomAnchor).isActive = true
        minusTime.widthAnchor.constraint(equalToConstant: 30).isActive = true

        timerView.translatesAutoresizingMaskIntoConstraints = false
        timerView.bottomAnchor.constraint(equalTo: sellView.topAnchor, constant: -23).isActive = true
        timerView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5.5).isActive = true
        timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        timerView.heightAnchor.constraint(equalToConstant: 37).isActive = true

        timerVal.translatesAutoresizingMaskIntoConstraints = false
        timerVal.centerYAnchor.constraint(equalTo: timerView.centerYAnchor).isActive = true
        timerVal.leadingAnchor.constraint(equalTo: timerView.leadingAnchor, constant: 30).isActive = true
        timerVal.trailingAnchor.constraint(equalTo: timerView.trailingAnchor, constant: -30).isActive = true

        titleBalance.translatesAutoresizingMaskIntoConstraints = false
        titleBalance.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        titleBalance.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true

        labelBalance.translatesAutoresizingMaskIntoConstraints = false
        labelBalance.topAnchor.constraint(equalTo: titleBalance.bottomAnchor, constant: 5).isActive = true
        labelBalance.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true

        pairLabel.translatesAutoresizingMaskIntoConstraints = false
        pairLabel.bottomAnchor.constraint(equalTo: timerView.topAnchor, constant: -80).isActive = true
        pairLabel.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 12).isActive = true

        imgArrowRight.translatesAutoresizingMaskIntoConstraints = false
        imgArrowRight.centerYAnchor.constraint(equalTo: pairLabel.centerYAnchor).isActive = true
        imgArrowRight.leadingAnchor.constraint(equalTo: pairLabel.trailingAnchor, constant: 15).isActive = true
        imgArrowRight.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imgArrowRight.widthAnchor.constraint(equalToConstant: 24).isActive = true

        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.topAnchor.constraint(equalTo: labelBalance.bottomAnchor, constant: 25).isActive = true
        chart.bottomAnchor.constraint(equalTo: pairLabel.topAnchor, constant: -1).isActive = true
        chart.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        chart.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        chartView.bottomAnchor.constraint(equalTo: chart.bottomAnchor).isActive = true
        chartView.leadingAnchor.constraint(equalTo: chart.leadingAnchor).isActive = true
        chartView.trailingAnchor.constraint(equalTo: chart.trailingAnchor).isActive = true
    }
}

extension TradeViewController: PairDelegate {
    func updatePair(_ value: String?) {
        guard let key = value else { return }

        pair = OlympContent.shared.pairs.first(where: {$0.key == key})

        guard let pair = pair else { return }
        pairLabel.text = pair.key.prefix(3) + "/" + pair.key.suffix(3)

        let content = TradingView(width: chart.frame.width - 20.0, height: chart.frame.height, symbol: pair.0).getHTMLContent()
        chart.loadHTMLString(content, baseURL: nil)
    }
}

extension TradeViewController {
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done".localize(), style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        labelBalance.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction() {
        let balance = Int(labelBalance.text!)
        UserDefaults.standard.set(balance, forKey: UserData.SettingsKeys.balance.rawValue)
        self.labelBalance.text = "\(UserData.balance)"
        labelBalance.resignFirstResponder()
    }

    private func taskForPair(amount: Double) {
        let time = timerValue * 60
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(time)) { [self] in
            let profit = Double.random(in: 0.0..<0.075)
            let sign = Bool.random() ? 1.0 : -1.0
            var balance = UserData.balance
            balance = balance + Int(self.invValue + sign * profit * amount)
            UserDefaults.standard.set(balance, forKey: UserData.SettingsKeys.balance.rawValue)
            self.labelBalance.text = "\(UserData.balance)"
        }
    }

    @objc private func sellAction() {
        showToast(message: "trade.open1".localize() + "\(timerValue) minutes. " + "trade.open2".localize() + "\(round(price * 100000) / 100000.0)")
        taskForPair(amount: Double(invValue))

        UserDefaults.standard.set((UserData.balance - Int(invValue)), forKey: UserData.SettingsKeys.balance.rawValue)
        self.labelBalance.text = "\(UserData.balance)"
        if Int(invValue) > UserData.balance {
            invValue = 0
            investmentVal.text = "\(Int(invValue))"
        }
    }

    @objc private func buyAction() {
        showToast(message: "trade.open1".localize() + "\(timerValue) minutes. " + "trade.open2".localize() + "\(round(price * 100000) / 100000.0)")
        taskForPair(amount: Double(invValue))


        UserDefaults.standard.set((UserData.balance - Int(invValue)), forKey: UserData.SettingsKeys.balance.rawValue)
        self.labelBalance.text = "\(UserData.balance)"
        if Int(invValue) > UserData.balance {
            invValue = 0
            investmentVal.text = "\(Int(invValue))"
        }
    }

    @objc private func tapPair() {
        let vc = PairViewController()
        vc.pair = pair?.key
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func tapPlusMinus(_ sender: UIButton) {
        switch sender {
        case plusInv: invValue += 100
            investmentVal.text = "\(Int(invValue))"
        case plusTime: if timerValue != 5 {
            index += 1
            timerValue = timeArr[index]
            timerVal.text = "0\(timerValue):00"
        } else {
            index = 0
            timerValue = 1
            timerVal.text = "0\(timerValue):00"
        }
        case minusInv: invValue -= 100
            if invValue < 0 {
                invValue = Double(Int(0))
            }
            investmentVal.text = "\(Int(invValue))"
        case minusTime: if timerValue != 1 {
            index -= 1
            if index != -1 {
                timerValue = timeArr[index]
                timerVal.text = "0\(timerValue):00"
            }
        } else {
            index = 2
            timerValue = 5
            timerVal.text = "0\(timerValue):00"
        }
        default: break
        }
    }

    private func animationStart() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self, let pair = self.pair else {
                timer.invalidate()
                return
            }

            let sign = Bool.random() ? 1.0 : -1.0
            self.price = pair.1 + pair.1 * Double.random(in: 0.0 ..< 0.0029) * sign
        }
    }
}
