import UIKit

protocol DropDownViewControlleDelegate {
    func passData(data: LearningInfo, title: String, idItems: [LearningModel])
}

class SupportController: UIViewController {
    private let labelTitle = UILabel()
    private let labelSubtitle = UILabel()
    private let tableView = UITableView.init(frame: .zero, style: .grouped)
    var eduPresenter: SupportViewPreseneterProtocol?

    private var hiddenSections = Set<Int>()

    private var arrayTtiles: [String] = []
    private var imgForTable: [UIImage?] = []
    private var topicsFirst: [[LearningModel]] = []

    var toDetailDelegate: DropDownViewControlleDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)
        navigationController?.navigationBar.isHidden = true
        configureLabel()
        configureTableView()
        self.eduPresenter?.showData()
    }

    @objc private func hideSection(sender: UIButton) {
        let section = sender.tag
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            for row in 0..<self.topicsFirst[section].count {
                indexPaths.append(IndexPath(row: row, section: section))
            }
            return indexPaths
        }

        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
            self.tableView.insertRows(at: indexPathsForSection(), with: .fade)
        } else {
            self.hiddenSections.insert(section)
            self.tableView.deleteRows(at: indexPathsForSection(), with: .fade)
        }
    }


    //MARK: - Configure UI
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DropDownTableViewCell.self, forCellReuseIdentifier: DropDownTableViewCell.id)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        constraintsTableView()
    }

    private func constraintsTableView() {
        tableView.topAnchor.constraint(equalTo: labelSubtitle.bottomAnchor, constant: 12).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        tableView.heightAnchor.constraint(lessThanOrEqualToConstant: 770).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }

    private func configureLabel() {
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

        view.addSubview(labelSubtitle)
        labelSubtitle.translatesAutoresizingMaskIntoConstraints = false
        labelSubtitle.textColor = .white
        labelSubtitle.font = .systemFont(ofSize: 18, weight: .bold)
        labelSubtitle.textAlignment = .left
        labelSubtitle.text = "FAQ".localize()

        labelSubtitle.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(17)
            make.trailing.equalToSuperview().offset(-17)
        }
    }
}

//MARK: - UITableViewDataSource
extension SupportController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DropDownTableViewCell.id
        ) as? DropDownTableViewCell else {
            fatalError("failed to get value cell")
        }
        cell.topicLabel.text = topicsFirst[indexPath.section][indexPath.row].topic
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hiddenSections.contains(section) {
            return 0
        }
        return topicsFirst[section].count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return topicsFirst.count
    }
}

//MARK: - UITableViewDelegate
extension SupportController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionButton = UIButton()
        for (ind, value) in arrayTtiles.enumerated() where section == ind {
            sectionButton.setTitle((value), for: .normal)
        }
        sectionButton.contentHorizontalAlignment = .left
        sectionButton.titleLabel?.font = .systemFont(ofSize: 11, weight: .medium)
        sectionButton.setTitleColor(UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1), for: .normal)
        sectionButton.backgroundColor = .clear
        sectionButton.tag = section
        sectionButton.addTarget(self, action: #selector(self.hideSection(sender:)), for: .touchUpInside)
        return sectionButton
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 8
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            let vc = DetailViewController()
            self.navigationController?.pushViewController(vc, animated: false)
            self.toDetailDelegate = vc
            self.toDetailDelegate?.passData(data: topicsFirst[indexPath.section][indexPath.row].text, title: topicsFirst[indexPath.section][indexPath.row].topic, idItems: topicsFirst[indexPath.section])
    }
}

extension SupportController: SupportViewProtocol {
    func setQuestion(arrayTtiles: [String], topic: [[LearningModel]]) {
        self.arrayTtiles = arrayTtiles
        self.topicsFirst = topic
        tableView.reloadData()
    }
}
