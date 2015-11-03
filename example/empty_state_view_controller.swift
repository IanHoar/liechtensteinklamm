import UIKit
import Liechtensteinklamm

class EmptyStateViewController: UIViewController {

  override func viewDidLoad() {
    self.view.backgroundColor = UIColor.redColor()
    super.viewDidLoad()
  }

}

extension EmptyStateViewController: SplitViewExcludeViewController {

  func excludeViewController(splitViewController: UISplitViewController) -> Bool {
    return true
  }

}
