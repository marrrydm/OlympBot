import UIKit

struct LearningInfo {
    var text: String
    var image: [UIImage?]
    var id: Int
}

struct LearningModel {
    var topic : String
    var text: LearningInfo

    init(topic : String, text: LearningInfo) {
        self.topic = topic
        self.text = text
    }
}

