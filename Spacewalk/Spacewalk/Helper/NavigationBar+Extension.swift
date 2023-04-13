//
//  NavigationBar+Extension.swift
//  Spacewalk
//
//  Created by Krystsina on 2023-04-13.
//

import UIKit

extension UINavigationController {
    override open func viewWillLayoutSubviews() {
        let transparentAppearance = UINavigationBarAppearance()
        transparentAppearance.configureWithTransparentBackground()
        transparentAppearance.backgroundColor = .clear
        transparentAppearance.shadowColor = .clear
        navigationBar.standardAppearance = transparentAppearance
        navigationBar.compactAppearance = transparentAppearance
        navigationBar.scrollEdgeAppearance = transparentAppearance
    }
}
