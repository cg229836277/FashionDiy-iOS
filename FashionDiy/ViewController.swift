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
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.navigationBar.translucent = true
        initBtnBounds(maleButton)
    }
    
    func initBtnBounds(customBtn:UIButton){
        let titleBounds = customBtn.titleLabel?.bounds
        customBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(titleBounds?.width)!, 0, 0)
        customBtn.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        customBtn.titleEdgeInsets = UIEdgeInsetsMake(-(titleBounds?.height)!, -(titleBounds?.width)!, 0, 0)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

