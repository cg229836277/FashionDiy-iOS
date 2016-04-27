//
//  MaleDesignViewController.swift
//  FashionDiy
//
//  Created by chuck chan on 16/3/30.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class MaleDesignViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var contentTabelView: UITableView!
    
    
    @IBOutlet weak var maleBottomDesignView: BottomChooseView!
    
    
    var clothSource = ClothSource()
    var malePositiveSourceCount = 0
    
    var isCellDelegateInit = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
        
        initTableView()
        initButtonClickEvent()
    }
    
    func initTableView(){
        contentTabelView.delegate = self
        contentTabelView.dataSource = self
        let cellNib = UINib(nibName: "ClothSourceCell", bundle: nil)
        contentTabelView.registerNib(cellNib, forCellReuseIdentifier: "cloth_item_cell")
        malePositiveSourceCount = clothSource.malePositiveSources.count
    }
    
    func initButtonClickEvent(){
        maleBottomDesignView.styleButton.addTarget(self, action: "styleButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    @IBAction func backAndFrontSelected(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            backImageView.hidden = true
            frontImageView.hidden = false
        case 1:
            backImageView.hidden = false
            frontImageView.hidden = true
        default:
            break;
        }
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
        //let cellIdentifier = "cloth_item_cell"
        let cell = tableView.dequeueReusableCellWithIdentifier("cloth_item_cell", forIndexPath: indexPath) as! ClothSourceCell
        let row = indexPath.row
        
        print("invoke cell for row at index path")
        
        let firstCount = row * 5 + 0
        let secondCount = row * 5 + 1
        let thirdCount = row * 5 + 2
        let fourthCount = row * 5 + 3
        let fifthCount = row * 5 + 4
        
        //print("firstCount = \(firstCount)")
        
        if !isOverArray(firstCount) {
            cell.oneButton.tag = row
            cell.oneButton.addTarget(self, action: "oneButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            initTableviewCell(cell.oneButton, index: firstCount)
        }
        
        if !isOverArray(secondCount) {
            cell.twoButton.tag = row
            cell.twoButton.addTarget(self, action: "twoButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            initTableviewCell(cell.twoButton, index: secondCount)
        }
        if !isOverArray(thirdCount) {
            cell.threeButton.tag = row
            cell.threeButton.addTarget(self, action: "threeButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            initTableviewCell(cell.threeButton, index: thirdCount)
        }
        if !isOverArray(fourthCount) {
            cell.fourButton.tag = row
            cell.fourButton.addTarget(self, action: "fourButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            initTableviewCell(cell.fourButton, index: fourthCount)
        }
        if !isOverArray(fifthCount) {
            cell.fiveButton.tag = row
            cell.fiveButton.addTarget(self, action: "fiveButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            initTableviewCell(cell.fiveButton, index: fifthCount)
        }
        return cell
    }
    
    func initTableviewCell(button:CustomButton ,index:Int){
        let imageName:String = clothSource.malePositiveSources[index]
        //print("imagename is \(imageName)")
        button.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
        let image = UIImage(named: imageName)
        if image != nil{
            button.setImage(image: image!)
        }else{
            print("\(imageName) is nil")
        }
    }
    
    func isOverArray(index : Int) -> Bool{
        return index >= malePositiveSourceCount ? true : false
    }
    
    @IBAction func oneButtonClicked(sender:UIButton){
        print("1button tag is \(sender.tag)")
    }
    @IBAction func twoButtonClicked(sender:UIButton){
        print("2button tag is \(sender.tag)")
    }
    @IBAction func threeButtonClicked(sender:UIButton){
        print("3button tag is \(sender.tag)")
    }
    @IBAction func fourButtonClicked(sender:UIButton){
        print("4button tag is \(sender.tag)")
    }
    @IBAction func fiveButtonClicked(sender:UIButton){
        print("5button tag is \(sender.tag)")
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait,UIInterfaceOrientationMask.PortraitUpsideDown]
    }
    
    //款式按钮点击事件
    @IBAction
    func styleButtonClicked(sender:UIButton){
        //print("choose style")
        if contentTabelView.hidden{
            contentTabelView.hidden = false
        }else{
            contentTabelView.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
