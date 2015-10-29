import Nimble
import Quick
import UIKit
@testable import Liechtensteinklamm

private class PrimaryViewController: UIViewController, PreferredSplitViewPosition {
  func preferredSplitViewPositionForSplitViewController(splitViewController: UISplitViewController) -> SplitViewPosition {
    return .Primary
  }
}

private class SecondaryViewController: UIViewController, PreferredSplitViewPosition {
  func preferredSplitViewPositionForSplitViewController(splitViewController: UISplitViewController) -> SplitViewPosition {
    return .Secondary
  }
}

class SplitViewControllerPartitionerSpec: QuickSpec {

  override func spec() {
    describe("SplitViewControllerPartitioner") {
      var navigationController: UINavigationController!
      var splitViewController: UISplitViewController!
      beforeEach {
        splitViewController = UISplitViewController(nibName: nil, bundle: nil)
        navigationController = UINavigationController(nibName: nil, bundle: nil)
      }

      describe("#partitionViewControllers") {

        it("partitions the first controller as primary") {
          let first = SecondaryViewController()
          let second = SecondaryViewController()
          navigationController.setViewControllers([first, second], animated: false)
          let (primary, secondary) = navigationController.partitionViewControllers(splitViewController)

          expect(primary).to(equal([first]))
          expect(secondary).to(equal([second]))
        }

        it("partitions zero view controllers") {
          let (primary, secondary) = navigationController.partitionViewControllers(splitViewController)
          expect(primary).to(equal([]))
          expect(secondary).to(equal([]))
        }

        it("partions consecutive primary view controllers") {
          let first = PrimaryViewController()
          let second = PrimaryViewController()
          let third = SecondaryViewController()
          navigationController.setViewControllers([first, second, third], animated: false)

          let (primary, secondary) = navigationController.partitionViewControllers(splitViewController)

          expect(primary).to(equal([first, second]))
          expect(secondary).to(equal([third]))
        }

        it("partions consecutive primary view controllers") {
          let first = PrimaryViewController()
          let second = PrimaryViewController()
          let third = SecondaryViewController()
          let fourth = PrimaryViewController()
          navigationController.setViewControllers([first, second, third, fourth], animated: false)

          let (primary, secondary) = navigationController.partitionViewControllers(splitViewController)

          expect(primary).to(equal([first, second]))
          expect(secondary).to(equal([third, fourth]))
        }

      }
    }
  }
  
}
