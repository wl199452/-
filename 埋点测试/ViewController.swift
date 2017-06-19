//
//  ViewController.swift
//  埋点测试
//
//  Created by 王林 on 2017/6/16.
//  Copyright © 2017年 edon. All rights reserved.
//

import UIKit

import Aspects

class ViewController: UIViewController {

    var block:((String)->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "第一个控制器"
        
        let btn = UIButton(type: .contactAdd)
        view.addSubview(btn)
        btn.sizeToFit()
        
        btn.center = self.view.center
        btn.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        
        
    }

    func pushVC() {       //注意这里的方法 是不带参数的，如果这个方法带参数，plist也需要修改
        
        let targerVC = TextViewController()
        
        self.present(targerVC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

