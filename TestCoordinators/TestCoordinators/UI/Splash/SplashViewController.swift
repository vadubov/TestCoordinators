
import UIKit
import Reusable

protocol SplashControllerOutput: class {
    var onFinish: (() -> Void)? { get set }
}

class SplashViewController: AbstractViewController, StoryboardSceneBased, SplashControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.splash

    var onFinish: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        delay(1) { [weak self] in
            self?.onFinish?()
        }
    }

}
