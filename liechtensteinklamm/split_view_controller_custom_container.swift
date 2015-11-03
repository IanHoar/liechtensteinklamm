import UIKit

public protocol SplitViewControllerCustomContainers {

  var expandingContainerClass: UINavigationController.Type { get }
  var collapsedContainerClass: UINavigationController.Type { get }

}

extension SplitViewControllerCustomContainers {

  public var expandingContainerClass: UINavigationController.Type {
    return UINavigationController.self
  }

  public var collapsedContainerClass: UINavigationController.Type {
    return UINavigationController.self
  }

}
