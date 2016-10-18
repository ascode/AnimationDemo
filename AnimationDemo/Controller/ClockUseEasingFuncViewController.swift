//
//  ClockUseEasingFuncViewController.swift
//  AnimationDemo
//
//  Created by 金飞 on 2016/10/18.
//  Copyright © 2016年 JL. All rights reserved.
//

import UIKit

class ClockUseEasingFuncViewController: UIViewController {
    
    var secLayer: CALayer!
    var timer: Timer!
    static var i: Double = Double(0)

    override func viewDidLoad() {
        super.viewDidLoad()

        let clockPanel: UIView = UIView()
        clockPanel.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        clockPanel.center = self.view.center
        clockPanel.layer.borderWidth = 1
        clockPanel.layer.borderColor = UIColor.white.cgColor
        clockPanel.layer.cornerRadius = 150
        clockPanel.layer.masksToBounds = true
        self.view.addSubview(clockPanel)
        
        //设置指针
        secLayer = CALayer()
        secLayer.anchorPoint = CGPoint(x: 0, y: 0)
        secLayer.frame = CGRect(x: 150, y: 150, width: 1, height: 130)
        secLayer.backgroundColor = UIColor.white.cgColor
        clockPanel.layer.addSublayer(secLayer)
        
        
        /*1、参数repeats是指定是否循环执行，YES将循环，NO将只执行一次。
        2、timerWithTimeInterval这两个类方法创建出来的对象如果不用 addTimer: forMode方法手动加入主循环池中，将不会循环执行。并且如果不手动调用fair，则定时器不会启动。
        3、scheduledTimerWithTimeInterval这两个方法不需要手动调用fair，会自动执行，并且自动加入主循环池。
        4、init方法需要手动加入循环池，它会在设定的启动时间启动。*/
        timer = Timer(timeInterval: 1, target: self, selector: #selector(ClockUseEasingFuncViewController.timerEvent), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
        timer.fire()
        
        let btnStart: UIButton = UIButton()
        btnStart.frame = CGRect(x: UIScreen.main.bounds.width * 0/3, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width / 3, height: 50)
        btnStart.setTitle("播放", for: UIControlState.normal)
        btnStart.layer.borderColor = UIColor.white.cgColor
        btnStart.layer.borderWidth = 3
        btnStart.layer.cornerRadius = 3
        btnStart.layer.masksToBounds = true
        btnStart.backgroundColor = UIColor.blue
        btnStart.addTarget(self, action: #selector(ImageViewAnimationViewController.btnStartPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnStart)
        
        let btnStop: UIButton = UIButton()
        btnStop.frame = CGRect(x: UIScreen.main.bounds.width * 1/3, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width / 3, height: 50)
        btnStop.setTitle("停止", for: UIControlState.normal)
        btnStop.layer.borderColor = UIColor.white.cgColor
        btnStop.layer.borderWidth = 3
        btnStop.layer.cornerRadius = 3
        btnStop.layer.masksToBounds = true
        btnStop.backgroundColor = UIColor.blue
        btnStop.addTarget(self, action: #selector(ImageViewAnimationViewController.btnStopPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnStop)
        
        let btnBack: UIButton = UIButton()
        btnBack.frame = CGRect(x: UIScreen.main.bounds.width * 2/3, y: UIScreen.main.bounds.height - 50, width: UIScreen.main.bounds.width / 3, height: 50)
        btnBack.setTitle("返回", for: UIControlState.normal)
        btnBack.layer.borderColor = UIColor.white.cgColor
        btnBack.layer.borderWidth = 3
        btnBack.layer.cornerRadius = 3
        btnBack.layer.masksToBounds = true
        btnBack.backgroundColor = UIColor.blue
        btnBack.addTarget(self, action: #selector(ImageViewAnimationViewController.btnBackPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnBack)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func timerEvent(){
        
        
        // 计算好起始值,结束值
        let oldValue = CGFloat(360 / 60 * M_PI / 180 * ClockUseEasingFuncViewController.i)
        ClockUseEasingFuncViewController.i += 1
        let newValue = CGFloat(360 / 60 * M_PI / 180 * ClockUseEasingFuncViewController.i)

        //创建关键帧动画
        let keyFrameAnimation: CAKeyframeAnimation = CAKeyframeAnimation()
        keyFrameAnimation.keyPath = "transform.rotation.z"
        // 设置持续时间
        keyFrameAnimation.duration = 0.5
        // 设置值
        keyFrameAnimation.values = YXEasing.calculateFrame(fromValue: oldValue, toValue: newValue, func: ElasticEaseOut, frameCount: Int(0.5 * 30))
        
        // 每秒增加的角度(设定结果值,在提交动画之前执行)
        secLayer.transform = CATransform3DMakeRotation(newValue, 0, 0, 1)
        // 提交动画
        secLayer.add(keyFrameAnimation, forKey: nil)
        
    }
    
    func btnBackPressed(){
        //如果我们启动了一个定时器，在某个界面释放前，将这个定时器停止，甚至置为nil，都不能是这个界面释放，原因是系统的循环池中还保有这个对象。所以我们需要这样做：
        if timer.isValid {
            // 在官方文档中我们可以看到 [timer invalidate]是唯一的方法将定时器从循环池中移除。
            timer.invalidate()
        }
        timer = nil
        self.dismiss(animated: true) {
            
        }
    }
    
    func btnStartPressed(){
        
    }
    
    func btnStopPressed(){
        
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
