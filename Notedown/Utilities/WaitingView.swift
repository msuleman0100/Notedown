//
//  WaitingView.swift
//  Notedown
//
//  Created by Muhammad Suleman on 5/1/23.
//

import UIKit

class WaitingView: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var loadingBackgroundView: UIView!
    @IBOutlet weak var activityIndicatorBackgroundView: UIView!
    
    init() {
        super.init(nibName: "WaitingView", bundle: nil)
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
        backgroundView.backgroundColor = .black.withAlphaComponent(0.5)
        backgroundView.alpha = 0
        loadingBackgroundView.alpha = 0
        loadingBackgroundView.layer.cornerRadius = 12
    }


    func show(sender: UIViewController) {
        sender.present(self, animated: true) {
            UIView.animate(withDuration: 0.1, delay: 0) { [weak self] in
                self?.backgroundView.alpha = 1
                self?.loadingBackgroundView.alpha = 1
                self?.activityIndicator.startAnimating()
            }
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.1, delay: 0) { [weak self] in
            self?.backgroundView.alpha = 0
            self?.loadingBackgroundView.alpha = 0
        } completion: { _ in
            self.activityIndicator.stopAnimating()
            self.dismiss(animated: false)
            self.removeFromParent()
        }
    }

}
