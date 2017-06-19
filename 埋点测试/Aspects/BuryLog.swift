//
//  BuryLog.swift
//  maidianTwo
//
//  Created by 王林 on 2017/6/17.
//  Copyright © 2017年 edon. All rights reserved.
//

import UIKit
import Aspects


class BuryLog: NSObject {
    let GLLoggingTrackedEvents = "GLLoggingTrackedEvents"
    let GLLoggingEventName = "GLLoggingEventName"
    let GLLoggingFuncName = "GLLoggingFuncName"
    let GLLoggingSelectorName = "GLLoggingSelectorName"
    
    
    func setupWithConfiguration() {
     
        let fliePath:String = Bundle.main.path(forResource: "FuncLog.plist", ofType: nil)!
        let dict = NSDictionary(contentsOfFile: fliePath)!
        
        
        for dictVC in dict {
            
            let dictyy = dict[dictVC.0] as! NSDictionary
            
            let GG =  dictyy[GLLoggingTrackedEvents] as! NSArray
            
            for dictFac in GG {
                print("-----")
               //print(dictFac)
                //获取方法
                let  SEDict = dictFac as! NSDictionary
                let Se = NSSelectorFromString((SEDict[GLLoggingSelectorName] as! String) )
                
                //获取 当前所在控制器（类）
                let vcName = dictVC.0 as! String
                
                guard let nameSpage = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
                    print("没有命名空间")
                    return
                }
                guard let childVcClass = NSClassFromString(nameSpage + "." + vcName) else {
                    print("没有获取到对应的class")
                    return
                }
                
              
                
                let wrappedBlock:@convention(block) (AspectInfo)-> Void = { aspectInfo in
                    print("走了>>>>>>>>>>>>>>>>>>>>")
                    
                    print("发送网络请求")
                    print(childVcClass)  //事件触发所在的控制器
                    print(NSDateTime.getNowTimeTimestamp3()) //时间戳
                    print( SEDict[self.GLLoggingEventName] ?? 0) //方法描述
                    print(SEDict[self.GLLoggingFuncName] ?? "无用") //方法名称
                    
                    print("<<<<<<<<<<<<<<<<<")
                }
                
                let wrappedObject: AnyObject = unsafeBitCast(wrappedBlock, to: AnyObject.self)
                
                do {
                    try _ = childVcClass.aspect_hook(Se, with: .positionBefore , usingBlock:wrappedObject)
                } catch  {
                    print(error)
                }
            
                
            }
        }
    }
    

}
