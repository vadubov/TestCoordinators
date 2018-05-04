
import UIKit
import Reusable

protocol FeedControllerOutput: class {
    var onClickProfile: (() -> Void)? { get set }
}

class FeedViewController: AbstractViewController, StoryboardSceneBased, FeedControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.feed

    var onClickProfile: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DLog("")
    }

    @IBAction private func profileAction(_ sender: UIBarButtonItem) {
        onClickProfile?()
    }
}
