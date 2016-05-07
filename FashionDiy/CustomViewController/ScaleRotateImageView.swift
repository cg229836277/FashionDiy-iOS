//
//  ScaleRotateImageView.swift
//  FashionDiy
//
//  Created by chuck chan on 16/5/7.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit
@IBDesignable
class ScaleRotateImageView: UIView {
    @IBOutlet weak var contentImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func deleteButtonClicked(sender: CustomButton) {
        
    }
    
    @IBAction func actionButtonClicked(sender: CustomButton) {
        
    }
    
    func setImage(image:UIImage){
        contentImageView.image = image
    }
    
}
