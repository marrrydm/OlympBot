import UIKit

class ResultSignal: UIViewController {
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

    private let lblTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Your trading session is finished".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center

        return view
    }()

    private let lblContent: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.584, green: 0.612, blue: 0.663, alpha: 1)
        view.text = "lbl.content.bot".localize()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textAlignment = .center

        return view
    }()

    private let resImg = UIImageView(image: UIImage(named: "imgRes"))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.08, green: 0.11, blue: 0.16, alpha: 1)

        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapButtonNext)))
        close.isUserInteractionEnabled = COREVIDEO_TRUE

        view.addSubviews(close, resImg, nextBtn, lblTitle, lblContent)

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

        resImg.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(170)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }

        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(resImg.snp.bottom).offset(21)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        lblContent.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

extension ResultSignal {
    @objc private func tapButtonNext() {
        UserDefaults.standard.set(nil, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
        self.navigationController?.popToRootViewController(animated: true)
    }

    @objc private func closePage() {
        UserDefaults.standard.set(nil, forKey: UserData.SettingsKeys.dateAlgorithmStart.rawValue)
        UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWorkSignal.rawValue)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
