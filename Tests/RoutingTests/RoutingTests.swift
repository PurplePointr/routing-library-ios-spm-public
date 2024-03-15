import XCTest
@testable import Routing
import RoutingCore

class RoutingTests: XCTestCase {
    func testSanity() throws {
        _ = try RoutingGraph(nodes: [], edges: [])
    }
}
