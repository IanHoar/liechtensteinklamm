import UIKit
import Liechtensteinklamm

let TableViewControllerCellReuseIdentifier = "TableViewControllerCellReuseIdentifier"

class TableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "App"
    self.tableView.register(UITableViewCell.self,
      forCellReuseIdentifier: TableViewControllerCellReuseIdentifier)
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.splitViewController?.showDetailViewController(ViewController(index: indexPath.row), sender: self)
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewControllerCellReuseIdentifier, for: indexPath)
    cell.accessoryType = .detailButton
    cell.textLabel!.text = "\(indexPath.row)"
    return cell
  }

  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    self.navigationController?.pushViewController(TableViewController(), animated: true)
  }
  
}

extension TableViewController: SplitViewDefaultViewController {

  func defaultViewController(_ splitViewController: UISplitViewController) -> UIViewController {
    return EmptyStateViewController()
  }

}

extension TableViewController: PreferredSplitViewPosition {

  func preferredSplitViewPositionForSplitViewController(_ splitViewController: UISplitViewController) -> SplitViewPosition {
    return .primary
  }

}
