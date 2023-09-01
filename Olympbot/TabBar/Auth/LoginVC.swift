import UIKit
import SnapKit

class LoginVC: UIViewController {
    private let viewForLbl = UIView()
    private let labelTitle1 = UILabel()
    private let labelTitle2 = UILabel()
    private let labelTitle3 = UILabel()
    private let btn1 = UIButton()

    private lazy var control: UISegmentedControl = {
        var control = UISegmentedControl()
        let segmentItems = ["Registration".localize(), "Log in".localize()]
        control = UISegmentedControl(items: segmentItems)
        control.selectedSegmentIndex = 0
        control.backgroundColor = UIColor(red: 0.43, green: 0.43, blue: 0.44, alpha: 0.3)
        control.selectedSegmentTintColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        control.layer.borderColor = UIColor.clear.cgColor
        control.layer.borderWidth = 1
        let font = UIFont.systemFont(ofSize: 13, weight: .medium)
        control.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                       for: .normal)
        control.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                       for: .selected)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        let titleTextAttributeSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]

        control.setTitleTextAttributes(titleTextAttributes, for:.normal)
        control.setTitleTextAttributes(titleTextAttributeSelected, for:.selected)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)

        return control
    }()

    private let emailTextField: TextField = {
        let emailTextField = TextField()
        emailTextField.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        emailTextField.layer.cornerRadius = 10
//        emailTextField.addDoneButtonOnKeyboard()
        emailTextField.textColor = .white
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "email".localize(),
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.769, green: 0.79, blue: 0.867, alpha: 1)]
        )
        emailTextField.font = .systemFont(ofSize: 16, weight: .regular)
        emailTextField.textAlignment = .left

        return emailTextField
    }()

    private let passwordTextField: TextField = {
        let passwordTextField = TextField()
        passwordTextField.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        passwordTextField.layer.cornerRadius = 10
//        passwordTextField.addDoneButtonOnKeyboard()
        passwordTextField.textColor = .white
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "password".localize(),
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.769, green: 0.79, blue: 0.867, alpha: 1)]
        )
        passwordTextField.font = .systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textAlignment = .left

        return passwordTextField
    }()

    private lazy var btnMark: UIButton = {
        let btnMark = UIButton()
        btnMark.setBackgroundImage(UIImage(named: "noMark"), for: .normal)
        btnMark.addTarget(self, action: #selector(btnMarkTap), for: .touchUpInside)

        return btnMark
    }()

    private let lblConfirm: UILabel = {
        let lblConfirm1 = UILabel()
        lblConfirm1.text = "confirm1".localize()
        lblConfirm1.textColor = UIColor(red: 0.769, green: 0.792, blue: 0.867, alpha: 1)
        lblConfirm1.numberOfLines = 0
        lblConfirm1.lineBreakMode = .byWordWrapping
        lblConfirm1.font = .systemFont(ofSize: 12, weight: .regular)
        lblConfirm1.textAlignment = .left

        return lblConfirm1
    }()

    private lazy var lblTerms: UILabel = {
        let lblConfirm1 = UILabel()
        lblConfirm1.text = "confirm2".localize()
        lblConfirm1.textColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        lblConfirm1.numberOfLines = 0
        lblConfirm1.lineBreakMode = .byWordWrapping
        lblConfirm1.font = .systemFont(ofSize: 12, weight: .regular)
        lblConfirm1.textAlignment = .left
        lblConfirm1.isUserInteractionEnabled = true
        lblConfirm1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTerms)))

        return lblConfirm1
    }()

    private lazy var lblPolicy: UILabel = {
        let lblConfirm1 = UILabel()
        lblConfirm1.text = "confirm3".localize()
        lblConfirm1.textColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        lblConfirm1.numberOfLines = 0
        lblConfirm1.lineBreakMode = .byWordWrapping
        lblConfirm1.font = .systemFont(ofSize: 12, weight: .regular)
        lblConfirm1.textAlignment = .left
        lblConfirm1.isUserInteractionEnabled = true
        lblConfirm1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapPrivacy)))

        return lblConfirm1
    }()

    private lazy var lblTemp: UILabel = {
        let lblConfirm1 = UILabel()
        lblConfirm1.text = "&"
        lblConfirm1.textColor = UIColor(red: 0.769, green: 0.792, blue: 0.867, alpha: 1)
        lblConfirm1.numberOfLines = 0
        lblConfirm1.lineBreakMode = .byWordWrapping
        lblConfirm1.font = .systemFont(ofSize: 12, weight: .regular)
        lblConfirm1.textAlignment = .left

        return lblConfirm1
    }()

    private lazy var lblForgot: UILabel = {
        let lblConfirm1 = UILabel()
        lblConfirm1.text = "Forgot password?".localize()
        lblConfirm1.textColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        lblConfirm1.numberOfLines = 0
        lblConfirm1.lineBreakMode = .byWordWrapping
        lblConfirm1.font = .systemFont(ofSize: 12, weight: .regular)
        lblConfirm1.textAlignment = .left
        lblConfirm1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapForgot)))

        return lblConfirm1
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.08, green: 0.11, blue: 0.16, alpha: 1)
        configureButtonNext()
        viewContent()
        doneBtn()
    }

    //MARK: - Configure UI
    private func viewContent() {
        view.addSubview(viewForLbl)
        viewForLbl.addSubview(labelTitle1)
        viewForLbl.addSubview(labelTitle2)
        viewForLbl.addSubview(labelTitle3)
        view.addSubview(control)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(btnMark)
        view.addSubview(lblConfirm)
        view.addSubview(lblForgot)
        view.addSubview(lblTerms)
        view.addSubview(lblPolicy)
        view.addSubview(lblTemp)
        lblForgot.isHidden = true

        labelTitle1.textColor = .white
        labelTitle1.text = "title.reg.1".localize()
        labelTitle1.font = .systemFont(ofSize: 20, weight: .bold)
        labelTitle1.numberOfLines = 0
        labelTitle1.textAlignment = .center
        labelTitle1.lineBreakMode = .byWordWrapping

        labelTitle2.textColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        labelTitle2.text = "title.reg.2".localize()
        labelTitle2.font = .systemFont(ofSize: 20, weight: .bold)
        labelTitle2.numberOfLines = 0
        labelTitle2.textAlignment = .center
        labelTitle2.lineBreakMode = .byWordWrapping

        labelTitle3.textColor = .white
        labelTitle3.text = "title.reg.3".localize()
        labelTitle3.font = .systemFont(ofSize: 20, weight: .bold)
        labelTitle3.numberOfLines = 0
        labelTitle3.textAlignment = .center
        labelTitle3.lineBreakMode = .byWordWrapping

        viewForLbl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }

        labelTitle1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalToSuperview()
        }

        labelTitle2.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(labelTitle1.snp.trailing).offset(4)
        }

        labelTitle3.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(labelTitle2.snp.trailing).offset(4)
            make.trailing.equalToSuperview()
        }

        control.snp.makeConstraints { make in
            make.top.equalTo(labelTitle1.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(32)
        }

        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(control.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(12)
            make.height.equalTo(50)
        }

        btnMark.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(12)
            make.height.width.equalTo(20)
        }

        lblConfirm.snp.makeConstraints { make in
            make.bottom.equalTo(btnMark.snp.centerY).offset(-1)
            make.leading.equalTo(btnMark.snp.trailing).offset(8)
        }

        lblTerms.snp.makeConstraints { make in
            make.bottom.equalTo(btnMark.snp.centerY).offset(-1)
            make.leading.equalTo(lblConfirm.snp.trailing).offset(4)
        }

        lblTemp.snp.makeConstraints { make in
//            make.bottom.equalTo(btnMark.snp.centerY).offset(-1)
            make.top.equalTo(btnMark.snp.centerY).offset(1)
            make.leading.equalTo(btnMark.snp.trailing).offset(8)
//            make.leading.equalTo(lblTerms.snp.trailing).offset(2)
//            make.trailing.equalToSuperview().inset(16)
        }

        lblPolicy.snp.makeConstraints { make in
            make.top.equalTo(btnMark.snp.centerY).offset(1)
            make.leading.equalTo(lblTemp.snp.trailing).offset(3)
            make.trailing.equalToSuperview().inset(16)
        }

        lblForgot.snp.makeConstraints { make in
            make.centerY.equalTo(btnMark.snp.centerY)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }

    private func configureButtonNext() {
        view.addSubview(btn1)
        btn1.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        btn1.layer.cornerRadius = 6
        btn1.setTitleColor(.white, for: .normal)
        btn1.setTitle("Open an account".localize(), for: .normal)
        btn1.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        btn1.alpha = 0.5
        btn1.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        btn1.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }

    private func doneBtn() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        emailTextField.inputAccessoryView = doneToolbar
        passwordTextField.inputAccessoryView = doneToolbar
    }
}

extension LoginVC {
    @objc private func tapForgot() {
        // forgot password
    }

    @objc private func tapTerms() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/12043b8e-f70e-4ef8-86cc-e12492390923"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @objc private func tapPrivacy() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/f043dd2d-3b13-4a96-b1d9-5c0adbdbc0b8"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension LoginVC {
    @objc private func btnMarkTap(sender: UITapGestureRecognizer) {
        btnMark.isSelected ? btnMark.setBackgroundImage(UIImage(named: "noMark"), for: .normal) : btnMark.setBackgroundImage(UIImage(named: "mark"), for: .normal)
        btnMark.isSelected = !btnMark.isSelected
        let isValid = isValidEmail(emailTextField.text ?? "")
        if !emailTextField.text!.isEmpty && !passwordTextField.text!.isEmpty && isValid && btnMark.currentBackgroundImage == UIImage(named: "mark") {
            btn1.alpha = 1
        } else {
            btn1.alpha = 0.5
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    @objc private func tapButtonNext(sender: UITapGestureRecognizer) {
        let isValid = isValidEmail(emailTextField.text ?? "")
        if !emailTextField.text!.isEmpty {
            if !passwordTextField.text!.isEmpty {
                if isValid {
                    if btnMark.currentBackgroundImage == UIImage(named: "mark") && btn1.alpha == 1 {
                        let alertError = UIAlertController(title: "RememberData".localize(), message: nil, preferredStyle: .alert)
                        alertError.addAction(UIAlertAction(title: "Yes".localize(), style: .default, handler: { [self](action: UIAlertAction!) in
                            UserDefaults.standard.set(emailTextField.text, forKey: UserData.SettingsKeys.login.rawValue)
                            UserDefaults.standard.set(true, forKey: UserData.SettingsKeys.showedAuth.rawValue)
                            let vc = TabBarController()
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: false)
                            UserDefaults.standard.set(self.emailTextField.text, forKey: UserData.SettingsKeys.login.rawValue)
                        }))
                        alertError.addAction(UIAlertAction(title: "No".localize(), style: .default, handler: {(action: UIAlertAction!) in
                            let vc = TabBarController()
                            vc.modalPresentationStyle = .fullScreen
                            self.present(vc, animated: false)
                        }))
                        present(alertError, animated: true)
                    } else {
                        btn1.alpha = 0.5
                    }
                }
            } else {
                let alertError = UIAlertController(title: "Error".localize(), message: "Invalid password".localize(), preferredStyle: .alert)
                alertError.addAction(UIAlertAction(title: "ОК", style: .default))
                present(alertError, animated: true)
            }
        } else {
            let alertError = UIAlertController(title: "Error".localize(), message: "Invalid email".localize(), preferredStyle: .alert)
            alertError.addAction(UIAlertAction(title: "ОК", style: .default))
            present(alertError, animated: true)
        }
    }

    @objc func doneButtonAction() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            btn1.setTitle("Open an account".localize(), for: .normal)
            control.backgroundColor = UIColor(red: 0.43, green: 0.43, blue: 0.44, alpha: 0.3)
            btnMark.isHidden = false
            lblConfirm.isHidden = false
            lblForgot.isHidden = true
            lblTerms.isHidden = false
            lblPolicy.isHidden = false
            lblTemp.isHidden = false
        case 1:
            btn1.setTitle("Log in".localize(), for: .normal)
            control.backgroundColor = UIColor(red: 0.43, green: 0.43, blue: 0.44, alpha: 0.3)
            btnMark.isHidden = true
            lblConfirm.isHidden = true
            lblForgot.isHidden = false
            lblTerms.isHidden = true
            lblPolicy.isHidden = true
            lblTemp.isHidden = true
        default: break
        }
    }
}
