//
//  PopupView.swift
//  GigleeLayout
//
//  Created by Muhammad Suleman on 4/29/23.
//

import UIKit

class PopupView: UIViewController {

    @IBOutlet weak var bacKView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertDescLabel: UILabel!
    public var alertTitle = "Invalid Credintials"
    public var alertDesc = "Please provide email address and password to continue"
    
    init() {
        super.init(nibName: "PopupView", bundle: nil)
        self.modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    func configView() {
        view.backgroundColor = .clear
        bacKView.backgroundColor = .black.withAlphaComponent(0.5)
        bacKView.alpha = 0
        contentView.alpha = 0
        contentView.layer.cornerRadius = 12
        alertTitleLabel.text = alertTitle.description
        alertDescLabel.text = alertDesc.description
    }
    
    @IBAction func okayBtnTapped(_ sender: Any) {
        hide()
    }
    
    
    func appear(sender: UIViewController) {
        sender.present(self, animated: true) {
            self.show()
        }
    }
    
    private func show() {
        UIView.animate(withDuration: 0.2, delay: 0) { [weak self] in
            self?.bacKView.alpha = 1
            self?.contentView.alpha = 1
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.2, delay: 0) { [weak self] in
            self?.bacKView.alpha = 0
            self?.contentView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
    }

}
