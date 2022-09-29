/// Interface describing a thing that can gather parts of a mock data
public protocol MockDataGathering {
    associatedtype Built

    /// Retrieves the data for a given KeyPath gathered by this entity
    /// - Parameters:
    ///   - keyPath: The KeyPath we seek the set value for
    ///   - defaultValue: A value to use when none were set
    /// - Returns: The value applicable for the KeyPath
    func value<T>(of keyPath: KeyPath<Built, T>, defaultValue: T) -> T

    /// Sets given value for a KeyPath to be used later on by this entity
    /// - Parameters:
    ///   - keyPath: The KeyPath we are setting the value for
    ///   - value: The value we would like to be set for the given KeyPath
    /// - Returns: Returns the modified self that now contains the additional value set
    @discardableResult
    func with<T>(_ keyPath: KeyPath<Built, T>, _ value: T) -> Self

    /// Sets given value for a KeyPath to be used later on by this entity
    /// - Parameters:
    ///   - keyPath: The KeyPath we are setting the value for
    ///   - value: The value we would like to be set for the given KeyPath
    /// - Returns: Returns the modified self that now contains the additional value set
    @discardableResult
    func with<T>(_ keyPath: KeyPath<Built, T?>, _ value: T?) -> Self
}
