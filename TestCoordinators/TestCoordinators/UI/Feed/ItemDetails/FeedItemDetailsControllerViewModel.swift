
import UIKit

class FeedItemDetailsControllerViewModel {
    let item: FeedItem
    let session: Session

    lazy var title: String = {
        return [self.item.firstName, self.item.lastName.first.flatMap({ String($0) }).flatMap({ $0 + "." }) ?? ""].joined(separator: " ")
    }()

    init(with item: FeedItem, session: Session) {
        self.item = item
        self.session = session
    }
}
