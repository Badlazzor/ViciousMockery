import XCTest

/// This class aims to support cases where we want stand-ins for generic functions
///
/// Stores stubs for the same generic function root based on the type. As each stub type is dependant on the **Input** and **Output** of it, the type is already
/// storing the necessary type information to differentiate between the same function called with diffrent types.
///
/// Unfortunately this means a separate stub needs to be defined for each type. One way to expand on this would be to use a second layer of **Stubs** that
/// is ignoring or generalizing the **Inputs**, so the actual stub implementation could stay the same and could collect the calls for different types in one place.
public final class GenericStubCollection {
    private var stubs: [String: Any] = [:]

    public init() {}

    /// Registers a **Stub** for a given **Input**, **Output** pair.
    /// - Parameter stub: The stub to register
    public func registerStub<Input, Output>(_ stub: Stub<Input, Output>) {
        stubs["\(type(of: stub))"] = stub
    }

    /// Retrieves a **Stub** for a given **Input**, **Output** pair.
    ///
    /// Fails (with force unwrap) if there is no such implementation.
    ///
    /// *Though I generally despise force unwrap, during testing I would still keep at least a fatal error on this one as we specifically
    /// want this to be a programmer error.*
    /// - Parameter type: The type of the **Stub** we would like to use
    /// - Returns: The **Stub** previously registered for the given **Input**, **Output** pair
    public func stub<Input, Output>(forType type: Stub<Input, Output>.Type) -> Stub<Input, Output> {
        return stubs["\(type)"] as! Stub<Input, Output>
    }
}
