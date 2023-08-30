import UIKit

class AccountViewController: UIViewController {
    private let titleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = UIColor(red: 0.918, green: 0.933, blue: 0.925, alpha: 1)
        labelTitle.text = "tabbar.account".localize()
        labelTitle.font = .systemFont(ofSize: 18, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var option: UIImageView = {
        let option = UIImageView()
        option.image = UIImage(named: "arrow")
        option.contentMode = .scaleAspectFit
        option.isUserInteractionEnabled = true
        option.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pop)))

        return option
    }()

    private lazy var privacyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.layer.cornerRadius = 13
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(policyAction)))

        return view
    }()

    private let privacyViewLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "account.policy".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private let privacyImg = UIImageView(image: UIImage(named: "toRight"))

    private lazy var termsView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(termsAction)))

        return view
    }()

    private let termsViewLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "account.terms".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private let termsImg = UIImageView(image: UIImage(named: "toRight"))

    private lazy var logoutView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(logoutAction)))

        return view
    }()

    private let logoutViewLabel: UILabel = {
        let view = UILabel()
        view.text = "Log out".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()

    private let logoutImg = UIImageView(image: UIImage(named: "toRight"))

    private lazy var deleteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 13
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(deleteAction)))

        return view
    }()

    private let deleteViewLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "account.delete".localize()
        view.font = .systemFont(ofSize: 13, weight: .medium)

        return view
    }()


    private let userName: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "User_100805733"
        view.font = .systemFont(ofSize: 18, weight: .bold)

        return view
    }()

    private let idUser: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        view.text = "ID 100805733"
        view.font = .systemFont(ofSize: 11, weight: .medium)

        return view
    }()

    private let personImg = UIImageView(image: UIImage(named: "person"))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)

        userName.text = "User_".localize() + "\(UserData.userId)"
        idUser.text = "ID " + "\(UserData.userId)"
        view.addSubviews(titleLabel, option, privacyView, termsView, userName, idUser, personImg, logoutView, deleteView)

        privacyView.addSubviews(privacyViewLabel, privacyImg)
        termsView.addSubviews(termsViewLabel, termsImg)
        logoutView.addSubviews(logoutViewLabel, logoutImg)
        deleteView.addSubviews(deleteViewLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        personImg.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(48)
        }

        userName.snp.makeConstraints { make in
            make.top.equalTo(personImg.snp.top)
            make.leading.equalTo(personImg.snp.trailing).offset(16)
        }

        idUser.snp.makeConstraints { make in
            make.bottom.equalTo(personImg.snp.bottom).offset(-4)
            make.leading.equalTo(personImg.snp.trailing).offset(16)
        }

        option.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(15)
            make.width.equalTo(15)
        }

        privacyView.snp.makeConstraints { make in
            make.top.equalTo(personImg.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }

        privacyViewLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }

        privacyImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(24)
        }

        termsView.snp.makeConstraints { make in
            make.top.equalTo(privacyView.snp.bottom).offset(1)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }

        termsViewLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }

        termsImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(24)
        }

        logoutView.snp.makeConstraints { make in
            make.top.equalTo(termsView.snp.bottom).offset(1)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }

        logoutViewLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }

        logoutImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(24)
        }

        deleteView.snp.makeConstraints { make in
            make.top.equalTo(logoutView.snp.bottom).offset(1)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }

        deleteViewLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
    }
}

extension AccountViewController {
    @objc private func policyAction() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/f043dd2d-3b13-4a96-b1d9-5c0adbdbc0b8"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @objc private func termsAction() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/12043b8e-f70e-4ef8-86cc-e12492390923"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @objc private func pop() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func deleteAction() {
        alertPage()
    }

    @objc private func logoutAction() {
        UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.showedAuth.rawValue)
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }

    private func alertPage() {
        let alertError = UIAlertController(title: "DeleteData".localize(), message: nil, preferredStyle: .alert)
        alertError.addAction(UIAlertAction(title: "Yes".localize(), style: .default, handler: { (action: UIAlertAction!) in
            UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.showedAuth.rawValue)
            UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.showedTrade.rawValue)
            UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWorkSignal.rawValue)
            UserDefaults.standard.set(false, forKey: UserData.SettingsKeys.isWork.rawValue)
            UserDefaults.standard.set("", forKey: UserData.SettingsKeys.login.rawValue)
            UserDefaults.standard.set(1000, forKey: UserData.SettingsKeys.balance.rawValue)
            UserDefaults.standard.set(0, forKey: UserData.SettingsKeys.userId.rawValue)

            let vc = TabBarController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }))
        alertError.addAction(UIAlertAction(title: "No".localize(), style: .default, handler: {(action: UIAlertAction!) in

        }))
        present(alertError, animated: true)
    }
}
