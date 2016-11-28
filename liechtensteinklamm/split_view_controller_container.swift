import UIKit

public protocol SplitViewControllerContainer {

  func containedViewControllers(_ splitViewController: UISplitViewController) -> [UIViewController]

}

extension UINavigationController: SplitViewControllerContainer {

  open func containedViewControllers(_ splitViewController: UISplitViewController) -> [UIViewController] {
    return self.viewControllers
  }
  
}
