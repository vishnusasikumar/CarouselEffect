//
//  InterestCollectionViewCell.swift
//  CarouselEffect
//
//  Created by Vishnu Sasikumar on 2/06/21.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    // MARK: - Properties
    lazy var featuredImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backgroundColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.alpha = 0.45
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var interestTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var image: String! {
        didSet {
            self.updateUI()
        }
    }
    
    lazy var quotes: Quotes = {
        let quotes = Quotes()
        
        return quotes
    }()
    
    func updateUI() {
        if image.isEmpty {
            featuredImageView.image = nil
            interestTitleLabel.text = nil
            backgroundColorView.backgroundColor = nil
        } else {
            featuredImageView.image = UIImage.init(named: image)
            interestTitleLabel.text = quotes.generateRandomQuote()
            backgroundColorView.backgroundColor = .black
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
}

// MARK: - UI Setup
extension InterestCollectionViewCell {
    private func setupUI() {
        self.contentView.addSubview(featuredImageView)
        self.contentView.addSubview(backgroundColorView)
        self.contentView.addSubview(interestTitleLabel)
        
        NSLayoutConstraint.activate([
            featuredImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            featuredImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            featuredImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            featuredImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            
            backgroundColorView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            backgroundColorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            backgroundColorView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
            backgroundColorView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5),
            
            interestTitleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            interestTitleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            interestTitleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            interestTitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10)
        ])
        
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}
