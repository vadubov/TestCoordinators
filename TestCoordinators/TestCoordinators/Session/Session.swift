
import Foundation

final class Session {
    static let shared = Session()

    var user: User?

    var isAuthorized: Bool {
        return user != nil
    }

    private init() {}
}
