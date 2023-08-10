import UIKit

class DropDownTableViewCell: UITableViewCell {
    var topicLabel = UILabel()
    var arrowImg = UIImageView(image: UIImage(named: "bottom"))
    static let id = "Cell"

    // MARK: - Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        create(frame: CGRect(x: 0, y: 0, width: 358, height: 600))
    }

    private func create(frame: CGRect) {
        contentView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        contentView.layer.cornerRadius = 10
        labelsConfigure()
        labelsConstraints()
    }

    private func labelsConfigure() {
        topicLabel.textColor = .white
        topicLabel.font = .systemFont(ofSize: 13, weight: .bold)
        topicLabel.lineBreakMode = .byWordWrapping
        topicLabel.numberOfLines = 0
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topicLabel)
        addSubview(arrowImg)
    }

    private func labelsConstraints() {
        topicLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        topicLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        topicLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true

        arrowImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }
    }
}
