/// Small wrapper that helps comparing Tuples that would be Equatable on paper
public struct EquatableTuple2<T1, T2>: Equatable where T1: Equatable, T2: Equatable {
    let t1: T1
    let t2: T2

    public init(_ tuple: (T1, T2)) {
        t1 = tuple.0
        t2 = tuple.1
    }
}

/// Small wrapper that helps comparing Tuples that would be Equatable on paper
public struct EquatableTuple3<T1, T2, T3>: Equatable where T1: Equatable, T2: Equatable, T3: Equatable {
    let t1: T1
    let t2: T2
    let t3: T3

    public init(_ tuple: (T1, T2, T3)) {
        t1 = tuple.0
        t2 = tuple.1
        t3 = tuple.2
    }
}

/// Small wrapper that helps comparing Tuples that would be Equatable on paper
public struct EquatableTuple4<T1, T2, T3, T4>: Equatable
where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable {
    let t1: T1
    let t2: T2
    let t3: T3
    let t4: T4

    public init(_ tuple: (T1, T2, T3, T4)) {
        t1 = tuple.0
        t2 = tuple.1
        t3 = tuple.2
        t4 = tuple.3
    }
}

/// Small wrapper that helps comparing Tuples that would be Equatable on paper
public struct EquatableTuple5<T1, T2, T3, T4, T5>: Equatable
where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable {
    let t1: T1
    let t2: T2
    let t3: T3
    let t4: T4
    let t5: T5

    public init(_ tuple: (T1, T2, T3, T4, T5)) {
        t1 = tuple.0
        t2 = tuple.1
        t3 = tuple.2
        t4 = tuple.3
        t5 = tuple.4
    }
}

/// Small wrapper that helps comparing Tuples that would be Equatable on paper
public struct EquatableTuple6<T1, T2, T3, T4, T5, T6>: Equatable
where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable, T6: Equatable {
    let t1: T1
    let t2: T2
    let t3: T3
    let t4: T4
    let t5: T5
    let t6: T6

    public init(_ tuple: (T1, T2, T3, T4, T5, T6)) {
        t1 = tuple.0
        t2 = tuple.1
        t3 = tuple.2
        t4 = tuple.3
        t5 = tuple.4
        t6 = tuple.5
    }
}

/// Small wrapper that helps comparing Tuples that would be Equatable on paper
public struct EquatableTuple7<T1, T2, T3, T4, T5, T6, T7>: Equatable
where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable, T6: Equatable, T7: Equatable {
    let t1: T1
    let t2: T2
    let t3: T3
    let t4: T4
    let t5: T5
    let t6: T6
    let t7: T7

    public init(_ tuple: (T1, T2, T3, T4, T5, T6, T7)) {
        t1 = tuple.0
        t2 = tuple.1
        t3 = tuple.2
        t4 = tuple.3
        t5 = tuple.4
        t6 = tuple.5
        t7 = tuple.6
    }
}

/// Small wrapper that helps comparing Tuples that would be Equatable on paper
public struct EquatableTuple8<T1, T2, T3, T4, T5, T6, T7, T8>: Equatable
where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable, T6: Equatable, T7: Equatable,
      T8: Equatable {
    let t1: T1
    let t2: T2
    let t3: T3
    let t4: T4
    let t5: T5
    let t6: T6
    let t7: T7
    let t8: T8

    public init(_ tuple: (T1, T2, T3, T4, T5, T6, T7, T8)) {
        t1 = tuple.0
        t2 = tuple.1
        t3 = tuple.2
        t4 = tuple.3
        t5 = tuple.4
        t6 = tuple.5
        t7 = tuple.6
        t8 = tuple.7
    }
}

/// Small wrapper that helps comparing Tuples that would be Equatable on paper
public struct EquatableTuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9>: Equatable
where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable, T6: Equatable, T7: Equatable,
      T8: Equatable, T9: Equatable {
    let t1: T1
    let t2: T2
    let t3: T3
    let t4: T4
    let t5: T5
    let t6: T6
    let t7: T7
    let t8: T8
    let t9: T9

    public init(_ tuple: (T1, T2, T3, T4, T5, T6, T7, T8, T9)) {
        t1 = tuple.0
        t2 = tuple.1
        t3 = tuple.2
        t4 = tuple.3
        t5 = tuple.4
        t6 = tuple.5
        t7 = tuple.6
        t8 = tuple.7
        t9 = tuple.8
    }
}

public func ==<T1, T2>(
    lhs: [(T1, T2)], rhs: [(T1, T2)]
) -> Bool where T1: Equatable, T2: Equatable {
    lhs.map(EquatableTuple2.init) == rhs.map(EquatableTuple2.init)
}

public func ==<T1, T2, T3>(
    lhs: [(T1, T2, T3)], rhs: [(T1, T2, T3)]
) -> Bool where T1: Equatable, T2: Equatable, T3: Equatable {
    lhs.map(EquatableTuple3.init) == rhs.map(EquatableTuple3.init)
}

public func ==<T1, T2, T3, T4>(
    lhs: [(T1, T2, T3, T4)], rhs: [(T1, T2, T3, T4)]
) -> Bool where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable {
    lhs.map(EquatableTuple4.init) == rhs.map(EquatableTuple4.init)
}

public func ==<T1, T2, T3, T4, T5>(
    lhs: [(T1, T2, T3, T4, T5)], rhs: [(T1, T2, T3, T4, T5)]
) -> Bool where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable {
    lhs.map(EquatableTuple5.init) == rhs.map(EquatableTuple5.init)
}

public func ==<T1, T2, T3, T4, T5, T6>(
    lhs: [(T1, T2, T3, T4, T5, T6)], rhs: [(T1, T2, T3, T4, T5, T6)]
) -> Bool where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable, T6: Equatable {
    lhs.map(EquatableTuple6.init) == rhs.map(EquatableTuple6.init)
}

public func ==<T1, T2, T3, T4, T5, T6, T7>(
    lhs: [(T1, T2, T3, T4, T5, T6, T7)], rhs: [(T1, T2, T3, T4, T5, T6, T7)]
) -> Bool where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable, T6: Equatable,
T7: Equatable {
    lhs.map(EquatableTuple7.init) == rhs.map(EquatableTuple7.init)
}

public func ==<T1, T2, T3, T4, T5, T6, T7, T8>(
    lhs: [(T1, T2, T3, T4, T5, T6, T7, T8)], rhs: [(T1, T2, T3, T4, T5, T6, T7, T8)]
) -> Bool where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable, T6: Equatable,
T7: Equatable, T8: Equatable {
    lhs.map(EquatableTuple8.init) == rhs.map(EquatableTuple8.init)
}

public func ==<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
    lhs: [(T1, T2, T3, T4, T5, T6, T7, T8, T9)], rhs: [(T1, T2, T3, T4, T5, T6, T7, T8, T9)]
) -> Bool where T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable, T6: Equatable,
T7: Equatable, T8: Equatable, T9: Equatable {
    lhs.map(EquatableTuple9.init) == rhs.map(EquatableTuple9.init)
}
