import UIKit

class ResultVC: UIViewController {
    private let viewResult: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.layer.cornerRadius = 10

        return view
    }()

    private lazy var close: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "closeRes")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private lazy var nextBtn: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Continue".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        return nextButton
    }()

    private let lblNum: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Number of trades".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private let lblPercentage: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Percentage of profitable trades".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private let lblTotalProfit: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        view.text = "Total profit for the session".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private var lblNumVal: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "100".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 13, weight: .bold)

        return view
    }()

    private let lblPercentageVal: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "73%"
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 13, weight: .bold)

        return view
    }()

    private let lblTotalProfitVal: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.13, green: 0.75, blue: 0.45, alpha: 1)
        view.text = "100"
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 23, weight: .bold)

        return view
    }()

    private let resImg = UIImageView(image: UIImage(named: "result"))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.08, green: 0.11, blue: 0.16, alpha: 1)

        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapButtonNext)))
        close.isUserInteractionEnabled = COREVIDEO_TRUE

        view.addSubviews(close, viewResult, resImg, nextBtn)
        viewResult.addSubviews(lblNum, lblNumVal, lblPercentage, lblPercentageVal, lblTotalProfit, lblTotalProfitVal)

        nextBtn.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(50)
        }

        close.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.width.equalTo(24)
        }

        viewResult.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(12)
            make.bottom.equalTo(lblTotalProfitVal.snp.bottom).offset(26)
            make.top.equalTo(lblNumVal.snp.top).offset(-26)
        }

        resImg.snp.makeConstraints { make in
            make.bottom.equalTo(viewResult.snp.top).offset(10)
            make.height.width.equalTo(150)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }

        lblTotalProfit.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-26)
            make.leading.equalToSuperview().inset(14)
        }

        lblTotalProfitVal.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-26)
            make.trailing.equalToSuperview().inset(14)
        }

        lblPercentage.snp.makeConstraints { make in
            make.bottom.equalTo(lblTotalProfitVal.snp.top).offset(-14)
            make.leading.equalToSuperview().inset(14)
        }

        lblPercentageVal.snp.makeConstraints { make in
            make.bottom.equalTo(lblTotalProfitVal.snp.top).offset(-14)
            make.trailing.equalToSuperview().inset(14)
        }

        lblNum.snp.makeConstraints { make in
            make.bottom.equalTo(lblPercentageVal.snp.top).offset(-14)
            make.leading.equalToSuperview().inset(14)
        }

        lblNumVal.snp.makeConstraints { make in
            make.centerY.equalTo(lblNum.snp.centerY)
            make.trailing.equalToSuperview().inset(14)
        }
    }
}

extension ResultVC {
    @objc private func tapButtonNext() {
        UserDefaults.standard.set(nil, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
        UserDefaults.standard.set(0, forKey: UserData.SettingsKeys.profitAfterActive.rawValue)
        UserDefaults.standard.set(0, forKey: UserData.SettingsKeys.sumProfitAfterActive.rawValue)

        self.navigationController?.popToRootViewController(animated: true)
    }

    @objc private func closePage() {
        UserDefaults.standard.set(nil, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
        UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWork.rawValue)
        UserDefaults.standard.set(0, forKey: UserData.SettingsKeys.profitAfterActive.rawValue)

        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ResultVC: ResultDelegate {
    func updateResult(result: Int) {
        lblTotalProfitVal.text = "\(result)"

        lblNumVal.text = "\(Int.random(range: 50..<150))"
        lblPercentageVal.text = "\(Int.random(range: 73..<87 ))"

        var balance = UserData.balance
        balance += result
        UserDefaults.standard.set(balance, forKey: UserData.SettingsKeys.balance.rawValue)
    }
}
