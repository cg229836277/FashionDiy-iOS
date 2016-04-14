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
    var malePositiveSourceCount = 0
    
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
        
        modelButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFill)
        photoButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFill)
        wordButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFill)
        iconButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFill)
        styleButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFill)
        
        clothTableView.delegate = self
        clothTableView.dataSource = self
        malePositiveSourceCount = clothSource.malePositiveSources.count
        
        let cellNib = UINib(nibName: "ClothSourceCell", bundle: nil)
        clothTableView.registerNib(cellNib, forCellReuseIdentifier: "cloth_item_cell")
        
        addSubview(view)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let remain = malePositiveSourceCount % 5
        let counts = malePositiveSourceCount / 5
        return remain == 0 ? counts : counts + 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "cloth_item_cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ClothSourceCell
        let row = indexPath.row
        
        let firstCount = row * 5 + 0
        let secondCount = row * 5 + 1
        let thirdCount = row * 5 + 2
        let fourthCount = row * 5 + 3
        let fifthCount = row * 5 + 4
        
        if !isOverArray(firstCount) {
            let imageName = clothSource.malePositiveSources[firstCount]
            print("imagename is \(imageName)")
            cell.firstButton.imageView?.image = UIImage(named: imageName + ".png")
        }
        /*
        if !isOverArray(secondCount) {
            cell.secondButton.imageView?.image = UIImage(named: clothSource.malePositiveSources[secondCount])
        }
        if !isOverArray(thirdCount) {
            cell.thirdButton.imageView?.image = UIImage(named: clothSource.malePositiveSources[thirdCount])
        }
        if !isOverArray(fourthCount) {
            cell.fourthButton.imageView?.image = UIImage(named: clothSource.malePositiveSources[fourthCount])
        }
        if !isOverArray(fifthCount) {
            cell.fifthButton.imageView?.image = UIImage(named: clothSource.malePositiveSources[fifthCount])
        }*/
        return cell
    }
    
    func isOverArray(index : Int) -> Bool{
        return index >= malePositiveSourceCount ? true : false
    }

}
