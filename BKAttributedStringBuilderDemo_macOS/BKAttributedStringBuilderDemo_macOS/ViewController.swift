//
//  ViewController.swift
//  BKAttributedStringBuilderDemo_macOS
//
//  Created by jinxiaolong on 2020/9/4.
//  Copyright © 2020 BuilderKit. All rights reserved.
//

import Cocoa
import BKAttributedStringBuilder

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let label = NSTextView(frame: view.bounds)
        view.addSubview(label)
        label.autoresizingMask = [.width, .minYMargin]
        
        let text = NSAttributedString {
            "Hello".foregroundColor(.red)
                .backgroundColor(.yellow)
                .font(.systemFont(ofSize: 20))
            "\n"
            "World".font(.systemFont(ofSize: 40))
                .backgroundColor(.red)
                .paragraphStyle {
                    let p = NSMutableParagraphStyle()
                    p.firstLineHeadIndent = 20
                    return p
                }
            "\n"
            NSAttributedString {
                "AttributedString".foregroundColor(.green)
                "Builder".foregroundColor(.brown)
                "\n"
                #imageLiteral(resourceName: "bell")
            }.underline(style: .double, color: .purple)
                .paragraphStyle {
                    let p = NSMutableParagraphStyle()
                    p.alignment = .center
                    return p
                }
            "\n"
            "https://www.apple.com"
                .link(URL(string: "https://www.apple.com")!)
                .shadow(color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), blurRadius: 4, offset: .init(width: 0, height: 4))
        }
        label.insertText(text, replacementRange: NSRange(location: 0, length: 0))
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

