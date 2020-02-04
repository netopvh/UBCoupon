//
//  InviteCell.swift
//  UBCoupon
//
//  Created by Usemobile on 16/08/19.
//

import UIKit

class InviteCell: UITableViewCell {
    
    // MARK: UI Components
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        self.contentView.addSubview(view)
        return view
    }()
    
    private lazy var lblText: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        self.containerView.addSubview(label)
        return label
    }()
    
    private lazy var lblDate: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        self.containerView.addSubview(label)
        return label
    }()
    
    // MARK: Properties
    
    private let borderName = "BorderLayer"
    
    var invitesSettings: InvitesSettings = .default {
        didSet {
            self.setupSettings()
        }
    }
    
    var inviteViewModel: InviteViewModel? {
        didSet {
            self.lblText.attributedText = self.inviteViewModel?.attributedText
            self.lblDate.text = self.inviteViewModel?.date
        }
    }
    
    // MARK: Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addBorder()
    }
    
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
        self.containerView.fillSuperview(with: .init(top: 10, left: 0, bottom: 10, right: 0))
        self.lblText.anchor(top: self.containerView.topAnchor, left: self.containerView.leftAnchor, bottom: self.lblDate.topAnchor, right: self.containerView.rightAnchor, padding: .init(top: 23, left: 22, bottom: 2, right: 22))
        self.lblDate.anchor(top: nil, left: nil, bottom: self.containerView.bottomAnchor, right: self.lblText.rightAnchor, padding: .init(top: 10, left: 0, bottom: 10, right: 0))
        self.setupSettings()
    }
    
    private func addBorder() {
        self.layer.sublayers?.filter({ $0.name == self.borderName }).forEach({ $0.removeFromSuperlayer() })
        
        let borderLayer = CAShapeLayer()
        borderLayer.name = self.borderName
        let borderSize: CGFloat = 1
        borderLayer.path = UIBezierPath(rect: CGRect(x: 36, y: self.bounds.height - borderSize, width: self.bounds.width - 36, height: borderSize)).cgPath
        borderLayer.fillColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1).cgColor
        
        self.layer.addSublayer(borderLayer)
    }
    
    private func setupSettings() {
        self.layer.sublayers?.filter({ $0.name == self.borderName }).forEach({ ($0 as? CAShapeLayer)?.fillColor = self.invitesSettings.separatorColor.cgColor })
        self.lblDate.font = self.invitesSettings.dateFont
        self.lblDate.textColor = self.invitesSettings.dateTextColor
    }
    
}
