//
//  ViewController.swift
//  FashionDiy
//
//  Created by chuck chan on 16/3/30.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var maleDesignImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.translucent = true
        initImageView()
    }
    
    @IBAction func maleBtnClicked(sender: UIButton) {
        
    }
    func initImageView(){
        let maleImageRecognizer = UITapGestureRecognizer(target: self, action: "maleImageViewClicked:")
        maleImageRecognizer.delegate = self
        maleDesignImage.addGestureRecognizer(maleImageRecognizer)
    }
    
    func maleImageViewClicked(sender:AnyObject){
        print("male image clicked")
        let maleDesignController = MaleDesignViewController()
        self.presentViewController(maleDesignController, animated: true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

