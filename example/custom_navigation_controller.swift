import UIKit

class CustomNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBar.barTintColor = UIColor.redColor()
  }

}

class GreenNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBar.barTintColor = UIColor.greenColor()
  }

}

class MagentaNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBar.barTintColor = UIColor.magentaColor()
  }

}
