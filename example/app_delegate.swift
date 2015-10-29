import UIKit
import Liechtensteinklamm

class SplitViewControllerDelegate: SplitViewDelegate {}

extension SplitViewControllerDelegate: SplitViewCustomContainers {

  var collapsedContainerClass: UINavigationController.Type {
    return CustomNavigationController.self
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


    self.splitViewController.viewControllers = [
      UINavigationController(rootViewController: TableViewController()),
      UINavigationController(rootViewController: ViewController(index: 0))
    ]
    window.makeKeyAndVisible()

    return true
  }


}
