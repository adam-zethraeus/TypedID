import Testing
import Foundation

@testable import TypedID

@Suite struct TypedIDTests {}

extension TypedIDTests {
  private struct IntID: TypedID {
    let raw: Int
  }

  @Test func Int() throws {
    let value = 2

    let id = IntID(raw: value)
    #expect(id == IntID(raw: value))

    let encoded = try JSONEncoder().encode(id)
    let stringRepresentation = Swift.String(data: encoded, encoding: .utf8)

    let str = try #require(stringRepresentation)
    #expect(str == "\(value)")

    let data = try #require(str.data(using: .utf8))
    let decoded = try JSONDecoder().decode(IntID.self, from: data)

    #expect(id == decoded)
  }
}

extension TypedIDTests {
  private struct BoolID: TypedID {
    let raw: Bool
  }

  @Test func Bool() throws {
    let value = false
    let id = BoolID(raw: value)
    #expect(id == BoolID(raw: value))

    let encoded = try JSONEncoder().encode(id)
    let stringRepresentation = Swift.String(data: encoded, encoding: .utf8)
    let str = try #require(stringRepresentation)
    #expect(str == "\(value)")

    let data = try #require(str.data(using: .utf8))
    let decoded = try JSONDecoder().decode(BoolID.self, from: data)

    #expect(id == decoded)
  }
}

extension TypedIDTests {
  private struct StringID: TypedID {
    let raw: String
  }

  @Test func String() throws {
    let value = "hello!"
    let id = StringID(raw: value)
    #expect(id == StringID(raw: value))

    let encoded = try JSONEncoder().encode(id)
    let stringRepresentation = Swift.String(data: encoded, encoding: .utf8)
    let str = try #require(stringRepresentation)
    #expect(str == "\"\(value)\"")

    let data = try #require(str.data(using: .utf8))
    let decoded = try JSONDecoder().decode(StringID.self, from: data)

    #expect(id == decoded)
  }
}

extension TypedIDTests {
  private struct FloatID: TypedID {
    let raw: Double
  }

  @Test func Float() throws {
    let value = 99.0
    let id = FloatID(raw: value)
    #expect(id == FloatID(raw: value))

    let encoded = try JSONEncoder().encode(id)
    let stringRepresentation = Swift.String(data: encoded, encoding: .utf8)
    let str = try #require(stringRepresentation)
    #expect(Double(str) == value)

    let data = try #require(str.data(using: .utf8))
    let decoded = try JSONDecoder().decode(FloatID.self, from: data)

    #expect(id == decoded)
  }
}

extension TypedIDTests {
  private struct UIntID: TypedID {
    let raw: UInt
  }

  @Test func UInt() throws {
    let value = Swift.UInt(3)
    let id = UIntID(raw: value)
    #expect(id == UIntID(raw: value))

    let encoded = try JSONEncoder().encode(id)
    let stringRepresentation = Swift.String(data: encoded, encoding: .utf8)
    let str = try #require(stringRepresentation)
    #expect(Swift.UInt(str) == value)

    let data = try #require(str.data(using: .utf8))
    let decoded = try JSONDecoder().decode(UIntID.self, from: data)

    #expect(id == decoded)
  }
}

extension TypedIDTests {
  private struct UID: TypedID {
    let raw: UUID
    typealias Serialized = String
  }

  @Test func UUIDBased() throws {
    let value = UUID()
    let id = UID(raw: value)
    #expect(id == UID(raw: value))

    let encoded = try JSONEncoder().encode(id)
    let stringRepresentation = Swift.String(data: encoded, encoding: .utf8)
    let str = try #require(stringRepresentation)
    #expect(str == "\"\(value)\"")

    let data = try #require(str.data(using: .utf8))
    let decoded = try JSONDecoder().decode(UID.self, from: data)

    #expect(id == decoded)
  }
}

extension TypedIDTests {
  private struct BUID: TypedID {
    let raw: UUID
    typealias Serialized = uuid_t
  }

  @Test func BinaryUUIDBased() throws {
    let value = UUID()
    let id = BUID(raw: value)
    #expect(id == BUID(raw: value))

    let encoded = try JSONEncoder().encode(id)

    let decoded = try JSONDecoder().decode(BUID.self, from: encoded)

    #expect(id == decoded)
  }
}
