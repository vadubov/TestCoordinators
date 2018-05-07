
import UIKit
import Reusable

protocol EditProfileControllerOutput: class {
    var onSave: (() -> Void)? { get set }
}

class EditProfileViewController: AbstractViewController, StoryboardSceneBased, EditProfileControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.profile

    var onSave: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func saveAction(_ sender: UIButton) {
        onSave?()
    }
}
