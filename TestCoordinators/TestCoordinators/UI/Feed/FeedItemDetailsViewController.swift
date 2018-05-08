
import UIKit
import Reusable

class FeedItemDetailsViewController: AbstractViewController, StoryboardSceneBased {
    static var sceneStoryboard: UIStoryboard = Storyboard.feed

    private var viewModel: FeedItemDetailsControllerViewModel!

    class func instantiate(with viewModel: FeedItemDetailsControllerViewModel) -> FeedItemDetailsViewController {
        let controller = FeedItemDetailsViewController.instantiate()
        controller.viewModel = viewModel
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        title = viewModel.title
    }
}
