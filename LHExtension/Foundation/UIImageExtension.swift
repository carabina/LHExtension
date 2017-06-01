
import Foundation
import UIKit

extension UIImage{
    
 convenience init(color:UIColor,size:CGSize = CGSize(width: 1, height: 1)) {
        self.init(cgImage: createImageWithColor(color: color,size:size).cgImage!)
    }
    
 convenience init(view:UIView,size:CGSize = CGSize(width: 1, height: 1)) {
        self.init(cgImage: creatImageWithUIView(view: view, size: size).cgImage!)
    }
}

fileprivate func createImageWithColor(color:UIColor,size:CGSize = CGSize(width: 1, height: 1)) ->UIImage{
    let rect = CGRect(origin: CGPoint.zero, size: size)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}

fileprivate func creatImageWithUIView(view:UIView,size:CGSize) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, false, 2)
    view.draw(CGRect(origin: CGPoint.zero, size: size))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
