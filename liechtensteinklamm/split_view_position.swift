import UIKit

public enum SplitViewPosition {
  case primary
  case secondary
}

public protocol SplitViewExcludeViewController {

  func excludeViewController(_ splitViewController: UISplitViewController) -> Bool

}
