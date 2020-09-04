//
//  String+Attributed.swift
//  BKAttributedStringBuilder
//
//  Created by jinxiaolong on 2020/9/3.
//  Copyright © 2020 BuilderKit. All rights reserved.
//

import Foundation

public struct Text : Attributed {
    
    public let string: String
    
    public let attributes: [NSAttributedString.Key: Any]?
    
    public init(_ string: String, attributes: [NSAttributedString.Key: Any]? = nil) {
        self.string = string
        self.attributes = attributes
    }
    
    public var attributedString: NSAttributedString {
        return .init(string: string, attributes: attributes)
    }
    
    public func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed {
        return withAttributes([attrName: value])
    }
    
    public func withAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Attributed {
        let attributes = attrs.reduce(into: self.attributes ?? [:]) { $0[$1.key] = $1.value }
        return Text(string, attributes: attributes)
    }
}

extension String : Attributed {
    
    public var attributedString: NSAttributedString {
        return Text(self).attributedString
    }
    
    public func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed {
        return withAttributes([attrName: value])
    }
    
    public func withAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Attributed {
        return Text(self, attributes: attrs)
    }
}

public struct Empty : Attributed {
    
    public init() { }

    public var attributedString: NSAttributedString {
        return Text("").attributedString
    }
    
    public func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed {
        return self
    }
    
    public func withAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Attributed {
        return self
    }
}

public struct LineBreak : Attributed {
    
    public init() { }
    
    public var attributedString: NSAttributedString {
        return Text("\n").attributedString
    }
    
    public func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed {
        return self
    }
    
    public func withAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Attributed {
        return self
    }
}

public struct WhiteSpace : Attributed {
    
    private let count: Int
    public init(count: Int = 1) {
        self.count = count
    }
    
    public var attributedString: NSAttributedString {
        let whiteSpaces = Array(repeating: " ", count: count)
        let string = whiteSpaces.joined()
        return Text(string).attributedString
    }
    
    public func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed {
        return self
    }
    
    public func withAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Attributed {
        return self
    }
}
