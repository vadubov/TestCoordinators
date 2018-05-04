
import UIKit
import Reusable

protocol ProfileControllerOutput: class {
    var onClickClose:(() -> Void)? { get set }
}

class ProfileViewController: AbstractViewController, StoryboardSceneBased, ProfileControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.profile

    var onClickClose: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func closeAction(_ sender: UIBarButtonItem) {
        onClickClose?()
    }
}
