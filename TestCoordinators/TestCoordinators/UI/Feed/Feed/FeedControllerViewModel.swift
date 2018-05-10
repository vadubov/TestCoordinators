
import UIKit

class FeedControllerViewModel {
    let session: Session
    private(set) var items: [FeedItem]?

    init(session: Session) {
        self.session = session
    }

    func loadItems() {
        items = (0..<10).map({ FeedItem(firstName: "First\($0)", lastName: "Last\($0)") })
    }

    func configureItemCell(_ cell: FeedItemTableViewCell, indexPath: IndexPath) {
        guard let items = items, indexPath.row < items.count else {
            return
        }

        let viewModel = FeedItemCellViewModel(with: items[indexPath.row])
        cell.viewModel = viewModel
    }
}
