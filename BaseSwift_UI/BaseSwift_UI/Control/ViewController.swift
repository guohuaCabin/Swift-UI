//
//  ViewController.swift
//  BaseSwift_UI
//
//  Created by 秦国华 on 2016/11/15.
//  Copyright © 2016年 秦国华. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UITextFieldDelegate,UITextViewDelegate{

    let viewWidth:CGFloat   = UIScreen.main.bounds.size.width
    let viewHeight:CGFloat  = UIScreen.main.bounds.size.height
    
    var page1ViewY:CGFloat = 70.0
    var page2ViewY:CGFloat = 70.0
    
    
    
    var adjustViewY = true
    
    
    var baseView : UIView!
    
    var textField: UITextField!
    
    var textView : UITextView!
    var slider   : UISlider!
    var stepper  : UIStepper!
    var scrollView : UIScrollView!
    var activityIndicatorView:UIActivityIndicatorView!
    var progressView : UIProgressView!
    
    
    
    var webVC                       = WebViewController()
    var ImageViewVC                 = ImageViewController()
    var pickerViewAndDatePickerVC   = PickerViewAndDatePicker()
    var scrollViewAndPageControlVC  = ScrollViewAndPageControl()
    var tableViewVC                 = TableViewController()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        CreateNavgationBar()
        
        print("now ,study Swift!")
        
        //创建scrollView
        createScrollView()
        
        //创建view
        createView()
        //创建label
        createLabel()
        
        //创建button
        createBtton()
        
        //创建textField
        createTextField()
        
        //监听键盘
        notificationMonitorKeyboard()
        
        //创建textView
        createTextView()
        
        //创建Slider
        createSlider()
        
        //创建Stepper 记步控件
        createStepper()
        
        //创建UISwitch
        createSwitch()
        
        //创建功能按钮
        createFunctionButton()
        
        //创建SegmentedControl
        createSegmentedControl()
        
        //创建UIProgressView
        createProgressView()
        
        //创建label
        createLabelExplain()
    }
    //MARK: ************创建label************
    func createLabelExplain(){
        let label = UILabel(frame:CGRect(x:10,y:page1ViewY,width:viewWidth-20,height:90))
        
        label.text = "左滑显示其他控件介绍，点击tableView显示Swift其他学习，若功能未实现，在之后会一步步实现。"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        label.layer.borderColor = UIColor.purple.cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.layer.cornerRadius = 5.0
        
        scrollView.addSubview(label)
        
    }
    
    //MARK: ************ 创建UIProgressView（进度条视图） ********************
    func createProgressView() {
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.frame = CGRect(x: 20, y: page1ViewY, width: viewWidth-40, height: 40)
        
        print("progressView的Frame为:\(progressView.frame)")//我们可以看出，progressView的height是系统给出的默认值，和UIStepper、UISwitch是一样的。
        
        //通过变形改变进度条高度（ 横向宽度不变，纵向高度变成默认的5倍）
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 3.0)
        
        //默认进度
        progressView.progress = 0.3 // 0.0 .. 1.0
        
        //设置进度条颜色
        progressView.progressTintColor = UIColor.green //已有进度颜色
        
        progressView.trackTintColor = UIColor.purple  //剩余进度颜色（即进度槽颜色）
        
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        
        progressView.layer.borderColor = UIColor.black.cgColor
        
        progressView.layer.borderWidth = 0.2
        
        scrollView.addSubview(progressView)
        
        page1ViewY += 50
    }
    
    @discardableResult
    //MARK: *********** 创建UISegmentedControl ***************
    func createSegmentedControl() -> UISegmentedControl {
        let item = ["一","二","三","四"]
        
        let segmentedControl = UISegmentedControl(items: item)
        
        segmentedControl.frame = CGRect(x: 20, y: page1ViewY, width: viewWidth-40, height: 50)
        
        //设置边框和文字内的颜色
        segmentedControl.tintColor = UIColor.brown
        
        //默认选择
        segmentedControl.selectedSegmentIndex = 1
        
        //设置下标为3的title
        segmentedControl.setTitle("点击第三个 ", forSegmentAt: 2)
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlClicked(_:)), for: .valueChanged)
        
        scrollView.addSubview(segmentedControl)
        
        /**
         //修改选项内容偏移位置
         segmentedControl.setContentOffset(CGSize(width:10, height:7), forSegmentAt:1)
         
         //新增文字选项
         segmentedControl.insertSegment(withTitle: "新增选项", at: 2, animated: true)
         //添加图片选项
         segmentedControl.insertSegment(with: UIImage(named:"icon"), at: 1, animated: true)
         //移除固定选项
         segmentedControl.removeSegment(at: 1, animated: true)
         //移除所有选项
         segmentedControl.removeAllSegments()
         */

        page1ViewY += 70
        
        return segmentedControl
        
        
        
    }
    //MARK: *********** segmentedControl 点击事件 ************
    func segmentedControlClicked(_ segmentedControl:UISegmentedControl ) {
        
        //获取选择的文字
        print(segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) ?? "默认值：000")
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("cilcked \(segmentedControl.selectedSegmentIndex+1)个按钮")
        case 1:
           print("i am \(segmentedControl.selectedSegmentIndex+1)个按钮")
        case 2:
            print("it`s \(segmentedControl.selectedSegmentIndex+1)个按钮")
        case 3:
            print("but me , is \(segmentedControl.selectedSegmentIndex+1)个按钮")
        default:
            break
        }
    }
    
    //MARK: *********** 创建UIActivityIndicatorView ***********
    func createActivityIndicatorView() {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        activityIndicatorView.frame = CGRect(x: self.view.center.x + viewWidth, y: self.view.center.y, width: 0, height: 0)
        
        activityIndicatorView.color = UIColor.purple
        
        activityIndicatorView.backgroundColor = UIColor.gray
        

        scrollView.addSubview(activityIndicatorView)
        
        activityIndicatorView.startAnimating()
        
        //延时执行（也可以使用一次性定时器）
        
        self.perform(#selector(delayAction), with: nil, afterDelay: 2.0)
        //或者
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int(2 * NSEC_PER_SEC))/Double(NSEC_PER_SEC)) {
//            self.activityIndicatorView.stopAnimating()
//            
//            self.activityIndicatorView.hidesWhenStopped = true
//        }
    }
    //MARK: ******** 延迟执行的方法 ***********
    func delayAction(){
        self.activityIndicatorView.stopAnimating()
        
        self.activityIndicatorView.hidesWhenStopped = true
    }
    //MARK: *********** 创建UIActionSheetStyle **********
    func createActionSheetStyle (_ message:String) {
        let ActionSheetAlartController = UIAlertController(title: "hehe", message: message, preferredStyle: .actionSheet)
        
        let OKSure = UIAlertAction(title: "Sure", style: .default) { (UIAlertAction) ->Void in
            print("click Sure")
        }
        
        let Cancel  = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction)->Void in
            print("click cancel")
        }
        
        ActionSheetAlartController.addAction(OKSure)
        ActionSheetAlartController.addAction(Cancel)
        
        self.present(ActionSheetAlartController, animated: true, completion: nil)
        
    }
    
    //MARK: *********** 创建ScrollView ********
    func createScrollView()  {
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        //是否分页
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: viewWidth*2, height: viewHeight)
        self.view.addSubview(scrollView)
  
    }
    //MARK: *********** 连环按钮 ************
    func createFunctionButton() {
        
        let buttonTitle = ["click ->UIActionSheet","click -> UIImageView","click -> DatePicker and UIPickerView","click -> UIScrollView and UIPageControl","click -> UITableView","click -> UIActivityIndicatorView",]
        
        for  i  in 0..<buttonTitle.count {
            
          let functionButton = UIButton(frame: CGRect(x: 20 + viewWidth, y: page2ViewY, width:viewWidth - 40, height: 50))
            
            functionButton.setTitle(buttonTitle[i], for: .normal)
            
            functionButton.setTitleColor(UIColor.black, for: .normal)
            
            functionButton.setTitleColor(UIColor.brown, for: .selected)
            
            functionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            
            functionButton.layer.borderColor = UIColor.black.cgColor
            functionButton.layer.borderWidth = 2
            
            functionButton.layer.cornerRadius = 8.0
            functionButton.clipsToBounds = true
            
            functionButton.addTarget(self, action: #selector(functionButtonClicked(_:)), for: UIControlEvents.touchUpInside)
            
            functionButton.tag = i
            
            scrollView.addSubview(functionButton)
            
            page2ViewY += 60
            
        }
    }
    //MARK: ***********功能点击事件************
    func functionButtonClicked(_ functionButton:UIButton) {
        print("click %\(functionButton.titleLabel?.text)")
        
        switch functionButton.tag {
        case 0:
            createActionSheetStyle("Hi ,friend")
        case 1:
            self.navigationController?.pushViewController(ImageViewVC, animated: true)
        case 2:
            self.navigationController?.pushViewController(pickerViewAndDatePickerVC, animated: true)
        case 3:
            self.navigationController?.pushViewController(scrollViewAndPageControlVC, animated: true)
        case 4:
            self.navigationController?.pushViewController(tableViewVC, animated: true)
        case 5:
            createActivityIndicatorView()

        default:
            break
        }
        
        
    }
    
    //MARK: ************** UISwitch ***********
    func createSwitch() {
        let stepper = self.view.viewWithTag(300)

        let Switch = UISwitch(frame: CGRect(x: (stepper?.bounds.size.width)!+50, y: page1ViewY, width: 70, height: 30))
        
        Switch.isOn = true
        
        //打开后的switch颜色
        Switch.onTintColor = UIColor.orange
        
//        关闭后的switch的边框颜色
        Switch.tintColor = UIColor.black
        
        //纽扣的颜色
        Switch.thumbTintColor = UIColor.black
        
        
        
        Switch.addTarget(self, action: #selector(switchDidChange(_:)), for: .valueChanged)
        
       scrollView.addSubview(Switch)
        
        page1ViewY += 50
        
    }
    
    //MARK: ********** Switch事件 ***********
    func switchDidChange(_ Switch:UISwitch) {
        
        if Switch.isOn == true {
            stepper.autorepeat = true
        }else{
            stepper.autorepeat = false
        }
        
        print(Switch.isOn)
    }
    
    //MARK: **************UIStepper************
    func createStepper() {
        stepper = UIStepper(frame: CGRect(x: 10, y: page1ViewY, width: viewWidth-20, height: 30))
        stepper.tag = 300
//        stepper.backgroundColor = UIColor.gray
        
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        
        //增减的值
        stepper.stepValue = 2
        stepper.value = 70
        
//        即每次改变都是value ± stepValue，然后将最终的值限制在[minimumValue,maximumValue]区间内。
        
        //判断是否循环,即到最大值后又从最小值开始.
        stepper.wraps = true
        
        //长按可以连续
        stepper.isContinuous = true
        
        //设置长按是否一直触发变化，true时，长按可以连续
        stepper.autorepeat = true
        
        //设置按钮的颜色
        stepper.tintColor = UIColor.orange
        
        stepper.addTarget(self, action: #selector(stepperClicked(_stepper:)), for: UIControlEvents.valueChanged)
        
        
        scrollView.addSubview(stepper)
         
    }
    //MARK:**************UIStepper点击事件*************
    func stepperClicked(_stepper:UIStepper) {

        self.slider.value = Float(_stepper.value)
        
        let value:Double = _stepper.value * 0.01
        
        
        self.progressView.setProgress(Float(value), animated: true)
    }
    
    
    //MARK: ************创建UISlider*********
    func createSlider(){
       self.slider = UISlider(frame: CGRect(x: 10, y: page1ViewY, width: viewWidth-20, height: 30))
        
        
        self.slider.minimumValue = 0
        
        self.slider.maximumValue = 100
        
        self.slider.minimumTrackTintColor = UIColor.purple
        
        self.slider.maximumTrackTintColor = UIColor.orange
        
        self.slider.value = 70
        
        self.slider.thumbTintColor = UIColor.brown
        
        
        scrollView.addSubview(self.slider)
        
        page1ViewY += 40
        
    }
    
    
    //MARK: ************创建导航栏****************
    func CreateNavgationBar() {
        let leftBarButton = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(barButtonClicked(_:)))
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        
        let rightBarButton = UIBarButtonItem.init(title: "^_^||", style: .plain, target: self, action: #selector(barButtonClicked(_:)))
        
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    //MARK: ************barButton点击事件***********
    func barButtonClicked(_ sender:UIBarButtonItem) {
        creatAlertView(message: "click barButton")
    }
    @discardableResult
    //MARK: *********创建textView******************
    func createTextView() -> UITextView {
        self.textView = UITextView(frame: CGRect(x: 2, y: page1ViewY, width: viewWidth-4, height: 100))
        self.textView.delegate = self
        
        self.textView.bounces  = true
        
        self.textView.text = "it`s UITextView"
        
        self.textView.font = UIFont.systemFont(ofSize: 17)
        
        self.textView.layer.borderColor = UIColor.black.cgColor
        self.textView.layer.borderWidth = 2;
        
        self.textView.clipsToBounds = true
        self.textView.layer.cornerRadius = 5
        
        self.textView.tag = 200
//        self.textView.backgroundColor = UIColor.orange
        
        scrollView.addSubview(self.textView)
    
        page1ViewY += 110
        
        return self.textView
        
    }
    //MARK: *********通知监听键盘显示和隐藏***********
    func notificationMonitorKeyboard(){
        
        //键盘显示通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(_:)) , name: .UIKeyboardWillShow, object: nil)
        //键盘隐藏通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
        
    }
    
    
    //键盘显示事件
    func keyBoardWillShow(_ notification:Notification) {
        
        var frame = self.view.frame
        if adjustViewY {
           frame.origin.y -= 50
            adjustViewY = false
        }

        self.view.frame = frame
        
    }
    //键盘隐藏事件
    func keyBoardWillHide(_ notification:Notification) {
        self.textField.resignFirstResponder()
        
        var frame = self.view.frame
        
        if !adjustViewY {
           frame.origin.y += 50
            adjustViewY = true
        }
        
        
        self.view.frame = frame
        
        
    }
    
    //MARK: **********创建textField***********
    func createTextField(){
        self.textField = UITextField(frame: CGRect(x: 2, y: page1ViewY, width: viewWidth-4, height: 80))
        
        self.textField.delegate = self
        
        self.textField.layer.cornerRadius = 5.0
        self.textField.clipsToBounds = true
        
        //设置圆角，但不能设置边线
        self.textField.borderStyle = UITextBorderStyle.roundedRect
        
        self.textField.layer.borderWidth = 2
        self.textField.layer.borderColor = UIColor.brown.cgColor
        
        self.textField.placeholder = "please input words,it`s textField"
        
        self.textField.clearButtonMode = UITextFieldViewMode.whileEditing
        
        self.textField.keyboardType = UIKeyboardType.namePhonePad
        
        self.textField.keyboardAppearance = UIKeyboardAppearance.default
        
        self.textField.returnKeyType = UIReturnKeyType.done
        
        self.textField.adjustsFontSizeToFitWidth = true
        //设置最小可缩小字号
        self.textField.minimumFontSize = 14;
        
        self.textField.isSecureTextEntry = true
        
        
        self.textField.tag = 100
        
        //水平对齐
//        self.textField.textAlignment = .center
        
        //垂直对齐
//        self.textField.contentVerticalAlignment = .top
        
        scrollView.addSubview(self.textField)
        
        page1ViewY += 90
        
    }
    
    //MARK: **********创建View********
    func createView(){
        self.baseView = UIView(frame: CGRect(x: 2, y: page1ViewY, width: viewWidth-4, height: 110))
        
        self.baseView.backgroundColor = UIColor.white
        
        self.baseView.layer.borderColor = UIColor.black.cgColor
        self.baseView.layer.borderWidth = 2
        
        self.baseView.layer.cornerRadius = 5.0
        self.baseView.clipsToBounds = true
        scrollView.addSubview(self.baseView)
        
        page1ViewY += 120
        
    }
    
    //MARK: ************创建label************
    func createLabel(){
        let label = UILabel(frame:CGRect(x:10,y:10,width:viewWidth-20,height:40))
//        label.frame = CGRect(x:100,y:200,width:100,height:40)
        
        label.text = "label - >Swift3.0"
        label.textAlignment = .center
        
        label.font = UIFont.systemFont(ofSize: 17)
        
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.layer.cornerRadius = 5.0
        
        self.baseView.addSubview(label)
 
    }
    
    //MARK: **********创建button********
    @discardableResult
    func createBtton() -> (UIButton) {
        
        let button = UIButton(frame:CGRect(x:10,y:60,width:viewWidth-20,height:40))
        
        button.setTitle(" jump to WebViewController", for: .normal)
        button.setTitle("click button", for: .selected)
        button.setTitle("forbidden button", for: .disabled)
        
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.brown, for: .selected)
        button.setTitleColor(UIColor.cyan, for:  .disabled)
        
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
//        button.backgroundColor = UIColor.white
        
        button.layer.cornerRadius = 5.0
        
        button.layer.masksToBounds = true
        
        button.layer.borderColor = UIColor.brown.cgColor
        button.layer.borderWidth = 1
        
        button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        
        self.baseView.addSubview(button)

        return button
        
    }
    //MARK: ******button点击事件*******
    func buttonClicked(sender:UIButton) -> () {
        
        
//        creatAlertView(message: "If clicked Button?")
        
        print("clicked button ......")
        
        self.navigationController?.pushViewController(webVC, animated: true)
       
  
    }
    //MARK: ***********alertView 警告视图**********
    func creatAlertView(message:String) {
        
        let alertView = UIAlertController(title: "prompting!!!", message: message, preferredStyle:.alert)
        
        let defaultAction = UIAlertAction(title: "YES", style: .default) {
            defaultAction in

        }
        
        let cancelAction = UIAlertAction(title: "NO", style: .cancel,handler:nil)
        
        alertView.addAction(defaultAction)
        alertView.addAction(cancelAction)
        
        self.present(alertView, animated: true, completion: nil)
        
    }
    
    //MARK: *********textFieldDelegate***********
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        print(textField.text ?? "")
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        //设置输入字数不能超过30
        if textField.text?.characters.count == 30 {
            creatAlertView(message: "Words can't more than 30")
        }

        return true
        
    }
    
    //MARK: **************textViewDelegate**************
    func textViewDidChange(_ textView: UITextView) {
            //设置输入字数不能超过30
//        if textView.text.characters.count == 30 {
//            creatAlertView(message: "Words can't more than 30")
//        }
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        textView.text = ""
        
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        //输入回车字符，注销响应者，隐藏键盘。但如果这样，点击键盘return，不能实现换行
        if text == "\n" {
            textView .resignFirstResponder()
            return false
        }
        return true
    }
    //MARK: **********点击空白处注销第一响应，键盘回落**********
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    //MARK: ************视图消失时，将键盘隐藏，不然返回时界面会刷新闪动***********
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
        //注销通知
        NotificationCenter.default.removeObserver(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}








