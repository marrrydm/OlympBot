import UIKit

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

class PaddingLabel: UILabel {
   @IBInspectable var topInset: CGFloat = 4.0
   @IBInspectable var bottomInset: CGFloat = 4.0
   @IBInspectable var leftInset: CGFloat = 6.0
   @IBInspectable var rightInset: CGFloat = 6.0

   override func drawText(in rect: CGRect) {
      let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
       super.drawText(in: rect.inset(by: insets))
   }

   override var intrinsicContentSize: CGSize {
      get {
         var contentSize = super.intrinsicContentSize
         contentSize.height += topInset + bottomInset
         contentSize.width += leftInset + rightInset
         return contentSize
      }
   }
}
