//
//  TodayViewController.swift
//  ToDayDemo
//
//  Created by xiaobin liu on 2018/11/21.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import NotificationCenter

/*
 Today Extension只能通过openURL的方式来调起app，并且需要在info.plist文件中配置参数URL types，
 URL identifier为app的bundle ID，URL Schemes配置为app的scheme
 */

class TodayViewController: UIViewController, NCWidgetProviding {

    private lazy var oneButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.red
        temButton.setTitle("第一个", for: .normal)
        temButton.frame = CGRect(x: 20, y: 0, width: ((UIScreen.main.bounds.size.width - 20 - 20) - (20 * 4))/5, height: 100)
        temButton.addTarget(self, action: #selector(openURLContainingAPP), for: .touchUpInside)
        return temButton
    }()

    private lazy var twoButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.black
        temButton.setTitle("第二个", for: .normal)
        temButton.frame = CGRect(x: self.oneButton.frame.maxX + 20, y: 0, width: ((UIScreen.main.bounds.size.width - 20 - 20) - (20 * 4))/5, height: 100)
        temButton.addTarget(self, action: #selector(openURLContainingAPP), for: .touchUpInside)
        return temButton
    }()

    private lazy var threeButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.yellow
        temButton.setTitle("第三个", for: .normal)
                temButton.frame = CGRect(x: self.twoButton.frame.maxX + 20, y: 0, width: ((UIScreen.main.bounds.size.width - 20 - 20) - (20 * 4))/5, height: 100)
        temButton.addTarget(self, action: #selector(openURLContainingAPP), for: .touchUpInside)
        return temButton
    }()
    
    private lazy var fourButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.blue
        temButton.setTitle("第四个", for: .normal)
        temButton.frame = CGRect(x: self.threeButton.frame.maxX + 20, y: 0, width: ((UIScreen.main.bounds.size.width - 20 - 20) - (20 * 4))/5, height: 100)
        temButton.addTarget(self, action: #selector(openURLContainingAPP), for: .touchUpInside)
        return temButton
    }()
    
    
    private lazy var fiveButton: UIButton = {
        let temButton = UIButton(type: .custom)
        temButton.backgroundColor = UIColor.gray
        temButton.setTitle("第五个", for: .normal)
        temButton.frame = CGRect(x: self.fourButton.frame.maxX + 20, y: 0, width: ((UIScreen.main.bounds.size.width - 20 - 20) - (20 * 4))/5, height: 100)
        temButton.addTarget(self, action: #selector(openURLContainingAPP), for: .touchUpInside)
        return temButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //配置Today Extension展示视图的大小
        self.preferredContentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 100)

        self.view.addSubview(oneButton)
        self.view.addSubview(twoButton)
        self.view.addSubview(threeButton)
        self.view.addSubview(fourButton)
        self.view.addSubview(fiveButton)
    }
    
    
    @objc private func openURLContainingAPP() {
        
        if let url = URL(string: "XBWidgetDemo://") {
            extensionContext?.open(url, completionHandler: { (success) in
                    debugPrint(success)
            })
        }
//        self.extensionContext?.open(URL(string: "scheme://XBWidgetDemo")!, completionHandler: { (success) in
//            debugPrint(success)
//        })
    }
    
    
    /// MARK - 必须实现
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
