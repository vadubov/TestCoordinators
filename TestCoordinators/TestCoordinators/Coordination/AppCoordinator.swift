
import UIKit

class AppCoordinator: RootCoordinator {

    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }

    private var deeplink: DeepLink?

    enum Tab: Int {
        case feed, favorites
    }

    private lazy var tabBarController: TabBarController = {
        let controller = TabBarController()

        controller.onShouldSelectViewController = { [weak self] (controller) -> Bool in
            if let index = self?.tabBarController.viewControllers?.index(of: controller), let tab = Tab(rawValue: index) {
                if tab == .favorites, !Session.shared.isAuthorized {
                    self?.runAuthFlow() { [weak self] in
                        if Session.shared.isAuthorized {
                            self?.tabBarController.selectedIndex = tab.rawValue
                        }
                    }
                    return false
                }
            }
            return true
        }
        
        return controller
    }()

    private var tabs: [Tab: NavigationCoordinator] = [:]

    var activeTabCoordinator: NavigationCoordinator? {
        guard let tab = Tab(rawValue: tabBarController.selectedIndex) else {
            return nil
        }

        return tabs[tab]
    }

    private typealias TabCoordinatorBox = (tab: Tab, coordinator: NavigationCoordinator)

    override func start(with deeplink: DeepLink?) {
        self.deeplink = deeplink
        runSplash()
    }

    func runSplash() {
        let controller = SplashViewController.instantiate()

        controller.onFinish = { [weak self] in
            if let deeplink = self?.deeplink {
                switch deeplink {
                default:
                    self?.runMainFlow()
                }
            } else {
                switch self?.instructor {
                case .onboarding?:
                    self?.runOnboarding()
                default:
                    self?.runMainFlow()
                }
            }
        }
        
        router.setRootModule(controller)
    }

    func runOnboarding() {
        let controller = OnboardingViewController.instantiate()

        controller.onSkip = { [weak self] in
            self?.runMainFlow()
        }

        controller.onDone = { [weak self] in
            self?.runMainFlow()
        }

        router.setRootModule(controller)
    }

    func runMainFlow() {
        let tabs: [TabCoordinatorBox] = [
            (Tab.feed, FeedCoordinator(with: NavigationRouter())),
            (Tab.favorites, FavoritesCoordinator(with: NavigationRouter()))
        ]

        addTabs(tabs)
        router.setRootModule(tabBarController)
    }

    private func addTabs(_ tabs: [TabCoordinatorBox]) {
        let sorted = tabs.sorted { (box1, box2) -> Bool in
            return box2.tab.rawValue > box1.tab.rawValue
        }

        let controllers = sorted.map { (box) -> UIViewController in
            self.tabs[box.tab] = box.coordinator
            return box.coordinator.toPresentable()
        }

        tabBarController.viewControllers = controllers
    }
}
