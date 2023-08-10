import UIKit

class DetailViewController: UIViewController {
    private var leftBarButton = UIButton()
    private let labelTitle = UILabel()
    private let titleLabel = UILabel()
    private let textLabel = UILabel()
    private var id = 0
    private var idItems: [LearningModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)
        navigationController?.navigationBar.isHidden = true

        view.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textColor = .white
        labelTitle.text = "tabbar.support".localize()
        labelTitle.font = .systemFont(ofSize: 18, weight: .bold)
        labelTitle.textAlignment = .center

        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().offset(-17)
        }
        
        configureLeftBarButton()
        configureTitleLabel()
        configureTextLabel()
    }

    //MARK: - Actions
    @objc private func didLeftBarButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        navigationController?.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Configure UI
    private func configureLeftBarButton() {
        view.addSubview(leftBarButton)
        leftBarButton.setImage(UIImage(named: "close"), for: .normal)
        leftBarButton.addTarget(self, action: #selector(didLeftBarButtonTapped(_:)), for: .touchUpInside)
        leftBarButton.isUserInteractionEnabled = true
        leftBarButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalTo(labelTitle.snp.centerY)
            make.height.width.equalTo(24)
        }
    }

    private func configureTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        constraintsTitleLabel()
    }

    private func configureTextLabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
        textLabel.font = .systemFont(ofSize: 13, weight: .medium)
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textColor = .white
        textLabel.textAlignment = .natural
        constraintsTextLabel()
    }

    private func constraintsTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16).isActive = true
    }

    private func constraintsTextLabel() {
        textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
    }
}

extension DetailViewController: DropDownViewControlleDelegate {
    func passData(data: LearningInfo, title: String, idItems: [LearningModel]) {
        titleLabel.text = title
        textLabel.text = data.text
        id = data.id
        self.idItems = idItems
    }
}
