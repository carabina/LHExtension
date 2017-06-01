
import Foundation
import UIKit

func Font(_ fontSize:CGFloat) -> UIFont {
    let font = UIFont.systemFont(ofSize: fontSize)
    return font
}

func Font(_ fontName:String,_ fontSize:CGFloat) -> UIFont{
    let font = UIFont(name: fontName, size: fontSize)
    
    guard let fnt = font else {
        assertionFailure("font is nil")
        return Font(17)
    }
    return fnt
}

extension UIFont{
    
}
