//
//  ClothSourceCell.swift
//  FashionDiy
//
//  Created by chuck chan on 16/4/13.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit
@IBDesignable
class ClothSourceCell: UITableViewCell {
    @IBOutlet weak var firstButton: CustomButton!
    
    @IBOutlet weak var secondButton: CustomButton!
    
    @IBOutlet weak var thirdButton: CustomButton!
    
    @IBOutlet weak var fourthButton: CustomButton!
    
    @IBOutlet weak var fifthButton: CustomButton!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        firstButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
        secondButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
        thirdButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
        fourthButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
        fifthButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
        self.imageView?.frame = CGRectMake(0, 0, 0, 0)
        self.detailTextLabel?.frame = CGRectMake(0, 0, 0, 0)
        self.textLabel?.frame = CGRectMake(0, 0, 0, 0)
    }
}
