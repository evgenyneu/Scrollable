import UIKit

/**

Makes the content in the scroll view scrollable.

*/
open class Scrollable {
  @discardableResult
  open class func createContentView(_ scrollView: UIScrollView) -> UIView {
    let contentView = UIView()
    scrollView.addSubview(contentView)
    Scrollable.embedSubviews(scrollView, inNewSuperview: contentView)
    Scrollable.layoutContentViewInScrollView(contentView, scrollView: scrollView)
    scrollView.layoutIfNeeded()

    return contentView
  }
  
  class func layoutContentViewInScrollView(_ contentView: UIView, scrollView: UIView) {
    // Make content view fill scroll view
    
    ScrollableAutolayoutConstraints.fillParent(contentView, parentView: scrollView, margin: 0,
      vertically: false)
    
    ScrollableAutolayoutConstraints.fillParent(contentView, parentView: scrollView, margin: 0,
      vertically: true)
    
    // Content view width is equal to scroll view width
    ScrollableAutolayoutConstraints.equalWidth(contentView, viewTwo: scrollView,
      constraintContainer: scrollView)
  }
  
  class func embedSubviews(_ fromView: UIView, inNewSuperview newSuperview: UIView) {
    newSuperview.translatesAutoresizingMaskIntoConstraints = false
    
    // Move all subviews to newSuperview
    for subview in fromView.subviews {
      if subview == newSuperview { continue }
      newSuperview.addSubview(subview)
    }
    
    // Move all scrollview constraints to contentView
    moveConstraints(fromView, toView: newSuperview)
  }
  
  class func moveConstraints(_ fromView: UIView, toView: UIView) {
    let constraints = fromView.constraints
    for constraint in constraints {
      moveConstraint(constraint, fromView: fromView, toView: toView)
    }
  }
  
  fileprivate class func moveConstraint(_ constraint: NSLayoutConstraint,
    fromView: UIView, toView: UIView) {
      
    if let firstItem = constraint.firstItem as? NSObject {
      
      let newFirstItem = firstItem == fromView ? toView : firstItem
      
      if let secondItem = constraint.secondItem as? NSObject {
        let newSecondItem = secondItem == fromView ? toView : secondItem
        
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
