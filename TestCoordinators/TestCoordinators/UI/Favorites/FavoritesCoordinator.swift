
import UIKit

class FavoritesCoordinator: NavigationCoordinator {
    override init(with router: NavigationRouter) {
        super.init(with: router)

        let controller = FavoritesViewController.instantiate()
        router.navigationController.tabBarItem = UITabBarItem(title: "Favorites", image: nil, tag: 1)

        router.setRootModule(controller)
    }
}
