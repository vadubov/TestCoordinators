
import Foundation
import RxSwift

public class Session {
    let config: Variable<Config?>
    let user: Variable<User?>

    var isAuthorized: Bool {
        return user.value != nil
    }

    init() {
        self.config = Variable(nil)
        self.user = Variable(nil)
    }
}
