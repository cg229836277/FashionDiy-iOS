//
//  FemaleDesignViewController.swift
//  FashionDiy
//
//  Created by chuck chan on 16/4/12.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class FemaleDesignViewController: UIViewController {

    @IBOutlet weak var bottomView: BottomChooseView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait,UIInterfaceOrientationMask.PortraitUpsideDown]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
