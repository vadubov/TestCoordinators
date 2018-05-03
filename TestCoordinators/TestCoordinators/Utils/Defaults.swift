
import UIKit

enum Defaults {
    private enum Keys {
        static let onboardingWasShown = "onboardingWasShown"
    }

    static var onboardingWasShown: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.onboardingWasShown)
        }
        get {
            return UserDefaults.standard.bool(forKey: Keys.onboardingWasShown)
        }
    }
}
