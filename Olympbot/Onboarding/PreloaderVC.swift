import Lottie
import SnapKit
import UIKit

class VCLoad: UIViewController {
    private var clock = Timer()
    private var lottie = LottieAnimationView(name: "1 preloader")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.08, green: 0.11, blue: 0.16, alpha: 1)
        
        view.addSubview(lottie)
        lottie.translatesAutoresizingMaskIntoConstraints = false
        lottie.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lottie.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lottie.heightAnchor.constraint(equalToConstant: 133).isActive = true
        lottie.widthAnchor.constraint(equalToConstant: 133).isActive = true

        lottie.play()
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(followVC), userInfo: nil, repeats: false)
    }
}

extension VCLoad {
    @objc private func followVC() {
        if UserData.showedOnboarding {
            let vc = TabBarController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        } else {
            UserDefaults.standard.set(true, forKey: UserData.SettingsKeys.showedOnboarding.rawValue)
            let vc = Onboarding1()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
}
