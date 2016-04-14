import UIKit

@IBDesignable
class CustomButton : UIButton {
    let IMAGE_RATIO :CGFloat = 1  // 图片占整个按钮高度的比例
    let TITLE_FONT:CGFloat = 0   // 设置按钮标题字体默认的大小
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImageAndTitle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setImageAndTitle()
    }
    
    func setImageAndTitle(){
        self.titleLabel?.text = ""
    }
    
    func setImageContentMode(mode mode:UIViewContentMode){
        self.imageView?.contentMode = mode  // 设置图片显示的模式
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageX:CGFloat = 0
        let imageY:CGFloat = 0
        let imageW:CGFloat = self.frame.size.width
        let imageH:CGFloat = self.frame.size.height * IMAGE_RATIO
        return CGRectMake(imageX, imageY, imageW, imageH)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleX:CGFloat = 0
        let titleY:CGFloat = 0
    
        let titleW:CGFloat = 0
        let titleH:CGFloat = 0
    
        return CGRectMake(titleX, titleY, titleW, titleH)
    }
    
}
