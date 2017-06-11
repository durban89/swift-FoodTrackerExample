//
//  RatingControlView.swift
//  FoodTrackerExample
//
//  Created by durban.zhang on 2017/5/21.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

import UIKit

@IBDesignable class RatingControlView: UIStackView {
    // MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtons()
        }
    }
    
    @IBInspectable var startSize:CGSize = CGSize(width:44.0, height:44.0){
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var startCount:Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Button Action
    func ratingButtonTapped(button:UIButton){
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButton array: \(ratingButtons)")
        }
        
        let selectedRating = index + 1;
        
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
    
    
    // MARK: Private Methods
    private func updateButtons(){
        for (index, button) in ratingButtons.enumerated(){
            let hintString:String?
            if rating == index + 1 {
                hintString = "Tap tp reset the rating to zero"
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString:String
            switch rating {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
            button.isSelected = index < rating
        }
    }
    
    private func setupButtons(){
        // clear any existing buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named:"filledStar", in:bundle, compatibleWith:self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in:bundle, compatibleWith:self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in:bundle, compatibleWith:self.traitCollection)
        
        for index in 0..<startCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
            
            
            // Set the Accessibility Label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            button.addTarget(self, action: #selector(RatingControlView.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        
        updateButtons()
    }
    
}
