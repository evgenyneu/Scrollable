//
//  ViewController.swift
//  scrolled-content
//
//  Created by Evgenii Neumerzhitckii on 28/11/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let contentView = UIView()
    scrollView.addSubview(contentView)
    ViewController.embedSubviews(scrollView, inNewSuperview: contentView)
  }

  private class func embedSubviews(fromView: UIView, inNewSuperview newSuperview: UIView) {
    newSuperview.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    // Move all subviews to newSuperview
    for subview in fromView.subviews {
      if let currentSubview = subview as? UIView {
        if currentSubview == newSuperview { continue }
        newSuperview.addSubview(currentSubview)
      }
    }
    
    // Move all scrollview constraints to contentView
    ViewController.moveConstraints(fromView, toView: newSuperview)

    // Make content view fill scroll view
    TegAutolayoutConstraints.fillParent(newSuperview, parentView: fromView, margin: 0, vertically: false)
    TegAutolayoutConstraints.fillParent(newSuperview, parentView: fromView, margin: 0, vertically: true)
    
    // Content view width is equal to scroll view width
    TegAutolayoutConstraints.equalWidth(newSuperview, viewTwo: fromView, constraintContainer: fromView)
    
    println("Scroll view constraints \(fromView.constraints().count)")
  }
  
  private class func moveConstraints(fromView: UIView, toView: UIView) {
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

