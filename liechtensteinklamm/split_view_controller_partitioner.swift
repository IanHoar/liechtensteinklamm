import UIKit

public protocol SplitViewControllerPartitioner {

  func partitionViewControllers(splitViewController: UISplitViewController) -> (primary: [UIViewController], secondary: [UIViewController])

}

extension UINavigationController: SplitViewControllerPartitioner {

  public func partitionViewControllers(splitViewController: UISplitViewController) -> (primary: [UIViewController], secondary: [UIViewController]) {

    if let first = self.viewControllers.first {
      var primary = Array(arrayLiteral: first)
      for viewController in self.viewControllers.dropFirst() {
        if let viewControllerPartition = viewController as? PreferredSplitViewPosition {
            if viewControllerPartition.preferredSplitViewPositionForSplitViewController(splitViewController: splitViewController) == .primary {
            primary.append(viewController)
            continue
          }
        }
        break
      }
      
      let secondary = self.viewControllers[primary.count..<viewControllers.count]
      return (primary: primary, secondary: Array(secondary))
    }
    return (primary: [], secondary: [])
  }
  
}
