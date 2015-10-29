import UIKit

class ViewController: UIViewController {

  let label = UILabel(frame: .zero)
  let index: Int

  init(index: Int) {
    self.index = index
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "View \(index)"
    self.label.text = "\(index)"
    self.label.font = UIFont.systemFontOfSize(70, weight: UIFontWeightThin)
    self.label.textColor = UIColor.lightGrayColor()
    self.label.sizeToFit()
    self.view.addSubview(self.label)
    self.view.addConstraintsForCenteredSubview(self.label)

    self.view.backgroundColor = UIColor.greenColor()

    if let button = self.splitViewController?.displayModeButtonItem() {
      self.navigationItem.leftBarButtonItem = button
      self.navigationItem.leftItemsSupplementBackButton = true
    }
  }

}
