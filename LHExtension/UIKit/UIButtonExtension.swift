
import Foundation
import UIKit

extension UIButton{

//MARK:Configuring the Button Title
    
    func title(_ title:String,_ state:UIControlState = .normal) -> UIButton {
        self.setTitle(title, for: state)
        return self
    }
    
    func attriTitle(_ attri:NSAttributedString,_ state: UIControlState = .normal) -> UIButton {
        self.setAttributedTitle(attri, for: state)
        return self
    }
    
    func titleColor(_ color:UIColor,_ state:UIControlState = .normal) -> UIButton {
        self.setTitleColor(color, for: state)
        return self
    }
    
    func titleShadowColor(_ color:UIColor,_ state: UIControlState) -> UIButton {
        self.setTitleShadowColor(color, for: state)
        return self
    }
    
    func reverseTitleShadowWhenHighlighted(_ highlighted:Bool) -> UIButton {
        self.reversesTitleShadowWhenHighlighted = highlighted
        return self
    }
    
    
//MARK:Configuring Button Presentation
    
    func adjustImageWhenHighlighted(_ highlighted:Bool) -> UIButton {
        self.adjustsImageWhenHighlighted = highlighted
        return self
    }
    
    func adjustImageWhenDisabled(_ disable:Bool) -> UIButton {
        self.adjustsImageWhenHighlighted = disable
        return self
    }
    
    func showsTouchWhenHighlighted(_ showTouch:Bool) -> UIButton {
        self.showsTouchWhenHighlighted = showTouch
        return self
    }
    
    func backGroundImage(_ image:UIImage,_ state:UIControlState = .normal) -> UIButton {
        self.setBackgroundImage(image, for: state)
        return self
    }
    
    func image(_ image:UIImage,_ state:UIControlState = .normal) -> UIButton {
        self.setImage(image, for: state)
        return self
    }
    
    override func tintColor(_ color:UIColor) -> UIButton {
        self.tintColor = color
        return self
    }
    
//MARK:Configuring Edge Insets
    
    func contentEdgeInsets(_ edgeInsets:UIEdgeInsets) -> UIButton {
        self.contentEdgeInsets = edgeInsets
        return self
    }
    
    func titleEdgeInsets(_ edgeInsets:UIEdgeInsets) -> UIButton {
        self.titleEdgeInsets = edgeInsets
        return self
    }
    
    func imageEdgeInsets(_ edgeInsets:UIEdgeInsets) -> UIButton {
        self.imageEdgeInsets = edgeInsets
        return self
    }
}


typealias  clickCloser = (UIButton) -> ()

let TOUCH_UP_INSIDE = "touUpInside"
let TOUCH_UP_OUTSIDE = "touchUpOutside"
let TOUCH_DOWN = "touchDown"
let TOUCH_DOWN_REPEAT = "touchDownRepeat"
let TOUCH_DRAG_INSIDE = "touchDragInside"
let TOUCH_DRAG_OUTSIDE = "touchDragOutside"
let TOUCH_DRAG_ENTER = "touchDragEnter"
let TOUCH_DRAG_EXIT = "touchDragExit"
let TOUCH_CANCEL = "touchCancel"
let ALL_TOUCH_EVENTS = "allTouchEvents"
let ALL_EVENTS = "allEvents"

fileprivate func setAssociated(_ key:String) -> clickCloser?{
    let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: key.hashValue)
    return objc_getAssociatedObject(UIButton.self, key) as? clickCloser
}

fileprivate func getAssociated(_ key:String,_ value:Any!){
    let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: key.hashValue)
    objc_setAssociatedObject(UIButton.self, key, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
}

extension UIButton {
    
    override func tap(_ tapcloser: @escaping UIView.ontapCloser) -> UIView {
        return self
    }
    
    var touUpInside : clickCloser? {
        get{
            return setAssociated(TOUCH_UP_INSIDE)
        }
        set{
            getAssociated(TOUCH_UP_INSIDE, newValue)
        }
    }
    
    var touchDownRepeat : clickCloser? {
        get{
            return setAssociated(TOUCH_DOWN_REPEAT)
        }
        set{
            getAssociated(TOUCH_DOWN_REPEAT, newValue)
        }
    }
    
    var touchDragOutside : clickCloser? {
        get{
            return setAssociated(TOUCH_UP_OUTSIDE)
        }
        set{
            getAssociated(TOUCH_UP_OUTSIDE, newValue)
        }
    }
    
    var touchDragEnter : clickCloser? {
        get{
            return setAssociated(TOUCH_DRAG_ENTER)
        }
        set{
            getAssociated(TOUCH_DRAG_ENTER, newValue)
        }
    }
    
    var touchDragExit : clickCloser? {
        get{
            return setAssociated(TOUCH_DRAG_EXIT)
        }
        set{
            getAssociated(TOUCH_DRAG_EXIT, newValue)
        }
    }
    
    var touchUpOutside : clickCloser? {
        get{
            return setAssociated(TOUCH_UP_OUTSIDE)
        }
        set{
            getAssociated(TOUCH_UP_OUTSIDE, newValue)
        }
    }
    
    var touchCancel : clickCloser? {
        get{
            return setAssociated(TOUCH_CANCEL)
        }
        set{
            getAssociated(TOUCH_CANCEL, newValue)
        }
    }
    
    var touchDragInside : clickCloser? {
        get{
            return setAssociated(TOUCH_DRAG_INSIDE)
        }
        set{
            getAssociated(TOUCH_DRAG_INSIDE, newValue)
        }
    }
    
    var touchDown : clickCloser? {
        get{
            return setAssociated(TOUCH_DOWN)
        }
        set{
            getAssociated(TOUCH_DOWN, newValue)
        }
    }
    
    func addAction(_ state: UIControlEvents = .touchUpInside,_ closer: @escaping clickCloser) -> UIButton {
        routerTouchEvent(state, closer)
        return self
    }
    
//MARK:target action
    @objc fileprivate func touchupInside(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touUpInside!(weakSelf!)
    }
    
    @objc fileprivate func touchUpOutside(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touchUpOutside!(weakSelf!)
    }
    
    @objc fileprivate func touchdown(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touchDown!(weakSelf!)
    }

    @objc fileprivate func touchDownRepeat(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touchDownRepeat!(weakSelf!)
    }
    
    @objc fileprivate func touchCancel(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touchCancel!(weakSelf!)
    }

    @objc fileprivate func touchDragEnter(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touchDragEnter!(weakSelf!)
    }

    @objc fileprivate func touchDragExit(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touchDragExit!(weakSelf!)
    }

    @objc fileprivate func touchDragInside(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touchDragInside!(weakSelf!)
    }

    @objc fileprivate func touchDragOutside(_ state:UIControlEvents)  {
        weak var weakSelf = self
        touchDragOutside!(weakSelf!)
    }

    
    fileprivate func routerTouchEvent(_ state:UIControlEvents, _ closer:@escaping clickCloser){
        
        switch state {
        case UIControlEvents.touchUpInside:
            touUpInside = closer
            self.addTarget(self, action: #selector(touchupInside(_:)), for: state)
        case UIControlEvents.touchUpOutside:
            touchUpOutside = closer
            self.addTarget(self, action: #selector(touchUpOutside(_:)), for: state)
        case UIControlEvents.touchDown:
            touchDown = closer
            self.addTarget(self, action: #selector(touchdown(_:)), for: state)
        case UIControlEvents.touchDownRepeat:
            touchDownRepeat = closer
            self.addTarget(self, action: #selector(touchDownRepeat(_:)), for: state)
        case UIControlEvents.touchCancel:
            touchCancel = closer
            self.addTarget(self, action: #selector(touchCancel(_:)), for: state)
        case UIControlEvents.touchDragEnter:
            touchDragEnter = closer
            self.addTarget(self, action: #selector(touchDragEnter(_:)), for: state)
        case UIControlEvents.touchDragExit:
            touchDragExit = closer
            self.addTarget(self, action: #selector(touchDragExit(_:)), for: state)
        case UIControlEvents.touchDragInside:
            touchDragInside = closer
            self.addTarget(self, action: #selector(touchDragInside(_:)), for: state)
        case UIControlEvents.touchDragOutside:
            touchDragOutside = closer
            self.addTarget(self, action: #selector(touchDragOutside(_:)), for: state)
        default:
            break
        }
    }
}



