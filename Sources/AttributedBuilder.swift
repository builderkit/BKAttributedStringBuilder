//
//  AttributedBuilder.swift
//  BKAttributedStringBuilder
//
//  Created by jinxiaolong on 2020/9/3.
//  Copyright © 2020 builderkit. All rights reserved.
//

import Foundation

@_functionBuilder
public struct AttributedBuilder {
    
    public static func buildBlock(_ attributeds: Attributed...) -> Attributed {
        let mas = NSMutableAttributedString()
        attributeds.forEach(mas.append)
        return NSAttributedString(attributedString: mas)
    }
    
    public static func buildIf(_ attributed: Attributed?) -> Attributed {
        return attributed ?? Empty()
    }
    
    public static func buildEither(first: Attributed) -> Attributed {
        return first
    }
    
    public static func buildEither(second: Attributed) -> Attributed {
        return second
    }
}

extension NSAttributedString : Attributed {
    
    public convenience init(@AttributedBuilder attributed: () -> Attributed) {
        self.init(attributedString: attributed().attributedString)
    }
    
    public var attributedString: NSAttributedString {
        return self
    }
    
    public func withAttribute(_ attrName: Key, value: Any) -> Attributed {
        return withAttributes([attrName: value])
    }
    
    public func withAttributes(_ attrs: [Key : Any]) -> Attributed {
        let mas = NSMutableAttributedString(attributedString: self)
        mas.addAttributes(attrs, range: .init(location: 0, length: length))
        return NSAttributedString(attributedString: mas)
    }
}

extension NSMutableAttributedString {
    
    public func append(_ attributed: Attributed) {
        self.append(attributed.attributedString)
    }
}
