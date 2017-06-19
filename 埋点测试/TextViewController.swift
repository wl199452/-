//
//  TextViewController.swift
//  埋点测试
//
//  Created by 王林 on 2017/6/19.
//  Copyright © 2017年 edon. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "第二个控制器"
        
        self.view.backgroundColor = UIColor.cyan
        
        let btn = UIButton(type: .contactAdd)
        view.addSubview(btn)
        btn.sizeToFit()
        
        btn.center = self.view.center
        btn.addTarget(self, action: #selector(dismissVC(_ :)), for: .touchUpInside)
        
    }

    func dismissVC(_ :UIButton) {  //这个是带参数的
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
