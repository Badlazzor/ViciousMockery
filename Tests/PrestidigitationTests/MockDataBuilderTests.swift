import Nimble
import Quick

@testable import Prestidigitation
import ViciousMockery

final class MockBuilderSpec: QuickSpec {
    override func spec() {
        describe("MockBuilder") {
            var mockBuilder: MockBuilder<Original.A>!

            beforeEach {
                mockBuilder = Original.A.mock
            }

            describe("with") {
                it("will store the given value in the values dictionary") {
                    mockBuilder = mockBuilder
                        .with(\.a, "🐱🦊🐯")
                        .with(\.b, 1)

                    expect(mockBuilder.values[keyPath: \.a]).to(equal("🐱🦊🐯"))
                    expect(mockBuilder.values[keyPath: \.b]).to(equal(1))
                }

                // Dodging doulbe optionals
                it("will store the given value for optional types as non optional") {
                    mockBuilder = mockBuilder.with(\.c, (1, "🐱🦊🐯"))

                    expect(
                        mockBuilder.values[keyPath: \.c]?.map(EquatableTuple2.init)
                    ).to(equal(
                        EquatableTuple2((1, "🐱🦊🐯"))
                    ))
                }
            }

            describe("value of") {
                var store: MockBuilder<Original.A>.Store<Original.A>!

                beforeEach {
                    mockBuilder = .init(finalizer: { s in
                        store = s
                        return Original.A.mock.build()
                    })

                    mockBuilder.values = [
                        \.a: "🐱🦊🐯",
                        \.c: (1, "🐱🦊🐯")
                    ]

                    _ = mockBuilder.build()
                }

                it("will return the values stored") {
                    expect(store.value(of: \.a, .empty)).to(equal("🐱🦊🐯"))
                    expect(
                        store.value(of: \.c, .empty).map(EquatableTuple2.init)
                    ).to(equal(
                        EquatableTuple2((1, "🐱🦊🐯"))
                    ))
                }

                it("will return the default values for nonstored KeyPaths") {
                    expect(store.value(of: \.b, .init(create: { -1 }))).to(equal(-1))
                }
            }
        }
    }
}

enum Original {
    fileprivate struct A {
        let a: String
        let b: Int
        let c: (Int, String)?
    }
}

extension Original.A: Mockable {
    static var mock: Prestidigitation.MockBuilder<Original.A> {
        MockBuilder<Original.A> { store in
            .init(
                a: store.value(of: \.a, .empty),
                b: store.value(of: \.b, .empty),
                c: store.value(of: \.c, .empty)
            )
        }
    }
}
