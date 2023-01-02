import CustomDump
import XCTest

extension Array {
    func expectToEqual<T0, T1>(
        actual: [(T0, T1)],
        file: StaticString = #filePath,
        line: UInt = #line
    )
    where (T0, T1) == Element,
          T0: Equatable,
          T1: Equatable
    {
        XCTAssertEqual(
            self.asEqautableTupleArray(),
            actual.asEqautableTupleArray(),
            diff(self, actual) ?? "",
            file: file,
            line: line
        )
    }
}

extension Array {
    func expectToEqual<T0, T1, T2>(
        actual: [(T0, T1, T2)],
        file: StaticString = #filePath,
        line: UInt = #line
    )
    where (T0, T1, T2) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable
    {
        XCTAssertEqual(
            self.asEqautableTupleArray(),
            actual.asEqautableTupleArray(),
            diff(self, actual) ?? "",
            file: file,
            line: line
        )
    }
}

extension Array {
    func expectToEqual<T0, T1, T2, T3>(
        actual: [(T0, T1, T2, T3)],
        file: StaticString = #filePath,
        line: UInt = #line
    )
    where (T0, T1, T2, T3) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable
    {
        XCTAssertEqual(
            self.asEqautableTupleArray(),
            actual.asEqautableTupleArray(),
            diff(self, actual) ?? "",
            file: file,
            line: line
        )
    }
}

extension Array {
    func expectToEqual<T0, T1, T2, T3, T4>(
        actual: [(T0, T1, T2, T3, T4)],
        file: StaticString = #filePath,
        line: UInt = #line
    )
    where (T0, T1, T2, T3, T4) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable,
          T4: Equatable
    {
        XCTAssertEqual(
            self.asEqautableTupleArray(),
            actual.asEqautableTupleArray(),
            diff(self, actual) ?? "",
            file: file,
            line: line
        )
    }
}

extension Array {
    func expectToEqual<T0, T1, T2, T3, T4, T5>(
        actual: [(T0, T1, T2, T3, T4, T5)],
        file: StaticString = #filePath,
        line: UInt = #line
    )
    where (T0, T1, T2, T3, T4, T5) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable,
          T4: Equatable,
          T5: Equatable
    {
        XCTAssertEqual(
            self.asEqautableTupleArray(),
            actual.asEqautableTupleArray(),
            diff(self, actual) ?? "",
            file: file,
            line: line
        )
    }
}

extension Array {
    func expectToEqual<T0, T1, T2, T3, T4, T5, T6>(
        actual: [(T0, T1, T2, T3, T4, T5, T6)],
        file: StaticString = #filePath,
        line: UInt = #line
    )
    where (T0, T1, T2, T3, T4, T5, T6) == Element,
          T0: Equatable,
          T1: Equatable,
          T2: Equatable,
          T3: Equatable,
          T4: Equatable,
          T5: Equatable,
          T6: Equatable
    {
        XCTAssertEqual(
            self.asEqautableTupleArray(),
            actual.asEqautableTupleArray(),
            diff(self, actual) ?? "",
            file: file,
            line: line
        )
    }
}

extension Array {
    func expectToEqual<T0, T1, T2, T3, T4, T5, T6, T7>(
        actual: [(T0, T1, T2, T3, T4, T5, T6, T7)],
        file: StaticString = #filePath,
        line: UInt = #line
    )
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
        XCTAssertEqual(
            self.asEqautableTupleArray(),
            actual.asEqautableTupleArray(),
            diff(self, actual) ?? "",
            file: file,
            line: line
        )
    }
}

extension Array {
    func expectToEqual<T0, T1, T2, T3, T4, T5, T6, T7, T8>(
        actual: [(T0, T1, T2, T3, T4, T5, T6, T7, T8)],
        file: StaticString = #filePath,
        line: UInt = #line
    )
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
        XCTAssertEqual(
            self.asEqautableTupleArray(),
            actual.asEqautableTupleArray(),
            diff(self, actual) ?? "",
            file: file,
            line: line
        )
    }
}
