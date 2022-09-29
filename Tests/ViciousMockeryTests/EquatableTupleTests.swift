import Nimble
import Quick

@testable import ViciousMockery

final class EquatableTupleSpec: QuickSpec {
    override func spec() {
        describe("Equatable Tuples") {
            it("are actually eqatable when initalized with eqautable elements") {
                expect([("AB", 5)] == [("AB", 5)]).to(beTruthy())
                expect([("AB", 5)] == [("AB", 6)]).to(beFalsy())

                expect([("AB", 5, 5)] == [("AB", 5, 5)]).to(beTruthy())
                expect([("AB", 5, 5)] == [("AB", 5, 6)]).to(beFalsy())

                expect([("AB", 5, 5, 5)] == [("AB", 5, 5, 5)]).to(beTruthy())
                expect([("AB", 5, 5, 5)] == [("AB", 5, 5, 6)]).to(beFalsy())

                expect([("AB", 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5)]).to(beTruthy())
                expect([("AB", 5, 5, 5, 5)] == [("AB", 5, 5, 5, 6)]).to(beFalsy())

                expect([("AB", 5, 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5, 5)]).to(beTruthy())
                expect([("AB", 5, 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5, 6)]).to(beFalsy())

                expect([("AB", 5, 5, 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5, 5, 5)]).to(beTruthy())
                expect([("AB", 5, 5, 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5, 5, 6)]).to(beFalsy())

                expect([("AB", 5, 5, 5, 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5, 5, 5, 5)]).to(beTruthy())
                expect([("AB", 5, 5, 5, 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5, 5, 5, 6)]).to(beFalsy())

                expect([("AB", 5, 5, 5, 5, 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5, 5, 5, 5, 5)]).to(beTruthy())
                expect([("AB", 5, 5, 5, 5, 5, 5, 5, 5)] == [("AB", 5, 5, 5, 5, 5, 5, 5, 6)]).to(beFalsy())
            }
        }
    }
}
