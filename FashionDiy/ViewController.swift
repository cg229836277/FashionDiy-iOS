//
//  ViewController.swift
//  FashionDiy
//
//  Created by chuck chan on 16/3/30.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var maleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideNavigationBar()
        
        maleButton.imageView?.contentMode = UIViewContentMode.Top
    }
    
    @IBAction func backToHome(segue : UIStoryboardSegue){
        hideNavigationBar()
    }
    
    
    func hideNavigationBar(){
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.translucent = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

