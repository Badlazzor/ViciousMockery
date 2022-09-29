import XCTest

public protocol StubInterface {
    /// The count of the calls happened on this stub
    var callCount: UInt { get }

    /// Whether the Stub has been called at all
    var isCalled: Bool { get }

    /// Whether the stub has an implementation attached or not
    var isImplemented: Bool { get }
}

/// **Stub** is a stand-in for our functions and variables on the public interfaces that we might want to mock.
///
/// Needs an implementation that describes the behavior we want to observe during the testing.
/// Sports two generic parameters **Input** and **Output**.
///
/// **Input** is the collection of types of the values the original thing would accept, while the
/// **Output** is the amalgamation of the returned types. This most of the time means using Structures or Tuples for both types unless we are in the lucky
/// situation of only having one input and one ouput parameter at most.
///
/// By design the implementation of the stub is nil. We could generate default implementations based on the **Output** type if we would know how to create
/// them, but having to implement the actual implementation reminds the developers wrinting the actual tests, that they will be using the **Stub** itself so
/// most probably they are using a dependency as well, enforcing testing for them. In future releases this might change by adding "nice" **Stubs** that
/// are a bit more lenient on having an actual implementation.
///
/// **Example usage:**
///
/// ```
/// let stub: Stub<(Bool, String), Void> = .init()
///
/// print(stub.isCalled) // false
/// stub.invoke(with: (true, "Stuff"))
/// print(stub.inputs) // [(true, "Stuff")]
/// print(stub.isCalled) // true
/// ```
///
public final class Stub<Input, Output>: StubInterface {

    /// The implementation behind this stub
    private let impl: ((Input) throws -> Output)?

    /// Whether the stub has been implemented or not
    public var isImplemented: Bool { impl != nil }

    /// The inputs this stub has been invoked with so far
    public private(set) var inputs: [Input] = []

    public init(_ impl: ((Input) throws -> Output)? = nil) {
        self.impl = impl
    }

    /// Call the stubs implementation with the passed input, taking a note that a call has been made with the given inputs.
    ///
    /// Fails if the implementation is `nil`.
    ///
    /// - Parameters:
    ///   - input: The **Input** we would have called the original implementation with
    ///   - file: #file
    ///   - line: #line
    ///   - function: #function
    /// - Returns: The **Ouput** returned by the implementation closure
    @inline(__always)
    @discardableResult
    public func invoke(
        with input: Input,
        file: NSString = #file,
        line: Int = #line,
        function: String = #function
    ) -> Output {
        guard let impl = impl else {
            fatalError("\n❗️Called not implemented stub -> \(file.lastPathComponent):\(line) -> \(function)")
        }

        inputs.append(input)
        return try! impl(input)
    }

    /// Call the stubs implementation with the passed input, allowing throwing implementations, taking a note that a call has been made with the given inputs.
    ///
    /// Fails if the implementation is `nil`. Throws if the implementation throws.
    ///
    /// - Parameters:
    ///   - input: The **Input** we would have called the original implementation with
    ///   - file: #file
    ///   - line: #line
    ///   - function: #function
    /// - Returns: The **Ouput** returned by the implementation closure
    @inline(__always)
    @discardableResult
    public func tryInvoke(with input: Input, file: NSString = #file, line: Int = #line, function: String = #function) throws -> Output {
        guard let impl = impl else {
            fatalError("\n❗️Called not implemented stub -> \(file.lastPathComponent):\(line) -> \(function)")
        }

        inputs.append(input)
        return try impl(input)
    }

    /// The count of the calls happened on this stub
    public var callCount: UInt {
        return UInt(inputs.count)
    }

    /// The count of the calls happened on this stub
    public var isCalled: Bool {
        return inputs.count > 0
    }

    /// A way to record inputs into a stub (should the need arise), without actual usage of the implementation.
    ///
    /// Does NOT fail if the implementation is `nil`. Should be used sparingly and only when creating custom stubs for collecting information.
    ///
    /// - Parameter input: The **Input** we would have called the original implementation with
    public func recordNotInvoking(_ input: Input) {
        inputs.append(input)
    }
}

/// Extension to make usage Stubs where the **Input** is Void to be used more conveniently
public extension Stub where Input == Void {

    /// A way to call a stub, without actual usage of the implementation.
    ///
    /// Does NOT fail if the implementation is `nil`. Should be used sparingly and only when creating custom stubs for collecting information.
    func recordNotInvoking() {
        recordNotInvoking(())
    }

    /// Call the stubs implementation, taking a note that a call has been made.
    ///
    /// Fails if the implementation is `nil`.
    ///
    /// - Parameters:
    ///   - file: #file
    ///   - line: #line
    ///   - function: #function
    /// - Returns: The **Ouput** returned by the implementation closure
    @inline(__always)
    @discardableResult
    func invoke(file: NSString = #file, line: Int = #line, function: String = #function) -> Output {
        return invoke(with: (), file: file, line: line, function: function)
    }

    /// Call the stubs implementation, allowing throwing implementations, taking a note that a call has been made.
    ///
    /// Fails if the implementation is `nil`. Throws if the implementation throws.
    ///
    /// - Parameters:
    ///   - input: The **Input** we would have called the original implementation with
    ///   - file: #file
    ///   - line: #line
    ///   - function: #function
    /// - Returns: The **Ouput** returned by the implementation closure
    @inline(__always)
    @discardableResult
    func tryInvoke(file: NSString = #file, line: Int = #line, function: String = #function) throws -> Output {
        try tryInvoke(with: (), file: file, line: line, function: function)
    }
}
