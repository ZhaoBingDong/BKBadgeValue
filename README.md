# BKBadgeValue
自定义 badgeValue

使用方法
1 需要自定义 TabBarController  通过 KVC 方式替换 tabbarControoler 的 tabBar

    let newTabbar                       = BKTabbar(frame: self.tabBar.frame)

    // 需要先给 tabbarcontroller 设置 viewControllers 已经 tabbarItem 属性 包括 image selectImage 才可以替换掉系统的 tabbar

    newTabbar.items                     = self.tabBar.items
    // badgeValue 的文字颜色
    newTabbar.badgeValueTextColor       = UIColor.black
    // badgeValue 背景色
    newTabbar.badgeValueBackgroundColor = UIColor.yellow
    self.setValue(newTabbar, forKey: "tabBar")

2         self.tabBarItem.badgeValue = "100"

通过 UIViewControler 的 tabBarItem.badgeValue 属性设置 badgeValue的值 , 跟系统的 badgeValue 设置方式一致,只是屏蔽了系统的实现方法,改成自定义 badgeValue 的显示样式
