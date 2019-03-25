import UIKit

public protocol SplitViewSetViewControllers {

  func setPrimaryViewControllers(primaryViewControllers: [UIViewController], secondaryViewControllers: [UIViewController])

}

public extension SplitViewSetViewControllers where Self: UISplitViewController {

  var primaryViewController: UINavigationController? {
    return self.viewControllers.first as? UINavigationController
  }

  var secondaryViewController: UINavigationController? {
    return self.viewControllers.last as? UINavigationController
  }

  public func setPrimaryViewControllers(primaryViewControllers: [UIViewController], secondaryViewControllers: [UIViewController]) {

    if let primary = self.primaryViewController,
    self.isCollapsed {
      primary.setViewControllers(primaryViewControllers + secondaryViewControllers, animated: false)
    } else if let primary = self.primaryViewController, let secondary = self.secondaryViewController {
      primary.setViewControllers(primaryViewControllers, animated: false)
      if let lastPrimaryViewController = primaryViewControllers.last as? SplitViewDefaultViewController,
        secondaryViewControllers.count == 0 {
        secondary.setViewControllers([lastPrimaryViewController.defaultViewController(splitViewController: self)], animated: false)
      } else {
        secondary.setViewControllers(secondaryViewControllers, animated: false)
      }
    } else {
        self.viewControllers = createContainersForSplitViewController(splitViewController: self,
        primaryViewControllers: primaryViewControllers,
        secondaryViewControllers: secondaryViewControllers)
    }
  }

}
