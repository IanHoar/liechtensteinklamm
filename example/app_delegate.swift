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
    splitViewController.preferredDisplayMode = .allVisible
    return splitViewController
  }()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    window.rootViewController = self.splitViewController

    self.splitViewController.viewControllers = createContainersForSplitViewController(splitViewController: splitViewController,
      primaryViewControllers: [TableViewController()],
      secondaryViewControllers: [EmptyStateViewController()])

    window.makeKeyAndVisible()

    return true
  }

}
