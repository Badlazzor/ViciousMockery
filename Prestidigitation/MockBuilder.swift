/// Provides a way to build mocks for arbitrary entities leveraging KeyPaths.
///
/// Apart from the initializer (which we need to have public for obvious reasons), only 2 things are visible for the end user, the generic `.with()` and the finalizing
/// `.build()`. The definition on how to use the collected data during building is coming from the boilerplate code shown above, while the data gathering
/// is handled by the Mock itself.
public struct MockBuilder<A> {
    let finalizer: (Store<A>) -> A
    var values: [PartialKeyPath<A>: Any] = [:]

    /// Creates a builder with the given finalizer implementation.
    /// - Parameter finalizer: The function that describes how to use the gathered data when the `build()` function is called.
    public init(finalizer: @escaping (Store<A>) -> A) {
        self.finalizer = finalizer
    }

    /// Intermediary step during a mock definition. Stores the passed data which will be used during the actual creatin of the desired mock entity.
    /// - Parameters:
    ///   - keyPath: A KeyPath on the generic type.
    ///   - value: The value that should be set for the given keypath.
    /// - Returns: A modified version of this same builder for chaining purposes
    public func with<V>(_ keyPath: KeyPath<A, V>, _ value: V) -> MockBuilder<A> {
        var new = self
        new.values[keyPath: keyPath] = value
        return new
    }

    /// Builds the final mock entity using the gathered data and the passed finalizer.
    /// - Returns: The final mock entity
    public func build() -> A { finalizer(Store(values: values)) }
}

// MARK: - MockBuilder.Store
extension MockBuilder {

    /// An enity to provide interface for retreiving the gathered mock data.
    ///
    /// Separates the data retrieval interface from the data collection during mock generation. Provides
    public struct Store<A> {
        var values: [PartialKeyPath<A>: Any] = [:]

        /// Initializes a store with the given information.
        /// - Parameter values: A dictionary containing values for given KeyPaths
        public init(values: [PartialKeyPath<A>: Any]) {
            self.values = values
        }

        /// Retrieves a values from the wrapped dictionary.
        /// - Parameters:
        ///   - keyPath: The KeyPath we need the gathered value for.
        ///   - defaultValueProvider: The EmptyInitializing instance should we fail to retrieve the data from the store (ie. none given).
        /// - Returns: The value gathered or the default value if none found.
        public func value<V>(of keyPath: KeyPath<A, V>, _ defaultValueProvider: EmptyInitializing<V>) -> V {
            values[keyPath: keyPath] ?? defaultValueProvider.create()
        }
    }
}

// MARK: - Mockable
public protocol Mockable {
    static var mock: MockBuilder<Self> { get }
}

// MARK: - MockBuilder + EmptyInitializing
extension EmptyInitializing where T: Mockable {
    public static var empty: EmptyInitializing {
        EmptyInitializing { .mock.build() }
    }
}
