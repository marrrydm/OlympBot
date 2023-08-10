import UIKit

class PairCell: UICollectionViewCell {
    var pairLabel: UILabel = {
        var pairLabel = UILabel()
        pairLabel.textColor = .white
        pairLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        pairLabel.textAlignment = .left

        return pairLabel
    }()

    private let buttonSelected: UIView = {
        let view = UIView()
        view.backgroundColor = .clear

        return view
    }()

    private let imgPair: UIImageView = {
        let imgPair = UIImageView()
        imgPair.image = UIImage(named: "AUD")
        imgPair.contentMode = .scaleAspectFit

        return imgPair
    }()

    private var checkImg: UIImageView = {
        let imgPair = UIImageView()
        imgPair.contentMode = .scaleAspectFit
        imgPair.image = UIImage(named: "unchecked")

        return imgPair
    }()

    private var arrImgPairs: [(String, UIImage?)] = [
        ("EUR/CAD", UIImage(named: "EUR:CAD")),
        ("EUR/GBP", UIImage(named: "EUR:GBP")),
        ("USD/JPY", UIImage(named: "USD:JPY")),
        ("AUD/USD", UIImage(named: "AUD:USD")),
        ("EUR/USD", UIImage(named: "EUR:USD")),
        ("GBP/CHF", UIImage(named: "GBR:CHF")),
        ("GBP/AUD", UIImage(named: "GBP:AUD")),
        ("GBP/USD", UIImage(named: "GBP:USD")),
        ("AUD/JPY", UIImage(named: "AUD:JPY")),
        ("CAD/CHF", UIImage(named: "CAD:CHF")),
        ("CAD/JPY", UIImage(named: "CAD:JPY")),
        ("GBP/JPY", UIImage(named: "GBP:JPY")),
        ("NZD/JPY", UIImage(named: "NZD:JPY")),
        ("AUD/CAD", UIImage(named: "AUD:CAD")),
        ("EUR/JPY", UIImage(named: "EUR:JPY")),
        ("NZD/USD", UIImage(named: "NZD:USD")),
        ("USD/CAD", UIImage(named: "USD:CAD")),
        ("USD/CHF", UIImage(named: "USD:CHF")),
        ("EUR/CHF", UIImage(named: "EUR:CHF"))
    ]

    static let id = "Cell"

    func configure(pair: String, selected: Bool) {
        checkImg.image = selected ? UIImage(named: "check") :  UIImage(named: "unchecked")
        self.contentView.backgroundColor = selected ? UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1) : .clear
        self.contentView.layer.cornerRadius = 10
        pairLabel.text = pair.prefix(3) + "/" + pair.suffix(3)
        let forImg = pairLabel.text!
        for item in arrImgPairs {
            if item.0 == forImg {
                imgPair.image = item.1
            }
        }
        buttonSelected.isHidden = !selected
        self.backgroundColor = .clear
        self.layer.borderColor = UIColor(red: 0.18, green: 0.27, blue: 0.39, alpha: 1).cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 8

        contentView.addSubviews(pairLabel, imgPair, buttonSelected, checkImg)
        buttonSelected.translatesAutoresizingMaskIntoConstraints = false
        buttonSelected.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        buttonSelected.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        buttonSelected.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        buttonSelected.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        pairLabel.translatesAutoresizingMaskIntoConstraints = false
        pairLabel.leadingAnchor.constraint(equalTo: imgPair.trailingAnchor, constant: 20).isActive = true
        pairLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pairLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true

        checkImg.translatesAutoresizingMaskIntoConstraints = false
        checkImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18).isActive = true
        checkImg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        checkImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkImg.heightAnchor.constraint(equalToConstant: 20).isActive = true

        imgPair.translatesAutoresizingMaskIntoConstraints = false
        imgPair.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        imgPair.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imgPair.widthAnchor.constraint(equalToConstant: 32).isActive = true
        imgPair.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}
