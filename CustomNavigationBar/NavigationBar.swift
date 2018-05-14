//
//  NavigationBar.swift
//  UINavigationBar Programmatically
//
//  Created by ShawnBaek on 2017. 10. 6..
//  Copyright © 2017 ShawnBaek. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {

    //set NavigationBar's height
    //For iphonex, I recommended to set the minimum height to 88 or higher.
    static var customHeight: CGFloat {
        // iPhone8などのノッチがない端末のカスタムHeightを指定
        let baseHeight: CGFloat = 100
        // iPhoneXなどはstatusBarの高さが44ptであるため、additionalHeightが22ptとなる
        let additionalHeight = statusBarHeight - 20
        return baseHeight + additionalHeight
    }
    
//    static var safeAreaInsetsTop: CGFloat {
//        // iPhoneX
//        //Default NavigationBar Height is 44. Custom NavigationBar Height is 66. So We should set additionalSafeAreaInsets to 66-44 = 22
//        return customHeight - 44
//    }
    
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: type(of: self).customHeight)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.tintColor = .black
        
        frame = CGRect(x: frame.origin.x, y:  0, width: frame.size.width, height: type(of: self).customHeight)

        // title position (statusbar height / 2)
//        setTitleVerticalPositionAdjustment(-10, for: UIBarMetrics.default)

        for subview in self.subviews {
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground") {
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: type(of: self).customHeight)
                subview.backgroundColor = .yellow
            }

            stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarContent") {
                subview.frame = CGRect(x: subview.frame.origin.x, y: type(of: self).statusBarHeight, width: subview.frame.width, height: type(of: self).customHeight - type(of: self).statusBarHeight)
            }
        }

    }


}
