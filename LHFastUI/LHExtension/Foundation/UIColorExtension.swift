

import Foundation
import UIKit

func Color(_ hexString:String,_ alpha:CGFloat = 1.0) -> UIColor {
    let color = colorWithHexString(hexString,alpha)
    return color
}

func RandomColor(_ alpha: Float = 1.0) -> UIColor {
    
    let r = arc4random() % 256
    let g = arc4random() % 256
    let b = arc4random() % 256
    
    let color = UIColor(colorLiteralRed: Float(Double(r) / 255.0), green: Float(Double(g) / 255.0), blue: Float(Double(b) / 255.0), alpha: alpha)
    
    return color
}

extension UIColor{
    
    class func color(from hexString:String,_ alpha:CGFloat = 1.0) -> UIColor{
        let color = colorWithHexString(hexString,alpha)
        return color
    }
    
    class func randomColor(_ alpha: Float = 1.0) -> UIColor{
        return RandomColor(alpha)
    }
}

extension UIColor{
    
    convenience init(hex:String,_ alpha:CGFloat = 1.0) {
        self.init(cgColor: colorWithHexString(hex, alpha).cgColor)
    }
}

fileprivate func colorWithHexString (_ hex:String,_ alpha:CGFloat) -> UIColor {
    
    var cString:String = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substring(from: 1)
    }
    
    if (cString.characters.count != 6) {
        return UIColor.gray
    }
    
    let rString = (cString as NSString).substring(to: 2)
    let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
    let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
}

fileprivate func rgbToHex(_ r:Int,g:Int,b:Int)->String{
    
    let  R = NSString(format: "%x",r)
    let G = NSString(format: "%x",g)
    let  B = NSString(format: "%x",b)
    let str = "#\(R)" + "\(G)" + "\(B)"
    return  str as NSString as String
}


