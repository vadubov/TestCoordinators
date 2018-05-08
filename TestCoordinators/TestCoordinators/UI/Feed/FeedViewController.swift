
import UIKit
import Reusable

protocol FeedControllerOutput: class {
    var onClickProfile: (() -> Void)? { get set }
    var onSelectItem: ((FeedItem) -> Void)? { get set }
}

class FeedViewController: AbstractViewController, StoryboardSceneBased, FeedControllerOutput {

    static var sceneStoryboard: UIStoryboard = Storyboard.feed

    @IBOutlet private var profileButton: UIBarButtonItem!
    @IBOutlet private var tableView: UITableView!

    var onClickProfile: (() -> Void)?
    var onSelectItem: ((FeedItem) -> Void)?

    private var viewModel: FeedControllerViewModel!

    class func instantiate(with viewModel: FeedControllerViewModel) -> FeedViewController {
        let controller = FeedViewController.instantiate()
        controller.viewModel = viewModel
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        viewModel.loadItems()
    }

    @IBAction private func profileAction(_ sender: UIBarButtonItem) {
        onClickProfile?()
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
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
