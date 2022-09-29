/// Interface for an entity that can finish the builder pattern making the instance of the associated type.
public protocol MockDataBuilding: MockDataGathering {
    associatedtype Built

    /// Creates an instance of the associated type using the information gathered
    /// - Returns: The created instance
    func build() -> Built
}
