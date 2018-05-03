
import UIKit

class AppCoordinator: RootCoordinator {

    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }

    enum Tab: Int {
        case feed, favorites
    }

    private let tabBarController = TabBarController()
    private var tabs: [Tab: NavigationCoordinator] = [:]

    var activeTabCoordinator: NavigationCoordinator? {
        guard let tab = Tab(rawValue: tabBarController.selectedIndex) else {
            return nil
        }

        return tabs[tab]
    }

    private typealias TabCoordinatorBox = (tab: Tab, coordinator: NavigationCoordinator)

    override func start(with deeplink: DeepLink?) {
        if let deeplink = deeplink {
            switch deeplink {
            default:
                runSplash()
            }
        } else {
            switch instructor {
            default:
                runSplash()
            }
        }
    }

    func runSplash() {
        let controller = SplashViewController.instantiate()
        controller.onFinish = { [weak self] in
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
