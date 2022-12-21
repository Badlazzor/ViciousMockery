import Foundation

/// Describing how we can create something with an empty input.
public struct EmptyInitializing<T> {
    public let create: () -> T

    public init(create: @escaping () -> T) {
        self.create = create
    }
}

public func makeEmpty<T>(_ initializer: EmptyInitializing<T>) -> T {
    initializer.create()
}

// The `EmptyInitializing` extensions for most common types

// MARK: - Bool
extension EmptyInitializing where T == Bool {
    public static let empty = EmptyInitializing { false }
}

// MARK: - Date
extension EmptyInitializing where T == Date {
    public static let empty = EmptyInitializing { Date() }
}

// MARK: - TimeInterval
extension EmptyInitializing where T == TimeInterval {
    public static let empty = EmptyInitializing { .zero }
}

// MARK: - Data
extension EmptyInitializing where T == Data {
    public static let empty = EmptyInitializing { Data() }
}

// MARK: - StringProtocol
extension EmptyInitializing where T: StringProtocol {
    public static var empty: EmptyInitializing {
        EmptyInitializing { "" }
    }
}

// MARK: - Numeric
extension EmptyInitializing where T: Numeric {
    public static var empty: EmptyInitializing {
        EmptyInitializing { 0 }
    }
}

// MARK: - ExpressibleByNilLiteral
extension EmptyInitializing where T: ExpressibleByNilLiteral {
    public static var empty: EmptyInitializing {
        EmptyInitializing { nil }
    }
}

// MARK: - ExpressibleByArrayLiteral
extension EmptyInitializing where T: ExpressibleByArrayLiteral {
    public static var empty: EmptyInitializing {
        EmptyInitializing { [] }
    }
}

// MARK: - ExpressibleByDictionaryLiteral
extension EmptyInitializing where T: ExpressibleByDictionaryLiteral {
    public static var empty: EmptyInitializing {
        EmptyInitializing { [:] }
    }
}

// MARK: - UUID
extension EmptyInitializing where T == UUID {
    public static var incrementing: () -> UUID {
        var uuid = 0
        return {
            defer { uuid += 1 }
            return UUID(uuidString: "00000000-0000-0000-0000-\(String(format: "%012x", uuid))")!
        }
    }

    public static var empty: EmptyInitializing {
        EmptyInitializing { incrementing() }
    }
}

// MARK: - URL
extension EmptyInitializing where T == URL {
    public static var empty: EmptyInitializing {
        EmptyInitializing { URL(string: "https://api.github.com")! }
    }
}
