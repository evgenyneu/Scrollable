//
//  Collection of shortcuts to create autolayout constraints.
//

import UIKit

class ScrollableAutolayoutConstraints {
  class func fillParent(_ view: UIView, parentView: UIView, margin: CGFloat = 0, vertically: Bool = false) {
    var marginFormat = ""
    
    if margin != 0 {
      marginFormat = "-\(margin)-"
    }
    
    var format = "|\(marginFormat)[view]\(marginFormat)|"
    
    if vertically {
      format = "V:" + format
    }
    
    let constraints = NSLayoutConstraint.constraints(withVisualFormat: format,
      options: [], metrics: nil,
      views: ["view": view])
    
    parentView.addConstraints(constraints)
  }
  
  @discardableResult
  class func equalWidth(_ viewOne: UIView, viewTwo: UIView, constraintContainer: UIView) -> [NSLayoutConstraint] {

    let constraints = NSLayoutConstraint.constraints(withVisualFormat: "[viewOne(==viewTwo)]",
      options: [], metrics: nil,
      views: ["viewOne": viewOne, "viewTwo": viewTwo])
    
    constraintContainer.addConstraints(constraints)
  
    return constraints
  }
}
