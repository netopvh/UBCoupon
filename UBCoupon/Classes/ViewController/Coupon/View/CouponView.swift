//
//  CouponView.swift
//  UBCoupon
//
//  Created by Usemobile on 16/08/19.
//

import UIKit

protocol CouponViewDelegate: class {
    func couponView(_ view: CouponView, didRequestEdit code: String)
    func couponView(_ view: CouponView, didRequestShare code: String)
}

class CouponView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        self.addSubview(tableView)
        return tableView
    }()
    
    private let kCouponFirstCell = "CouponFirstCell"
    private let kInviteCell = "InviteCell"
    
    weak var delegate: CouponViewDelegate?
    
    var settings: CouponSettings
    var code: String
    var inviteList: [InviteViewModel] = []
    
    init(settings: CouponSettings, code: String) {
        self.settings = settings
        self.code = code
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.settings = .default
        self.code = ""
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        self.backgroundColor = .white
        self.tableView.fillSuperview()
        self.tableView.register(CouponFirstCell.self, forCellReuseIdentifier: self.kCouponFirstCell)
        self.tableView.register(InviteCell.self, forCellReuseIdentifier: self.kInviteCell)
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    public func updateInvites(_ inviteList: [InviteViewModel]) {
        self.inviteList = inviteList
        self.tableView.reloadData()
    }
    
    public func updateCode(_ code: String) {
        self.code = code
        self.tableView.reloadData()
    }
    
}

extension CouponView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.inviteList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: self.kCouponFirstCell, for: indexPath) as! CouponFirstCell
            cell.code = self.code
            cell.numberOfInvites = self.inviteList.count
            cell.settings = self.settings
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: self.kInviteCell, for: indexPath) as! InviteCell
            cell.invitesSettings = self.settings.invitesSettings
            cell.inviteViewModel = self.inviteList[indexPath.row - 1]
            return cell
        }
    }
    
}

extension CouponView: CouponFirstCellDelegate {
    
    func couponFirstCellDelegate(_ cell: CouponFirstCell, dcdRequestEdit code: String) {
        self.delegate?.couponView(self, didRequestEdit: code)
    }
    
    func couponFirstCellDelegate(_ cell: CouponFirstCell, didRequestShare code: String) {
        self.delegate?.couponView(self, didRequestShare: code)
    }
}

