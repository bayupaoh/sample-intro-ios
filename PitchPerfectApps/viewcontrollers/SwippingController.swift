//
//  SwippingController.swift
//  PitchPerfectApps
//
//  Created by Bayu Paoh on 27/03/19.
//  Copyright © 2019 Bayu Paoh. All rights reserved.
//

import UIKit

class SwippingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let pages = [
        Page(image: "karaoke", headerText: "Join us today in our fun games",bodyText:"\n\nAre you readey for the loads and loads of fun? Don't wait any longer! We hope you to seeyou in our store rooms"),
        Page(image: "speaker", headerText: "Record your voice and add effect",bodyText:"\n\nJust tap record button and choose effects that you want. You will feel like a singer"),
        Page(image: "friends", headerText: "Share your voice to your friends",bodyText:"\n\nShare your voice to social media or your messanger apps")]
    
    
    let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    lazy var pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 3
        pc.currentPage = 0
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .red
        return pc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.isPagingEnabled = true
        
        NSLayoutConstraint.activate([
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        setupBottomControls()
    }

    private func setupBottomControls(){
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
    }
    
    @objc private func handlePrev(){
        let nextPath = max(pageControl.currentPage - 1,0)
        pageControl.currentPage = nextPath
        let indexPath = IndexPath(item: nextPath, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleNext(){
        let nextPath = min(pageControl.currentPage + 1,pages.count-1)
        pageControl.currentPage = nextPath
        let indexPath = IndexPath(item: nextPath, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
