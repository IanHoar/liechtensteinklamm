import UIKit

open class SplitViewDelegate: NSObject, UISplitViewControllerDelegate {

  open func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController? {
    if let customContainerSelf = self as? SplitViewControllerCustomContainers {
      if let navigationController = splitViewController.viewControllers.first as? SplitViewControllerContainer {
        let container = customContainerSelf.collapsedContainerClass.init(nibName: nil, bundle: nil)
        container.view.frame = splitViewController.view.bounds
        container.setViewControllers(navigationController.containedViewControllers(splitViewController), animated: false)
        return container
      }
    }
    return nil
  }

  open func primaryViewController(forExpanding splitViewController: UISplitViewController) -> UIViewController? {
    if let customContainerSelf = self as? SplitViewControllerCustomContainers {
      if let navigationController = splitViewController.viewControllers.first as? SplitViewControllerContainer {
        let container = customContainerSelf.expandedPrimaryContainerClass.init(nibName: nil, bundle: nil)
        container.view.frame = splitViewController.view.bounds
        container.setViewControllers(navigationController.containedViewControllers(splitViewController), animated: false)
        return container
      }
    }
    return nil
  }

  open func splitViewController(_ splitViewController: UISplitViewController, showDetail viewController: UIViewController, sender: Any?) -> Bool {
    if splitViewController.isCollapsed == false {
      let navigationController = splitViewController.viewControllers[1] as! UINavigationController
      navigationController.setViewControllers([viewController], animated: false)
      return true
    }
    return false
  }

  open func splitViewController(
    _ splitViewController: UISplitViewController,
    collapseSecondary secondaryViewController: UIViewController,
    onto primaryViewController: UIViewController) -> Bool {

      if let navigationController = secondaryViewController as? UINavigationController,
        let primaryViewController = primaryViewController as? UINavigationController {
          let secondaryViewControllers = navigationController.viewControllers.filter({ viewController -> Bool in
            if let viewController = viewController as? SplitViewExcludeViewController {
              return viewController.excludeViewController(splitViewController) == false
            }
            return true
          })
          primaryViewController.setViewControllers(primaryViewController.viewControllers + secondaryViewControllers, animated: false)
          return true
      }
      return false
  }

  open func splitViewController(
    _ splitViewController: UISplitViewController,
    separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {

      if let navigationController = primaryViewController as? UINavigationController {
        let (primary, secondary) = navigationController.partitionViewControllers(splitViewController)

        // Calling `setViewControllers` with the same view controller, that has 
        // a different parent view controller, raises an 
        // `UIViewControllerHierarchyInconsistency`. We therefor have to make 
        // sure they are not the same.
        if primary != navigationController.viewControllers {
          navigationController.setViewControllers(primary, animated: false)
        }

        let secondaryNavigationController: UINavigationController
        if let customContainerSelf = self as? SplitViewControllerCustomContainers {
          secondaryNavigationController = customContainerSelf.expandedSecondaryContainerClass.init(nibName: nil, bundle: nil)
        } else {
          secondaryNavigationController = UINavigationController()
        }

        secondaryNavigationController.view.frame = splitViewController.view.bounds
        if let primary = primary.last as? SplitViewDefaultViewController, secondary.count == 0 {
          let viewController = primary.defaultViewController(splitViewController)
          secondaryNavigationController.setViewControllers([viewController], animated: false)
        } else {
          secondaryNavigationController.setViewControllers(Array(secondary), animated: false)
        }
        return secondaryNavigationController
      }
      return nil
  }

  open func splitViewControllerSupportedInterfaceOrientations(_ splitViewController: UISplitViewController) -> UIInterfaceOrientationMask {
    return .all
  }

}
