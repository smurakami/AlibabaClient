//
//  MessageView.swift
//  Alibaba
//
//  Created by 村上晋太郎 on 2016/07/03.
//  Copyright © 2016年 S. Murakami. All rights reserved.
//

import UIKit

class MessageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.alizarinColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func fire() {
        UIView.animateWithDuration(
            2,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                self.center.y -= 400
                self.alpha = 0
            }, completion: {
                finished in
                self.removeFromSuperview()
            })
    }
    
    class func instance(pos: CGPoint) -> MessageView {
        let view = MessageView(frame: CGRectMake(0, 0, 66, 66))
        view.center = pos
        return view
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}