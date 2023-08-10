import Lottie
import UIKit

struct OnboardingModel {
    var title: String
    var description: String
    var imgProgress: UIImage
    var lottie: LottieAnimationView


    init(title: String, description: String, imgProgress: UIImage, lottie: LottieAnimationView) {
        self.title = title
        self.description = description
        self.imgProgress = imgProgress
        self.lottie = lottie
    }
}
