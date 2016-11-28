import UIKit
import Liechtensteinklamm

class EmptyStateViewController: UIViewController {

  override func viewDidLoad() {
    self.view.backgroundColor = UIColor.red
    super.viewDidLoad()
  }

}

extension EmptyStateViewController: SplitViewExcludeViewController {

  func excludeViewController(_ splitViewController: UISplitViewController) -> Bool {
    return true
  }

}
