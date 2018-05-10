
import UIKit
import Reusable

class FeedItemTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet private var titleLabel: UILabel!

    var viewModel: FeedItemCellViewModel! {
        didSet {
            titleLabel.text = viewModel.title
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

struct FeedItemCellViewModel {
    private let item: FeedItem

    lazy var title: String = {
        return [self.item.firstName, self.item.lastName].joined(separator: " ")
    }()

    init(with item: FeedItem) {
        self.item = item
    }
}
