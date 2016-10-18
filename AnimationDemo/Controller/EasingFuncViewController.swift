//
//  testViewController.swift
//  test
//
//  Created by 金飞 on 2016/10/17.
//  Copyright © 2016年 JL. All rights reserved.
//

import UIKit

class EasingFuncViewController: UIViewController , CAAnimationDelegate {

    
    var vv: UIView!
    
    var bgImage: UIImageView!
    var flightImage: UIImageView!
    var fireTimer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let v: UIView = UIView()
//        
//        v.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        self.view.addSubview(v)
        self.view.backgroundColor = UIColor.white
        
        //设置背景图片1
        bgImage = UIImageView()
        bgImage.frame = CGRect(x: 0, y: -UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        bgImage.image = UIImage(named: "1")
        self.view.addSubview(bgImage)
        
        
        
        
        
        
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
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(EasingFuncViewController.pan)))
        
        //        //基本动画类型
        //        let animation: CABasicAnimation = CABasicAnimation()
        //        animation.keyPath = "position"
        //        animation.duration = 4
        //        animation.fromValue = NSValue(cgPoint: vv.center)
        //        animation.toValue = NSValue(cgPoint: CGPoint(x: 200, y: 200))
        //
        //        vv.center = CGPoint(x: 200, y: 200)
        //        vv.layer.add(animation, forKey: nil)
        
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        backgroundRepeat()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pan(obj: UIPanGestureRecognizer){
        print("\(obj.location(in: self.view)):state:\(obj.state.rawValue)")
        if(obj.state == UIGestureRecognizerState.began){
            flightImage = UIImageView()
            flightImage.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            flightImage.center = obj.location(in: self.view)
            flightImage.image = UIImage(named: "5")
            flightImage.contentMode = UIViewContentMode.scaleAspectFill
            self.view.addSubview(flightImage)
            
            fireTimer = Timer(timeInterval: 0.1, target: self, selector: #selector(EasingFuncViewController.fire), userInfo: nil, repeats: true)
            RunLoop.main.add(fireTimer, forMode: RunLoopMode.defaultRunLoopMode)
            fireTimer.fire()
        }
        
        if(obj.state == UIGestureRecognizerState.changed){
            flightImage.center = obj.location(in: self.view)
        }
        
        if(obj.state == UIGestureRecognizerState.ended){
            flightImage.removeFromSuperview()
            flightImage = nil
            
            if fireTimer.isValid {
                fireTimer.invalidate()
            }
            fireTimer = nil
            
        }
        
    }
    
    func fire(){
        
        if flightImage != nil{
            print("firepoint:\(flightImage.center)")
            let bullet = CALayer()
            bullet.frame = CGRect(x: flightImage.center.x , y: flightImage.center.y, width: 10, height: 10)
            bullet.backgroundColor = UIColor.yellow.cgColor
            flightImage.layer.addSublayer(bullet)
            
            let bulletAnim: CAKeyframeAnimation = CAKeyframeAnimation()
            bulletAnim.keyPath = "position"
            bulletAnim.duration = 0.8
            bulletAnim.repeatCount = 1
            bulletAnim.values = [NSValue(cgPoint: flightImage.center) , NSValue(cgPoint: CGPoint(x: flightImage.center.x, y: -1000))]
            bulletAnim.delegate = self
            
            bullet.frame = CGRect(x: flightImage.center.x, y: -1000 , width: 10, height:10)
            bullet.add(bulletAnim, forKey: nil)
            
        }
    }
    
    func backgroundRepeat(){
        
        
        let bg1Anim: CAKeyframeAnimation = CAKeyframeAnimation()
        bg1Anim.keyPath = "position"
        bg1Anim.duration = 3
        bg1Anim.repeatCount = 10000000
        bg1Anim.values = [NSValue(cgPoint: CGPoint(x: UIScreen.main.bounds.width / 2, y: -self.view.center.y)) , NSValue(cgPoint: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height + self.view.center.y))]
        
        bgImage.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height + self.view.center.y)
        
        bgImage.layer.add(bg1Anim, forKey: nil)
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
        
//        backgroundRepeat()
        
    }

}
