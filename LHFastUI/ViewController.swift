//
//  ViewController.swift
//  LHFastUI
//
//  Created by 刘欢 on 2017/5/29.
//  Copyright © 2017年 com.taguage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      _ = UIView(frame: CGRect(x: 50, y: 80, width: 100, height: 100))
                .tintAdMode(.automatic)
                .tap({
                    print("UIView")
                })
                .border(1,UIColor(hex:"#129494"))
                .conerRadius(2)
                .addToView(view)
                .shadow(10)
                .shadowColor(UIColor.blue)
                .shadowRadius(4)
                .shadowOpacity(0.6)
        
        
        _ = UIImageView(image: UIImage(color: UIColor.blue, size: CGSize(width: 100, height: 100)))
                    .addToView(self.view)
                    .frame(CGRect(x: 100, y: 100, width: 100, height: 100))
                    .tap{
                        print("imageview")
                    }
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 5, height: 5)
        shadow.shadowColor = RandomColor()
        
        var atti = NSMutableAttributedString(string: "今天星期三，时间：11点05分")
                    .addAttri(.fontName(Font(20)), NSMakeRange(0, 1))
                    .setAttri(.fgColor(RandomColor()), NSMakeRange(0, 1))
                    .addAttri(.shadow(shadow), NSMakeRange(0,1))
                        atti = atti.setAttris([AttriType.bgColor(RandomColor()),
                                               .fgColor(RandomColor()),
                                               AttriType.link(NSURL(string: "http://www.baidu.com")!)
                            ],NSMakeRange(1, 1))

        
        let label = UILabel(frame: CGRect(x: 10, y: 20, width: 100, height: 30))
                    .attriText(atti)
                    .textAlign(.center)
                    .font(fontSize: 14)
                    .addToView(view)
        
        
        _ = UIButton(frame: CGRect(x: 10, y: 300, width: 100, height: 30))
            .title("快点我呀")
            .titleColor(RandomColor())
            .addAction(.touchUpInside, { (bt) in
                print("1------touchUpInside")
                
                UIView.animate(withDuration: 1, animations: {
                    bt.backgroundColor = RandomColor()
                }, completion: { (finish) in
                    
                })
            })
            .addAction(.touchDown, { (_) in
                print("2-------touchDown")
            })
            .addAction(.touchCancel, { (_) in
                print("3--------touchCancel")
            })
            .addAction(.touchDragOutside, { (_) in
                print("4--------touchDragOutside")
            })
            .addToView(view)
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

