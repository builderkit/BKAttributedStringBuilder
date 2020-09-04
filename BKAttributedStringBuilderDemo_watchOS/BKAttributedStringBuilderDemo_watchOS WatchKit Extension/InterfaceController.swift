//
//  InterfaceController.swift
//  BKAttributedStringBuilderDemo_watchOS WatchKit Extension
//
//  Created by jinxiaolong on 2020/9/4.
//  Copyright © 2020 BuilderKit. All rights reserved.
//

import WatchKit
import Foundation
import BKAttributedStringBuilder

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var label: WKInterfaceLabel!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        let attributedText = NSAttributedString {
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
        
        label.setAttributedText(attributedText)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
