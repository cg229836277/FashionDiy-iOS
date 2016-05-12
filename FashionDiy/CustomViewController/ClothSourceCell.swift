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
    
    //var cellButtonDelagate:TableviewCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //initButtonClickedEvent()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cloth_item_cell")
        //initButtonClickedEvent()
    }
    
    func initButtonClickedEvent(){
        oneButton.addTarget(self, action: "oneButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        twoButton.addTarget(self, action: "twoButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        threeButton.addTarget(self, action: "threeButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        fourButton.addTarget(self, action: "fourButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        fiveButton.addTarget(self, action: "fiveButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    @IBAction func oneButtonClicked(sender:UIButton){
        sendClickedEvent(0 , sender: sender)
    }
    @IBAction func twoButtonClicked(sender:UIButton){
        sendClickedEvent(1 , sender: sender)
    }
    @IBAction func threeButtonClicked(sender:UIButton){
        sendClickedEvent(2 , sender: sender)
    }
    @IBAction func fourButtonClicked(sender:UIButton){
        sendClickedEvent(3 , sender: sender)
    }
    @IBAction func fiveButtonClicked(sender:UIButton){
        sendClickedEvent(4 , sender: sender)
    }
    
    func sendClickedEvent(index:Int , sender:UIButton){
//        if cellButtonDelagate != nil{
//            cellButtonDelagate?.buttonIncellClicked(index , sender: sender)
//        }
    }
}

//protocol TableviewCellDelegate{
//    func buttonIncellClicked(index:Int , sender:UIButton)
//}
