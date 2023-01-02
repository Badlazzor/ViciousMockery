extension Array {
    public func asEqautableTupleArray<T0, T1>() -> [EquatableTuple2<T0, T1>]
    where (T0, T1) == Element,
          T0: Equatable,
          T1: Equatable
    {
        map { EquatableTuple2($0) }
    }
}

extension Array {
    public func asEqautableTupleArray<T0, T1, T2>() -> [EquatableTuple3<T0, T1, T2>]
    where (T0, T1, T2) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable
    {
        map { EquatableTuple3($0) }
    }
}

extension Array {
    public func asEqautableTupleArray<T0, T1, T2, T3>() -> [EquatableTuple4<T0, T1, T2, T3>]
    where (T0, T1, T2, T3) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable
    {
        map { EquatableTuple4($0) }
    }
}

extension Array {
    public func asEqautableTupleArray<T0, T1, T2, T3, T4>() -> [EquatableTuple5<T0, T1, T2, T3, T4>]
    where (T0, T1, T2, T3, T4) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable,
          T4: Equatable
    {
        map { EquatableTuple5($0) }
    }
}

extension Array {
    public func asEqautableTupleArray<T0, T1, T2, T3, T4, T5>() -> [EquatableTuple6<T0, T1, T2, T3, T4, T5>]
    where (T0, T1, T2, T3, T4, T5) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable,
          T4: Equatable,
          T5: Equatable
    {
        map { EquatableTuple6($0) }
    }
}

extension Array {
    public func asEqautableTupleArray<T0, T1, T2, T3, T4, T5, T6>() -> [EquatableTuple7<T0, T1, T2, T3, T4, T5, T6>]
    where (T0, T1, T2, T3, T4, T5, T6) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable,
          T4: Equatable,
          T5: Equatable,
          T6: Equatable
    {
        map { EquatableTuple7($0) }
    }
}

extension Array {
    public func asEqautableTupleArray<T0, T1, T2, T3, T4, T5, T6, T7>() -> [EquatableTuple8<T0, T1, T2, T3, T4, T5, T6, T7>]
    where (T0, T1, T2, T3, T4, T5, T6, T7) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable,
          T4: Equatable,
          T5: Equatable,
          T6: Equatable,
          T7: Equatable
    {
        map { EquatableTuple8($0) }
    }
}

extension Array {
    public func asEqautableTupleArray<T0, T1, T2, T3, T4, T5, T6, T7, T8>() -> [EquatableTuple9<T0, T1, T2, T3, T4, T5, T6, T7, T8>]
    where (T0, T1, T2, T3, T4, T5, T6, T7, T8) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable,
          T4: Equatable,
          T5: Equatable,
          T6: Equatable,
          T7: Equatable,
          T8: Equatable
    {
        map { EquatableTuple9($0) }
    }
}
