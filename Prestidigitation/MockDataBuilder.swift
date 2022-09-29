/// "Namespace" to store `MockDataBuilders` in
public enum MockDataBuilder {}

extension MockDataBuilder {

    /// A generic class that provides the basics for every `MockDataBuilder`
    ///
    /// Subclassing this makes creating a `MockDataBuilder` simpler, as the only thing it needs to implement is the `build()` function.
    open class Builder<Built>: MockDataGathering {

        /// Currently sotred values per KeyPath. Only the modified ones will be present here.
        public var values: [PartialKeyPath<Built>: Any] = [:]

        public init() {}

        public func value<T>(of keyPath: KeyPath<Built, T>, defaultValue: T) -> T {
            return values[keyPath: keyPath] ?? defaultValue
        }

        @discardableResult
        public func with<T>(_ keyPath: KeyPath<Built, T>, _ value: T) -> Self {
            values[keyPath: keyPath] = value
            return self
        }

        @discardableResult
        public func with<T>(_ keyPath: KeyPath<Built, T?>, _ value: T?) -> Self {
            values[keyPath: keyPath] = value
            return self
        }
    }
}
