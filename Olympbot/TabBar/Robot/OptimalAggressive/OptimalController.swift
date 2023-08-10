import UIKit

class OptimalController: UIViewController {
    private let titleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Optimal strategy".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let contentLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "OptimalContent".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var close: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private lazy var img: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "risk1")

        return close
    }()

    private lazy var imgPage: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "riskPage1")

        return close
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapRecognizer)
        tapRecognizer.delegate = self
        self.view.isUserInteractionEnabled = true
        view.addSubviews(titleLabel, contentLabel, close, img, imgPage)

        close.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        img.snp.makeConstraints { make in
            make.top.equalTo(close.snp.bottom).offset(5)
            make.bottom.equalTo(titleLabel.snp.top).offset(-14)
            make.trailing.leading.equalToSuperview().inset(16)
        }

        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentLabel.snp.top).offset(-5)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        contentLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imgPage.snp.top).offset(-12)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        imgPage.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.centerX.equalToSuperview()
            make.height.equalTo(10)
            make.width.equalTo(32)
        }
    }
}

extension OptimalController {
    @objc private func closePage() {
        dismiss(animated: true)
    }
}

extension OptimalController : UIGestureRecognizerDelegate {
    @objc func tapped(gestureRecognizer: UITapGestureRecognizer) {

    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let position = touch.location(in: self.view)
        if position.x >= UIScreen.main.bounds.width / 2 {
            img.image = UIImage(named: "risk2")
            imgPage.image = UIImage(named: "riskPage2")
            titleLabel.text = "Aggressive strategy".localize()
            contentLabel.text = "AggressiveContent".localize()
        } else {
            img.image = UIImage(named: "risk1")
            imgPage.image = UIImage(named: "riskPage1")
            titleLabel.text = "Optimal strategy".localize()
            contentLabel.text = "OptimalContent".localize()
        }
        return true
    }
}
