import UIKit

public protocol SplitViewControllerCustomContainers {

  var expandedPrimaryContainerClass: UINavigationController.Type { get }
  var expandedSecondaryContainerClass: UINavigationController.Type { get }
  var collapsedContainerClass: UINavigationController.Type { get }

}

extension SplitViewControllerCustomContainers {

  public var expandedPrimaryContainerClass: UINavigationController.Type {
    return UINavigationController.self
  }

  public var expandedSecondaryContainerClass: UINavigationController.Type {
    return UINavigationController.self
  }

  public var collapsedContainerClass: UINavigationController.Type {
    return UINavigationController.self
  }

}
