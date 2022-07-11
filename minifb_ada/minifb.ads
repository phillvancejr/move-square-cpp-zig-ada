pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with minifb_enums;
with System;
with Interfaces.C.Extensions;
with utypes_uuint8_t_h;
with utypes_uuint32_t_h;

package minifb is

   --  arg-macro: function MFB_RGB (r, g, b)
   --    return ((uint32_t) r) << 16) or (((uint32_t) g) << 8) or ((uint32_t) b;
  --/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  --/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  -- Create a window that is used to display the buffer sent into the mfb_update function, returns 0 if fails
   function mfb_open
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : unsigned;
      arg3 : unsigned) return access minifb_enums.mfb_window  -- /usr/local/include/minifb/minifb_h:17
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_open";

   function mfb_open_ex
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : unsigned;
      arg3 : unsigned;
      arg4 : unsigned) return access minifb_enums.mfb_window  -- /usr/local/include/minifb/minifb_h:18
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_open_ex";

  -- Update the display
  -- Input buffer is assumed to be a 32-bit buffer of the size given in the open call
  -- Will return a negative status if something went wrong or the user want to exit
  -- Also updates the window events
   function mfb_update (window : access minifb_enums.mfb_window; buffer : System.Address) return minifb_enums.mfb_update_state  -- /usr/local/include/minifb/minifb_h:24
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_update";

   function mfb_update_ex
     (window : access minifb_enums.mfb_window;
      buffer : System.Address;
      width : unsigned;
      height : unsigned) return minifb_enums.mfb_update_state  -- /usr/local/include/minifb/minifb_h:26
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_update_ex";

  -- Only updates the window events
   function mfb_update_events (window : access minifb_enums.mfb_window) return minifb_enums.mfb_update_state  -- /usr/local/include/minifb/minifb_h:29
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_update_events";

  -- Close the window
   procedure mfb_close (window : access minifb_enums.mfb_window)  -- /usr/local/include/minifb/minifb_h:32
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_close";

  -- Set user data
   procedure mfb_set_user_data (window : access minifb_enums.mfb_window; user_data : System.Address)  -- /usr/local/include/minifb/minifb_h:35
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_user_data";

   function mfb_get_user_data (arg1 : access minifb_enums.mfb_window) return System.Address  -- /usr/local/include/minifb/minifb_h:36
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_user_data";

  -- Set viewport (useful when resize)
   function mfb_set_viewport
     (window : access minifb_enums.mfb_window;
      offset_x : unsigned;
      offset_y : unsigned;
      width : unsigned;
      height : unsigned) return Extensions.bool  -- /usr/local/include/minifb/minifb_h:39
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_viewport";

  -- DPI
  -- [Deprecated]: Probably a better name will be mfb_get_monitor_scale
   procedure mfb_get_monitor_dpi
     (window : access minifb_enums.mfb_window;
      dpi_x : access float;
      dpi_y : access float)  -- /usr/local/include/minifb/minifb_h:43
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_monitor_dpi";

  -- Use this instead
   procedure mfb_get_monitor_scale
     (window : access minifb_enums.mfb_window;
      scale_x : access float;
      scale_y : access float)  -- /usr/local/include/minifb/minifb_h:45
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_monitor_scale";

  -- Callbacks
   procedure mfb_set_active_callback (window : access minifb_enums.mfb_window; callback : minifb_enums.mfb_active_func)  -- /usr/local/include/minifb/minifb_h:48
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_active_callback";

   procedure mfb_set_resize_callback (window : access minifb_enums.mfb_window; callback : minifb_enums.mfb_resize_func)  -- /usr/local/include/minifb/minifb_h:49
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_resize_callback";

   procedure mfb_set_keyboard_callback (window : access minifb_enums.mfb_window; callback : minifb_enums.mfb_keyboard_func)  -- /usr/local/include/minifb/minifb_h:50
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_keyboard_callback";

   procedure mfb_set_char_input_callback (window : access minifb_enums.mfb_window; callback : minifb_enums.mfb_char_input_func)  -- /usr/local/include/minifb/minifb_h:51
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_char_input_callback";

   procedure mfb_set_mouse_button_callback (window : access minifb_enums.mfb_window; callback : minifb_enums.mfb_mouse_button_func)  -- /usr/local/include/minifb/minifb_h:52
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_mouse_button_callback";

   procedure mfb_set_mouse_move_callback (window : access minifb_enums.mfb_window; callback : minifb_enums.mfb_mouse_move_func)  -- /usr/local/include/minifb/minifb_h:53
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_mouse_move_callback";

   procedure mfb_set_mouse_scroll_callback (window : access minifb_enums.mfb_window; callback : minifb_enums.mfb_mouse_scroll_func)  -- /usr/local/include/minifb/minifb_h:54
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_mouse_scroll_callback";

  -- Getters
   function mfb_get_key_name (arg1 : minifb_enums.mfb_key) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/minifb/minifb_h:57
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_key_name";

   function mfb_is_window_active (window : access minifb_enums.mfb_window) return Extensions.bool  -- /usr/local/include/minifb/minifb_h:59
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_is_window_active";

   function mfb_get_window_width (window : access minifb_enums.mfb_window) return unsigned  -- /usr/local/include/minifb/minifb_h:60
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_window_width";

   function mfb_get_window_height (window : access minifb_enums.mfb_window) return unsigned  -- /usr/local/include/minifb/minifb_h:61
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_window_height";

  -- Last mouse pos X
   function mfb_get_mouse_x (window : access minifb_enums.mfb_window) return int  -- /usr/local/include/minifb/minifb_h:62
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_mouse_x";

  -- Last mouse pos Y
   function mfb_get_mouse_y (window : access minifb_enums.mfb_window) return int  -- /usr/local/include/minifb/minifb_h:63
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_mouse_y";

  -- Mouse wheel X as a sum. When you call this function it resets.
   function mfb_get_mouse_scroll_x (window : access minifb_enums.mfb_window) return float  -- /usr/local/include/minifb/minifb_h:64
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_mouse_scroll_x";

  -- Mouse wheel Y as a sum. When you call this function it resets.
   function mfb_get_mouse_scroll_y (window : access minifb_enums.mfb_window) return float  -- /usr/local/include/minifb/minifb_h:65
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_mouse_scroll_y";

  -- One byte for every button. Press (1), Release 0. (up to 8 buttons)
   function mfb_get_mouse_button_buffer (arg1 : access minifb_enums.mfb_window) return access utypes_uuint8_t_h.uint8_t  -- /usr/local/include/minifb/minifb_h:66
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_mouse_button_buffer";

  -- One byte for every key. Press (1), Release 0.
   function mfb_get_key_buffer (arg1 : access minifb_enums.mfb_window) return access utypes_uuint8_t_h.uint8_t  -- /usr/local/include/minifb/minifb_h:67
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_key_buffer";

  -- FPS
   procedure mfb_set_target_fps (fps : utypes_uuint32_t_h.uint32_t)  -- /usr/local/include/minifb/minifb_h:70
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_set_target_fps";

   function mfb_get_target_fps return unsigned  -- /usr/local/include/minifb/minifb_h:71
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_get_target_fps";

   function mfb_wait_sync (window : access minifb_enums.mfb_window) return Extensions.bool  -- /usr/local/include/minifb/minifb_h:72
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_wait_sync";

  -- Timer
   function mfb_timer_create return access minifb_enums.mfb_timer  -- /usr/local/include/minifb/minifb_h:75
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_timer_create";

   procedure mfb_timer_destroy (tmr : access minifb_enums.mfb_timer)  -- /usr/local/include/minifb/minifb_h:76
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_timer_destroy";

   procedure mfb_timer_reset (tmr : access minifb_enums.mfb_timer)  -- /usr/local/include/minifb/minifb_h:77
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_timer_reset";

   function mfb_timer_now (tmr : access minifb_enums.mfb_timer) return double  -- /usr/local/include/minifb/minifb_h:78
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_timer_now";

   function mfb_timer_delta (tmr : access minifb_enums.mfb_timer) return double  -- /usr/local/include/minifb/minifb_h:79
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_timer_delta";

   function mfb_timer_get_frequency return double  -- /usr/local/include/minifb/minifb_h:80
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_timer_get_frequency";

   function mfb_timer_get_resolution return double  -- /usr/local/include/minifb/minifb_h:81
   with Import => True, 
        Convention => C, 
        External_Name => "mfb_timer_get_resolution";

  --/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
end minifb;
