import UIKit

public func createContainersForSplitViewController(_ splitViewController: UISplitViewController, primaryViewControllers: [UIViewController], secondaryViewControllers: [UIViewController]) -> [UIViewController] {

  let primaryNavigationController: UINavigationController
  let secondaryNavigationController: UINavigationController
  if let customContainerSelf = splitViewController.delegate as? SplitViewControllerCustomContainers {
    primaryNavigationController = customContainerSelf.expandedPrimaryContainerClass.init()
    secondaryNavigationController = customContainerSelf.expandedSecondaryContainerClass.init()
  } else {
    primaryNavigationController = UINavigationController()
    secondaryNavigationController = UINavigationController()
  }
  primaryNavigationController.setViewControllers(primaryViewControllers, animated: false)
  secondaryNavigationController.setViewControllers(secondaryViewControllers, animated: false)
  return [primaryNavigationController, secondaryNavigationController]
}
