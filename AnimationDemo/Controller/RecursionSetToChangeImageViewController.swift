//
//  RecursionSetToChangeImageViewController.swift
//  AnimationDemo
//
//  Created by 金飞 on 2016/10/17.
//  Copyright © 2016年 JL. All rights reserved.
//

import UIKit

class RecursionSetToChangeImageViewController: UIViewController {
    
    var img: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = UIImageView()
        img.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50)
        self.view.addSubview(img)
        
        

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
        btnStop.setTitle("暂停", for: UIControlState.normal)
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
        
        
        
        
        self.perform(#selector(RecursionSetToChangeImageViewController.changeImages), with: img, afterDelay: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var imgCode = 1
    var state = 1
    func changeImages(imgView: UIImageView){
        
        if imgCode <= 25 && state == 1{
            img.image = UIImage(named: "\(imgCode)")
            imgCode += 1
        }
        self.perform(#selector(RecursionSetToChangeImageViewController.changeImages), with: img, afterDelay: 1)
    }
    
    
    func btnBackPressed(){
        self.dismiss(animated: true) {
            
        }
    }
    
    func btnStartPressed(){
        state = 1
    }
    
    func btnStopPressed(){
        state = 0
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
