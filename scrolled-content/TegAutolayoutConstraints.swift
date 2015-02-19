//
//  TegAlign.swift
//
//  Collection of shortcuts to create autolayout constraints.
//
//  Created by Evgenii Neumerzhitckii on 27/10/2014.
//  Copyright (c) 2014 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class TegAutolayoutConstraints {
  class func fillParent(view: UIView, parentView: UIView, margin: CGFloat = 0, vertically: Bool = false) {
    var marginFormat = ""
    
    if margin != 0 {
      marginFormat = "-\(margin)-"
    }
    
    var format = "|\(marginFormat)[view]\(marginFormat)|"
    
    if vertically {
      format = "V:" + format
    }
    
    let constraints = NSLayoutConstraint.constraintsWithVisualFormat(format,
      options: nil, metrics: nil,
      views: ["view": view])
    
    parentView.addConstraints(constraints)
  }
  
  class func equalWidth(viewOne: UIView, viewTwo: UIView, constraintContainer: UIView) -> [NSLayoutConstraint] {

    if let constraints = NSLayoutConstraint.constraintsWithVisualFormat("[viewOne(==viewTwo)]",
      options: nil, metrics: nil,
      views: ["viewOne": viewOne, "viewTwo": viewTwo]) as? [NSLayoutConstraint] {
    
      constraintContainer.addConstraints(constraints)
    
      return constraints
    }

    return []
  }
}
