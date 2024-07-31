#if canImport(Foundation)
  import Foundation

extension TypedID where Raw == UUID {
    public init() {
      self.init(raw: UUID())
    }
    public static func convert(raw: UUID) -> String { raw.uuidString }
    public static func convert(serialized: String) -> UUID? { UUID(uuidString: serialized) }
  }

  extension TypedID where Raw == UUID, Serialized == uuid_t {
    public static func convert(raw: UUID) -> uuid_t { raw.uuid }
    public static func convert(serialized: uuid_t) -> UUID? { UUID(uuid: serialized) }
  }
#endif
