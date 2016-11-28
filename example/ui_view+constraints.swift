import UIKit

extension UIView {

  func addConstraintsForFullscreenSubview(_ subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false

    let horizontalContraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview]|",
      options: NSLayoutFormatOptions(),
      metrics: nil,
      views: ["subview" : subview])

    let verticalContraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview]|",
      options: NSLayoutFormatOptions(),
      metrics: nil,
      views: ["subview" : subview])

    self.addConstraints(horizontalContraint)
    self.addConstraints(verticalContraint)
  }

  func addConstraintsForCenteredSubview(_ subview: UIView) {

    subview.translatesAutoresizingMaskIntoConstraints = false

    let verticalContraint = NSLayoutConstraint(
      item: subview,
      attribute: .centerY,
      relatedBy: .equal,
      toItem: self,
      attribute: .centerY,
      multiplier: 1.0,
      constant: 0)

    let horizontalContraint = NSLayoutConstraint(
      item: subview,
      attribute: .centerX,
      relatedBy: .equal,
      toItem: self,
      attribute: .centerX,
      multiplier: 1.0,
      constant: 0)

    let heightContraint = NSLayoutConstraint(
      item: subview,
      attribute: .height,
      relatedBy: .equal,
      toItem: nil,
      attribute: .notAnAttribute,
      multiplier: 1.0,
      constant: subview.frame.height)

    let widthContraint = NSLayoutConstraint(
      item: subview,
      attribute: .width,
      relatedBy: .equal,
      toItem: nil,
      attribute: .notAnAttribute,
      multiplier: 1.0,
      constant: subview.frame.width)

    self.addConstraints([horizontalContraint, verticalContraint, heightContraint, widthContraint])
    
  }
  
}
