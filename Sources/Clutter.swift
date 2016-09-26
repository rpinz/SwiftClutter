//
//  Clutter.swift
//  Clutter
//
//  Created by Rene Hexel on 25/9/16.
//
//
import CGLib
import CClutter
import GLib
import GObject

/// Command line argument count as used by Clutter
public var argc = CommandLine.argc

/// Command line argument vector as used by Clutter
public var argv: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>? = CommandLine.unsafeArgv

/// Initialisation function for Clutter.
/// Must be called before any other function gets called!
@discardableResult public func initialize() -> InitError {
    return clutter_init(&argc, &argv)
}

public typealias ClutterAnimatable = _ClutterAnimatable
public typealias ClutterParamSpecUnit = _ClutterParamSpecUnit

public extension ActorProtocol {
    /// Dimensions of the actor.
    var size: (width: Double, height: Double) {
        get {
            var w = gfloat(0)
            var h = gfloat(0)
            getSize(width: &w, height: &h)
            return (Double(w), Double(h))
        }
        set {
            setSize(width: gfloat(newValue.width), height: gfloat(newValue.height))
        }
    }

    /// Position of the actor.
    var position: (x: Double, y: Double) {
        get {
            var x = gfloat(0)
            var y = gfloat(0)
            getPosition(x: &x, y: &y)
            return (Double(x), Double(y))
        }
        set {
            setPosition(x: gfloat(newValue.x), y: gfloat(newValue.y))
        }
    }

    /// Background colour of the actor.
    var backgroundColor: Color {
        get {
            let c = Color(red: 0, green: 0, blue: 0, alpha: 0)
            getBackground(color: c)
            return c
        }
        set { setBackground(color: newValue) }
    }

}


public protocol MatrixProtocol {
    var ptr: UnsafeMutablePointer<ClutterMatrix> { get }
}

public struct MatrixRef: MatrixProtocol {
    public let ptr: UnsafeMutablePointer<ClutterMatrix>
}

public extension MatrixRef {
    public init(_ p: UnsafeMutablePointer<ClutterMatrix>) {
        ptr = p
    }
    
    public init<T: MatrixProtocol>(_ other: T) {
        ptr = other.ptr
    }
    
    public init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = cPointer.withMemoryRebound(to: ClutterMatrix.self, capacity: 1) { $0 }
    }
    
    public init<T>(constPointer: UnsafePointer<T>) {
        ptr = constPointer.withMemoryRebound(to: ClutterMatrix.self, capacity: 1) { $0 }
    }
    
    public init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw).assumingMemoryBound(to: ClutterMatrix.self)
    }
    
    public init(raw: UnsafeMutableRawPointer) {
        ptr = raw.assumingMemoryBound(to: ClutterMatrix.self)
    }
    
    public init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutablePointer<ClutterMatrix>(opaquePointer)
    }
    
}

open class MatrixClass: MatrixProtocol {
    public let ptr: UnsafeMutablePointer<ClutterMatrix>
    
    public init(_ op: UnsafeMutablePointer<ClutterMatrix>) {
        self.ptr = op
    }
    
    public convenience init<T: MatrixProtocol>(_ other: T) {
        self.init(other.ptr)
        // no reference counting for ClutterMatrix, cannot ref(cast(ptr))
    }
    
    deinit {
        // no reference counting for ClutterMatrix, cannot unref(cast(ptr))
    }
    
    public convenience init<T>(cPointer: UnsafeMutablePointer<T>) {
        self.init(cPointer.withMemoryRebound(to: ClutterMatrix.self, capacity: 1) { $0 })
    }
    
    public convenience init(raw: UnsafeRawPointer) {
        self.init(UnsafeMutableRawPointer(mutating: raw).assumingMemoryBound(to: ClutterMatrix.self))
    }
    
    public convenience init(raw: UnsafeMutableRawPointer) {
        self.init(raw.assumingMemoryBound(to: ClutterMatrix.self))
    }
    
    public convenience init(opaquePointer: OpaquePointer) {
        self.init(UnsafeMutablePointer<ClutterMatrix>(opaquePointer))
    }
}


func cast(_ f: @convention(c) (UnsafeMutablePointer<GObject>?, UnsafePointer<gchar>?, guint, ClutterModifierType, gpointer?) -> gboolean) -> GCallback {
    return unsafeBitCast(f, to: GCallback.self)
}


