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

    @IBOutlet weak var oneButton: CustomButton!
    @IBOutlet weak var twoButton: CustomButton!
    @IBOutlet weak var threeButton: CustomButton!
    @IBOutlet weak var fourButton: CustomButton!
    
    @IBOutlet weak var fiveButton: CustomButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        firstButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
//        secondButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
//        thirdButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
//        fourthButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
//        fifthButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
//        self.imageView?.frame = CGRectMake(0, 0, 0, 0)
//        self.detailTextLabel?.frame = CGRectMake(0, 0, 0, 0)
//        self.textLabel?.frame = CGRectMake(0, 0, 0, 0)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cloth_item_cell")
    }
}
