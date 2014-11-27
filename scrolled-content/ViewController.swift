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
    TegAutolayoutConstraints.fillParent(contentView, parentView: scrollView, margin: 0, vertically: false)
    TegAutolayoutConstraints.fillParent(contentView, parentView: scrollView, margin: 0, vertically: true)
    TegAutolayoutConstraints.equalWidth(contentView, viewTwo: scrollView, constraintContainer: view)

    for subview in scrollView.subviews {
      if let currentSubview = subview as? UIView {
        if currentSubview == contentView { continue }
        contentView.addSubview(currentSubview)
      }
    }
    
    
//    let constraints = scrollView.constraints()
//    NSLayoutConstraint
//    constraints[0]
//    println("Scroll view constraints \(constraints.count)")
  }
}

