
import UIKit
import Reusable

protocol OnboardingControllerOutput: class {
    var onSkip: (() -> Void)? { get set }
    var onDone: (() -> Void)? { get set }
}

class OnboardingViewController: UIViewController, StoryboardSceneBased, OnboardingControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.onboarding

    var onSkip: (() -> Void)?
    var onDone: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func skipAction(_ sender: UIButton) {
        onSkip?()
    }

    @IBAction private func doneAction(_ sender: UIButton) {
        Defaults.onboardingWasShown = true
        onDone?()
    }
}
