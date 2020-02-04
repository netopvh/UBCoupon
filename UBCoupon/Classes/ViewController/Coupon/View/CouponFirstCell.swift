//
//  CouponFirstCell.swift
//  UBCoupon
//
//  Created by Usemobile on 16/08/19.
//

import UIKit

protocol CouponFirstCellDelegate: class {
    func couponFirstCellDelegate(_ cell: CouponFirstCell, dcdRequestEdit code: String)
    func couponFirstCellDelegate(_ cell: CouponFirstCell, didRequestShare code: String)
}

class CouponFirstCell: UITableViewCell {

    // MARK: UI Components
    
    private lazy var imvCoupon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(imageView)
        return imageView
    }()
    
    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var viewCode: UIView = {
        let view = UIView()
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var lblCode: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = self.code
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var btnEdit: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        let insets: CGFloat = 15
        button.imageEdgeInsets = UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
        let image = UIImage.getFrom(customClass: CouponFirstCell.self, nameResource: "edit")
        button.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(self.editPressed), for: .touchUpInside)
        self.contentView.addSubview(button)
        return button
    }()
    
    private lazy var btnShare: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(.shareAction, for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(self.sharePressed), for: .touchUpInside)
        self.contentView.addSubview(button)
        return button
    }()
    
    private lazy var lblInvitesTitle: UILabel = {
        let label = UILabel()
        label.text = .invites
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var lblInvitesCount: UILabel = {
        let label = UILabel()
        self.contentView.addSubview(label)
        return label
    }()
    
    // MARK: Properties
    
    var settings: CouponSettings = .default {
        didSet {
            self.setupSettings()
        }
    }
    
    var code: String = "" {
        didSet {
            self.lblCode.text = self.code
        }
    }
    
    var numberOfInvites: Int = 0 {
        didSet {
            self.setNumberOfInvites()
        }
    }
    
    weak var delegate: CouponFirstCellDelegate?
    
    // MARK: Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: Methods
    
    private func setup() {
        self.contentView.backgroundColor = .white
        self.selectionStyle = .none
        self.imvCoupon.anchor(top: self.contentView.topAnchor, left: self.contentView.leftAnchor, bottom: nil, right: nil, padding: .init(top: 32, left: 22, bottom: 0, right: 0), size: .init(width: 75, height: 75))
        self.lblTitle.anchor(top: nil, left: self.imvCoupon.rightAnchor, bottom: nil, right: self.contentView.rightAnchor, padding: .init(top: 0, left: 28, bottom: 0, right: 28))
        self.lblTitle.centerYAnchor.constraint(equalTo: self.imvCoupon.centerYAnchor).isActive = true
        
        self.setupViewCode()
        
        self.btnShare.anchor(top: self.lblCode.bottomAnchor, left: nil, bottom: nil, right: nil, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
        self.btnShare.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        self.lblInvitesTitle.anchor(top: self.btnShare.bottomAnchor, left: self.contentView.leftAnchor, bottom: nil, right: self.contentView.rightAnchor, padding: .init(top: 30, left: 22, bottom: 0, right: 22))
        
        self.lblInvitesCount.anchor(top: self.lblInvitesTitle.bottomAnchor, left: self.lblInvitesTitle.leftAnchor, bottom: nil, right: self.lblInvitesTitle.rightAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        
        let lblInvitesCountBottom = self.lblInvitesCount.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 24)
        lblInvitesCountBottom.priority = UILayoutPriority(rawValue: 750)
        lblInvitesCountBottom.isActive = true
    }
    
    private func setupViewCode() {
        self.viewCode.anchor(top: self.lblCode.topAnchor, left: self.contentView.leftAnchor, bottom: self.lblCode.bottomAnchor, right: self.contentView.rightAnchor, padding: .init(top: -20, left: 0, bottom: -20, right: 0))
        
        self.lblCode.anchor(top: self.imvCoupon.bottomAnchor, left: self.contentView.leftAnchor, bottom: nil, right: nil, padding: .init(top: 50, left: 42, bottom: 0, right: 0))
        
        self.btnEdit.anchor(top: self.lblCode.topAnchor, left: self.lblCode.rightAnchor, bottom: nil, right: self.contentView.rightAnchor, padding: .init(top: -7, left: 38, bottom: 0, right: 8), size: .init(width: 50, height: 50))
    }
    
    private func setupSettings() {
        self.imvCoupon.image = self.settings.shareIcon
        self.lblTitle.textColor = self.settings.shareTitleColor
        
        self.viewCode.backgroundColor = self.settings.codeBackgroundColor
        self.lblCode.textColor = self.settings.codeTextColor
        self.lblCode.font = self.settings.codeFont
        
        self.btnShare.backgroundColor = self.settings.btnShareBackgroundColor
        self.btnShare.setTitleColor(self.settings.btnShareTextColor, for: .normal)
        self.btnShare.titleLabel?.font = self.settings.btnShareFont
        
        self.lblInvitesTitle.font = self.settings.invitesSettings.titleFont
        self.lblInvitesTitle.textColor = self.settings.invitesSettings.titleTextColor
        self.lblInvitesCount.font = self.settings.invitesSettings.subtitleFont
        self.lblInvitesCount.textColor = self.settings.invitesSettings.subtitleTextColor
        
        self.setTitleText()
    }
    
    fileprivate func setTitleText() {
        let attributedTitle = NSMutableAttributedString(string: .share,
                                                        attributes: [NSAttributedString.Key.font: self.settings.shareWordFont,
                                                                     NSAttributedString.Key.foregroundColor: self.settings.shareTitleColor])
        attributedTitle.append(NSAttributedString(string: .theAppWithYourFriends,
                                                  attributes: [NSAttributedString.Key.font: self.settings.shareTextFont,
                                                               NSAttributedString.Key.foregroundColor: self.settings.shareTitleColor]))
        self.lblTitle.attributedText = attributedTitle
    }
    
    private func setNumberOfInvites() {
        var inviteCount = "\(self.numberOfInvites) " + .confirmed
        if currentLanguage == .pt && self.numberOfInvites > 1 {
            inviteCount += "s"
        }
        self.lblInvitesCount.text = inviteCount
    }
    
    @objc func editPressed() {
        self.delegate?.couponFirstCellDelegate(self, dcdRequestEdit: self.code)
    }
    
    @objc func sharePressed() {
        self.delegate?.couponFirstCellDelegate(self, didRequestShare: self.code)
    }

}
