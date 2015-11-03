import UIKit

extension UIView {

  func addConstraintsForFullscreenSubview(subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false

    let horizontalContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[subview]|",
      options: .DirectionLeadingToTrailing,
      metrics: nil,
      views: ["subview" : subview])

    let verticalContraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|[subview]|",
      options: .DirectionLeadingToTrailing,
      metrics: nil,
      views: ["subview" : subview])

    self.addConstraints(horizontalContraint)
    self.addConstraints(verticalContraint)
  }

  func addConstraintsForCenteredSubview(subview: UIView) {

    subview.translatesAutoresizingMaskIntoConstraints = false

    let verticalContraint = NSLayoutConstraint(
      item: subview,
      attribute: .CenterY,
      relatedBy: .Equal,
      toItem: self,
      attribute: .CenterY,
      multiplier: 1.0,
      constant: 0)

    let horizontalContraint = NSLayoutConstraint(
      item: subview,
      attribute: .CenterX,
      relatedBy: .Equal,
      toItem: self,
      attribute: .CenterX,
      multiplier: 1.0,
      constant: 0)

    let heightContraint = NSLayoutConstraint(
      item: subview,
      attribute: .Height,
      relatedBy: .Equal,
      toItem: nil,
      attribute: .NotAnAttribute,
      multiplier: 1.0,
      constant: CGRectGetHeight(subview.frame))

    let widthContraint = NSLayoutConstraint(
      item: subview,
      attribute: .Width,
      relatedBy: .Equal,
      toItem: nil,
      attribute: .NotAnAttribute,
      multiplier: 1.0,
      constant: CGRectGetWidth(subview.frame))

    self.addConstraints([horizontalContraint, verticalContraint, heightContraint, widthContraint])
    
  }
  
}
