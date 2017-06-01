

import Foundation
import UIKit

extension UILabel{
    func text(_ text:String) -> UILabel {
        self.text = text
        return self
    }
    
    func attriText(_ attiText:NSAttributedString) -> UILabel {
        self.attributedText = attiText
        return self
    }
    
    func textColor(_ color:UIColor) -> UILabel {
        self.textColor = color
        return self
    }
    
    func font(_ font:UIFont) -> UILabel {
        self.font = font
        return self
    }
    
    func font(fontSize:CGFloat) -> UILabel {
        self.font = Font(fontSize)
        return self
    }
    
    func textAlign(_ textAlign:NSTextAlignment) -> UILabel {
        self.textAlignment = textAlign
        return self
    }
    
    func lineBreakMode(_ lineBreakMode:NSLineBreakMode) -> UILabel {
        self.lineBreakMode = lineBreakMode
        return self
    }
    
    func isEnabled(_ isEnavled:Bool) -> UILabel {
        self.isEnabled = isEnavled
        return self
    }
    
    
//MARK:Sizing the Label’s Text
    
    func adjustFitWith(_ adjustFitWith:Bool) -> UILabel {
        self.adjustsFontSizeToFitWidth = adjustFitWith
        return self
    }
    
    func allowDefaultTighteningForTruncation(_ allow:Bool) -> UILabel {
        self.allowsDefaultTighteningForTruncation = allow
        return self
    }
    
    func baselineAdjust(_ baselineAdjust:UIBaselineAdjustment) -> UILabel {
        self.baselineAdjustment = baselineAdjust
        return self
    }
    
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> UILabel {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    func numberOfLines(_ numberOflines:Int) -> UILabel {
        self.numberOfLines = numberOflines
        return self
    }
    
//MARK:Managing Highlight Values
    
    func highLightedTextColor(_ color:UIColor) -> UILabel {
        self.highlightedTextColor = color
        return self
    }
    
    func highLighted(_ highlighted:Bool) -> UILabel {
        self.isHighlighted = highlighted
        return self
    }
    
//MARK:Drawing a Shadow
    
    override func shadowColor(_ color:UIColor) -> UILabel {
        self.shadowColor = color
        return self
    }
    
    func shadowOffset(_ offset:CGSize) -> UILabel {
        self.shadowOffset = offset
        return self
    }
    
    func isUserInteractionEnabled(_ userEnabled:Bool) -> UILabel {
        self.isUserInteractionEnabled = userEnabled
        return self
    }
    
    func preferredMaxLayoutWith(_ width:CGFloat) -> UILabel {
        self.preferredMaxLayoutWidth = width
        return self
    }
    
    
    
    
}
