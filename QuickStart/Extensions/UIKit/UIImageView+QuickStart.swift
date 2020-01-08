//
//  UIImageView+QuickStart.swift
//  QuickStart
//
//  Copyright © 2020 SendBird, Inc. All rights reserved.
//

import UIKit

extension UIImageView {
    func rounding() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
    
    func border() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.lightPurple.cgColor
    }
    
    func updateProfileImage(_ imageURL: String) {
        self.image = UIImage(named: imageURL)
        self.rounding()
        self.border()
        
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
            self.alpha = 1.0
        }
        
        animator.startAnimation()
    }
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIImage {
    static func mute() -> UIImage? {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: "mic.slash.fill")
        } else {
            return UIImage(named: "icon_audio_mute")
        }
    }
    
    static func unmute() -> UIImage? {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: "mic.fill")
        } else {
            return UIImage(named: "icon_audio_unmute")
        }
    }
}
