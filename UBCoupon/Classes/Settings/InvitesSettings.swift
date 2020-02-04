//
//  InvitesSettings.swift
//  UBCoupon
//
//  Created by Usemobile on 16/08/19.
//

import Foundation


public class InvitesSettings {
    
    public var titleFont: UIFont
    public var titleTextColor: UIColor
    
    public var subtitleFont: UIFont
    public var subtitleTextColor: UIColor
    
    public var dateFont: UIFont
    public var dateTextColor: UIColor
    
    public var separatorColor: UIColor
    
    public static var `default`: InvitesSettings {
        return InvitesSettings(titleFont: .boldSystemFont(ofSize: 25), subtitleFont: .systemFont(ofSize: 14), dateFont: .systemFont(ofSize: 12))
    }
    
    public init(titleFont: UIFont,
                titleTextColor: UIColor = .black,
                subtitleFont: UIFont,
                subtitleTextColor: UIColor = #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1),
                dateFont: UIFont,
                dateTextColor: UIColor = #colorLiteral(red: 0.7254901961, green: 0.7254901961, blue: 0.7254901961, alpha: 1),
                separatorColor: UIColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)) {
        self.titleFont = titleFont
        self.titleTextColor = titleTextColor
        
        self.subtitleFont = subtitleFont
        self.subtitleTextColor = subtitleTextColor
        
        self.dateFont = dateFont
        self.dateTextColor = dateTextColor
        
        self.separatorColor = separatorColor
    }
    
    
}
