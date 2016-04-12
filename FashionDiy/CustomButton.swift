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
        self.imageView?.contentMode = .ScaleAspectFit   // 设置图片显示的模式  居中
//        self.titleLabel?.textAlignment = .Center  // 文本文字居中显示
//        self.titleLabel?.font = UIFont.systemFontOfSize(TITLE_FONT) //文本文字默认大小
//        self.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)  // 文本文字默认颜色
    }
    
    
    
    /// 重写highlighted 状态
    
//    override var  highlighted : Bool {
//    set{
//    
//    }
//    get{
//    
//    
//    return false
//    }
//    
//    }
    
    
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        let imageX:CGFloat = 0
        let imageY:CGFloat = 0
        let imageW:CGFloat = self.frame.size.width
        let imageH:CGFloat = self.frame.size.height * IMAGE_RATIO
        return CGRectMake(imageX, imageY, imageW, imageH)
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        let titleX:CGFloat = 0
        let titleY:CGFloat = self.frame.size.height * IMAGE_RATIO
    
        let titleW:CGFloat = 0
        let titleH:CGFloat = self.frame.size.height * (1.0 - IMAGE_RATIO)
    
        return CGRectMake(titleX, titleY, titleW, titleH)
    }
    
}
