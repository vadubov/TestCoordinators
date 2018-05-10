
import UIKit
import Reusable

protocol FavoritesControllerOutput: class {
    var onSelectItem: ((FeedItem) -> Void)? { get set }
}

class FavoritesViewController: AbstractViewController, StoryboardSceneBased, FavoritesControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.favorites

    @IBOutlet private var tableView: UITableView!

    var onSelectItem: ((FeedItem) -> Void)?
    
    private var viewModel: FavoritesControllerViewModel!

    class func instantiate(with viewModel: FavoritesControllerViewModel) -> FavoritesViewController {
        let controller = FavoritesViewController.instantiate()
        controller.viewModel = viewModel
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewModel.loadItems()
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedItemTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        viewModel.configureItemCell(cell, indexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.items![indexPath.row]
        onSelectItem?(item)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
