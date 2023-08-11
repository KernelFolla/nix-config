  local doubleclickKeyRule(keyCode, shellCmd) = {
    description: "double %s to execute %s" % [keyCode, shellCmd],
    manipulators: [
      {
        type: "basic",
        from: {
          key_code: keyCode,
          modifiers: { optional: ["any"] },
        },
        to: [{ shell_command: shellCmd }],
        conditions: [{ type: "variable_if", name: keyCode + " pressed", value: 1 }],
      },
      {
        type: "basic",
        from: {
          key_code: keyCode,
          modifiers: { optional: ["any"] },
        },
        to: [
          {
            set_variable: { name: keyCode + " pressed", value: 1 },
          },
          { key_code: keyCode },
        ],
        to_delayed_action: {
          to_if_invoked: [{ set_variable: { name: keyCode + " pressed", value: 0 } }],
          to_if_canceled: [{ set_variable: { name: keyCode + " pressed", value: 0 } }],
        },
      },
    ],
  };


{
  // Global configuration parameters
  global: {
    ask_for_confirmation_before_quitting: true,
    check_for_updates_on_startup: true,
    show_in_menu_bar: true,
    show_profile_name_in_menu_bar: false,
    unsafe_ui: false,
  },

  profiles: [
    {
      complex_modifications: {
        parameters: {
          basic_simultaneous_threshold_milliseconds: 50,
          basic_to_delayed_action_delay_milliseconds: 500,
          basic_to_if_alone_timeout_milliseconds: 1000,
          basic_to_if_held_down_threshold_milliseconds: 500,
          mouse_motion_to_scroll_speed: 100,
        },
        rules: [
          // Rules for manipulators
          doubleclickKeyRule("right_command", "open -a 'Safari'"),
          doubleclickKeyRule("right_option", "open -a 'Warp'"),
          doubleclickKeyRule("left_shift", "/Users/marino/_work/marino/nix-config/bin/yabai-toggle"),
        ],
      },

      // Devices configuration
      devices: [
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          identifiers: {
            is_keyboard: true,
            is_pointing_device: false,
            product_id: 45929,
            vendor_id: 1133,
          },
          ignore: false,
          manipulate_caps_lock_led: true,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          identifiers: {
            is_keyboard: true,
            is_pointing_device: true,
            product_id: 45091,
            vendor_id: 1133,
          },
          ignore: true,
          manipulate_caps_lock_led: true,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          identifiers: {
            is_keyboard: false,
            is_pointing_device: true,
            product_id: 781,
            vendor_id: 1452,
          },
          ignore: true,
          manipulate_caps_lock_led: false,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
      ],

      // Additional profile settings
      fn_function_keys: [],
      name: "Default profile",
      parameters: {
        delay_milliseconds_before_open_device: 1000,
      },
      selected: true,
      simple_modifications: [],
      virtual_hid_keyboard: {
        country_code: 0,
        indicate_sticky_modifier_keys_state: true,
        mouse_key_xy_scale: 100,
      },
    },
  ],
}
