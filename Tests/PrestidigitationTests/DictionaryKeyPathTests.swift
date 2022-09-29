import Nimble
import Quick

@testable import Prestidigitation

final class EquatableTupleSpec: QuickSpec {
    override func spec() {
        describe("ParitalKeyPath based Dictionary") {
            var sut: [PartialKeyPath<A>: Any]!

            beforeEach {
                sut = .init()
            }

            it("can store and retrieve data using KeyPath based subscripts") {
                sut[keyPath: \.a] = "A"
                sut[keyPath: \.b] = 1

                expect(sut[keyPath: \.a]).to(equal("A"))
                expect(sut[keyPath: \.b]).to(equal(1))
                expect(sut[keyPath: \.c]).to(beNil())
            }
        }

        struct A {
            let a: String
            let b: Int
            let c: String
        }
    }
}
