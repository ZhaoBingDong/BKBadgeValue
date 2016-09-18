//
//  BKTabBarController.swift
//  BKBadgeValue
//
//  Created by 董招兵 on 2016/9/18.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import UIKit

class BKTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.addCustomTabbar()
        
        
        
    }

    func addCustomTabbar()  {
        
        let newTabbar                       = BKTabbar(frame: self.tabBar.frame)
        newTabbar.items                     = self.tabBar.items
        newTabbar.badgeValueTextColor       = UIColor.black
        newTabbar.badgeValueBackgroundColor = UIColor.yellow
        self.setValue(newTabbar, forKey: "tabBar")
        
        
        
    }
  
    
}
