import AppTrackingTransparency
import AppsFlyerLib
import FirebaseAnalytics
import Lottie
import OneSignal
import StoreKit
import UIKit
 
class Onboarding1: UIViewController {
    private let labelTitle = UILabel()
    private let contentLabel = UILabel()
    private var imgView = LottieAnimationView(name: "experience")
    private var imgView2 = LottieAnimationView(name: "3 auto-trading")
    private var imgView3 = LottieAnimationView(name: "4 signal")
    private var imgView4 = LottieAnimationView(name: "5 Free of charge")
    private var imgView5 = LottieAnimationView(name: "6 comments")
    private var imgView6 = LottieAnimationView(name: "7 notification")
    private let imgControl = UIImageView(image: UIImage(named: "control1"))
    private let nextButton = UIButton()
    private var count = 0
    private let arrayData = [
        OnboardingModel(title: "onb1.title".localize(), description: "onb1.content".localize(), imgProgress: UIImage(named: "control1")!, lottie: LottieAnimationView(name: "experience")),
        OnboardingModel(title: "onb2.title".localize(), description: "onb2.content".localize(), imgProgress: UIImage(named: "control2")!, lottie: LottieAnimationView(name: "3 auto-trading")),
        OnboardingModel(title: "onb3.title".localize(), description: "onb3.content".localize(), imgProgress: UIImage(named: "control3")!, lottie: LottieAnimationView(name: "4 signal")),
        OnboardingModel(title: "onb4.title".localize(), description: "onb4.content".localize(), imgProgress: UIImage(named: "control4")!, lottie: LottieAnimationView(name: "5 Free of charge")),
        OnboardingModel(title: "onb5.title".localize(), description: "onb5.content".localize(), imgProgress: UIImage(named: "control5")!, lottie: LottieAnimationView(name: "6 comments")),
        OnboardingModel(title: "onb6.title".localize(), description: "onb6.content".localize(), imgProgress: UIImage(named: "control6")!, lottie: LottieAnimationView(name: "7 notification"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.08, green: 0.11, blue: 0.16, alpha: 1)
        configureButtonNext()
        viewContent()
        configureImg()
        imgView.play()

        let random = Int.random(in: 100000...999999)
        UserDefaults.standard.set(random, forKey: UserData.SettingsKeys.userId.rawValue)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppsFlyerLib.shared().logEvent("onboarding_start", withValues: nil)
        Analytics.logEvent("onboarding_start", parameters: nil)
    }

    private func viewContent() {
        view.addSubview(labelTitle)
        view.addSubview(contentLabel)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false

        labelTitle.textColor = UIColor(red: 0.918, green: 0.933, blue: 0.925, alpha: 1)
        labelTitle.text = arrayData[count].title
        labelTitle.font = .systemFont(ofSize: 20, weight: .bold)
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = .center
        labelTitle.lineBreakMode = .byWordWrapping
        labelTitle.backgroundColor = .clear

        contentLabel.bottomAnchor.constraint(equalTo: imgControl.topAnchor, constant: -25).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true

        labelTitle.bottomAnchor.constraint(equalTo: contentLabel.topAnchor, constant: -2).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true

        contentLabel.backgroundColor = .clear
        contentLabel.text = arrayData[count].description
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
        
        view.addSubview(imgControl)
        imgControl.translatesAutoresizingMaskIntoConstraints = false
        imgControl.image = arrayData[count].imgProgress
        imgControl.contentMode = .scaleAspectFit

        imgControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -45).isActive = true
        imgControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imgControl.heightAnchor.constraint(equalToConstant: 10).isActive = true
        imgControl.widthAnchor.constraint(equalToConstant: 83).isActive = true
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

extension Onboarding1 {
    @objc private func tapButtonNext(sender: UITapGestureRecognizer) {
        
        if count == 0 {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    print("The user has granted access.")
                case .denied, .restricted:
                    print("The user has denied access.")
                case .notDetermined:
                    print("The user has not yet received an authorization request.")
                @unknown default:
                    break
                }
            }
        }
        
        if count == 4 {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
        
        if count == 5 {
            OneSignal.promptForPushNotifications(userResponse: { accepted in
                
            })
        }
        
        count += 1
        if count < 6 {
            labelTitle.text = arrayData[count].title
            contentLabel.text = arrayData[count].description
            imgControl.image = arrayData[count].imgProgress
            switch count {
            case 1:
                view.addSubview(imgView2)
                imgView2.contentMode = .scaleAspectFit
                imgView2.translatesAutoresizingMaskIntoConstraints = false
                imgView2.bottomAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -100).isActive = true
                imgView2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
                imgView2.heightAnchor.constraint(equalToConstant: 200).isActive = true
                imgView2.widthAnchor.constraint(equalToConstant: 200).isActive = true
                imgView.isHidden = true
                imgView2.play()
            case 2:
                view.addSubview(imgView3)
                imgView3.contentMode = .scaleAspectFit
                imgView3.translatesAutoresizingMaskIntoConstraints = false
                imgView3.bottomAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -100).isActive = true
                imgView3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
                imgView3.heightAnchor.constraint(equalToConstant: 200).isActive = true
                imgView3.widthAnchor.constraint(equalToConstant: 200).isActive = true
                imgView2.isHidden = true
                imgView3.play()
            case 3:
                view.addSubview(imgView4)
                imgView4.contentMode = .scaleAspectFit
                imgView4.translatesAutoresizingMaskIntoConstraints = false
                imgView4.bottomAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -100).isActive = true
                imgView4.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
                imgView4.heightAnchor.constraint(equalToConstant: 200).isActive = true
                imgView4.widthAnchor.constraint(equalToConstant: 200).isActive = true
                imgView3.isHidden = true
                imgView4.play()
            case 4:
                view.addSubview(imgView5)
                imgView5.contentMode = .scaleAspectFit
                imgView5.translatesAutoresizingMaskIntoConstraints = false
                imgView5.bottomAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -50).isActive = true
                imgView5.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                imgView5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
                imgView5.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
                imgView4.isHidden = true
                imgView5.play()
            case 5:
                view.addSubview(imgView6)
                imgView6.contentMode = .scaleAspectFit
                imgView6.translatesAutoresizingMaskIntoConstraints = false
                imgView6.bottomAnchor.constraint(equalTo: labelTitle.topAnchor, constant: -100).isActive = true
                imgView6.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
                imgView6.heightAnchor.constraint(equalToConstant: 200).isActive = true
                imgView6.widthAnchor.constraint(equalToConstant: 200).isActive = true
                imgView5.isHidden = true
                imgView6.play()
            default: break
            }
        } else {
            AppsFlyerLib.shared().logEvent("onboarding_finish", withValues: nil)
            Analytics.logEvent("onboarding_finish", parameters: nil)
            let vc =  TabBarController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
}
