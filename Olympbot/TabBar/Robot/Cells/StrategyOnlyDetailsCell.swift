import UIKit

class StrategyDetailsCell: UITableViewCell {
    static let id = "Cell"

    private let buttonSelected: GrdientView = {
        let view = GrdientView()

        return view
    }()

    var titleLabel: UILabel = {
        var pairLabel = UILabel()
        pairLabel.textColor = .white
        pairLabel.font = .systemFont(ofSize: 13, weight: .bold)
        pairLabel.textAlignment = .left
        pairLabel.numberOfLines = 0
        pairLabel.lineBreakMode = .byWordWrapping
        return pairLabel
    }()

    var descriptionLabel: UILabel = {
        var durationLabel = UILabel()
        durationLabel.textColor = .white
        durationLabel.font = .systemFont(ofSize: 11, weight: .regular)
        durationLabel.textAlignment = .left
        durationLabel.numberOfLines = 0
        durationLabel.lineBreakMode = .byWordWrapping
        return durationLabel
    }()

    var imgCheck: UIImageView = {
        var imgCheck = UIImageView()
        imgCheck.contentMode = .scaleAspectFit
        imgCheck.layer.cornerRadius = 10
        imgCheck.clipsToBounds = true
        return imgCheck
    }()

    var img: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()

    lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = .clear
        nextButton.layer.cornerRadius = 6
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1).cgColor
        nextButton.setTitleColor(UIColor(red: 0, green: 0.58, blue: 1, alpha: 1), for: .normal)
        nextButton.setTitle("Show details".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(runFollowVC), for: .touchUpInside)

        return nextButton
    }()

    var actionHandler: ((StrategyDetailsCell, Int) -> Void)?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureUI()
        self.backgroundColor = UIColor(red: 0.208, green: 0.224, blue: 0.282, alpha: 1)
    }

    func setup(data: StrategyModel, selected: Bool) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        img.image = data.img
        if selected {
            imgCheck.image = UIImage(named: "ch")
            buttonSelected.isHidden = false
            nextButton.layer.borderColor = UIColor.white.cgColor
            nextButton.setTitleColor(.white, for: .normal)
        } else {
            imgCheck.image = UIImage(named: "un")
            buttonSelected.isHidden = true
            nextButton.layer.borderColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1).cgColor
            nextButton.setTitleColor(UIColor(red: 0, green: 0.58, blue: 1, alpha: 1), for: .normal)
        }
    }

    private func configureUI() {
        buttonSelected.isHidden = true
        contentView.addSubviews(buttonSelected, img, imgCheck, titleLabel, descriptionLabel, nextButton)

        buttonSelected.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(13)
            make.leading.equalTo(img.snp.trailing).offset(12)
            make.trailing.equalTo(imgCheck.snp.leading).offset(-16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.equalTo(img.snp.trailing).offset(12)
            make.trailing.equalTo(imgCheck.snp.leading).offset(-16)
        }

        img.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(13)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        }

        imgCheck.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(13)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }
    }
}

extension StrategyDetailsCell {
    @objc private func runFollowVC() {
        actionHandler?(self, 1)
    }
}
