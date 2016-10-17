//
//  testViewController.swift
//  test
//
//  Created by 金飞 on 2016/10/17.
//  Copyright © 2016年 JL. All rights reserved.
//

import UIKit

class EasingFuncViewController: UIViewController {

    
    var vv: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let v: UIView = UIView()
//        
//        v.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        self.view.addSubview(v)
        self.view.backgroundColor = UIColor.white
        
        //添加显示用的view
        vv = UIView(frame: CGRect(x: 0, y: 300, width: 200, height: 100))
        vv.layer.cornerRadius = 10
        vv.layer.masksToBounds = true
        
        vv.layer.backgroundColor = UIColor.red.cgColor
        
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect(x: 15, y: 30, width: 80, height: 30)
        btn.setTitle("返回", for: UIControlState.normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.masksToBounds = true
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(EasingFuncViewController.btnPressed), for: UIControlEvents.touchUpInside)
        vv.addSubview(btn)
        
        self.view.addSubview(vv)
        
        
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(EasingFuncViewController.viewTouched)))
        
        
        //        //基本动画类型
        //        let animation: CABasicAnimation = CABasicAnimation()
        //        animation.keyPath = "position"
        //        animation.duration = 4
        //        animation.fromValue = NSValue(cgPoint: vv.center)
        //        animation.toValue = NSValue(cgPoint: CGPoint(x: 200, y: 200))
        //
        //        vv.center = CGPoint(x: 200, y: 200)
        //        vv.layer.add(animation, forKey: nil)
        
        //关键帧动画
        let animationKey: CAKeyframeAnimation = CAKeyframeAnimation()
        animationKey.keyPath = "position"
        animationKey.duration = 2
        //        animationKey.values = [NSValue(cgPoint: vv.center), NSValue(cgPoint: CGPoint(x: 200, y: 200)) , NSValue(cgPoint: CGPoint(x: 250, y: 250)), NSValue(cgPoint: CGPoint(x: 280, y: 280)) , NSValue(cgPoint: CGPoint(x: 300, y: 300))];
        
        let p: NSMutableArray = NSMutableArray()
        p.addObjects(from: YXEasing.calculateFrame(from: vv.center, to: CGPoint(x: 100, y: 100), func: QuarticEaseOut, frameCount: 60))
        p.addObjects(from: YXEasing.calculateFrame(from: CGPoint(x: 100, y: 100), to: vv.center, func: QuarticEaseIn, frameCount: 60))
        animationKey.values = p as? [Any]
        
        
        
        //        vv.center = CGPoint(x: 100, y: 100)
        vv.layer.add(animationKey, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func btnPressed(obj : AnyObject){
        print("pressed:\(obj)")
        self.dismiss(animated: true) { 
            
        }
    }
    
    func viewTouched(obj : AnyObject){
        print("pressed:\(obj)")
        
        //关键帧动画
        let animationKey: CAKeyframeAnimation = CAKeyframeAnimation()
        animationKey.keyPath = "position"
        animationKey.duration = 2
        //        animationKey.values = [NSValue(cgPoint: vv.center), NSValue(cgPoint: CGPoint(x: 200, y: 200)) , NSValue(cgPoint: CGPoint(x: 250, y: 250)), NSValue(cgPoint: CGPoint(x: 280, y: 280)) , NSValue(cgPoint: CGPoint(x: 300, y: 300))];
        
        let p: NSMutableArray = NSMutableArray()
        p.addObjects(from: YXEasing.calculateFrame(from: vv.center, to: CGPoint(x: 100, y: 100), func: CubicEaseOut, frameCount: 60))
        p.addObjects(from: YXEasing.calculateFrame(from: CGPoint(x: 100, y: 100), to: vv.center, func: CubicEaseIn, frameCount: 60))
        animationKey.values = p as? [Any]
        
        
        
        //        vv.center = CGPoint(x: 100, y: 100)
        vv.layer.add(animationKey, forKey: nil)
        
    }

}
