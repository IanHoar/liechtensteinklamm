import UIKit

public class SplitViewDelegate: NSObject, UISplitViewControllerDelegate {

  public func primaryViewControllerForCollapsingSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
    if let customContainerSelf = self as? SplitViewCustomContainers {
      if let navigationController = splitViewController.viewControllers.first as? UINavigationController {
        let container = customContainerSelf.collapsedContainerClass.init(nibName: nil, bundle: nil)
        container.view.frame = splitViewController.view.bounds
        container.setViewControllers(navigationController.viewControllers, animated: false)
        return container
      }
    }
    return nil
  }

  public func primaryViewControllerForExpandingSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
    if let customContainerSelf = self as? SplitViewCustomContainers {
      if let navigationController = splitViewController.viewControllers.first as? UINavigationController {
        let container = customContainerSelf.expandingContainerClass.init(nibName: nil, bundle: nil)
        container.view.frame = splitViewController.view.bounds
        container.setViewControllers(navigationController.viewControllers, animated: false)
        return container
      }
    }
    return nil
  }

  public func splitViewController(splitViewController: UISplitViewController, showDetailViewController viewController: UIViewController, sender: AnyObject?) -> Bool {
    if splitViewController.collapsed == false {
      let navigationController = splitViewController.viewControllers[1] as! UINavigationController
      navigationController.setViewControllers([viewController], animated: false)
      return true
    }
    return false
  }

  public func splitViewController(
    splitViewController: UISplitViewController,
    collapseSecondaryViewController secondaryViewController: UIViewController,
    ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {

      if let navigationController = secondaryViewController as? UINavigationController,
        let primaryViewController = primaryViewController as? UINavigationController {
          primaryViewController.setViewControllers(primaryViewController.viewControllers + navigationController.viewControllers, animated: false)
          return true
      }
      return false
  }

  public func splitViewController(
    splitViewController: UISplitViewController,
    separateSecondaryViewControllerFromPrimaryViewController primaryViewController: UIViewController) -> UIViewController? {

      if let navigationController = primaryViewController as? UINavigationController {
        let (primary, secondary) = navigationController.partitionViewControllers(splitViewController)
        navigationController.setViewControllers(primary, animated: false)
        let secondaryNavigationController = UINavigationController()
        secondaryNavigationController.view.frame = splitViewController.view.bounds
        if let primary = primary.last as? SplitViewDefaultViewController where secondary.count == 0 {
          let viewController = primary.defaultViewController(splitViewController)
          secondaryNavigationController.setViewControllers([viewController], animated: false)
        } else {
          secondaryNavigationController.setViewControllers(Array(secondary), animated: false)
        }
        return secondaryNavigationController
      }
      return nil
  }

  public func splitViewControllerSupportedInterfaceOrientations(splitViewController: UISplitViewController) -> UIInterfaceOrientationMask {
    return .All
  }

}
