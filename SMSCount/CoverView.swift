//
//  CoverView.swift
//  SMSCount
//
//  Created by Eddie on 1/22/16.
//  Copyright © 2016 Wen. All rights reserved.
//

import UIKit

class CoverView: UIView {

    var viewWidth: CGFloat = 0.0
    var viewHeight: CGFloat = 0.0

    var status: String = ""

    convenience init( status: String ) {

        self.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width-44-49))

        self.viewWidth = UIScreen.mainScreen().bounds.width
        self.viewHeight = UIScreen.mainScreen().bounds.height-44-49

        self.backgroundColor = UIColor.whiteColor()

        self.status = status

    }

    func addIconView() {

        let iconView = UIImageView(frame: CGRectMake(self.viewWidth/2-24, self.viewHeight/2-50, 48, 48))
            iconView.image = {
                switch self.status {
                    case "facebook":
                        return UIImage(named: "person-pin")!
                    case "public":
                        return UIImage(named: "setting-pin")!
                    case "no-friends":
                        return UIImage()
                    default:
                        return UIImage(named: "internet-pin")!
                }
            }()

        self.addSubview(iconView)

    }

}
