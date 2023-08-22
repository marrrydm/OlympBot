import UIKit

class StartTradeVC: UIViewController {
    private let labelTitle = UILabel()
    private let contentLabel = UILabel()
    private var imgView = UIImageView(image: UIImage(named: "tradeImg"))
    private let nextButton = UIButton()
    private var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.08, green: 0.11, blue: 0.16, alpha: 1)
        configureButtonNext()
        viewContent()
        configureImg()
    }

    private func viewContent() {
        view.addSubview(labelTitle)
        view.addSubview(contentLabel)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false

        labelTitle.textColor = UIColor(red: 0.918, green: 0.933, blue: 0.925, alpha: 1)
        labelTitle.text = "trade.start.1".localize()
        labelTitle.font = .systemFont(ofSize: 20, weight: .bold)
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .center
        labelTitle.lineBreakMode = .byWordWrapping
        labelTitle.backgroundColor = .clear

        contentLabel.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -80).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true

        labelTitle.bottomAnchor.constraint(equalTo: contentLabel.topAnchor, constant: -2).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true

        contentLabel.backgroundColor = .clear
        contentLabel.text = "trade.start.2".localize()
        contentLabel.textColor = UIColor(red: 0.743, green: 0.758, blue: 0.829, alpha: 1)
        contentLabel.font = .systemFont(ofSize: 16, weight: .regular)
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .center
        contentLabel.lineBreakMode = .byWordWrapping
    }

    private func configureButtonNext() {
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("next".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }

    private func configureImg() {
        view.addSubview(imgView)
        imgView.contentMode = .scaleAspectFit

        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.bottomAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -100).isActive = true
        imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

extension StartTradeVC {
    @objc private func tapButtonNext(sender: UITapGestureRecognizer) {
        let vc =  TradeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
