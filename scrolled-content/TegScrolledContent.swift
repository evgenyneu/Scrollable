//
//  TegScrolledContent.swift
//
//  
//
//  Created by Evgenii Neumerzhitckii on 28/11/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class TegScrolledContent {
  class func createContentView(scrollView: UIScrollView) -> UIView {
    let contentView = UIView()
    scrollView.addSubview(contentView)
    TegScrolledContent.embedSubviews(scrollView, inNewSuperview: contentView)
    TegScrolledContent.layoutContentViewInScrollView(contentView, scrollView: scrollView)
    scrollView.layoutIfNeeded()
    
    return contentView
  }
  
  class func layoutContentViewInScrollView(contentView: UIView, scrollView: UIView) {
    // Make content view fill scroll view
    TegAutolayoutConstraints.fillParent(contentView, parentView: scrollView, margin: 0, vertically: false)
    TegAutolayoutConstraints.fillParent(contentView, parentView: scrollView, margin: 0, vertically: true)
    
    // Content view width is equal to scroll view width
    TegAutolayoutConstraints.equalWidth(contentView, viewTwo: scrollView, constraintContainer: scrollView)
  }
  
  class func embedSubviews(fromView: UIView, inNewSuperview newSuperview: UIView) {
    newSuperview.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    // Move all subviews to newSuperview
    for subview in fromView.subviews {
      if let currentSubview = subview as? UIView {
        if currentSubview == newSuperview { continue }
        newSuperview.addSubview(currentSubview)
      }
    }
    
    // Move all scrollview constraints to contentView
    moveConstraints(fromView, toView: newSuperview)
  }
  
  class func moveConstraints(fromView: UIView, toView: UIView) {
    let constraints = fromView.constraints()
    for constraint in constraints {
      if let currentConstraint = constraint as? NSLayoutConstraint {
        moveConstraint(currentConstraint, fromView: fromView, toView: toView)
      }
    }
  }
  
  private class func moveConstraint(constraint: NSLayoutConstraint,
    fromView: UIView, toView: UIView) {
      
      if let currentFirstItem = constraint.firstItem as? NSObject {
        
        let newFirstItem = currentFirstItem == fromView ? toView : currentFirstItem
        
        if let currentSecondItem = constraint.secondItem as? NSObject {
          let newSecondItem = currentSecondItem == fromView ? toView : currentSecondItem
          
          let newConstraint = NSLayoutConstraint(
            item: newFirstItem,
            attribute: constraint.firstAttribute,
            relatedBy: constraint.relation,
            toItem: newSecondItem,
            attribute: constraint.secondAttribute,
            multiplier: constraint.multiplier,
            constant: constraint.constant
          )
          
          newConstraint.priority = constraint.priority
          
          fromView.removeConstraint(constraint)
          
          toView.addConstraint(newConstraint)
        }
      }
  }
}
