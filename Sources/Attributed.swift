//
//  Attributed.swift
//  BKAttributedStringBuilder
//
//  Created by jinxiaolong on 2020/9/3.
//  Copyright © 2020 builderkit. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
public typealias BKFont = UIFont
public typealias BKColor = UIColor
#elseif canImport(AppKit)
import AppKit
public typealias BKFont = NSFont
public typealias BKColor = NSColor
#endif

public protocol Attributed {
    
    var attributedString: NSAttributedString { get }
    
    func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed
    
    func withAttributes(_ attrs: [NSAttributedString.Key: Any]) -> Attributed
}

public enum Ligature : Int {
    
    case none = 0
    case `default` = 1
    #if canImport(AppKit)
    case all = 2 // Value 2 is unsupported on iOS
    #endif
}

/// Currently on iOS, it's always horizontal. The behavior for any other value is undefined.
public enum GlyphForm : Int {

    case horizontal = 0
    #if canImport(AppKit)
    case vertical = 1
    #endif
}

// MARK: - Basic Attributes

extension Attributed {

    public func font(_ font: BKFont) -> Attributed {
        return withAttribute(.font, value: font)
    }

    public func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> Attributed {
        return withAttribute(.paragraphStyle, value: paragraphStyle)
    }

    public func paragraphStyle(_ builder: () -> NSParagraphStyle) -> Attributed {
        return withAttribute(.paragraphStyle, value: builder())
    }

    public func foregroundColor(_ foregroundColor: BKColor) -> Attributed {
        return withAttribute(.foregroundColor, value: foregroundColor)
    }

    public func backgroundColor(_ backgroundColor: BKColor) -> Attributed {
        return withAttribute(.backgroundColor, value: backgroundColor)
    }

    public func ligature(_ ligature: Ligature) -> Attributed {
        return withAttribute(.ligature, value: ligature.rawValue)
    }

    public func kern(_ kern: CGFloat) -> Attributed {
        return withAttribute(.kern, value: kern)
    }

    public func strikethrough(style: NSUnderlineStyle, color: BKColor? = nil) -> Attributed {
        var attrs: [NSAttributedString.Key: Any] = [.strikethroughStyle: style.rawValue]
        if let color = color {
            attrs[.strikethroughColor] = color
        }
        return withAttributes(attrs)
    }

    public func underline(style: NSUnderlineStyle, color: BKColor? = nil) -> Attributed {
        var attrs: [NSAttributedString.Key: Any] = [.underlineStyle: style.rawValue]
        if let color = color {
            attrs[.underlineColor] = color
        }
        return withAttributes(attrs)
    }

    public func stroke(width: CGFloat, color: BKColor? = nil) -> Attributed {
        var attrs: [NSAttributedString.Key: Any] = [.strokeWidth: width]
        if let color = color {
            attrs[.strokeColor] = color
        }
        return withAttributes(attrs)
    }

    public func shadow(color: BKColor, blurRadius: CGFloat, offset: CGSize) -> Attributed {
        let shadow = NSShadow()
        shadow.shadowColor = color
        shadow.shadowBlurRadius = blurRadius
        shadow.shadowOffset = offset
        return self.shadow(shadow)
    }

    public func shadow(_ shadow: NSShadow) -> Attributed {
        return withAttribute(.shadow, value: shadow)
    }

    public func textEffect(_ textEffect: NSAttributedString.TextEffectStyle) -> Attributed {
        return withAttribute(.textEffect, value: textEffect)
    }

    public func link(_ link: URL) -> Attributed {
        return withAttribute(.link, value: link)
    }

    public func baselineOffset(_ baselineOffset: CGFloat) -> Attributed {
        return withAttribute(.baselineOffset, value: baselineOffset)
    }

    public func obliqueness(_ obliqueness: CGFloat) -> Attributed {
        return withAttribute(.obliqueness, value: obliqueness)
    }

    public func expansion(_ expansion: CGFloat) -> Attributed {
        return withAttribute(.expansion, value: expansion)
    }

    public func writingDirection(_ writingDirection: NSWritingDirection) -> Attributed {
        return withAttribute(.writingDirection, value: writingDirection.rawValue)
    }

    public func glyphForm(_ glyphForm: GlyphForm) -> Attributed {
        return withAttribute(.verticalGlyphForm, value: glyphForm.rawValue)
    }
}
