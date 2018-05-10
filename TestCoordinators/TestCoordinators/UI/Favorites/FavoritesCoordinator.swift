
import UIKit

class FavoritesCoordinator: NavigationCoordinator, FeedItemDetailsPresenter {

    override init(with router: NavigationRouter, session: Session) {
        super.init(with: router, session: session)

        let viewModel = FavoritesControllerViewModel(session: session)
        let controller = FavoritesViewController.instantiate(with: viewModel)

        controller.onSelectItem = { [weak self] (item) in
            self?.pushItemDetails(with: item)
        }

        router.setRootModule(controller)
    }
}
