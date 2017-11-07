//
//  FirstView.swift
//  SampleModal
//
//  Created by GiriAdmin on 27/09/17.
//  Copyright © 2017 AgniAdmin. All rights reserved.
//

import UIKit
import AFNetworking
import SVProgressHUD


class FirstView: UIView {

    convenience init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!)
    {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
    }
    
    class func instanceFromNib() -> UIView {
        
        return UINib(nibName: "FirstView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        
    }
    @IBAction func btnClk(_ sender: Any) {
        print(self.tag)
        loginView.view.frame = CGRect(x: CGFloat(10), y: CGFloat(200), width: CGFloat(loginView.view.frame.size.width), height: CGFloat(loginView.view.frame.size.height))
    }
    
    override func  layoutSubviews() {
       if UserDefaults.standard.value(forKey: "firstview") as! Int == 0
        {
             self.callAPIForNearestVenues()
        }
       
     
    }
    
    
    func callAPIForNearestVenues()
    {
        UserDefaults.standard.set(1, forKey: "firstview")
        UserDefaults.standard.synchronize()
        self.superview?.superview?.isHidden = true
        let manager = AFHTTPSessionManager()
        let parameters = NSMutableDictionary()
         parameters["latitude"] = "33.5620130"
         parameters["longitude"] = "-117.6778740"
         manager.requestSerializer = AFJSONRequestSerializer()
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setForegroundColor(UIColor.black)
        SVProgressHUD.setAnimationsEnabled(true)
        SVProgressHUD.show(withStatus: "Please wait...")
        manager.post("https://api.public.int.jelie.com/v1/nearby/venues", parameters: parameters, progress: { (Progress) in
            
        },
            success: { (requestOperation, response) in
            SVProgressHUD.dismiss()
            print("sucess")
            self.superview?.superview?.isHidden = false
        })
        { (requestOperation, error) in
            SVProgressHUD.dismiss()
           print("failed")
        }
        
    }
    
  


}
