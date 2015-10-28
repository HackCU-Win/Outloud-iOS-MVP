//
//  RecordingCellGeneration.swift
//  OutloudMVP
//
//  Created by Frederik Lohner on 27/Oct/15.
//  Copyright © 2015 Outloud. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

func generateRecordingParagraphCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
    let paragraphCell = UITableViewCell(style: .Default, reuseIdentifier: "articleCell")
    paragraphCell.backgroundColor = backgroundColorAll
    let paragraph = UILabel()
    paragraphCell.addSubview(paragraph)
    paragraph.text = FullArticleContentArray[ParagraphCount].text
    paragraph.lineBreakMode = NSLineBreakMode.ByWordWrapping
    paragraph.numberOfLines = 0
    paragraph.snp_makeConstraints { (make) -> Void in
        make.left.equalTo(paragraphCell.snp_left).offset(30)
        make.right.equalTo(paragraphCell.snp_right).offset(-30)
        make.top.equalTo(paragraphCell.snp_top).offset(10)
    }
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .Justified
    paragraphStyle.lineSpacing = 3
    paragraphStyle.firstLineHeadIndent = 0.001
    
    let mutableAttrStr = NSMutableAttributedString(attributedString: paragraph.attributedText!)
    mutableAttrStr.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, mutableAttrStr.length))
    paragraph.attributedText = mutableAttrStr
    paragraph.font = recordArticleParagraphFont
    
    paragraphCell.selectionStyle = .None

    return paragraphCell
}

func generateRecordingHeaderCell(tableView : UITableView) -> UIView {
    let headerView = UIView()
    let authorName = UILabel()
    
    //    .addSubview(headerView)
    headerView.addSubview(authorName)
    headerView.backgroundColor = backgroundColorAll
    
    let articleTitle = UILabel()
    headerView.addSubview(articleTitle)
    
    articleTitle.text = ArticleDetailArray[0].title
    articleTitle.lineBreakMode = NSLineBreakMode.ByWordWrapping
    articleTitle.numberOfLines = 0
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .Justified
    paragraphStyle.lineSpacing = 3
    paragraphStyle.firstLineHeadIndent = 0.001
    
    let mutableAttrStr = NSMutableAttributedString(attributedString: articleTitle.attributedText!)
    mutableAttrStr.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, mutableAttrStr.length))
    articleTitle.attributedText = mutableAttrStr
    articleTitle.font = recordArticleTitleFont
    
    articleTitle.snp_makeConstraints { (make) -> Void in
        make.left.equalTo(headerView).offset(30)
        make.top.equalTo(headerView).offset(5)
        make.right.equalTo(headerView.snp_right).offset(-30)
    }
    //
    authorName.adjustsFontSizeToFitWidth = true
    authorName.text = ArticleDetailArray[0].author
    //    authorName.font = authorNameFont
    
    authorName.snp_makeConstraints { (make) -> Void in
        make.top.equalTo(articleTitle.snp_bottom).offset(10)
        make.left.equalTo(articleTitle.snp_left)
        make.right.equalTo(articleTitle.snp_right)
    }
    let articleLink = UILabel()
    
    articleLink.textColor = transparentBlack
    articleLink.font = UIFont(name: ".SFUIText-Light", size: 10)
    headerView.addSubview(articleLink)
    articleLink.snp_makeConstraints { (make) -> Void in
        make.left.equalTo(authorName.snp_left)
        make.top.equalTo(authorName.snp_bottom).offset(2)
    }
    let separatorBar = UIView()
    headerView.addSubview(separatorBar)
    separatorBar.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
    separatorBar.snp_makeConstraints { (make) -> Void in
        make.height.equalTo(1)
        make.top.equalTo(articleLink.snp_bottom).offset(10)
        make.left.equalTo(articleTitle.snp_left)
        make.right.equalTo(articleTitle.snp_right)
    }
    guard let fullURL = ArticleDetailArray[0].url else {
        articleLink.text = "Not Found"
        return headerView
    }
    let fullURLArray = fullURL.characters.split{$0 == "."}.map(String.init)
    articleLink.text = fullURLArray[1]

    return headerView
}