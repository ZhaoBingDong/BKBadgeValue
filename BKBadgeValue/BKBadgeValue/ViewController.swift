//
//  ViewController.swift
//  BKBadgeValue
//
//  Created by 董招兵 on 2016/9/18.
//  Copyright © 2016年 大兵布莱恩特. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        self.tabBarItem.index = 102
//        print(self.tabBarItem.tag)
        self.tabBarItem.badgeValue = "100"

        
    }



}

