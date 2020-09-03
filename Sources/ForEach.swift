//
//  ForEach.swift
//  BKAttributedStringBuilder
//
//  Created by jinxiaolong on 2020/9/4.
//  Copyright © 2020 builderkit. All rights reserved.
//

import Foundation

public struct ForEach<Data> where Data : RandomAccessCollection {
    
    public init(_ data: Data, @AttributedBuilder attributed: @escaping (Data.Element) -> Attributed) {
        let mas = NSMutableAttributedString()
        data.map(attributed).forEach(mas.append(_:))
        _attributedString = NSAttributedString(attributedString: mas)
    }
    
    private let _attributedString: NSAttributedString
}

extension ForEach : Attributed {
    
    public var attributedString: NSAttributedString {
        return _attributedString
    }
    
    public func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed {
        withAttributes([attrName: value])
    }
    
    public func withAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Attributed {
        attributedString.withAttributes(attrs)
    }
}
