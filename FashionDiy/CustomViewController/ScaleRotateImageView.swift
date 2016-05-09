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
    weak var view:UIView!
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var deleteButton: CustomButton!
    
    @IBOutlet weak var actionButton: CustomButton!
    
//    var delegate: ChildViewDeletedDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(){
        view = loadViewFromXib()
        //view.frame = bounds
        //view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth , UIViewAutoresizing.FlexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = false
        setParentViewEvent()
        addSubview(view)
    }
    
    func loadViewFromXib() -> UIView{
        let bundle = NSBundle(forClass: self.dynamicType)
        let xib = UINib(nibName: String(self.dynamicType), bundle: bundle)
        let view = xib.instantiateWithOwner(self, options: nil).first as! UIView
        return view
    }
    
    func setParentViewEvent(){
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "childContentClicked:"))
    }
    
    @IBAction func childContentClicked(sender:UIView){
        deleteButton.hidden ? (deleteButton.hidden = false) : (deleteButton.hidden = true)
        actionButton.hidden ? (actionButton.hidden = false) : (actionButton.hidden = true)
    }
    
    @IBAction func deleteButtonClicked(sender: CustomButton) {
//        if delegate != nil{
//            delegate?.didDeletedChildView(self)
//        }
        self.removeFromSuperview()
    }
    
    @IBAction func actionButtonClicked(sender: CustomButton) {
        
    }
    
    func setImage(image:UIImage){
        contentImageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentImageView.image = image
    }
    
}

//protocol ChildViewDeletedDelegate{
//    func didDeletedChildView(view: UIView)
//}
