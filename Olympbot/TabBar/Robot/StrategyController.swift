import UIKit

protocol StrategyDelegate: AnyObject {
    func updateStrategy(_ value: String?)
}

class StrategyController: UIViewController {
    private let titleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = UIColor(red: 0.918, green: 0.933, blue: 0.925, alpha: 1)
        labelTitle.text = "Strategy".localize()
        labelTitle.font = .systemFont(ofSize: 18, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var strategyCollectionView: UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = true
        tableView.register(StrategyCell.self, forCellReuseIdentifier: "StrategyCell")
        tableView.register(StrategyDetailsCell.self, forCellReuseIdentifier: StrategyDetailsCell.id)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    private lazy var leftBarButton: UIImageView = {
        let leftBarButton = UIImageView()
        leftBarButton.image = UIImage(named: "close")
        leftBarButton.isUserInteractionEnabled = true
        leftBarButton.contentMode = .scaleAspectFit
        leftBarButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didLeftBarButtonTapped)))

        return leftBarButton
    }()

    private let viewMac: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private lazy var signalImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "mac")

        return close
    }()

    private let titleLabelMac: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "MACD".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let contentLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "mac.content".localize()
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
        close.contentMode = .scaleToFill
        close.image = UIImage(named: "macImg")

        return close
    }()

    private let lblIndicators: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "mac.content2".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var nextBtn: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Select".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 1

        return nextButton
    }()

    let viewSummary: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private lazy var summaryImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "signal indi")

        return close
    }()

    private let summaryTitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Indicators: Summary".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let summaryContentLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Combination".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var summaryClose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private lazy var summaryBigImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleToFill
        close.image = UIImage(named: "summary")

        return close
    }()

    private let lblSummary: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "indicators.content".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private let bgViewSummary: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private lazy var summaryNextBtn: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Select".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.tag = 0
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        return nextButton
    }()

    private let bgTitle1: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Technical indicators".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private let bgContent1: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        labelTitle.text = "bg1.content".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private let bgTitle2: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Moving Averages".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private let bgContent2: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = UIColor(red: 0.58, green: 0.61, blue: 0.66, alpha: 1)
        labelTitle.text = "bg2.content".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    let viewStochastic: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private lazy var stochasticImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "Stochastic")

        return close
    }()

    private let stochastictitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Stochastic".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let stochasticcontentLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Stochastic.content".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var stochasticclose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private lazy var stochasticBigImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleToFill
        close.image = UIImage(named: "StochasticImg")

        return close
    }()

    private let lblStochastic: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Stochastic.content2".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var stochasticNextBtn: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Select".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.tag = 2
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        return nextButton
    }()

    let viewBollinger: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private lazy var bollingerImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "Bollinger")

        return close
    }()

    private let bollingertitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Bollinger".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let bollingercontentLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Bollinger.content".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var bollingerclose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private lazy var bollingerBigimg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleToFill
        close.image = UIImage(named: "BollingerImg")

        return close
    }()

    private let lblbollinger: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Bollinger.content2".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var bollingernextBtn: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Select".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 3

        return nextButton
    }()

    let viewRSI: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private lazy var RSIImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "RSI")

        return close
    }()

    private let RSItitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "RSI".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let RSIcontentLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Stochastic.content".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var RSIclose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private lazy var RSIBigimg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleToFill
        close.image = UIImage(named: "RSIImg")

        return close
    }()

    private let lblRSI: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "RSI.content2".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var RSInextBtn: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Select".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 4

        return nextButton
    }()

    let viewCCI: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private lazy var CCIImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "CCI")

        return close
    }()

    private let CCItitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "CCI".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let CCIcontentLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Stochastic.content".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var CCIclose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private lazy var CCIBigimg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleToFill
        close.image = UIImage(named: "CCIImg")

        return close
    }()

    private let lblCCI: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "CCI.content2".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var CCInextBtn: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Select".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 5

        return nextButton
    }()

    private let viewClose: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private lazy var closeImg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "ClosePrice")

        return close
    }()

    private let closetitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Close price".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let closecontentLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Stochastic.content".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var closeclose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private lazy var closeBigimg: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleToFill
        close.image = UIImage(named: "CloseImg")

        return close
    }()

    private let lblclose: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Close price.content2".localize()
        labelTitle.font = .systemFont(ofSize: 11, weight: .medium)
        labelTitle.textAlignment = .left
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = .byWordWrapping

        return labelTitle
    }()

    private lazy var closenextBtn: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Select".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 6

        return nextButton
    }()

    private let viewMacSettings: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private let macSettingsTitleLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "MACD settings".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let histigramLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Histogram".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let signalLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Signal".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let lineLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "MACD line" .localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private var blue1: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "blue")

        return close
    }()

    private var red1: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "red")

        return close
    }()

    private var green1: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "green")

        return close
    }()

    private lazy var macSettingsClose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private let macSettingsbgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let macSettingsbgView2: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let macSettingsbgView3: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let macSignalView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusSignal: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 20

        return plusInv
    }()

    private lazy var minusSignal: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 21

        return minusInv
    }()

    private let lblSignalVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "2"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private let macLineView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusLine1: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 22

        return plusInv
    }()

    private lazy var minusLine1: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 23

        return minusInv
    }()

    private let lblLineVal1: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "11"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private let macLineView2: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusLine2: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 24

        return plusInv
    }()

    private lazy var minusLine2: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 25

        return minusInv
    }()

    private let lblLineVal2: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "22"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var macSettingsBtnSave: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Save".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 1

        return nextButton
    }()

    private let viewStochasticSettings: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private let stochasticTitleLabelSettings: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Stochastic settings".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let mLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "m".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let dLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "%D".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let kLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "K" .localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private var grey2: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "grey1")

        return close
    }()

    private var red2: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "red")

        return close
    }()

    private var blue2: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "blue")

        return close
    }()

    private lazy var stochasticSettingsClose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private let stochasticSettingsbgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let stochasticSettingsbgView2: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let stochasticSettingsbgView3: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let stochasticMView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusMStochastic: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 26

        return plusInv
    }()

    private lazy var minusMStochastic: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 27

        return minusInv
    }()

    private let lblMVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "2"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private let stochasticDView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusDStochastic: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 28

        return plusInv
    }()

    private lazy var minusDStochastic: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 29

        return minusInv
    }()

    private let lblDVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "2"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private let stochasticKView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusKStochastic: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 30

        return plusInv
    }()

    private lazy var minusKStochastic: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 31

        return minusInv
    }()

    private let lblKVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "2"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var stochasticSettingsBtnSave: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Save".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 2

        return nextButton
    }()

    private let viewBollingerSettings: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private let bollingerTitleLabelSettings: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Bollinger Bands settings".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let standartLabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "Strandard deviation".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let SMALabel: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "SMA".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private var red3: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "red")

        return close
    }()

    private var blue3: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "blue")

        return close
    }()

    private lazy var bollingerSettingsClose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private let bollingerSettingsbgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let bollingerSettingsbgView2: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let bollingerView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusbollinger1: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 32

        return plusInv
    }()

    private lazy var minusbollinger1: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 33

        return minusInv
    }()

    private let lblStandartVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "2"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private let bollingerView2: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusbollinger2: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 34

        return plusInv
    }()

    private lazy var minusbollinger2: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 35

        return minusInv
    }()

    private let lblbollingerVal2: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "2"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var bollingerSettingsBtnSave: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Save".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 3
        return nextButton
    }()

    private let viewRSISettings: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private let RSITitleLabelSettings: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "RSI settings".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let RSILabelSettings: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "RSI".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private var purple4: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "purple")

        return close
    }()

    private lazy var RSISettingsClose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private let RSISettingsbgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let RSIView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusRSI1: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 36

        return plusInv
    }()

    private lazy var minusRSI1: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 37

        return minusInv
    }()

    private let lblRSIVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "2"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var RSISettingsBtnSave: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Save".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 4
        return nextButton
    }()

    private let viewCCISettings: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        view.layer.cornerRadius = 20

        return view
    }()

    private let CCITitleLabelSettings: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "CCI settings".localize()
        labelTitle.font = .systemFont(ofSize: 13, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private let CCILabelSettings: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "CCI".localize()
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .left

        return labelTitle
    }()

    private var purple5: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.image = UIImage(named: "green")

        return close
    }()

    private lazy var CCISettingsClose: UIImageView = {
        var close = UIImageView()
        close.contentMode = .scaleAspectFit
        close.isUserInteractionEnabled = true
        close.image = UIImage(named: "cross")
        close.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage)))

        return close
    }()

    private let CCISettingsbgView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        bgView.layer.cornerRadius = 10

        return bgView

    }()

    private let CCIView1: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.13, green: 0.14, blue: 0.18, alpha: 1)
        bgView.layer.cornerRadius = 8

        return bgView

    }()

    private lazy var plusCCI1: UIButton = {
        let plusInv = UIButton()
        plusInv.isUserInteractionEnabled = true
        plusInv.layer.cornerRadius = 6
        plusInv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        plusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        plusInv.setImage(UIImage(named: "plus"), for: .normal)
        plusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        plusInv.tag = 38

        return plusInv
    }()

    private lazy var minusCCI1: UIButton = {
        let minusInv = UIButton()
        minusInv.isUserInteractionEnabled = true
        minusInv.layer.cornerRadius = 6
        minusInv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        minusInv.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        minusInv.setImage(UIImage(named: "minus"), for: .normal)
        minusInv.addTarget(self, action: #selector(tapPlusMinus), for: .touchUpInside)
        minusInv.tag = 39

        return minusInv
    }()

    private let lblCCIVal: UILabel = {
        let labelTitle = UILabel()
        labelTitle.textColor = .white
        labelTitle.text = "2"
        labelTitle.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
        labelTitle.font = .systemFont(ofSize: 14, weight: .bold)
        labelTitle.textAlignment = .center

        return labelTitle
    }()

    private lazy var CCISettingsBtnSave: UIButton = {
        var nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.58, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 6
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Save".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)
        nextButton.tag = 5
        return nextButton
    }()

    private var topicsFirst: [[StrategyModel]] = [
        [StrategyModel(title: "Indicators: Summary".localize(), img: UIImage(named: "signal indi"), check: UIImage(named: "un"), description: "sum1".localize(), isWaiting: false, num: 0)],
        [StrategyModel(title: "MACD".localize(), img: UIImage(named: "mac"), check: UIImage(named: "un"), description: "mac1".localize(), isWaiting: false, num: 1),
         StrategyModel(title: "Stochastic".localize(), img: UIImage(named: "Stochastic"), check: UIImage(named: "un"), description: "stochastic1".localize(), isWaiting: false, num: 2),
         StrategyModel(title: "Bollinger".localize(), img: UIImage(named: "Bollinger"), check: UIImage(named: "un"), description: "bollinger1".localize(), isWaiting: false, num: 3),
         StrategyModel(title: "RSI".localize(), img: UIImage(named: "RSI"), check: UIImage(named: "un"), description: "RSI1".localize(), isWaiting: false, num: 4),
         StrategyModel(title: "CCI".localize(), img: UIImage(named: "CCI"), check: UIImage(named: "un"), description: "CCI1".localize(), isWaiting: false, num: 5),
         StrategyModel(title: "Close price".localize(), img: UIImage(named: "ClosePrice"), check: UIImage(named: "un"), description: "ClosePrice1".localize(), isWaiting: false, num: 6)]
    ]
    private var hiddenSections = Set<Int>()
    private var arrayTtiles: [String] = ["Auto strategy".localize(), "Custom strategy".localize()]
    private var imgForTable: [UIImage?] = []
    var titleTopic: String?
    weak var delegate: StrategyDelegate?
    private var strategyValue: String?

    private var cciVal = 1
    private var rsiVal = 1
    private var bandsVal1 = 1
    private var bandsVal2 = 1
    private var srochasticVal1 = 1
    private var srochasticVal2 = 1
    private var srochasticVal3 = 1
    private var macVal1 = 1
    private var macVal2 = 1
    private var macVal3 = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.05, green: 0.06, blue: 0.07, alpha: 1)
        navigationController?.navigationBar.isHidden = true
        view.addSubviews(leftBarButton, titleLabel, strategyCollectionView)
        lblSignalVal.text = "\(macVal1)"
        lblLineVal1.text = "\(macVal2)"
        lblLineVal2.text = "\(macVal3)"
        lblMVal.text = "\(srochasticVal1)"
        lblDVal.text = "\(srochasticVal2)"
        lblKVal.text = "\(srochasticVal3)"
        lblStandartVal.text = "\(bandsVal1)"
        lblbollingerVal2.text = "\(bandsVal2)"
        lblRSIVal.text = "\(rsiVal)"
        lblCCIVal.text = "\(cciVal)"

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        strategyCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        leftBarButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.leading.equalToSuperview().offset(25)
            make.height.width.equalTo(24)
        }
    }
}

extension StrategyController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 || indexPath.row == 5 {
            cell = tableView.dequeueReusableCell(
                withIdentifier: StrategyDetailsCell.id , for: indexPath) as! StrategyDetailsCell
            if titleTopic == "Auto".localize() {
                titleTopic = "Indicators: Summary".localize()
            } else if titleTopic == "Custom".localize() {
                titleTopic = "MACD".localize()
            }
            (cell as! StrategyDetailsCell).setup(data: topicsFirst[indexPath.section][indexPath.row], selected: topicsFirst[indexPath.section][indexPath.row].title == titleTopic)
            cell.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)
            (cell as! StrategyDetailsCell).actionHandler = { [weak self] (cell, num) in
                let indexPath = self?.strategyCollectionView.indexPath(for: cell)
                if indexPath?.section == 0 {
                    self?.configureSummaryDetails()
                    self?.viewSummary.isHidden = false
                } else {
                    self?.viewClose.isHidden = false
                    self?.configureCloseDetails()
                }
            }
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "StrategyCell", for: indexPath) as! StrategyCell
            (cell as! StrategyCell).setup(data: topicsFirst[indexPath.section][indexPath.row], selected: topicsFirst[indexPath.section][indexPath.row].title == titleTopic)
            cell.backgroundColor = UIColor(red: 0.14, green: 0.19, blue: 0.28, alpha: 1)

            (cell as! StrategyCell).actionHandler = { [weak self] (cell, num) in
                let indexPath = self?.strategyCollectionView.indexPath(for: cell)
                if num == 1 {
                    switch indexPath?.row {
                    case 0:
                        self?.configureMacDetails()
                        self?.viewMac.isHidden = false
                    case 1:
                        self?.viewStochastic.isHidden = false
                        self?.configureStochasticDetails()
                    case 2:
                        self?.viewBollinger.isHidden = false
                        self?.configureBollingerDetails()
                    case 3:
                        self?.viewRSI.isHidden = false
                        self?.configureRSIDetails()
                    case 4:
                        self?.viewCCI.isHidden = false
                        self?.configureCCIDetails()
                    default: break
                    }
                } else {
                    switch indexPath?.row {
                    case 0:
                        self?.configureMacSettings()
                        self?.viewMacSettings.isHidden = false
                    case 1:
                        self?.configureStochasticSettings()
                        self?.viewStochasticSettings.isHidden = false
                    case 2:
                        self?.configureBollingerSettings()
                        self?.viewBollingerSettings.isHidden = false
                    case 3:
                        self?.configureRSISettings()
                        self?.viewRSISettings.isHidden = false
                    case 4:
                        self?.configureCCISettings()
                        self?.viewCCISettings.isHidden = false
                    default: break
                    }
                }
            }
        }
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

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 8
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}

extension StrategyController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionButton = UIButton()
        for (ind, value) in arrayTtiles.enumerated() where section == ind {
            sectionButton.setTitle((value), for: .normal)
        }
        sectionButton.contentHorizontalAlignment = .left
        sectionButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        sectionButton.setTitleColor(.white, for: .normal)
        sectionButton.backgroundColor = .clear
        sectionButton.tag = section
        sectionButton.addTarget(self, action: #selector(self.hideSection(sender:)), for: .touchUpInside)
        return sectionButton
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        titleTopic = topicsFirst[indexPath.section][indexPath.row].title
        tableView.deselectRow(at: indexPath, animated: false)
        tableView.reloadData()
    }
}

extension StrategyController: TitleDelegate {
    func updateTitle(result: String) {
        switch result {
        case "Auto".localize(): titleTopic = "Indicators: Summary".localize()
        case "Indicators: Summary".localize():
            titleTopic = "Indicators: Summary".localize()
        case "MACD".localize(): titleTopic = "MACD".localize()
        case "Stochastic".localize(): titleTopic = "Stochastic".localize()
        case "Bollinger".localize(): titleTopic = "Bollinger".localize()
        case "RSI".localize(): titleTopic = "RSI".localize()
        case "CCI".localize(): titleTopic = "CCI".localize()
        case "Close price".localize(): titleTopic = "Close price".localize()
        case "Custom": titleTopic = "MACD".localize()
        default: break
        }
        strategyCollectionView.reloadData()
    }
}

extension StrategyController {
    @objc private func tapPlusMinus(sender: UIButton) {
        switch sender.tag {
        case 20:
            if 1...49 ~= macVal1 {
                macVal1 += 1
                lblSignalVal.text = "\(macVal1)"
            }
        case 21:
            if 2...50 ~= macVal1 {
                macVal1 -= 1
                lblSignalVal.text = "\(macVal1)"
            }
        case 22:
            if 1...49 ~= macVal2 {
                macVal2 += 1
                lblLineVal1.text = "\(macVal2)"
            }
        case 23:
            if 2...50 ~= macVal2 {
                macVal2 -= 1
                lblLineVal1.text = "\(macVal2)"
            }
        case 24:
            if 1...49 ~= macVal3 {
                macVal3 += 1
                lblLineVal2.text = "\(macVal3)"
            }
        case 25:
            if 2...50 ~= macVal3 {
                macVal3 -= 1
                lblLineVal2.text = "\(macVal3)"
            }
        case 26:
            if 1...49 ~= srochasticVal1 {
                srochasticVal1 += 1
                lblMVal.text = "\(srochasticVal1)"
            }
        case 27:
            if 2...50 ~= srochasticVal1 {
                srochasticVal1 -= 1
                lblMVal.text = "\(srochasticVal1)"
            }
        case 28:
            if 1...49 ~= srochasticVal2 {
                srochasticVal2 += 1
                lblDVal.text = "\(srochasticVal2)"
            }
        case 29:
            if 2...50 ~= srochasticVal2 {
                srochasticVal2 -= 1
                lblDVal.text = "\(srochasticVal2)"
            }
        case 30:
            if 1...49 ~= srochasticVal3 {
                srochasticVal3 += 1
                lblKVal.text = "\(srochasticVal3)"
            }
        case 31:
            if 2...50 ~= srochasticVal3 {
                srochasticVal3 -= 1
                lblKVal.text = "\(srochasticVal3)"
            }
        case 32:
            if 1...49 ~= bandsVal1 {
                bandsVal1 += 1
                lblStandartVal.text = "\(bandsVal1)"
            }
        case 33:
            if 2...50 ~= bandsVal1 {
                bandsVal1 -= 1
                lblStandartVal.text = "\(bandsVal1)"
            }
        case 34:
            if 1...49 ~= bandsVal2 {
                bandsVal2 += 1
                lblbollingerVal2.text = "\(bandsVal2)"
            }
        case 35:
            if 2...50 ~= bandsVal2 {
                bandsVal2 -= 1
                lblbollingerVal2.text = "\(bandsVal2)"
            }
        case 36:
            if 1...49 ~= rsiVal {
                rsiVal += 1
                lblRSIVal.text = "\(rsiVal)"
            }
        case 37:
            if 2...50 ~= rsiVal {
                rsiVal -= 1
                lblRSIVal.text = "\(rsiVal)"
            }
        case 38:
            if 1...49 ~= cciVal {
                cciVal += 1
                lblCCIVal.text = "\(cciVal)"
            }
        case 39:
            if 2...50 ~= cciVal {
                cciVal -= 1
                lblCCIVal.text = "\(cciVal)"
            }
        default: break
        }
    }

    @objc private func tapButtonNext(sender: UIButton) {
        switch sender.tag {
        case 0: titleTopic = "Indicators: Summary".localize()
            viewSummary.isHidden = true
        case 1: titleTopic = "MACD".localize()
            viewMac.isHidden = true
            viewMacSettings.isHidden = true
        case 2: titleTopic = "Stochastic".localize()
            viewStochastic.isHidden = true
            viewStochasticSettings.isHidden = true
        case 3: titleTopic = "Bollinger".localize()
            viewBollinger.isHidden = true
            viewBollingerSettings.isHidden = true
        case 4: titleTopic = "RSI".localize()
            viewRSI.isHidden = true
            viewRSISettings.isHidden = true
        case 5: titleTopic = "CCI".localize()
            viewCCI.isHidden = true
            viewCCISettings.isHidden = true
        case 6: titleTopic = "Close price".localize()
            viewClose.isHidden = true
        default: break
        }
        strategyCollectionView.reloadData()
    }

    @objc private func closePage() {
        viewMac.isHidden = true
        viewSummary.isHidden = true
        viewStochastic.isHidden = true
        viewBollinger.isHidden = true
        viewRSI.isHidden = true
        viewCCI.isHidden = true
        viewClose.isHidden = true
        viewMacSettings.isHidden = true
        viewStochasticSettings.isHidden = true
        viewBollingerSettings.isHidden = true
        viewRSISettings.isHidden = true
        viewCCISettings.isHidden = true
    }

    @objc private func didLeftBarButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        delegate?.updateStrategy(titleTopic)
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
            self.strategyCollectionView.insertRows(at: indexPathsForSection(), with: .fade)
        } else {
            self.hiddenSections.insert(section)
            self.strategyCollectionView.deleteRows(at: indexPathsForSection(), with: .fade)
        }
    }
}

// MARK: - Windows
extension StrategyController {
    private func configureCCISettings() {
        view.addSubview(viewCCISettings)
        viewCCISettings.addSubviews(CCITitleLabelSettings, CCISettingsClose, CCISettingsbgView1, CCISettingsBtnSave)
        CCISettingsbgView1.addSubviews(CCILabelSettings, purple5, CCIView1)
        CCIView1.addSubviews(lblCCIVal, minusCCI1, plusCCI1)

        CCISettingsBtnSave.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }

        CCISettingsbgView1.snp.makeConstraints { make in
            make.bottom.equalTo(CCISettingsBtnSave.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(CCILabelSettings.snp.top).offset(-13)
        }

        CCIView1.snp.makeConstraints { make in
            make.bottom.equalTo(CCISettingsbgView1.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblCCIVal.snp.makeConstraints { make in
            make.bottom.equalTo(CCIView1.snp.bottom).offset(-2)
            make.top.equalTo(CCIView1.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        CCILabelSettings.snp.makeConstraints { make in
            make.bottom.equalTo(CCIView1.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        purple5.snp.makeConstraints { make in
            make.centerY.equalTo(CCILabelSettings.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusCCI1.snp.makeConstraints { make in
            make.centerY.equalTo(CCIView1.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusCCI1.snp.makeConstraints { make in
            make.centerY.equalTo(CCIView1.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        CCISettingsClose.snp.makeConstraints { make in
            make.bottom.equalTo(CCISettingsbgView1.snp.top).offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        CCITitleLabelSettings.snp.makeConstraints { make in
            make.centerY.equalTo(CCISettingsClose.snp.centerY)
            make.centerX.equalToSuperview()
        }

        viewCCISettings.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(CCITitleLabelSettings.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureRSISettings() {
        view.addSubview(viewRSISettings)
        viewRSISettings.addSubviews(RSITitleLabelSettings, RSISettingsClose, RSISettingsbgView1, RSISettingsBtnSave)
        RSISettingsbgView1.addSubviews(RSILabelSettings, purple4, RSIView1)
        RSIView1.addSubviews(lblRSIVal, minusRSI1, plusRSI1)

        RSISettingsBtnSave.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }

        RSISettingsbgView1.snp.makeConstraints { make in
            make.bottom.equalTo(RSISettingsBtnSave.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(RSILabelSettings.snp.top).offset(-13)
        }

        RSIView1.snp.makeConstraints { make in
            make.bottom.equalTo(RSISettingsbgView1.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblRSIVal.snp.makeConstraints { make in
            make.bottom.equalTo(RSIView1.snp.bottom).offset(-2)
            make.top.equalTo(RSIView1.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        RSILabelSettings.snp.makeConstraints { make in
            make.bottom.equalTo(RSIView1.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        purple4.snp.makeConstraints { make in
            make.centerY.equalTo(RSILabelSettings.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusRSI1.snp.makeConstraints { make in
            make.centerY.equalTo(RSIView1.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusRSI1.snp.makeConstraints { make in
            make.centerY.equalTo(RSIView1.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        RSISettingsClose.snp.makeConstraints { make in
            make.bottom.equalTo(RSISettingsbgView1.snp.top).offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        RSITitleLabelSettings.snp.makeConstraints { make in
            make.centerY.equalTo(RSISettingsClose.snp.centerY)
            make.centerX.equalToSuperview()
        }

        viewRSISettings.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(RSITitleLabelSettings.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureBollingerSettings() {
        view.addSubview(viewBollingerSettings)
        viewBollingerSettings.addSubviews(bollingerTitleLabelSettings, bollingerSettingsClose, bollingerSettingsbgView1, bollingerSettingsbgView2, bollingerSettingsBtnSave)
        bollingerSettingsbgView1.addSubviews(standartLabel, red3, bollingerView1)
        bollingerView1.addSubviews(lblStandartVal, minusbollinger1, plusbollinger1)
        bollingerSettingsbgView2.addSubviews(SMALabel, blue3, bollingerView2)
        bollingerView2.addSubviews(lblbollingerVal2, minusbollinger2, plusbollinger2)

        bollingerSettingsBtnSave.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }

        bollingerSettingsbgView1.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerSettingsBtnSave.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(standartLabel.snp.top).offset(-13)
        }

        bollingerView1.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerSettingsbgView1.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblStandartVal.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerView1.snp.bottom).offset(-2)
            make.top.equalTo(bollingerView1.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        standartLabel.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerView1.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        red3.snp.makeConstraints { make in
            make.centerY.equalTo(standartLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusbollinger1.snp.makeConstraints { make in
            make.centerY.equalTo(bollingerView1.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusbollinger1.snp.makeConstraints { make in
            make.centerY.equalTo(bollingerView1.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        bollingerSettingsbgView2.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerSettingsbgView1.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(SMALabel.snp.top).offset(-13)
        }

        bollingerView2.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerSettingsbgView2.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblbollingerVal2.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerView2.snp.bottom).offset(-2)
            make.top.equalTo(bollingerView2.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        SMALabel.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerView2.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        blue3.snp.makeConstraints { make in
            make.centerY.equalTo(SMALabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusbollinger2.snp.makeConstraints { make in
            make.centerY.equalTo(bollingerView2.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusbollinger2.snp.makeConstraints { make in
            make.centerY.equalTo(bollingerView2.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        bollingerSettingsClose.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerSettingsbgView2.snp.top).offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        bollingerTitleLabelSettings.snp.makeConstraints { make in
            make.centerY.equalTo(bollingerSettingsClose.snp.centerY)
            make.centerX.equalToSuperview()
        }

        viewBollingerSettings.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(bollingerTitleLabelSettings.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureStochasticSettings() {
        view.addSubview(viewStochasticSettings)
        viewStochasticSettings.addSubviews(stochasticTitleLabelSettings, stochasticSettingsClose, stochasticSettingsbgView1, stochasticSettingsbgView2, stochasticSettingsbgView3, stochasticSettingsBtnSave)
        stochasticSettingsbgView1.addSubviews(mLabel, grey2, stochasticMView)
        stochasticMView.addSubviews(lblMVal, minusMStochastic, plusMStochastic)
        stochasticSettingsbgView2.addSubviews(dLabel, red2, stochasticDView)
        stochasticDView.addSubviews(lblDVal, minusDStochastic, plusDStochastic)
        stochasticSettingsbgView3.addSubviews(kLabel, blue2, stochasticKView)
        stochasticKView.addSubviews(lblKVal, minusKStochastic, plusKStochastic)

        stochasticSettingsBtnSave.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }

        stochasticSettingsbgView1.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticSettingsBtnSave.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(mLabel.snp.top).offset(-13)
        }

        stochasticMView.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticSettingsbgView1.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblMVal.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticMView.snp.bottom).offset(-2)
            make.top.equalTo(stochasticMView.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        mLabel.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticMView.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        grey2.snp.makeConstraints { make in
            make.centerY.equalTo(mLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusMStochastic.snp.makeConstraints { make in
            make.centerY.equalTo(stochasticMView.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusMStochastic.snp.makeConstraints { make in
            make.centerY.equalTo(stochasticMView.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        stochasticSettingsbgView2.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticSettingsbgView1.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(dLabel.snp.top).offset(-13)
        }

        stochasticDView.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticSettingsbgView2.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblDVal.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticDView.snp.bottom).offset(-2)
            make.top.equalTo(stochasticDView.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        dLabel.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticDView.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        red2.snp.makeConstraints { make in
            make.centerY.equalTo(dLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusDStochastic.snp.makeConstraints { make in
            make.centerY.equalTo(stochasticDView.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusDStochastic.snp.makeConstraints { make in
            make.centerY.equalTo(stochasticDView.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        stochasticSettingsbgView3.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticSettingsbgView2.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(kLabel.snp.top).offset(-13)
        }

        stochasticKView.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticSettingsbgView3.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblKVal.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticKView.snp.bottom).offset(-2)
            make.top.equalTo(stochasticKView.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        kLabel.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticKView.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        blue2.snp.makeConstraints { make in
            make.centerY.equalTo(kLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusKStochastic.snp.makeConstraints { make in
            make.centerY.equalTo(stochasticKView.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusKStochastic.snp.makeConstraints { make in
            make.centerY.equalTo(stochasticKView.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        stochasticSettingsClose.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticSettingsbgView3.snp.top).offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        stochasticTitleLabelSettings.snp.makeConstraints { make in
            make.centerY.equalTo(stochasticSettingsClose.snp.centerY)
            make.centerX.equalToSuperview()
        }

        viewStochasticSettings.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(stochasticTitleLabelSettings.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureMacSettings() {
        view.addSubview(viewMacSettings)
        viewMacSettings.addSubviews(macSettingsTitleLabel, macSettingsClose, macSettingsbgView1, macSettingsbgView2, macSettingsbgView3, macSettingsBtnSave)
        macSettingsbgView1.addSubviews(histigramLabel, blue1)
        macSettingsbgView2.addSubviews(signalLabel, red1, macSignalView)
        macSignalView.addSubviews(lblSignalVal, minusSignal, plusSignal)
        macSettingsbgView3.addSubviews(lineLabel, green1, macLineView1, macLineView2)
        macLineView1.addSubviews(minusLine1, plusLine1, lblLineVal1)
        macLineView2.addSubviews(minusLine2, plusLine2, lblLineVal2)

        macSettingsBtnSave.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }

        macSettingsbgView1.snp.makeConstraints { make in
            make.bottom.equalTo(macSettingsBtnSave.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        histigramLabel.snp.makeConstraints { make in
            make.bottom.top.equalToSuperview().inset(13)
            make.leading.equalToSuperview().offset(16)
        }

        blue1.snp.makeConstraints { make in
            make.centerY.equalTo(histigramLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        macSettingsbgView2.snp.makeConstraints { make in
            make.bottom.equalTo(macSettingsbgView1.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(signalLabel.snp.top).offset(-13)
        }

        macSignalView.snp.makeConstraints { make in
            make.bottom.equalTo(macSettingsbgView2.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblSignalVal.snp.makeConstraints { make in
            make.bottom.equalTo(macSignalView.snp.bottom).offset(-2)
            make.top.equalTo(macSignalView.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        signalLabel.snp.makeConstraints { make in
            make.bottom.equalTo(macSignalView.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        red1.snp.makeConstraints { make in
            make.centerY.equalTo(signalLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusSignal.snp.makeConstraints { make in
            make.centerY.equalTo(macSignalView.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusSignal.snp.makeConstraints { make in
            make.centerY.equalTo(macSignalView.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        macLineView1.snp.makeConstraints { make in
            make.bottom.equalTo(macSettingsbgView3.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblLineVal1.snp.makeConstraints { make in
            make.bottom.equalTo(macLineView1.snp.bottom).offset(-2)
            make.top.equalTo(macLineView1.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        macLineView2.snp.makeConstraints { make in
            make.bottom.equalTo(macLineView1.snp.top).offset(-12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(37)
        }

        lblLineVal2.snp.makeConstraints { make in
            make.bottom.equalTo(macLineView2.snp.bottom).offset(-2)
            make.top.equalTo(macLineView2.snp.top).offset(2)
            make.leading.trailing.equalToSuperview().inset(67)
        }

        lineLabel.snp.makeConstraints { make in
            make.bottom.equalTo(macLineView2.snp.top).offset(-11)
            make.leading.equalToSuperview().offset(16)
        }

        green1.snp.makeConstraints { make in
            make.centerY.equalTo(lineLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(20)
        }

        plusLine1.snp.makeConstraints { make in
            make.centerY.equalTo(macLineView1.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusLine1.snp.makeConstraints { make in
            make.centerY.equalTo(macLineView1.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        plusLine2.snp.makeConstraints { make in
            make.centerY.equalTo(macLineView2.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
            make.width.equalTo(30)
        }

        minusLine2.snp.makeConstraints { make in
            make.centerY.equalTo(macLineView2.snp.centerY)
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(30)
        }

        macSettingsbgView3.snp.makeConstraints { make in
            make.bottom.equalTo(macSettingsbgView2.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(lineLabel.snp.top).offset(-13)
        }

        macSettingsClose.snp.makeConstraints { make in
            make.bottom.equalTo(macSettingsbgView3.snp.top).offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        macSettingsTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(macSettingsClose.snp.centerY)
            make.centerX.equalToSuperview()
        }

        viewMacSettings.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(macSettingsTitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureCloseDetails() {
        view.addSubview(viewClose)
        viewClose.addSubviews(closetitleLabel, closecontentLabel, closeclose, closeBigimg, closeImg, lblclose, closenextBtn)
        closenextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        lblclose.snp.makeConstraints { make in
            make.bottom.equalTo(closenextBtn.snp.top).offset(-26)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        closeclose.snp.makeConstraints { make in
            make.top.equalTo(viewClose.snp.top).offset(20)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        closeImg.snp.makeConstraints { make in
            make.centerY.equalTo(closeclose.snp.centerY)
            make.bottom.equalTo(closeBigimg.snp.top).offset(-13)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }

        closeBigimg.snp.makeConstraints { make in
            make.bottom.equalTo(lblclose.snp.top).offset(-13)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(180)
        }

        closetitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(closeImg.snp.centerY).offset(-5)
            make.leading.equalTo(closeImg.snp.trailing).offset(12)
        }

        closecontentLabel.snp.makeConstraints { make in
            make.top.equalTo(closeImg.snp.centerY).offset(5)
            make.leading.equalTo(closeImg.snp.trailing).offset(12)
        }

        viewClose.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(closetitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureCCIDetails() {
        view.addSubview(viewCCI)
        viewCCI.addSubviews(CCItitleLabel, CCIcontentLabel, CCIclose, CCIBigimg, CCIImg, lblCCI, CCInextBtn)
        CCInextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        lblCCI.snp.makeConstraints { make in
            make.bottom.equalTo(CCInextBtn.snp.top).offset(-26)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        CCIclose.snp.makeConstraints { make in
            make.top.equalTo(viewCCI.snp.top).offset(20)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        CCIImg.snp.makeConstraints { make in
            make.centerY.equalTo(CCIclose.snp.centerY)
            make.bottom.equalTo(CCIBigimg.snp.top).offset(-13)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }

        CCIBigimg.snp.makeConstraints { make in
            make.bottom.equalTo(lblCCI.snp.top).offset(-13)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(250)
        }

        CCItitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(CCIImg.snp.centerY).offset(-5)
            make.leading.equalTo(CCIImg.snp.trailing).offset(12)
        }

        CCIcontentLabel.snp.makeConstraints { make in
            make.top.equalTo(CCIImg.snp.centerY).offset(5)
            make.leading.equalTo(CCIImg.snp.trailing).offset(12)
        }

        viewCCI.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(CCItitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureRSIDetails() {
        view.addSubview(viewRSI)
        viewRSI.addSubviews(RSItitleLabel, RSIcontentLabel, RSIclose, RSIBigimg, RSIImg, lblRSI, RSInextBtn)
        RSInextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        lblRSI.snp.makeConstraints { make in
            make.bottom.equalTo(RSInextBtn.snp.top).offset(-26)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        RSIclose.snp.makeConstraints { make in
            make.top.equalTo(viewRSI.snp.top).offset(20)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        RSIImg.snp.makeConstraints { make in
            make.centerY.equalTo(RSIclose.snp.centerY)
            make.bottom.equalTo(RSIBigimg.snp.top).offset(-13)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }

        RSIBigimg.snp.makeConstraints { make in
            make.bottom.equalTo(lblRSI.snp.top).offset(-13)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(250)
        }

        RSItitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(RSIImg.snp.centerY).offset(-5)
            make.leading.equalTo(RSIImg.snp.trailing).offset(12)
        }

        RSIcontentLabel.snp.makeConstraints { make in
            make.top.equalTo(RSIImg.snp.centerY).offset(5)
            make.leading.equalTo(RSIImg.snp.trailing).offset(12)
        }

        viewRSI.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(RSItitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureBollingerDetails() {
        view.addSubview(viewBollinger)
        viewBollinger.addSubviews(bollingertitleLabel, bollingercontentLabel, bollingerclose, bollingerBigimg, bollingerImg, lblbollinger, bollingernextBtn)
        bollingernextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        lblbollinger.snp.makeConstraints { make in
            make.bottom.equalTo(bollingernextBtn.snp.top).offset(-26)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        bollingerclose.snp.makeConstraints { make in
            make.top.equalTo(viewBollinger.snp.top).offset(20)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        bollingerImg.snp.makeConstraints { make in
            make.centerY.equalTo(bollingerclose.snp.centerY)
            make.bottom.equalTo(bollingerBigimg.snp.top).offset(-13)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }

        bollingerBigimg.snp.makeConstraints { make in
            make.bottom.equalTo(lblbollinger.snp.top).offset(-13)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(250)
        }

        bollingertitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(bollingerImg.snp.centerY).offset(-5)
            make.leading.equalTo(bollingerImg.snp.trailing).offset(12)
        }

        bollingercontentLabel.snp.makeConstraints { make in
            make.top.equalTo(bollingerImg.snp.centerY).offset(5)
            make.leading.equalTo(bollingerImg.snp.trailing).offset(12)
        }

        viewBollinger.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(bollingertitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureStochasticDetails() {
        view.addSubview(viewStochastic)
        viewStochastic.addSubviews(stochastictitleLabel, stochasticcontentLabel, stochasticclose, stochasticBigImg, stochasticImg, lblStochastic, stochasticNextBtn)
        stochasticNextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        lblStochastic.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticNextBtn.snp.top).offset(-26)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        stochasticclose.snp.makeConstraints { make in
            make.top.equalTo(viewStochastic.snp.top).offset(20)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        stochasticImg.snp.makeConstraints { make in
            make.centerY.equalTo(stochasticclose.snp.centerY)
            make.bottom.equalTo(stochasticBigImg.snp.top).offset(-13)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }

        stochasticBigImg.snp.makeConstraints { make in
            make.bottom.equalTo(lblStochastic.snp.top).offset(-13)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(250)
        }

        stochastictitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(stochasticImg.snp.centerY).offset(-5)
            make.leading.equalTo(stochasticImg.snp.trailing).offset(12)
        }

        stochasticcontentLabel.snp.makeConstraints { make in
            make.top.equalTo(stochasticImg.snp.centerY).offset(5)
            make.leading.equalTo(stochasticImg.snp.trailing).offset(12)
        }

        viewStochastic.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(stochastictitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureSummaryDetails() {
        view.addSubview(viewSummary)
        viewSummary.addSubviews(summaryTitleLabel, summaryContentLabel, summaryClose, summaryImg, lblSummary, bgViewSummary, summaryNextBtn, summaryBigImg)
        bgViewSummary.addSubviews(bgTitle1, bgTitle2, bgContent1, bgContent2)
        summaryNextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(45)
        }

        bgViewSummary.snp.makeConstraints { make in
            make.bottom.equalTo(summaryNextBtn.snp.top).offset(-6)
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(bgTitle1.snp.top).offset(-13)
        }

        bgContent2.snp.makeConstraints { make in
            make.bottom.equalTo(bgViewSummary.snp.bottom).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        bgTitle2.snp.makeConstraints { make in
            make.bottom.equalTo(bgContent2.snp.top).offset(-2)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        bgContent1.snp.makeConstraints { make in
            make.bottom.equalTo(bgTitle2.snp.top).offset(-10)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        bgTitle1.snp.makeConstraints { make in
            make.bottom.equalTo(bgContent1.snp.top).offset(-2)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        lblSummary.snp.makeConstraints { make in
            make.bottom.equalTo(bgViewSummary.snp.top).offset(-13)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        summaryClose.snp.makeConstraints { make in
            make.top.equalTo(viewSummary.snp.top).offset(20)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        summaryImg.snp.makeConstraints { make in
            make.centerY.equalTo(summaryClose.snp.centerY)
            make.bottom.equalTo(summaryBigImg.snp.top).offset(-13)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }

        summaryBigImg.snp.makeConstraints { make in
            make.bottom.equalTo(lblSummary.snp.top).offset(-13)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(260)
        }

        summaryTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(summaryImg.snp.centerY).offset(-5)
            make.leading.equalTo(summaryImg.snp.trailing).offset(12)
        }

        summaryContentLabel.snp.makeConstraints { make in
            make.top.equalTo(summaryImg.snp.centerY).offset(5)
            make.leading.equalTo(summaryImg.snp.trailing).offset(12)
        }

        viewSummary.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(summaryTitleLabel.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func configureMacDetails() {
        view.addSubview(viewMac)
        viewMac.addSubviews(titleLabelMac, contentLabel, close, img, signalImg, lblIndicators, nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        lblIndicators.snp.makeConstraints { make in
            make.bottom.equalTo(nextBtn.snp.top).offset(-26)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        close.snp.makeConstraints { make in
            make.top.equalTo(viewMac.snp.top).offset(20)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(24)
        }

        signalImg.snp.makeConstraints { make in
            make.centerY.equalTo(close.snp.centerY)
            make.bottom.equalTo(img.snp.top).offset(-13)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }

        img.snp.makeConstraints { make in
            make.bottom.equalTo(lblIndicators.snp.top).offset(-13)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(250)
        }

        titleLabelMac.snp.makeConstraints { make in
            make.bottom.equalTo(signalImg.snp.centerY).offset(-5)
            make.leading.equalTo(signalImg.snp.trailing).offset(12)
        }

        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(signalImg.snp.centerY).offset(5)
            make.leading.equalTo(signalImg.snp.trailing).offset(12)
        }

        viewMac.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.top.equalTo(titleLabelMac.snp.top).offset(-16)
            make.leading.trailing.equalToSuperview()
        }
    }
}
