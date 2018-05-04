
import UIKit

class FeedCoordinator: NavigationCoordinator, ProfileFlowRunner {
    override init(with router: NavigationRouter) {
        super.init(with: router)

        let controller = FeedViewController.instantiate()

        controller.onClickProfile = { [weak self] in
            if Session.shared.isAuthorized {
                self?.runProfileFlow()
            } else {
                self?.runAuthFlow()
            }
        }

        router.navigationController.tabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)

        router.setRootModule(controller)
    }
}
