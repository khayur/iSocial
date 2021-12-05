//
//  ProfileImageView.swift
//  iSocial
//
//  Created by Yury Khadatovich on 23.11.21.
//

import UIKit

class ProfileImageView: UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.animateOnTouchBegan()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.animateOnTouchEnded()
    }
    
    func animateOnTouchBegan() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveEaseInOut],
            animations: { [weak self] in
                self?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            },
            completion: nil
        )
    }
    
    func animateOnTouchEnded() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            usingSpringWithDamping: 0.1,
            initialSpringVelocity: 0.9,
            options: [.curveEaseIn, .curveLinear, .curveEaseOut],
            animations: { [weak self] in
                self?.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            },
            completion: nil
        )
    }
}


