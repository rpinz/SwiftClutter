s|^public let _|// public let _|
s/ ContextProtocol/ Cairo.ContextProtocol/g
s/EVENT_STOP: Bool = 424/EVENT_STOP = true/
s/: Callback/: @escaping Callback/g
s/: \([A-Z][A-Za-z.]*Func[,)]\)/: @escaping \1/g
s/: \([A-Z][A-Za-z.]*Notify[,)]\)/: @escaping \1/g
s/: \([A-Z][A-Za-z.]*Callback[,)]\)/: @escaping \1/g
s/CoglHandle {/CoglHandle! {/
s/FixedRef!/CoglFixed/
s/Fixed!/CoglFixed/
s/rv.map { FixedRef(cast($0)) }/rv/
s/rv.map { Fixed(cast($0)) }/rv/
s/cast(minimum.ptr)/minimum/
s/cast(maximum.ptr)/maximum/
s/cast(fixed_.ptr)/fixed_/
s/(x_:/(x x_:/
s/(y_:/(y y_:/
s/, x_:/, x x_:/
s/, y_:/, y y_:/
s/clutter_param_spec_fixed(name, nick, blurb, minimum, maximum, cast(default_value.ptr), flags)/clutter_param_spec_fixed(name, nick, blurb, minimum, maximum, default_value, flags)/
s/clutter_binding_pool_install_action(cast(ptr), action_name, guint(key_val), modifiers, callback, cast(data), notify)/clutter_binding_pool_install_action(cast(ptr), action_name, guint(key_val), modifiers, cast(callback), cast(data), notify)/
s/\(public func getAngleEnd\)/@available(*, deprecated) \1/
s/\(public var angleEnd:\)/@available(*, deprecated) \1/
s/\(public func getAngleStart\)/@available(*, deprecated) \1/
s/\(public var angleStart:\)/@available(*, deprecated) \1/
s/\(public func getAngleTilt\)/@available(*, deprecated) \1/
s/\(public func getCenter.x \)/@available(*, deprecated) \1/
s/\(public func getDirection.. -> ClutterRotateDirection\)/@available(*, deprecated) \1/
s/\(public var direction: ClutterRotateDirectio\)/@available(*, deprecated) \1/
s/\(public func getHeight.. -> CInt\)/@available(*, deprecated) \1/
s/\(public var height: CInt\)/@available(*, deprecated) \1/
s/\(public func getTilt\)/@available(*, deprecated) \1/
s/\(public func getWidth.. -> CInt\)/@available(*, deprecated) \1/
s/\(public var width: CInt\)/@available(*, deprecated) \1/
s/\(public.* init. alpha: AlphaProtocol, x x_: CInt, y y_: CInt, width: CInt, height: CInt, direction: RotateDirection, start: gdouble, end: gdouble.\)/@available(*, deprecated) \1/
s/\(public func set.angleEnd\)/@available(*, deprecated) \1/
s/\(public func set.angleStart\)/@available(*, deprecated) \1/
s/\(public func setAngleTilt.axis:\)/@available(*, deprecated) \1/
s/\(public func setCenter.x\)/@available(*, deprecated) \1/
s/\(public func set.direction: RotateDirection\)/@available(*, deprecated) \1/
s/\(public func set.height: CInt\)/@available(*, deprecated) \1/
s/\(public func setTilt.angleTiltX\)/@available(*, deprecated) \1/
s/\(public func set.width: CInt\)/@available(*, deprecated) \1/
s/\(public func getAxis.. -> ClutterRotateAxis\)/@available(*, deprecated) \1/
s/\(public var axis: ClutterRotateAxis\)/@available(*, deprecated) \1/
s/\(public func getBounds.angleStart angle_start:\)/@available(*, deprecated) \1/
s/\(public.* init. alpha: AlphaProtocol, axis: RotateAxis, direction: RotateDirection, angleStart angle_start: gdouble, angleEnd angle_end: gdouble.\)/@available(*, deprecated) \1/
s/\(public func set.axis: RotateAxis\)/@available(*, deprecated) \1/
s/\(public func setBounds.angleStart\)/@available(*, deprecated) \1/
s/\(public func shaderErrorQuark\)/@available(*, deprecated) \1/
s/GObject.Callback/GLibObject.Callback/g
s/GObject.ParamFlags/GLibObject.ParamFlags/g
