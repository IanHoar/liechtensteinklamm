import UIKit

class CustomNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBar.barTintColor = UIColor.red
  }

}

class GreenNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBar.barTintColor = UIColor.green
  }

}

class MagentaNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBar.barTintColor = UIColor.magenta
  }

}
