import UIKit
import Liechtensteinklamm

let TableViewControllerCellReuseIdentifier = "TableViewControllerCellReuseIdentifier"

class TableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "App"
    self.tableView.registerClass(UITableViewCell.self,
      forCellReuseIdentifier: TableViewControllerCellReuseIdentifier)
  }

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    self.splitViewController?.showDetailViewController(ViewController(index: indexPath.row), sender: self)
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(TableViewControllerCellReuseIdentifier, forIndexPath: indexPath)
    cell.accessoryType = .DetailButton
    cell.textLabel!.text = "\(indexPath.row)"
    return cell
  }

  override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
    self.navigationController?.pushViewController(TableViewController(), animated: true)
  }
  
}

extension TableViewController: SplitViewDefaultViewController {

  func defaultViewController(splitViewController: UISplitViewController) -> UIViewController {
    return EmptyStateViewController()
  }

}

extension TableViewController: PreferredSplitViewPosition {

  func preferredSplitViewPositionForSplitViewController(splitViewController: UISplitViewController) -> SplitViewPosition {
    return .Primary
  }

}