
import UIKit

class FeedCoordinator: NavigationCoordinator, ProfileFlowRunner {
    override init(with router: NavigationRouter) {
        super.init(with: router)

        let controller = FeedViewController.instantiate(with: FeedControllerViewModel())

        controller.onClickProfile = { [weak self] in
            if Session.shared.isAuthorized {
                self?.runProfileFlow()
            } else {
                self?.runAuthFlow()
            }
        }

        controller.onSelectItem = { [weak self] item in
            let viewModel = FeedItemDetailsControllerViewModel(with: item)
            let controller = FeedItemDetailsViewController.instantiate(with: viewModel)
            self?.router.push(controller)
        }

        router.navigationController.tabBarItem = UITabBarItem(title: "Feed", image: nil, tag: 0)

        router.setRootModule(controller)
    }
}
