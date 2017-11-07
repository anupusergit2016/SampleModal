//
//  SecondViewCViewController.swift
//  SampleModal
//
//  Created by GiriAdmin on 27/09/17.
//  Copyright © 2017 AgniAdmin. All rights reserved.
//

import UIKit


class SecondViewCViewController: UIViewController {
    @IBOutlet weak var scrollOutlet: UIScrollView!
  var firstView = FirstView()
  var secondView = SecondView()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.view.isHidden = true
        self.scrollOutlet.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height:self.view.frame.size.height)
        self.scrollOutlet.isPagingEnabled = true;
        self.scrollOutlet.layer.cornerRadius = 15.0
        self.scrollOutlet.layer.masksToBounds = true
        var x: CGFloat = 0
        for i in 0..<4 {
            if i == 0 {
                firstView = FirstView.instanceFromNib() as! FirstView
                firstView.frame = CGRect(x: CGFloat(x), y: CGFloat((10)), width: CGFloat(self.view.frame.size.width), height: CGFloat(firstView.frame.size.height))
                firstView.tag = i
                self.scrollOutlet.addSubview(firstView)
            }
            else if i == 1
            {
                secondView = SecondView.instanceFromNib() as! SecondView
                secondView.frame = CGRect(x: CGFloat(x), y: CGFloat((10)), width: CGFloat(self.view.frame.size.width), height: CGFloat(firstView.frame.size.height))
               // secondView.lbl.text = "View \(i + 1)"
                secondView.tag = i
                self.scrollOutlet.addSubview(secondView)
            }
            else{
                firstView = FirstView.instanceFromNib() as! FirstView
                firstView.frame = CGRect(x: CGFloat(x), y: CGFloat((10)), width: CGFloat(self.view.frame.size.width), height: CGFloat(firstView.frame.size.height))
                firstView.tag = i
                self.scrollOutlet.addSubview(firstView)
            }
          
            x += firstView.frame.size.width
        }
        //self.scrollOutlet.contentSize = CGSize(width: CGFloat(x), height: self.scrollOutlet.frame.size.height)
        
         self.scrollOutlet.contentSize = CGSize(width: CGFloat(x), height: self.scrollOutlet.frame.size.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
 
    }
    func showSearchResult()
    {
        self.view.isHidden = false
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK:UIScrollView Delegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
       
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        if Int(currentPage) == 0
        {
    
        }
        else if Int(currentPage) == 1
        {
           
        }
        else if Int(currentPage) == 2
        {
          
           
        }
        else if Int(currentPage) == 3
        {
         
           
        }

    }
 
    @IBAction func btn4(_ sender: Any) {
        self.scrollOutlet.setContentOffset(CGPoint(x: ((firstView.frame.size.width) * 3), y: 0), animated: true)
    }
    @IBAction func btn1(_ sender: Any) {
        self.scrollOutlet.setContentOffset(CGPoint(x: ((firstView.frame.size.width) * 0), y: 0), animated: true)
    }

    @IBAction func btn2(_ sender: Any) {
        self.scrollOutlet.setContentOffset(CGPoint(x: ((firstView.frame.size.width) * 1), y: 0), animated: true)
    }
    @IBAction func btn3(_ sender: Any) {
        
        self.scrollOutlet.setContentOffset(CGPoint(x: ((firstView.frame.size.width) * 2), y: 0), animated: true)
      
    }
}
