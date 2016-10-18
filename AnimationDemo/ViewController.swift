//
//  ViewController.swift
//  AnimationDemo
//
//  Created by 金飞 on 2016/10/17.
//  Copyright © 2016年 JL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn: UIButton = UIButton()
        btn.frame = CGRect(x: 15, y: 30, width: 150, height: 50)
        btn.setTitle("缓动函数示例", for: UIControlState.normal)
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 3
        btn.layer.cornerRadius = 3
        btn.layer.masksToBounds = true
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(ViewController.btnPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
        
        let btnIVA: UIButton = UIButton()
        btnIVA.frame = CGRect(x: 15, y: 100, width: 150, height: 50)
        btnIVA.setTitle("ImageView动画", for: UIControlState.normal)
        btnIVA.layer.borderColor = UIColor.white.cgColor
        btnIVA.layer.borderWidth = 3
        btnIVA.layer.cornerRadius = 3
        btnIVA.layer.masksToBounds = true
        btnIVA.backgroundColor = UIColor.blue
        btnIVA.addTarget(self, action: #selector(ViewController.btnIVAPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnIVA)
        
        let btnRecursion: UIButton = UIButton()
        btnRecursion.frame = CGRect(x: 15, y: 170, width: 150, height: 50)
        btnRecursion.setTitle("递归改变ImageView图片", for: UIControlState.normal)
        btnRecursion.layer.borderColor = UIColor.white.cgColor
        btnRecursion.layer.borderWidth = 3
        btnRecursion.layer.cornerRadius = 3
        btnRecursion.layer.masksToBounds = true
        btnRecursion.backgroundColor = UIColor.blue
        btnRecursion.addTarget(self, action: #selector(ViewController.btnRecursionPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnRecursion)
        
        
        let btnClock: UIButton = UIButton()
        btnClock.frame = CGRect(x: 15, y: 240, width: 150, height: 50)
        btnClock.setTitle("指针时钟", for: UIControlState.normal)
        btnClock.layer.borderColor = UIColor.white.cgColor
        btnClock.layer.borderWidth = 3
        btnClock.layer.cornerRadius = 3
        btnClock.layer.masksToBounds = true
        btnClock.backgroundColor = UIColor.blue
        btnClock.addTarget(self, action: #selector(ViewController.btnClockPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnClock)
        
        
        
        self.view.backgroundColor = UIColor(colorLiteralRed: Float(0.999), green: Float(0.111), blue: Float(0.222), alpha: Float(1))
    }
    
    func btnClockPressed(obj : AnyObject){
        let a: ClockUseEasingFuncViewController = ClockUseEasingFuncViewController()
        self.show(a, sender: self)
    }
    
    func btnPressed(obj : AnyObject){
        let a: EasingFuncViewController = EasingFuncViewController()
        self.show(a, sender: self)
        
    }
    
    func btnIVAPressed(obj : AnyObject){
        let a: ImageViewAnimationViewController = ImageViewAnimationViewController()
        self.show(a, sender: self)
    }
    
    func btnRecursionPressed(obj : AnyObject){
        let a: RecursionSetToChangeImageViewController = RecursionSetToChangeImageViewController()
        self.show(a, sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
