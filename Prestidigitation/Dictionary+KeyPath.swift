/// Extension on Dictionary to support KeyPath related storage of values based on a given type
public extension Dictionary {
    subscript<K, V>(keyPath keyPath: KeyPath<K, V>) -> V? where Key == PartialKeyPath<K> {
        get {
            self[keyPath] as? V
        }

        set {
            guard let value = newValue as? Value else {
                return
            }

            self[keyPath] = value
        }
    }
}
