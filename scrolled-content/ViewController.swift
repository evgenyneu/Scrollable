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
    
    addContentView()
  }

  private func addContentView() {
    
    let contentView = UIView()
    contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
    scrollView.addSubview(contentView)
    
    let scrollViewConstraints = scrollView.constraints()
    
    // Move all scollview subviews to content view
    for subview in scrollView.subviews {
      if let currentSubview = subview as? UIView {
        if currentSubview == contentView { continue }
        currentSubview.removeFromSuperview()
        contentView.addSubview(currentSubview)
      }
    }
    
    // Move all scrollview constraints to contentView
    ViewController.moveConstraints(scrollView, constraints: scrollViewConstraints, toView: contentView)

    // Make content view fill scroll view
    TegAutolayoutConstraints.fillParent(contentView, parentView: scrollView, margin: 0, vertically: false)
    TegAutolayoutConstraints.fillParent(contentView, parentView: scrollView, margin: 0, vertically: true)
    
    // Content view width is equal to scroll view width
    TegAutolayoutConstraints.equalWidth(contentView, viewTwo: scrollView, constraintContainer: view)

    
    println("Scroll view constraints \(scrollView.constraints().count)")
  }
  
  private class func moveConstraints(fromView: UIView, constraints: [AnyObject], toView: UIView) {
    for constraint in constraints {
      if let currentConstraint = constraint as? NSLayoutConstraint {
        moveConstraint(currentConstraint, fromView: fromView, toView: toView)
      }
    }
  }
  
  private class func moveConstraint(constraint: NSLayoutConstraint,
    fromView: UIView, toView: UIView) {
      
    println("Constraint \(constraint)")
      
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

