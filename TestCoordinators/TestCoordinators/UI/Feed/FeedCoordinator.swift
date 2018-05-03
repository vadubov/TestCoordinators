
import UIKit

class FeedCoordinator: NavigationCoordinator {
    override init(with router: NavigationRouter) {
        super.init(with: router)

        let controller = FeedViewController.instantiate()
        router.navigationController.tabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)

        router.setRootModule(controller)
    }
}
