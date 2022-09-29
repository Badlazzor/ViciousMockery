import Nimble
import Quick

@testable import ViciousMockery

final class GenericStubSpec: QuickSpec {
    override func spec() {
        describe("GenericStubCollection") {
            var stubCollection: GenericStubCollection!

            beforeEach {
                stubCollection = .init()
            }

            it("can register stubs that can be retreived") {
                stubCollection.registerStub(Stub<A, String> { _ in "" })
                stubCollection.registerStub(Stub<B, Void> { _ in })

                expect(stubCollection.stub(forType: Stub<A, String>.self)).notTo(throwAssertion())
                expect(stubCollection.stub(forType: Stub<B, Void>.self)).notTo(throwAssertion())
            }

            it("will throw an assertion if queried for not registered type") {
                expect(stubCollection.stub(forType: Stub<Void, Void>.self)).to(throwAssertion())
            }

            class A {}
            class B: A {}
        }
    }
}
