

import Foundation
import UIKit


protocol UIViewable {
    
}

extension UIView:UIViewable{
    
    func frame(_ frame:CGRect) -> UIView {
        self.frame = frame;
        return self
    }
    
    func bounds(_ bounds:CGRect) -> UIView {
        self.bounds = bounds;
        return self
    }
    
    func bgColor(_ color:UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }
    
    func alpha(_ alpha:CGFloat) -> UIView {
        self.alpha = alpha
        return self
    }
    
    func opaque(_ opaque:Bool) -> UIView {
        self.isOpaque = opaque
        return self
    }
    
    func tintColor(_ tintColor:UIColor) -> UIView {
        self.tintColor = tintColor
        return self
    }
    
    func tintAdMode(_ tintAdjustmentMode:UIViewTintAdjustmentMode) -> UIView {
        self.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    
    func clipToBounds(_ clipToBounds:Bool) -> UIView {
        self.clipsToBounds = clipToBounds
        return self
    }
    
    func clearContextBeforDraw(_ clearContextBeforDraw:Bool ) -> UIView {
        self.clearsContextBeforeDrawing = clearContextBeforDraw
        return self
    }
    
    func mask(_ mask:UIView?) -> UIView {
        self.mask = mask
        return self
    }
    
    func border(_ width:CGFloat,_ color:UIColor) -> UIView {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        return self
    }
    
    func conerRadius(_ radius:CGFloat) -> UIView {
        self.layer.cornerRadius = radius
        return self
    }
    
    func shadow(_ offset:CGFloat) -> UIView {
        self.layer.shadowOffset = CGSize(width: offset, height: offset)
        return self
    }
    
     func shadow(with offset: CGSize) -> UIView {
        self.layer.shadowOffset = offset
        return self
    }
    
    func shadowColor(_ color:UIColor) -> UIView {
        self.layer.shadowColor = color.cgColor
        return self
    }
    
    func shadowRadius(_ radius:CGFloat) -> UIView {
        self.layer.shadowRadius = radius
        return self
    }
    
    func shadowOpacity(_ opacity:Float) -> UIView {
        self.layer.shadowOpacity = opacity
        return self
    }
    
    func shadowPath(_ path:UIBezierPath) -> UIView {
        self.layer.shadowPath = path.cgPath
        return self
    }
    
    
//MARK:Configuring the Event-Related Behavior
    func userEnabled(_ userEnabled:Bool) -> UIView {
        self.isUserInteractionEnabled = userEnabled
        return self
    }
    
    func multipleTouchEnabled(_ multipleTouchEnabled:Bool) -> UIView {
        self.isMultipleTouchEnabled = multipleTouchEnabled
        return self
    }
    
    func exclusiveTouch(_ exclusiveTouch:Bool) -> UIView {
        self.isExclusiveTouch = exclusiveTouch
        return self
    }
    
//MARK:Configuring the Bounds and Frame Rectangles
    
    func center(_ center:CGPoint) -> UIView {
        self.center = center
        return self
    }
    
    func transform(_ transform:CGAffineTransform) -> UIView {
        self.transform = transform
        return self
    }
    
//MARK:Managing the View Hierarchy
    
    func addToView(_ view:UIView) -> UIView {
        view.addSubview(self)
        return self
    }
    
    func addSubView(_ subview:UIView) -> UIView {
        self.addSubview(subview)
        return self
    }
    
    
    func bringSubview(_ tofront:UIView) -> UIView {
        self.bringSubview(toFront: tofront)
        return self
    }
    
    func sendSubview(_ toback:UIView) -> UIView {
        self.sendSubview(toBack: toback)
        return self
    }
    
    func insertSubview(_ subview:UIView,_ at:Int) -> UIView {
        self.insertSubview(subview, at: at)
        return self
    }
    
    func insertSubView(_ subview:UIView,_ aboveSubview:UIView) -> UIView {
        self.insertSubview(subview, aboveSubview: aboveSubview)
        return self
    }
    
    func exchangeSubview(_ at:Int,_ subviewAt:Int) -> UIView {
        self.exchangeSubview(at: at, withSubviewAt: subviewAt)
        return self
    }
    
//MARK:Configuring the Resizing Behavior
    func autoresizingMask(_ autoresizingMask:UIViewAutoresizing) -> UIView {
        self.autoresizingMask = autoresizingMask
        return self
    }
    
    func autoresizesSubviews(_ autoresizesSubviews: Bool) -> UIView {
        self.autoresizesSubviews = autoresizesSubviews
        return self
    }
   
    func contenMode(_ contentMode:UIViewContentMode) -> UIView {
        self.contentMode = contentMode
        return self
    }
    
    func sizeTofit() -> UIView {
        self.sizeToFit()
        return self
    }
    
//MARK:Laying out Subviews
    
    func translateAutoMaskIntoCons(_ translateAutoMaskIntoCons:Bool) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = translateAutoMaskIntoCons
        return self
    }
    
    func addConst(_ constraint:NSLayoutConstraint) -> UIView {
        self.addConstraint(constraint)
        return self
    }
    
//MARK:Managing Gesture Recognizers
    typealias  ontapCloser = () -> ()
    
    var tapCloser : ontapCloser? {
        get{
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "ViewTap".hashValue)
            return objc_getAssociatedObject(self, key) as? ontapCloser
        }
        
        set{
            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "ViewTap".hashValue)
            objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    func tap(_ tapcloser: @escaping ontapCloser) -> UIView {
        
        tapCloser = tapcloser
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(onTap(_:)))
        self.addGestureRecognizer(tapGesture)
        return self
    }
    
@objc fileprivate  func onTap(_ tap: UITapGestureRecognizer) {
        tapCloser!()
    }
    
    
    
}






