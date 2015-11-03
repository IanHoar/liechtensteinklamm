import UIKit

public enum SplitViewPosition {
  case Primary
  case Secondary
}

public protocol SplitViewExcludeViewController {

  func excludeViewController(splitViewController: UISplitViewController) -> Bool

}
