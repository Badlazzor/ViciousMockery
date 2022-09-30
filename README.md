# ViciousMockery

A minimal mocking library for Swift projects.

## About

There are lot of ways getting your mocking and data ready for testing. A bit less so for Swift, but there are options still. "So why?" you could ask. `ViciousMockery` is not trying to be your saviour. It aims to provide you just enough to get started with Stubbing, Mocking and Data replacement for everything you need.

The original version was used in a very big project extended with code generation provided by [Sourcery](https://github.com/krzysztofzablocki/Sourcery). Later on the plan is to include templates and an executable in the package to help setting it up in arbitrary projects already using Sourcery.

## Example usage
The full example project can be reached [here](https://github.com/Badlazzor/ViciousMockeryExample)

### Usage in tests
The tests are using [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble). If you are not already familiar with them, check them out.

Excerpt from [here](https://github.com/Badlazzor/ViciousMockeryExample/blob/main/Tests/ViciousMockeryExampleTests/SimpleUserTests.swift).

```swift
describe("makeThingsHappen") {
    enum TestError: Error {
        case theOneAndOnly
    }
    var thingy: Thingy!

    beforeEach {
        thingy = MockDataBuilder.Thingy()
            .with(\.partA, "Kitty")
            .with(\.partB, 10)
            .with(\.partC, true)
            .build()

        simple.doThingsStub = .init { _ in true }
    }

    it("returns what the simple dependency gives from doThigns for 0 as a condition") {
        expect(try sut.makeThingsHappen(with: thingy)).to(beTruthy())
        expect(simple.doThingsStub.inputs == [(thingy, 0)]).to(beTruthy())
    }
}
```

Checking if the inputs match a certain `Array` can be done better and more clean, but that needs custom `Matcher`s to be written for Nimble and that will be added as a separate target into this package, not to force people getting that as well if they don't need it.

### Mock with Stubs
See files [here](https://github.com/Badlazzor/ViciousMockeryExample/tree/main/Tests/ViciousMockeryExampleTests/Mocks) for examples.


```swift
import ViciousMockery
@testable import ViciousMockeryExample

extension Mock {
    public final class Simple: ViciousMockeryExample.Simple {
        // Make separate getter and setter stub for variables
        public var thingsHappenedGetterStub: Stub<Void, Bool> = .init()
        public var thingsHappenedSetterStub: Stub<Bool, Void> = .init()
        public var thingsHappened: Bool {
            get { thingsHappenedGetterStub.invoke() }
            set { thingsHappenedSetterStub.invoke(with: newValue) }
        }

        // Use `tryInvoke` when stubbing a throwing function, so oyu can test the thrown errors as well
        public var doThingsStub: Stub<(Thingy, Int), Bool> = .init()
        public func doThings(with thingy: Thingy, when condition: Int) throws -> Bool {
            try doThingsStub.tryInvoke(with: (thingy, condition))
        }
    }
}
```

### MockDataBuilder
See files [here](https://github.com/Badlazzor/ViciousMockeryExample/tree/main/Tests/ViciousMockeryExampleTests/MockDataBuilders) for examples.

```swift
import ViciousMockery
import Prestidigitation

@testable import ViciousMockeryExample

extension MockDataBuilder {
    public final class Thingy: Builder<ViciousMockeryExample.Thingy>, MockDataBuilding {
        public func build() -> ViciousMockeryExample.Thingy {
            Built.init(
                partA: value(of: \.partA, defaultValue: ""),
                partB: value(of: \.partB, defaultValue: 0),
                partC: value(of: \.partC, defaultValue: false)
            )
        }
    }
}
```