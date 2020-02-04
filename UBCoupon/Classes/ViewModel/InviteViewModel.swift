//
//  InviteViewModel.swift
//  UBCoupon
//
//  Created by Usemobile on 16/08/19.
//

import Foundation

open class InviteViewModel {
    
    public var attributedText: NSAttributedString?
    public var date: String?
    
    public init(text: String,
                fontFamily: String,
                date: Date) {
        self.attributedText = text.getHtml(with: 16, fontFamily: fontFamily)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.date = formatter.string(from: date)
    }
    
}
