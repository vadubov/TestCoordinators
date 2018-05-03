
import Foundation

func DLog<T>(_ object: T, filename: String = #file, line: Int = #line, funcname: String = #function) {
    print("\(NSDate()): \((filename as NSString).lastPathComponent)(\(line)) \(funcname):\(object)\n")
}
