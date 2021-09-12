//
//  AICompatible.swift
//  Top2StaffApp
//
//  Created by aizexin on 2021/8/30.
//

public struct AI<Base> {
    /// Base object to extend.
    public let base: Base

    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has ai extensions.
public protocol AICompatible {
    /// Extended type
    associatedtype CompatibleType

    /// ai extensions.
    static var ai: AI<CompatibleType>.Type { get set }

    /// Reactive extensions.
    var ai: AI<CompatibleType> { get set }
}

public extension AICompatible {
    /// AI extensions.
    static var ai: AI<Self>.Type {
        get {
            return AI<Self>.self
        }
        set {
            // this enables using Reactive to "mutate" base type
        }
    }

    /// AI extensions.
    var ai: AI<Self> {
        get {
            return AI(self)
        }
        set {
            // this enables using Reactive to "mutate" base object
        }
    }
}

import class Foundation.NSObject

extension NSObject: AICompatible {}
