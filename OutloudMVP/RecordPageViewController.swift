//
//  RecordPageViewController.swift
//  OutloudMVP
//
//  Created by Peyman Mortazavi on 10/11/15.
//  Copyright © 2015 Outloud. All rights reserved.
//

import Foundation
import UIKit

class RecordPageViewController : UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        
        // Bottom View
        let bottomView = UIView();
        bottomView.backgroundColor = controlBarColor;
        self.view.addSubview(bottomView);
        
        bottomView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view);
            make.height.equalTo(80);
            make.bottom.equalTo(self.view);
        };
        
        
        // Progress View
        let progressView = UIView();
        progressView.layer.borderColor = progressBarColor.CGColor;
        progressView.layer.borderWidth = 0.5;
        self.view.addSubview(progressView);
        
        progressView.snp_makeConstraints{ (make) -> Void in
            make.width.equalTo(self.view);
            make.height.equalTo(20);
            make.bottom.equalTo(bottomView.snp_top);
        };
        
        let filledProgress = UIView();
        filledProgress.backgroundColor = progressBarColor;
        progressView.addSubview(filledProgress);
        filledProgress.snp_makeConstraints{ (make) -> Void in
            make.width.equalTo(progressView).dividedBy(4);
            make.height.top.left.equalTo(progressView);
        }
        
        let progressLabel = UILabel();
        progressLabel.text = "Section 1";
        progressLabel.font = UIFont(name: "Avenir-Light", size: 10);
        progressLabel.textColor = UIColor.blackColor();
        progressView.addSubview(progressLabel);
        
        progressLabel.snp_makeConstraints{ (make) -> Void in
            make.left.equalTo(progressView).offset(5);
            make.top.height.equalTo(progressView);
            make.width.equalTo(progressView).offset(64);
        };
        
        
        // Article Info Section
    }
    
}