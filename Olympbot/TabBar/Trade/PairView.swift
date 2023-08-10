import UIKit

protocol PairDelegate: AnyObject {
    func updatePair(_ value: String?)
}

class PairViewController: UIViewController {
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "trade.choose".localize()
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left

        return titleLabel
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.register(PairCell.self, forCellWithReuseIdentifier: "PairCell")
        view.delegate = self
        view.dataSource = self
        view.showsVerticalScrollIndicator = false

        return view
    }()

    private lazy var leftBarButton: UIImageView = {
        let leftBarButton = UIImageView()
        leftBarButton.image = UIImage(named: "close")
        leftBarButton.isUserInteractionEnabled = true
        leftBarButton.contentMode = .scaleAspectFit
        leftBarButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didLeftBarButtonTapped)))

        return leftBarButton
    }()

    private let pairs = Array(OlympContent.shared.pairs.keys)
    private var data = ""

    var pair: String?
    weak var delegate: PairDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)
        view.addSubviews(titleLabel, leftBarButton, collectionView)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        leftBarButton.translatesAutoresizingMaskIntoConstraints = false
        leftBarButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        leftBarButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        leftBarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        leftBarButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 4).isActive = true

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @objc private func didLeftBarButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}

extension PairViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pairs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PairCell", for: indexPath) as! PairCell
        cell.configure(pair: pairs[indexPath.row], selected: pairs[indexPath.row] == pair)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width), height: 42)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pair = pairs[indexPath.row]
        collectionView.reloadData()
        delegate?.updatePair(pair)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.navigationController?.popViewController(animated: false)
        }
    }
}
