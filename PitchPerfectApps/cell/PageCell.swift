//
//  PageCell.swift
//  PitchPerfectApps
//
//  Created by Bayu Paoh on 27/03/19.
//  Copyright © 2019 Bayu Paoh. All rights reserved.
//

import UIKit


class PageCell: UICollectionViewCell {
    var page: Page? {
        didSet{
            lightSaberImage.image = UIImage(named: page!.image)
            
            let attributtedText = NSMutableAttributedString(string: page!.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributtedText.append(NSAttributedString(string: page!.bodyText,attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            titleTextView.attributedText = attributtedText
            titleTextView.textAlignment = .center

        }
    }
    
    let lightSaberImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "light_saber"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleTextView : UITextView = {
        let textView = UITextView()
        let attributtedText = NSMutableAttributedString(string: "Join us today in our fun games", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributtedText.append(NSAttributedString(string: "\n\nAre you for the loads and loads of fun? Don't wait any longer! We hope you to seeyou in our store rooms",attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        
        textView.attributedText = attributtedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    func setupLayout(){
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.addSubview(lightSaberImage)
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        
        lightSaberImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        lightSaberImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        lightSaberImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(titleTextView)
        titleTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 30).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
