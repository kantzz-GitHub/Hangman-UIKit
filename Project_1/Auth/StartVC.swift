//
//  StartVC.swift
//  Project_1
//
//  Created by Shermukhammad Usmonov on 2024-04-02.
//

import UIKit

class StartVC: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.startAnimatingPressActions()
        createAccountButton.startAnimatingPressActions()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
    }
    
    
    
}

extension UIButton {
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
            button.transform = transform
        }, completion: nil)
    }
    
}


