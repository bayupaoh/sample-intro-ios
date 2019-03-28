//
//  SwippingController+extension.swift
//  PitchPerfectApps
//
//  Created by Bayu Paoh on 28/03/19.
//  Copyright © 2019 Bayu Paoh. All rights reserved.
//

import UIKit

extension SwippingController {

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
        coordinator.animate(alongsideTransition: {(_) in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }, completion: {(_) in
            
        })
    }
    
}
