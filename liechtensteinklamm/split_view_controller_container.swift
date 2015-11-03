import UIKit

public protocol SplitViewControllerContainer {

  func containedViewControllers(splitViewController: UISplitViewController) -> [UIViewController]

}

extension UINavigationController: SplitViewControllerContainer {

  public func containedViewControllers(splitViewController: UISplitViewController) -> [UIViewController] {
    return self.viewControllers
  }
  
}
