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
s/clutter_param_spec_fixed(name, nick, blurb, minimum, maximum, cast(default_value.ptr), flags)/clutter_param_spec_fixed(name, nick, blurb, minimum, maximum, default_value, flags)/
s/clutter_binding_pool_install_action(cast(ptr), action_name, guint(key_val), modifiers, callback, cast(data), notify)/clutter_binding_pool_install_action(cast(ptr), action_name, guint(key_val), modifiers, cast(callback), cast(data), notify)/
s/\(public func clutter_behaviour_ellipse_get_angle_end\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_get_angle_start\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_get_angle_tilt\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_get_center\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_get_direction\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_get_height\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_get_tilt\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_get_width\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_new\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_set_angle_end\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_set_angle_start\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_set_angle_tilt\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_set_center\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_set_direction\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_set_height\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_set_tilt\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_ellipse_set_width\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_get_axis\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_get_bounds\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_get_center\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_get_direction\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_new\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_set_axis\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_set_bounds\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_set_center\)/@available(*, deprecated) \1/
s/\(public func clutter_behaviour_rotate_set_direction\)/@available(*, deprecated) \1/
s/\(public func clutter_shader_error_quark\)/@available(*, deprecated) \1/
