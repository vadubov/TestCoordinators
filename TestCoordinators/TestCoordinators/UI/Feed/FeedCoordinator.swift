
import UIKit

class FeedCoordinator: NavigationCoordinator, ProfileFlowRunner, FeedItemDetailsPresenter {

    override init(with router: NavigationRouter, session: Session) {
        super.init(with: router, session: session)

        let viewModel = FeedControllerViewModel(session: session)
        let controller = FeedViewController.instantiate(with: viewModel)

        controller.onClickProfile = { [weak self] in
            if self?.session.isAuthorized ?? false {
                self?.runProfileFlow()
            } else {
                self?.runAuthFlow()
            }
        }

        controller.onSelectItem = { [weak self] item in
            self?.pushItemDetails(with: item)
        }

        router.setRootModule(controller)
    }
}
