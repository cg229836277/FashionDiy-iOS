//
//  MaleDesignViewController.swift
//  FashionDiy
//
//  Created by chuck chan on 16/3/30.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import UIKit

class DesignViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var coupleFemaleBackImageView: UIImageView!
    @IBOutlet weak var coupleFemaleFrontImageView: UIImageView!
    
    @IBOutlet weak var contentTabelView: UITableView!
    @IBOutlet weak var maleBottomDesignView: BottomChooseView!
    
    @IBOutlet weak var designTitleSegment: UISegmentedControl!
    
    //整个设计区域的父视图
    @IBOutlet weak var designParentView: UIView!
    
    var clothSource = ClothSource()
    var designDataSourceCount = 0
    
    var currentDesignType = -1
    let MALE_DESIGN = 0
    let FEMALE_DESIGN = 1
    let COUPLE_DESIGN = 2
    
    let BUTTONS_PER_CELL = 5
    
    var currentPositiveClothData:[String]?
    var currentNegativeClothData:[String]?
    
    var currentFemalePositiveClothData:[String]?
    var currentFemaleNegativeClothData:[String]?
    
    var currentDesignData:[String]?
    
    @IBOutlet weak var cameraParentView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSegmentController()
        
        frontImageView.userInteractionEnabled = true
        backImageView.userInteractionEnabled = true
        
        coupleFemaleFrontImageView.userInteractionEnabled = true
        coupleFemaleBackImageView.userInteractionEnabled = true
        
        frontImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "designClothClicked:"))
        backImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "designClothClicked:"))
        coupleFemaleFrontImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "designClothClicked:"))
        coupleFemaleBackImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "designClothClicked:"))
        
        //print("source count \(malePositiveSourceCount)")
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.translucent = false
        
        initTableView()
        initButtonClickEvent()
        initMainDesignView()
    }
    
    func initTableView(){
        contentTabelView.delegate = self
        contentTabelView.dataSource = self
        let cellNib = UINib(nibName: "ClothSourceCell", bundle: nil)
        contentTabelView.registerNib(cellNib, forCellReuseIdentifier: "cloth_item_cell")
    }
    
    func initSegmentController(){
        switch currentDesignType{
        case MALE_DESIGN:
            print("male design")
            initMaleDesignData()
        case FEMALE_DESIGN:
            print("female design")
            initFemaleDesignData()
        case COUPLE_DESIGN:
            print("couple design")
            initCoupleDesignData()
        default:
            break
        }
    }
    
    func initMaleDesignData(){
        frontImageView.image = UIImage(named: "design_source_cloth_white_positive")
        backImageView.image = UIImage(named: "design_source_cloth_white_negative")
        currentPositiveClothData = clothSource.malePositiveSources
        currentNegativeClothData = clothSource.maleNegativeSources
        currentDesignData = self.currentPositiveClothData
        designDataSourceCount = clothSource.malePositiveSources.count
    }
    
    func initFemaleDesignData(){
        frontImageView.image = UIImage(named: "design_source_female_ts_cloth_white_positive")
        backImageView.image = UIImage(named: "design_source_female_ts_cloth_white_negative")
        currentPositiveClothData = clothSource.femalePositiveSources
        currentNegativeClothData = clothSource.femaleNegativeSources
        currentDesignData = self.currentPositiveClothData
        designDataSourceCount = clothSource.femalePositiveSources.count
    }
    
    func initCoupleDesignData(){
        designTitleSegment.insertSegmentWithTitle("女前", atIndex: 2, animated: true)
        designTitleSegment.insertSegmentWithTitle("女后", atIndex: 3, animated: true)
        designTitleSegment.setTitle("男前", forSegmentAtIndex: 0)
        designTitleSegment.setTitle("男后", forSegmentAtIndex: 1)
        
        frontImageView.image = UIImage(named: "design_source_cloth_white_positive")
        backImageView.image = UIImage(named: "design_source_cloth_white_negative")
        coupleFemaleFrontImageView.image = UIImage(named: "design_source_female_ts_cloth_white_positive")
        coupleFemaleBackImageView.image = UIImage(named: "design_source_female_ts_cloth_white_negative")
        
        currentPositiveClothData = clothSource.malePositiveSources
        currentNegativeClothData = clothSource.maleNegativeSources
        
        currentFemalePositiveClothData = clothSource.femalePositiveSources
        currentFemaleNegativeClothData = clothSource.femaleNegativeSources
        
        currentDesignData = self.currentPositiveClothData
        designDataSourceCount = clothSource.femalePositiveSources.count
    }
    
    func initButtonClickEvent(){
        maleBottomDesignView.styleButton.addTarget(self, action: "styleButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        maleBottomDesignView.photoButton.addTarget(self, action: "takePhotoButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func initMainDesignView(){
        var mainDesignView = UIImageView()
        mainDesignView.translatesAutoresizingMaskIntoConstraints = false
        designParentView.addSubview(mainDesignView)
        
        let parentWidth = designParentView.frame.width
        let parentHeight = designParentView.frame.height
        print("parent width = \(parentWidth) , parent height = \(parentHeight)")
        
        let designFrameWidth = parentWidth / 2
        let designFrameHeight = parentHeight / 3
        print("designFrameWidth = \(designFrameWidth) , designFrameHeight = \(designFrameHeight)")
        
        let widthConstraint = NSLayoutConstraint(item: mainDesignView, attribute: .Width, relatedBy: .Equal,
            toItem: nil, attribute: .Width, multiplier: 1.0, constant: designFrameWidth)
        mainDesignView.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: mainDesignView, attribute: .Height, relatedBy: .Equal,
            toItem: nil, attribute: .Width, multiplier: 1.0, constant: designFrameHeight)
        mainDesignView.addConstraint(heightConstraint)
        
        let xConstraint = NSLayoutConstraint(item: mainDesignView, attribute: .CenterX, relatedBy: .Equal, toItem: self.designParentView, attribute: .CenterX, multiplier: 1, constant: 0)
        
        let yConstraint = NSLayoutConstraint(item: mainDesignView, attribute: .CenterY, relatedBy: .Equal, toItem: self.designParentView, attribute: .CenterY, multiplier: 1, constant: 0)
        mainDesignView.addConstraint(xConstraint)
        mainDesignView.addConstraint(yConstraint)
    
    }
    
    @IBAction func designClothClicked(sender:UIImageView){
        if !contentTabelView.hidden{
            contentTabelView.hidden = true
        }
        if !cameraParentView.hidden{
            cameraParentView.hidden = true
        }
    }
    
    @IBAction func backAndFrontSelected(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            currentDesignData = self.currentPositiveClothData
            backImageView.hidden = true
            frontImageView.hidden = false
            coupleFemaleBackImageView.hidden = true
            coupleFemaleFrontImageView.hidden = true
            reloadTableViewData()
        case 1:
            currentDesignData = self.currentNegativeClothData
            backImageView.hidden = false
            frontImageView.hidden = true
            coupleFemaleBackImageView.hidden = true
            coupleFemaleFrontImageView.hidden = true
            reloadTableViewData()
        case 2:
            currentDesignData = self.currentFemalePositiveClothData
            backImageView.hidden = true
            frontImageView.hidden = true
            coupleFemaleBackImageView.hidden = true
            coupleFemaleFrontImageView.hidden = false
            reloadTableViewData()
        case 3:
            currentDesignData = self.currentFemaleNegativeClothData
            backImageView.hidden = true
            frontImageView.hidden = true
            coupleFemaleBackImageView.hidden = false
            coupleFemaleFrontImageView.hidden = true
            reloadTableViewData()
        default:
            break;
        }
    }
    
    func reloadTableViewData(){
        if !contentTabelView.hidden{
            contentTabelView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let remain = designDataSourceCount % BUTTONS_PER_CELL
        let counts = designDataSourceCount / BUTTONS_PER_CELL
        return remain == 0 ? counts : counts + 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //let cellIdentifier = "cloth_item_cell"
        let cell = tableView.dequeueReusableCellWithIdentifier("cloth_item_cell", forIndexPath: indexPath) as! ClothSourceCell
        let row = indexPath.row
        
        //print("invoke cell for row at index path")
        
        let firstCount = row * BUTTONS_PER_CELL + 0
        let secondCount = row * BUTTONS_PER_CELL + 1
        let thirdCount = row * BUTTONS_PER_CELL + 2
        let fourthCount = row * BUTTONS_PER_CELL + 3
        let fifthCount = row * BUTTONS_PER_CELL + 4
        
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
        let imageName:String = currentDesignData![index]
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
        //print("index is \(index) , source count \(malePositiveSourceCount)")
        return index >= designDataSourceCount ? true : false
    }
    
    @IBAction func oneButtonClicked(sender:UIButton){
        //print("1button tag is \(sender.tag)")
        setDesignCloth(sender.tag * BUTTONS_PER_CELL + 0)
    }
    @IBAction func twoButtonClicked(sender:UIButton){
        //print("2button tag is \(sender.tag)")
        setDesignCloth(sender.tag * BUTTONS_PER_CELL + 1)
    }
    @IBAction func threeButtonClicked(sender:UIButton){
        //print("3button tag is \(sender.tag)")
        setDesignCloth(sender.tag * BUTTONS_PER_CELL + 2)
    }
    @IBAction func fourButtonClicked(sender:UIButton){
        //print("4button tag is \(sender.tag)")
        setDesignCloth(sender.tag * BUTTONS_PER_CELL + 3)
    }
    @IBAction func fiveButtonClicked(sender:UIButton){
        //print("5button tag is \(sender.tag)")
        setDesignCloth(sender.tag * BUTTONS_PER_CELL + 4
        )
    }
    
    func setDesignCloth(index:Int){
        if frontImageView.hidden{
            frontImageView.image = UIImage(named: currentPositiveClothData![index])
            backImageView.image = UIImage(named: currentDesignData![index])
        }else{
            frontImageView.image = UIImage(named: currentDesignData![index])
            backImageView.image = UIImage(named: currentNegativeClothData![index])
        }
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
        cameraParentView.hidden = true
        if contentTabelView.hidden{
            contentTabelView.hidden = false
        }else{
            contentTabelView.hidden = true
        }
    }
    
    @IBAction func takePhotoButtonClicked(sender:UIButton){
        contentTabelView.hidden = true
        if cameraParentView.hidden{
            cameraParentView.hidden = false
        }else{
            cameraParentView.hidden = true
        }
    }
    
    
    @IBAction func picturesSetClicked(sender: UIButton) {
        let isSupportPhotoLibrary = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)
        if isSupportPhotoLibrary{
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: { () -> Void in
                
            })
            
        }else{
            print("打开相册出错")
        }
    }
    
    @IBAction func takePhotosClicked(sender: UIButton) {
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chooseImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        picker.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
