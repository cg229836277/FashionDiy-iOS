//
//  BottomChooseView.swift
//  FashionDiy
//
//  Created by chuck chan on 16/4/10.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit
@IBDesignable
class BottomChooseView: UIView , UITableViewDelegate , UITableViewDataSource{
    weak var view:UIView!
    
    @IBOutlet weak var modelButton: CustomButton!
    
    @IBOutlet weak var photoButton: CustomButton!
    
    @IBOutlet weak var wordButton: CustomButton!
    
    @IBOutlet weak var iconButton: CustomButton!
    
    @IBOutlet weak var styleButton: CustomButton!
    
    @IBOutlet weak var clothTableView: UITableView!
    
    var clothSource = ClothSource()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubview()
    }

    
    func loadViewFromXib() -> UIView{
        let bundle = NSBundle(forClass: self.dynamicType)
        let xib = UINib(nibName: String(self.dynamicType), bundle: bundle)
        let view = xib.instantiateWithOwner(self, options: nil).first as! UIView
        return view
    }
    
    func setupSubview(){
        view = loadViewFromXib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth , UIViewAutoresizing.FlexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        clothTableView.delegate = self
        clothTableView.dataSource = self
        addSubview(view)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var remain = clothSource.malePositiveSources.count % 5
        var counts = clothSource.malePositiveSources.count / 5
        return remain == 0 ? counts : counts + 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}
