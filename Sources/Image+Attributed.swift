//
//  Image+Attributed.swift
//  BKAttributedStringBuilder
//
//  Created by jinxiaolong on 2020/9/3.
//  Copyright © 2020 builderkit. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit
public typealias BKImage = UIImage
#elseif canImport(AppKit)
import AppKit
public typealias BKImage = NSImage
#endif

#if !os(watchOS)

public struct Attachment : Attributed {
    
    private let attachment: NSTextAttachment
    
    public init(_ image: BKImage) {
        attachment = NSTextAttachment()
        attachment.image = image
    }
    
    public func size(_ size: CGSize) -> Attributed {
        attachment.bounds.size = size
        return self
    }

    public var attributedString: NSAttributedString {
        return .init(attachment: attachment)
    }
    
    public func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed {
        return self
    }
    
    public func withAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Attributed {
        return self
    }
}

extension BKImage : Attributed {
    
    public var attributedString: NSAttributedString {
        return Attachment(self).attributedString
    }
    
    public func withAttribute(_ attrName: NSAttributedString.Key, value: Any) -> Attributed {
        return self
    }
    
    public func withAttributes(_ attrs: [NSAttributedString.Key : Any]) -> Attributed {
        return self
    }
    
    public func size(_ size: CGSize) -> Attributed {
        return Attachment(self).size(size)
    }
}

#endif
