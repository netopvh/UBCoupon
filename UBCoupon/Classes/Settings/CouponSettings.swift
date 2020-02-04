//
//  CouponSettings.swift
//  UBCoupon
//
//  Created by usemobile on 04/07/19.
//

import Foundation

public enum CouponLanguage: String {
    case en = "en-US"
    case pt = "pt-BR"
    case es = "es-BO"
}

var currentLanguage: CouponLanguage = .pt

public class CouponSettings {
    
    public var language: CouponLanguage = .pt {
        didSet {
            currentLanguage = language
        }
    }
    
    public var shareIcon: UIImage?
    
    public var shareTitleColor: UIColor
    public var shareWordFont: UIFont
    public var shareTextFont: UIFont
    
    public var codeTextColor: UIColor
    public var codeFont: UIFont
    public var codeBackgroundColor: UIColor
    public var codeEditIcon: UIImage?
    
    public var btnShareBackgroundColor: UIColor
    public var btnShareTextColor: UIColor
    public var btnShareFont: UIFont
    
    public var invitesSettings: InvitesSettings
    
    public static var `default`: CouponSettings {
        return CouponSettings(shareIcon: nil, shareWordFont: .boldSystemFont(ofSize: 18), shareTextFont: .systemFont(ofSize: 18, weight: .light), codeFont: .systemFont(ofSize: 29), btnShareBackgroundColor: .blue, btnShareFont: .systemFont(ofSize: 20, weight: .black))
    }
    
    public init(shareIcon: UIImage?,
                shareTitleColor: UIColor = .black,
                shareWordFont: UIFont,
                shareTextFont: UIFont,
                codeTextColor: UIColor = .black,
                codeFont: UIFont,
                codeBackgroundColor: UIColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1),
                codeEditIcon: UIImage? = nil,
                btnShareBackgroundColor: UIColor,
                btnShareTextColor: UIColor = .white,
                btnShareFont: UIFont,
                invitesSettings: InvitesSettings = .default) {
        
        self.shareIcon = shareIcon
        
        self.shareTitleColor = shareTitleColor
        self.shareWordFont = shareWordFont
        self.shareTextFont = shareTextFont
        
        self.codeTextColor = codeTextColor
        self.codeFont = codeFont
        self.codeBackgroundColor = codeBackgroundColor
        self.codeEditIcon = codeEditIcon
        
        self.btnShareBackgroundColor = btnShareBackgroundColor
        self.btnShareTextColor = btnShareTextColor
        self.btnShareFont = btnShareFont
            
        self.invitesSettings = invitesSettings
        
    }
    
}
