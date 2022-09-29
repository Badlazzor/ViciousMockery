import Nimble
import Quick

@testable import ViciousMockery

final class StubSpec: QuickSpec {
    override func spec() {
        describe("Stub") {
            var stub: Stub<String, String>!

            beforeEach {
                stub = .init()
            }

            // MARK: - isImplemented
            describe("isImplemented") {

                // MARK: _returns false by default
                it("returns false by default") {
                    expect(stub.isImplemented).to(beFalsy())
                }

                // MARK: _when getting an implementation closure
                context("when getting an implementation closure") {
                    beforeEach {
                        stub = .init { _ in "Output" }
                    }

                    // MARK: __returns true
                    it("returns true") {
                        expect(stub.isImplemented).to(beTruthy())
                    }
                }
            }

            // MARK: - isCalled
            describe("isCalled") {
                beforeEach {
                    stub = .init { _ in "Output" }
                }

                // MARK: _returns false by default
                it("returns false by default") {
                    expect(stub.isCalled).to(beFalsy())
                }

                // MARK: _when called
                context("when called") {

                    // MARK: __returns true
                    it("returns true") {
                        stub.invoke(with: "")
                        expect(stub.isCalled).to(beTruthy())
                    }
                }
            }

            // MARK: - callCount
            describe("callCount") {
                beforeEach {
                    stub = .init { _ in "Output" }
                }

                // MARK: _returns 0 by default
                it("returns 0 by default") {
                    expect(stub.callCount).to(equal(0))
                }

                // MARK: _when called
                context("when called") {

                    // MARK: __returns the number of invocations
                    it("returns the number of invocations") {
                        stub.invoke(with: "")
                        stub.invoke(with: "")
                        stub.invoke(with: "")
                        expect(stub.callCount).to(equal(3))
                    }
                }
            }

            // MARK: - invoke
            describe("invoke") {

                // MARK: _fails by default
                it("fails by default") {
                    expect(stub.invoke(with: "")).to(throwAssertion())
                }

                // MARK: _when given an implementation
                context("when given an implementation") {
                    beforeEach {
                        stub = .init { _ in "Output" }
                    }

                    // MARK: __returns the output coming from the implementation
                    it("returns the output coming from the implementation") {
                        expect(stub.invoke(with: "")).to(equal("Output"))
                    }

                    // MARK: __registers each passed invocation in the inputs in order
                    it("registers each passed invocation in the inputs in order") {
                        stub.invoke(with: "A")
                        stub.invoke(with: "B")
                        stub.invoke(with: "C")

                        expect(stub.inputs).to(equal(["A", "B", "C"]))
                        expect(stub.inputs).notTo(equal(["C", "B", "A"]))
                    }
                }
            }

            // MARK: - tryInvoke
            describe("tryInvoke") {

                // MARK: _fails by default
                it("fails by default") {
                    expect(try stub.tryInvoke(with: "")).to(throwAssertion())
                }

                // MARK: _when given a nonthrowing implementation
                context("when given a nonthrowing implementation") {
                    beforeEach {
                        stub = .init { _ in "Output" }
                    }

                    // MARK: __returns the output coming from the implementation
                    it("returns the output coming from the implementation") {
                        expect(try stub.tryInvoke(with: "")).to(equal("Output"))
                    }

                    // MARK: __registers each passed invocation in the inputs in order
                    it("registers each passed invocation in the inputs in order") {
                        try stub.tryInvoke(with: "A")
                        try stub.tryInvoke(with: "B")
                        try stub.tryInvoke(with: "C")

                        expect(stub.inputs).to(equal(["A", "B", "C"]))
                        expect(stub.inputs).notTo(equal(["C", "B", "A"]))
                    }
                }

                // MARK: _when given a throwing implementation
                context("when given a throwing implementation") {
                    enum TestError: Error, Equatable {
                        case base
                    }

                    beforeEach {
                        stub = .init { _ in throw TestError.base }
                    }

                    // MARK: __throws the same error when invoked
                    it("throws the same error when invoked") {
                        expect(try stub.tryInvoke(with: "")).to(throwError(TestError.base))
                    }
                }
            }

            // MARK: - recordNotInvoking
            describe("recordNotInvoking") {

                // MARK: _saves the given input
                it("saves the given input") {
                    stub.recordNotInvoking("A")
                    stub.recordNotInvoking("B")

                    expect(stub.inputs).to(equal(["A", "B"]))
                }

                // MARK: _does not call the implementation itself
                it("does not call the implementation itself") {
                    let innerStub: Stub<String, String> = .init { $0 }

                    stub = .init {
                        innerStub.invoke(with: $0)
                    }
                    stub.recordNotInvoking("A")

                    expect(innerStub.isCalled).to(beFalsy())
                }
            }
        }
    }
}
