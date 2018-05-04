
import UIKit

protocol TabBarControllerOutput: class {
    var onShouldSelectViewController: ((UIViewController) -> Bool)? { get set }
}

class TabBarController: UITabBarController, TabBarControllerOutput {
    var onShouldSelectViewController: ((UIViewController) -> Bool)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        delegate = self
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return onShouldSelectViewController?(viewController) ?? true
    }
}
