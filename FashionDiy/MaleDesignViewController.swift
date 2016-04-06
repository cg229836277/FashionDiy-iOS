//
//  MaleDesignViewController.swift
//  FashionDiy
//
//  Created by chuck chan on 16/3/30.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class MaleDesignViewController: UIViewController {
    
    @IBOutlet weak var modelButton: CustomButton!
    @IBOutlet weak var takePicButton: CustomButton!
    
    @IBOutlet weak var wordButton: CustomButton!
    
    @IBOutlet weak var patternButton: CustomButton!
    
    @IBOutlet weak var styleButton: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.cyanColor()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
        
        modelButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        takePicButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        wordButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        patternButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        styleButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
