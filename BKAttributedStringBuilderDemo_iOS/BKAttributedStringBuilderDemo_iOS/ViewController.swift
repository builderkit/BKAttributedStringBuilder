//
//  ViewController.swift
//  BKAttributedStringBuilderDemo_iOS
//
//  Created by jinxiaolong on 2020/9/4.
//  Copyright © 2020 BuilderKit. All rights reserved.
//

import UIKit
import BKAttributedStringBuilder

class ViewController: UIViewController {

    enum PhoneType {
        case home
        case work
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel(frame: view.bounds)
        view.addSubview(label)
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.numberOfLines = 0
        
        let greeting = false
        let phoneType = PhoneType.home

        label.attributedText = NSAttributedString {
            "Hello".foregroundColor(.red)
                .backgroundColor(.yellow)
                .font(.systemFont(ofSize: 20))
            LineBreak()
            if greeting {
                "World".font(.systemFont(ofSize: 40))
                    .backgroundColor(.red)
                    .paragraphStyle {
                        let p = NSMutableParagraphStyle()
                        p.firstLineHeadIndent = 20
                        return p
                    }
            } else{
                "せかい".font(.systemFont(ofSize: 40))
                .backgroundColor(.red)
                .paragraphStyle {
                    let p = NSMutableParagraphStyle()
                    p.firstLineHeadIndent = 20
                    return p
                }
            }
            NSAttributedString {
                "BK".font(.italicSystemFont(ofSize: 20))
                "AttributedString".foregroundColor(.green)
                "Builder".foregroundColor(.brown)
                LineBreak()
                #imageLiteral(resourceName: "bell").size(.init(width: 120, height: 120))
            }.underline(style: .double, color: .purple)
                .paragraphStyle {
                    let p = NSMutableParagraphStyle()
                    p.alignment = .center
                    return p
                }
            LineBreak()
            ForEach(["子", "丑", "寅", "卯"]) {
                $0.paragraphStyle {
                    let p = NSMutableParagraphStyle()
                    p.alignment = .right
                    p.tailIndent = -15
                    return p
                }
                LineBreak()
            }
            ForEach(1 ..< 5) {
                "\($0)"
                WhiteSpace(count: $0)
            }
            LineBreak()
            "https://www.apple.com"
                .link(URL(string: "https://www.apple.com")!)
                .shadow(color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), blurRadius: 4, offset: .init(width: 0, height: 4))
        }
    }


}

