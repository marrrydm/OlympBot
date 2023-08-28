import UIKit
import SnapKit

class StartLoginVC: UIViewController {
    private let labelTitle = UILabel()
    private let imgView = UIImageView(image: UIImage(named: "startLogin"))
    private let btn1 = UIButton()
    private let btn2 = UIButton()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.08, green: 0.11, blue: 0.16, alpha: 1)
        configureButtonNext()
        viewContent()
        configureImg()
    }

    // MARK: - Actions
    @objc private func tapButtonNext(sender: UITapGestureRecognizer) {
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }

    //MARK: - Configure UI
    private func viewContent() {
        view.addSubview(labelTitle)

        labelTitle.textColor = .white
        labelTitle.text = "title.start.login".localize()
        labelTitle.font = .systemFont(ofSize: 20, weight: .bold)
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .center
        labelTitle.lineBreakMode = .byWordWrapping

        labelTitle.snp.makeConstraints { make in
            make.bottom.equalTo(btn2.snp.top).offset(-12)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }

    private func configureButtonNext() {
        view.addSubview(btn1)
        btn1.backgroundColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1)
        btn1.layer.cornerRadius = 6
        btn1.setTitleColor(.white, for: .normal)
        btn1.setTitle("Log in".localize(), for: .normal)
        btn1.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        btn1.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        btn1.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        view.addSubview(btn2)
        btn2.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        btn2.layer.cornerRadius = 6
        btn2.setTitleColor(.white, for: .normal)
        btn2.setTitle("create".localize(), for: .normal)
        btn2.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        btn2.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        btn2.snp.makeConstraints { make in
            make.bottom.equalTo(btn1.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }

    private func configureImg() {
        view.addSubview(imgView)
        imgView.contentMode = .scaleAspectFit
        imgView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
    }
}
