//
//  MaleDesignViewController.swift
//  FashionDiy
//
//  Created by chuck chan on 16/3/30.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class MaleDesignViewController: UIViewController {
    
    @IBOutlet weak var backDesignImage: UIImageView!
    
    @IBOutlet weak var FrontDesignImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.cyanColor()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
    }
    
    @IBAction func backAndFrontSelected(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            backDesignImage.hidden = true
            FrontDesignImage.hidden = false
        case 1:
            backDesignImage.hidden = false
            FrontDesignImage.hidden = true
        default:
            break;
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
