
import UIKit

protocol FeedItemDetailsPresenter where Self: NavigationCoordinator {
    func pushItemDetails(with item: FeedItem)
}

extension FeedItemDetailsPresenter {
    func pushItemDetails(with item: FeedItem) {
        let viewModel = FeedItemDetailsControllerViewModel(with: item, session: session)
        let controller = FeedItemDetailsViewController.instantiate(with: viewModel)
        router.push(controller)
    }
}
