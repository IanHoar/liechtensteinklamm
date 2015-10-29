import UIKit

public protocol SplitViewCustomContainers {

  var expandingContainerClass: UINavigationController.Type { get }
  var collapsedContainerClass: UINavigationController.Type { get }
  func primaryViewControllerForExpandingSplitViewController(splitViewController: UISplitViewController) -> UIViewController?
  func primaryViewControllerForCollapsingSplitViewController(splitViewController: UISplitViewController) -> UIViewController?

}

extension SplitViewCustomContainers {

  public var expandingContainerClass: UINavigationController.Type {
    return UINavigationController.self
  }

  public var collapsedContainerClass: UINavigationController.Type {
    return UINavigationController.self
  }

}
