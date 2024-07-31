# `TypedID`

`TypedID` turns otherwise dangerously interchangeable IDs backed by common values types like `String` into compiler differentiated, self-documenting, types like `UserID`.   

Add type-safety to your IDs with one trivial conformance.

## Usage

1. Add the SwiftPM dependency to your project:

```swift
.package(url: "https://github.com/adam-zethraeus/TypedID.git", from: "1.0.0")
```

2. Import the library:

```swift
import TypeID
```

3. Define your unique ID type:

```swift
struct UserID: TypedID {
  let raw: String
}
```

Working with the resulting ID type is intuitive:

```swift
let myID = UserID("usr99999")
let otherID = UserID("usr11111")

// Equatabilty
let isSameUser = myID == otherID

// Hashability
let users = Set([myID, otherID])

// Codability
let encoded = try JSONEncoder().encode(myID)
let decoded = String(data: encoded, encoding: .utf8)
// TypedID is totally transparent. Serialized values remain the same.
assert(decoded == "usr99999")
```



`TypeID` works with common ID types, including `String`, `Int`, `UUID`, `UInt`, `Double` — but see the conformance for Foundation's `UUID` if you'd like to make new types conform.
