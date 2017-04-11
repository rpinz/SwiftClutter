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
import GLibObject

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

/// Class that wraps a 3-parameter closure to make sure the closure
/// is retained until no longer required
public class ThreeParameterClosureHolder<S, T, U, V> {
    
    public let call: (S, T, U) -> V

    public init(_ closure: @escaping (S, T, U) -> V) {
        self.call = closure
    }
}

/// Signal handler for clutter events.
public typealias EventSignalHandler = (StageRef, UnsafeMutablePointer<ClutterEvent>, UnsafeMutableRawPointer?) -> Void

/// Internal type used for holding a Timeline signal handling closure
typealias EventSignalHandlerClosureHolder = ThreeParameterClosureHolder<StageRef,UnsafeMutablePointer<ClutterEvent>,UnsafeMutableRawPointer?,Void>

/// Signal handler for timeline signals.
public typealias TimelineSignalHandler = (TimelineRef, Int, UnsafeMutableRawPointer?) -> Void

/// Internal type used for holding a Timeline signal handling closure
typealias TimelineSignalHandlerClosureHolder = ThreeParameterClosureHolder<TimelineRef,Int,UnsafeMutableRawPointer?,Void>

public extension TimelineProtocol {
    /// Connection helper function
    private func _connect(signal name: UnsafePointer<gchar>, flags: ConnectFlags, data: TimelineSignalHandlerClosureHolder, handler: @convention(c) @escaping (gpointer, gpointer, gpointer) -> gboolean) -> CUnsignedLong {
        let opaqueHolder = Unmanaged.passRetained(data).toOpaque()
        let callback = unsafeBitCast(handler, to: GLibObject.Callback.self)
        let rv = signalConnectData(detailedSignal: name, cHandler: callback, data: opaqueHolder, destroyData: {
            if let swift = $0 {
                let holder = Unmanaged<TimelineSignalHandlerClosureHolder>.fromOpaque(swift)
                holder.release()
            }
            let _ = $1
            }, connectFlags: flags)
        return rv
    }
    
    /// Connects a (Timeline,Int,UnsafeMutableRawPointer?) -> Void closure or function to a signal for
    /// the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func connectSignal(name: UnsafePointer<gchar>, flags f: ConnectFlags = ConnectFlags(0), handler: @escaping TimelineSignalHandler) -> CUnsignedLong {
        let rv = _connect(signal: name, flags: f, data: TimelineSignalHandlerClosureHolder(handler)) {
            let holder = Unmanaged<TimelineSignalHandlerClosureHolder>.fromOpaque($2).takeUnretainedValue()
            let frame = Int(bitPattern: $1)
            holder.call(TimelineRef(raw: $0), frame, $2)
            return 0
        }
        return rv
    }
    
    /// Connects a (Timeline,Int,UnsafeMutableRawPointer?) -> Void closure or function to a signal for
    /// the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func connectTimelineSignal(name: UnsafePointer<gchar>, flags f: ConnectFlags = ConnectFlags(0), handler: @escaping TimelineSignalHandler) -> CUnsignedLong {
        let rv = _connect(signal: name, flags: f, data: TimelineSignalHandlerClosureHolder(handler)) {
            let holder = Unmanaged<TimelineSignalHandlerClosureHolder>.fromOpaque($2).takeUnretainedValue()
            let frame = Int(bitPattern: $1)
            holder.call(TimelineRef(raw: $0), frame, $2)
            return 0
        }
        return rv
    }
    
    /// Connects a (Timeline,Int,UnsafeMutableRawPointer?)) -> Void closure or function to a Timeline signal for
    /// the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func connect<T>(signal s: T, flags f: ConnectFlags = ConnectFlags(0), handler: @escaping TimelineSignalHandler) -> CUnsignedLong where T: SignalNameProtocol {
        return connectTimelineSignal(name: s.rawValue, flags: f, handler: handler)
    }
    
    /// Connects a (Timeline,Int,UnsafeMutableRawPointer?) -> Bool closure or function to a Timeline signal for
    /// the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func connect(signal: TimelineSignalName, flags f: ConnectFlags = ConnectFlags(0), handler: @escaping TimelineSignalHandler) -> CUnsignedLong {
        return connectTimelineSignal(name: signal.rawValue, flags: f, handler: handler)
    }
    
    /// Connects a (Timeline,Int,UnsafeMutableRawPointer?) -> Bool closure or function to the "new-frame"
    /// signal of the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func onNewFrame(flags f: ConnectFlags = ConnectFlags(0), handler: @escaping TimelineSignalHandler) -> CUnsignedLong {
        return connectTimelineSignal(name: TimelineSignalName.newFrame.rawValue, flags: f, handler: handler)
    }
}

public extension StageProtocol {
    /// Connection helper function
    private func _connect(signal name: UnsafePointer<gchar>, flags: ConnectFlags, data: EventSignalHandlerClosureHolder, handler: @convention(c) @escaping (gpointer, gpointer, gpointer) -> gboolean) -> CUnsignedLong {
        let opaqueHolder = Unmanaged.passRetained(data).toOpaque()
        let callback = unsafeBitCast(handler, to: GLibObject.Callback.self)
        let rv = signalConnectData(detailedSignal: name, cHandler: callback, data: opaqueHolder, destroyData: {
            if let swift = $0 {
                let holder = Unmanaged<EventSignalHandlerClosureHolder>.fromOpaque(swift)
                holder.release()
            }
            let _ = $1
            }, connectFlags: flags)
        return rv
    }
    
    /// Connects a (StageRef,Event,UnsafeMutableRawPointer?) -> Void closure or function to a signal for
    /// the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func connectSignal(name: UnsafePointer<gchar>, flags f: ConnectFlags = ConnectFlags(0), handler: @escaping EventSignalHandler) -> CUnsignedLong {
        let rv = _connect(signal: name, flags: f, data: EventSignalHandlerClosureHolder(handler)) {
            let holder = Unmanaged<EventSignalHandlerClosureHolder>.fromOpaque($2).takeUnretainedValue()
            let event = $1.assumingMemoryBound(to: ClutterEvent.self)
            holder.call(StageRef(raw: $0), event, $2)
            return 0
        }
        return rv
    }
    
    /// Connects a (StageRef,Event,UnsafeMutableRawPointer?) -> Void closure or function to a signal for
    /// the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func connectEventSignal(name: UnsafePointer<gchar>, flags f: ConnectFlags = ConnectFlags(0), handler: @escaping EventSignalHandler) -> CUnsignedLong {
        let rv = _connect(signal: name, flags: f, data: EventSignalHandlerClosureHolder(handler)) {
            let holder = Unmanaged<EventSignalHandlerClosureHolder>.fromOpaque($2).takeUnretainedValue()
            let event = $1.assumingMemoryBound(to: ClutterEvent.self)
            holder.call(StageRef(raw: $0), event, $2)
            return 0
        }
        return rv
    }
    
    /// Connects a (StageRef,Event,UnsafeMutableRawPointer?)) -> Void closure or function to a Timeline signal for
    /// the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func connect<T>(signal s: T, flags f: ConnectFlags = ConnectFlags(0), handler: @escaping EventSignalHandler) -> CUnsignedLong where T: SignalNameProtocol {
        return connectEventSignal(name: s.rawValue, flags: f, handler: handler)
    }
    
    /// Connects a (StageRef,Event,UnsafeMutableRawPointer?) -> Bool closure or function to a Timeline signal for
    /// the receiver object.  Similar to g_signal_connect(), but allows
    /// to provide a Swift closure that can capture its surrounding context.
    @discardableResult
    public func connect(event: ActorSignalName, flags f: ConnectFlags = ConnectFlags(0), handler: @escaping EventSignalHandler) -> CUnsignedLong {
        return connectEventSignal(name: event.rawValue, flags: f, handler: handler)
    }
}

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
        ptr = constPointer.withMemoryRebound(to: ClutterMatrix.self, capacity: 1) { UnsafeMutablePointer(mutating: $0) }
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


func cast(_ f: @convention(c) @escaping (UnsafeMutablePointer<GObject>?, UnsafePointer<gchar>?, guint, ClutterModifierType, gpointer?) -> gboolean) -> GCallback {
    return unsafeBitCast(f, to: GCallback.self)
}


