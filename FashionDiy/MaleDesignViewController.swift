//
//  MaleDesignViewController.swift
//  FashionDiy
//
//  Created by chuck chan on 16/3/30.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class MaleDesignViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var backDesignImage: UIImageView!
    
    @IBOutlet weak var FrontDesignImage: UIImageView!
    
    @IBOutlet weak var maleBottomDesignView: BottomChooseView!
    
    
    var clothSource = ClothSource()
    var malePositiveSourceCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
        
        initTableView()
    }
    
    func initTableView(){
        maleBottomDesignView.clothTableView.delegate = self
        maleBottomDesignView.clothTableView.dataSource = self
        let cellNib = UINib(nibName: "ClothSourceCell", bundle: nil)
        maleBottomDesignView.clothTableView.registerNib(cellNib, forCellReuseIdentifier: "cloth_item_cell")
        malePositiveSourceCount = clothSource.malePositiveSources.count
    }
    
    @IBAction func backAndFrontSelected(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            backDesignImage.hidden = true
            FrontDesignImage.hidden = false
        case 1:
            backDesignImage.hidden = false
            FrontDesignImage.hidden = true
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
        
        let firstCount = row * 5 + 0
        let secondCount = row * 5 + 1
        let thirdCount = row * 5 + 2
        let fourthCount = row * 5 + 3
        let fifthCount = row * 5 + 4
        
        print("firstCount = \(firstCount)")
        
        if !isOverArray(firstCount) {
            let imageName:String = clothSource.malePositiveSources[firstCount]
            print("imagename is \(imageName)")
            cell.oneButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
            let image = UIImage(named: imageName)
            if image != nil{
                cell.oneButton.setImage(image: image!)
            }else{
                print("image1 is nil")
            }
        }
        
        if !isOverArray(secondCount) {
            let imageName:String = clothSource.malePositiveSources[secondCount]
            print("imagename is \(imageName)")
            cell.twoButton.setImageContentMode(mode: UIViewContentMode.ScaleAspectFit)
            let image = UIImage(named: imageName)
            if image != nil{
                cell.twoButton.setImage(image: image!)
            }else{
                print("image2 is nil")
            }
        }
//        if !isOverArray(thirdCount) {
//        cell.thirdButton.imageView?.image = UIImage(named: clothSource.malePositiveSources[thirdCount])
//        }
//        if !isOverArray(fourthCount) {
//        cell.fourthButton.imageView?.image = UIImage(named: clothSource.malePositiveSources[fourthCount])
//        }
//        if !isOverArray(fifthCount) {
//        cell.fifthButton.imageView?.image = UIImage(named: clothSource.malePositiveSources[fifthCount])
//        }
        return cell
    }
    
    func isOverArray(index : Int) -> Bool{
        return index >= malePositiveSourceCount ? true : false
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait,UIInterfaceOrientationMask.PortraitUpsideDown]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
