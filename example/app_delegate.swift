import UIKit
import Liechtensteinklamm

class SplitViewControllerDelegate: SplitViewDelegate {}

extension SplitViewControllerDelegate: SplitViewControllerCustomContainers {

  var collapsedContainerClass: UINavigationController.Type {
    return GreenNavigationController.self
  }

  var expandedSecondaryContainerClass: UINavigationController.Type {
    return CustomNavigationController.self
  }

  var expandedPrimaryContainerClass: UINavigationController.Type {
    return MagentaNavigationController.self
  }

}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  let splitViewControllerDelegate = SplitViewControllerDelegate()
  lazy var splitViewController: UISplitViewController = {
    let splitViewController = UISplitViewController()
    splitViewController.delegate = self.splitViewControllerDelegate
    splitViewController.preferredDisplayMode = .AllVisible
    return splitViewController
  }()

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    self.window = window
    window.rootViewController = self.splitViewController

    self.splitViewController.viewControllers = createContainersForSplitViewController(splitViewController,
      primaryViewControllers: [TableViewController()],
      secondaryViewControllers: [EmptyStateViewController()])

    window.makeKeyAndVisible()

    return true
  }

}
