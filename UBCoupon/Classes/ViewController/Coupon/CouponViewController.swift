//
//  CouponViewController.swift
//  Pods-UBCoupon_Example
//
//  Created by Usemobile on 16/08/19.
//

import UIKit

public protocol CouponViewControllerDelegate: class {
    func couponViewController(_ viewController: CouponViewController, didRequestUpdate code: String)
    func couponViewController(_ viewController: CouponViewController, didRequestShare code: String)
}

public class CouponViewController: UIViewController {
    
    // MARK: UI Components

    lazy var couponView: CouponView = {
        let couponView = CouponView(settings: self.settings, code: self.code)
        couponView.delegate = self
        self.view.addSubview(couponView)
        return couponView
    }()
    
    // MARK: Properties
    
    var settings: CouponSettings {
        didSet {
            self.couponView.settings = self.settings
        }
    }
    var code: String {
        didSet {
            self.couponView.code = self.code
        }
    }
    var inviteList: [InviteViewModel] = []
    
    public weak var delegate: CouponViewControllerDelegate?
    
    // MARK: Life Cycle
    
    public init(settings: CouponSettings,
         code: String) {
        self.settings = settings
        self.code = code
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.settings = .default
        self.code = ""
        super.init(coder: aDecoder)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.couponView.fillSuperview()
        self.title = .indicationCode
    }
    
    // MARK: Methods
    
    public func updateInvites(_ inviteList: [InviteViewModel]) {
        self.couponView.updateInvites(inviteList)
    }
    
    func presentAlert(_ code: String) {
        let alertController = UIAlertController(title: .indicationCode, message: .editYourIndicationCode, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = code
            textField.placeholder = .indicationCode
        }
        let cancelAction = UIAlertAction(title: .cancel, style: .default, handler: nil)
        let saveAction = UIAlertAction(title: .save, style: .default) { _ in
            if let textField = alertController.textFields?.first, let text = textField.text, !text.isEmpty {
                self.delegate?.couponViewController(self, didRequestUpdate: text)
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        alertController.preferredAction = saveAction
        self.present(alertController, animated: true, completion: nil)
    }
    
    public func updateCode(_ code: String) {
        self.couponView.updateCode(code)
    }

}

// MARK: Extensions

extension CouponViewController: CouponViewDelegate {
    
    func couponView(_ view: CouponView, didRequestEdit code: String) {
        self.presentAlert(code)
    }
    
    func couponView(_ view: CouponView, didRequestShare code: String) {
        self.delegate?.couponViewController(self, didRequestShare: code)
    }
    
}
