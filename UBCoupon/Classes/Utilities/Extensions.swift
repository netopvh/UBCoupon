//
//  Extensions.swift
//  UBProfile
//
//  Created by Usemobile on 02/04/19.
//

import Foundation
import UIKit

// MARK: Primitive types

extension String {
    
    
    func getHtml(with fontSize: Int, fontFamily: String) -> NSAttributedString?{
        let arr = self.components(separatedBy: "<")
        let count = arr.count
        var text = ""
        switch count {
        case 0:
            break
        case 1:
            text = arr[0]
        default:
            text = arr[arr[0].isEmpty ? 1 : 0]
        }
        if let tag = text.components(separatedBy: ">").first {
            let styledTag = "<" + tag + " style=\"font-size:\(fontSize)px;font-family:\(fontFamily);\">"
            let newText = self.replacingOccurrences(of: "<\(tag)>", with: styledTag)
            return newText.htmlToAttributedString
        }
        return nil
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
}

// MARK: UI Components

extension UIImage {
    
    class func getFrom(customClass: AnyClass, nameResource: String) -> UIImage? {
        let frameWorkBundle = Bundle(for: customClass)
        if let bundleURL = frameWorkBundle.resourceURL?.appendingPathComponent("UBCoupon.bundle") , let resourceBundle = Bundle(url: bundleURL) {
            return UIImage(named: nameResource, in: resourceBundle, compatibleWith: nil)
        }
        return nil
    }
}

extension UIView {
    func fillSuperview(with padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        self.anchor(top: self.superview?.topAnchor, left: self.superview?.leftAnchor, bottom: self.superview?.bottomAnchor, right: self.superview?.rightAnchor, padding: padding, size: size)
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
            
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
            
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
            
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
            
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}
