import UIKit

struct StrategyModel: Codable {
    var title: String
    var img: UIImage?
    var description: String
    var cheImg: UIImage?
    var isComplete: Bool
    var num: Int

    private enum CodingKeys: String, CodingKey {
        case title
        case img
        case description
        case cheImg
        case isComplete
        case num
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        if let textIcon = try container.decodeIfPresent(String.self, forKey: .img) {
            if let data = Data(base64Encoded: textIcon) {
                img = UIImage(data: data)!
            }
        }
        if let textIcon = try container.decodeIfPresent(String.self, forKey: .cheImg) {
            if let data = Data(base64Encoded: textIcon) {
                cheImg = UIImage(data: data)!
            }
        }
        description = try container.decode(String.self, forKey: .description)
        isComplete = try container.decode(Bool.self, forKey: .isComplete)
        num = try container.decode(Int.self, forKey: .num)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        if let img = img, let data = img.pngData() {
            try container.encode(data, forKey: .img)
        }
        try container.encode(description, forKey: .description)
        if let img = cheImg, let data = img.pngData() {
            try container.encode(data, forKey: .cheImg)
        }
        try container.encode(isComplete, forKey: .isComplete)
        try container.encode(num, forKey: .num)
    }

    init(title: String, img: UIImage?, check: UIImage?, description: String, isWaiting: Bool, num: Int) {
        self.title = title
        self.img = img
        self.cheImg = check
        self.description = description
        self.isComplete = isWaiting
        self.num = num
    }
}
