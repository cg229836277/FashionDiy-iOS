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
        bottomView.bounds = CGRectMake(0, 0, self.view.frame.width, 60)
        print("view width = \(self.view.bounds.width)")
        print("view height = \(self.view.bounds.height)")
        // Do any additional setup after loading the view.
        //bottomView.bounds = CGRectMake(0, 0, self.view.bounds.width, 100)
        print("view width = \(bottomView.bounds.width)")
        print("view height = \(bottomView.bounds.height)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
