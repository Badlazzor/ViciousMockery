import Nimble
import Quick

@testable import Prestidigitation
import ViciousMockery

final class MockDataBuilderSpec: QuickSpec {
    override func spec() {
        describe("MockDataBuilder") {
            var dataBuilder: MockDataBuilder.A!

            beforeEach {
                dataBuilder = .init()
            }

            describe("with") {
                it("will store the given value in the values dictionary") {
                    dataBuilder.with(\.a, "🐱🦊🐯")
                    dataBuilder.with(\.b, 1)

                    expect(dataBuilder.values[keyPath: \.a]).to(equal("🐱🦊🐯"))
                    expect(dataBuilder.values[keyPath: \.b]).to(equal(1))
                }

                // Dodging doulbe optionals
                it("will store the given value for optional types as non optional") {
                    dataBuilder.with(\.c, (1, "🐱🦊🐯"))
                    expect(
                        dataBuilder.values[keyPath: \.c]?.map(EquatableTuple2.init)
                    ).to(equal(
                        EquatableTuple2((1, "🐱🦊🐯"))
                    ))
                }
            }

            describe("value of") {
                beforeEach {
                    dataBuilder.values = [
                        \.a: "🐱🦊🐯",
                        \.c: (1, "🐱🦊🐯")
                    ]
                }

                it("will return the values stored") {
                    expect(dataBuilder.value(of: \.a, defaultValue: "")).to(equal("🐱🦊🐯"))
                    expect(
                        dataBuilder.value(of: \.c, defaultValue: nil).map(EquatableTuple2.init)
                    ).to(equal(
                        EquatableTuple2((1, "🐱🦊🐯"))
                    ))
                }

                it("will return the default values for nonstored KeyPaths") {
                    expect(dataBuilder.value(of: \.b, defaultValue: -1)).to(equal(-1))
                }
            }
        }
    }
}

extension MockDataBuilder {
    fileprivate final class A: Builder<Original.A>, MockDataBuilding {
        func build() -> Original.A {
            .init(
                a: value(of: \.a, defaultValue: "default"),
                b: value(of: \.b, defaultValue: 0),
                c: value(of: \.c, defaultValue: nil)
            )
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
