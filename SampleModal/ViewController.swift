//
//  ViewController.swift
//  SampleModal
//
//  Created by GiriAdmin on 27/09/17.
//  Copyright © 2017 AgniAdmin. All rights reserved.
//

import UIKit
import  AFNetworking
//import SecondViewCViewController
var loginView = UIViewController()
var width = Float()
var height = Float()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds
        width = Float(bounds.size.width)
        height = Float(bounds.size.height)
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClk(_ sender: Any) {
       loginView.view.removeFromSuperview()
       let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
       loginView = storyBoard.instantiateViewController(withIdentifier: "second") as! SecondViewCViewController
       loginView.view.frame = CGRect(x: 10.0, y: CGFloat(height - height/3), width: self.view.frame.size.width - 20 , height: self.view.frame.size.height)
       loginView.view.layer.cornerRadius = 30.0
       loginView.view.clipsToBounds  = false;
       loginView.view.layer.shadowColor = UIColor.black.cgColor
       loginView.view.layer.shadowOpacity = 0.6
       loginView.view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        //**
        
        self.view.addSubview(loginView.view)
        UserDefaults.standard.set(0, forKey: "firstview")
        UserDefaults.standard.synchronize()
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        loginView.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        loginView.view.addGestureRecognizer(swipeDown)
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.respondToTapGesture))
        tapGesture1.numberOfTapsRequired = 1
        loginView.view.addGestureRecognizer(tapGesture1)
       
    }
    
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        let userDefaults = UserDefaults.standard
        if userDefaults.integer(forKey: "scrollupdown") == 0 {
            if let swipeGesture = gesture as? UISwipeGestureRecognizer {
                print(loginView.view.frame.size.height)
                switch swipeGesture.direction {
                case UISwipeGestureRecognizerDirection.up:
                    
                    //let getYPos = (self.view.frame.size.height - 495) + 146.0
                    loginView.view.frame = CGRect(x: CGFloat(10), y: CGFloat(height - height/2), width: CGFloat(self.view.frame.size.width - 20), height: self.view.frame.size.height)

                case UISwipeGestureRecognizerDirection.down:
                    loginView.view.frame = CGRect(x: CGFloat(10), y: CGFloat(height - height/3), width: CGFloat(self.view.frame.size.width - 20), height: self.view.frame.size.height)
                    
                default:
                    break
                }
            }
        }
        
    }
    
    func respondToTapGesture(_sender: UITapGestureRecognizer)
    {
       loginView.view.removeFromSuperview()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       loginView.view.removeFromSuperview()
    }
}

