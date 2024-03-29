// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: NetworkingInfo.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct NetworkingInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var profile: NetworkingInfo.Profile {
    get {return _storage._profile ?? NetworkingInfo.Profile()}
    set {_uniqueStorage()._profile = newValue}
  }
  /// Returns true if `profile` has been explicitly set.
  public var hasProfile: Bool {return _storage._profile != nil}
  /// Clears the value of `profile`. Subsequent reads from it will return its default value.
  public mutating func clearProfile() {_uniqueStorage()._profile = nil}

  public var picture: String {
    get {return _storage._picture}
    set {_uniqueStorage()._picture = newValue}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public struct Profile {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    public var firstName: String = String()

    public var lastName: String = String()

    public var email: String = String()

    public var phoneNumber: String = String()

    public var biography: String = String()

    public var facebookURL: String = String()

    public var twitterURL: String = String()

    public var linkedinURL: String = String()

    public var websiteURL: String = String()

    public var unknownFields = SwiftProtobuf.UnknownStorage()

    public init() {}
  }

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "beilmo.spectre.dto"

extension NetworkingInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".NetworkingInfo"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "profile"),
    2: .same(proto: "picture"),
  ]

  fileprivate class _StorageClass {
    var _profile: NetworkingInfo.Profile? = nil
    var _picture: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _profile = source._profile
      _picture = source._picture
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._profile)
        case 2: try decoder.decodeSingularStringField(value: &_storage._picture)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._profile {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._picture.isEmpty {
        try visitor.visitSingularStringField(value: _storage._picture, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: NetworkingInfo, rhs: NetworkingInfo) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._profile != rhs_storage._profile {return false}
        if _storage._picture != rhs_storage._picture {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension NetworkingInfo.Profile: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = NetworkingInfo.protoMessageName + ".Profile"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "first_name"),
    2: .standard(proto: "last_name"),
    3: .same(proto: "email"),
    4: .standard(proto: "phone_number"),
    5: .same(proto: "biography"),
    20: .standard(proto: "facebook_url"),
    21: .standard(proto: "twitter_url"),
    22: .standard(proto: "linkedin_url"),
    23: .standard(proto: "website_url"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.firstName)
      case 2: try decoder.decodeSingularStringField(value: &self.lastName)
      case 3: try decoder.decodeSingularStringField(value: &self.email)
      case 4: try decoder.decodeSingularStringField(value: &self.phoneNumber)
      case 5: try decoder.decodeSingularStringField(value: &self.biography)
      case 20: try decoder.decodeSingularStringField(value: &self.facebookURL)
      case 21: try decoder.decodeSingularStringField(value: &self.twitterURL)
      case 22: try decoder.decodeSingularStringField(value: &self.linkedinURL)
      case 23: try decoder.decodeSingularStringField(value: &self.websiteURL)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.firstName.isEmpty {
      try visitor.visitSingularStringField(value: self.firstName, fieldNumber: 1)
    }
    if !self.lastName.isEmpty {
      try visitor.visitSingularStringField(value: self.lastName, fieldNumber: 2)
    }
    if !self.email.isEmpty {
      try visitor.visitSingularStringField(value: self.email, fieldNumber: 3)
    }
    if !self.phoneNumber.isEmpty {
      try visitor.visitSingularStringField(value: self.phoneNumber, fieldNumber: 4)
    }
    if !self.biography.isEmpty {
      try visitor.visitSingularStringField(value: self.biography, fieldNumber: 5)
    }
    if !self.facebookURL.isEmpty {
      try visitor.visitSingularStringField(value: self.facebookURL, fieldNumber: 20)
    }
    if !self.twitterURL.isEmpty {
      try visitor.visitSingularStringField(value: self.twitterURL, fieldNumber: 21)
    }
    if !self.linkedinURL.isEmpty {
      try visitor.visitSingularStringField(value: self.linkedinURL, fieldNumber: 22)
    }
    if !self.websiteURL.isEmpty {
      try visitor.visitSingularStringField(value: self.websiteURL, fieldNumber: 23)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: NetworkingInfo.Profile, rhs: NetworkingInfo.Profile) -> Bool {
    if lhs.firstName != rhs.firstName {return false}
    if lhs.lastName != rhs.lastName {return false}
    if lhs.email != rhs.email {return false}
    if lhs.phoneNumber != rhs.phoneNumber {return false}
    if lhs.biography != rhs.biography {return false}
    if lhs.facebookURL != rhs.facebookURL {return false}
    if lhs.twitterURL != rhs.twitterURL {return false}
    if lhs.linkedinURL != rhs.linkedinURL {return false}
    if lhs.websiteURL != rhs.websiteURL {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
