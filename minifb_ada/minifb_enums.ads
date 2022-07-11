pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package minifb_enums is

   --  unsupported macro: MOUSE_LEFT MOUSE_BTN_1
   --  unsupported macro: MOUSE_RIGHT MOUSE_BTN_2
   --  unsupported macro: MOUSE_MIDDLE MOUSE_BTN_3
   --  unsupported macro: KB_KEY_LAST KB_KEY_MENU
  -- Enums
   subtype mfb_update_state is int;
   STATE_OK : constant int := 0;
   STATE_EXIT : constant int := -1;
   STATE_INVALID_WINDOW : constant int := -2;
   STATE_INVALID_BUFFER : constant int := -3;
   STATE_INTERNAL_ERROR : constant int := -4;  -- /usr/local/include/minifb/MiniFB_enums.h:13

  -- No mouse button
   type mfb_mouse_button is 
     (MOUSE_BTN_0,
      MOUSE_BTN_1,
      MOUSE_BTN_2,
      MOUSE_BTN_3,
      MOUSE_BTN_4,
      MOUSE_BTN_5,
      MOUSE_BTN_6,
      MOUSE_BTN_7)
   with Convention => C;  -- /usr/local/include/minifb/MiniFB_enums.h:24

   subtype mfb_key is int;
   KB_KEY_UNKNOWN : constant int := -1;
   KB_KEY_SPACE : constant int := 32;
   KB_KEY_APOSTROPHE : constant int := 39;
   KB_KEY_COMMA : constant int := 44;
   KB_KEY_MINUS : constant int := 45;
   KB_KEY_PERIOD : constant int := 46;
   KB_KEY_SLASH : constant int := 47;
   KB_KEY_0 : constant int := 48;
   KB_KEY_1 : constant int := 49;
   KB_KEY_2 : constant int := 50;
   KB_KEY_3 : constant int := 51;
   KB_KEY_4 : constant int := 52;
   KB_KEY_5 : constant int := 53;
   KB_KEY_6 : constant int := 54;
   KB_KEY_7 : constant int := 55;
   KB_KEY_8 : constant int := 56;
   KB_KEY_9 : constant int := 57;
   KB_KEY_SEMICOLON : constant int := 59;
   KB_KEY_EQUAL : constant int := 61;
   KB_KEY_A : constant int := 65;
   KB_KEY_B : constant int := 66;
   KB_KEY_C : constant int := 67;
   KB_KEY_D : constant int := 68;
   KB_KEY_E : constant int := 69;
   KB_KEY_F : constant int := 70;
   KB_KEY_G : constant int := 71;
   KB_KEY_H : constant int := 72;
   KB_KEY_I : constant int := 73;
   KB_KEY_J : constant int := 74;
   KB_KEY_K : constant int := 75;
   KB_KEY_L : constant int := 76;
   KB_KEY_M : constant int := 77;
   KB_KEY_N : constant int := 78;
   KB_KEY_O : constant int := 79;
   KB_KEY_P : constant int := 80;
   KB_KEY_Q : constant int := 81;
   KB_KEY_R : constant int := 82;
   KB_KEY_S : constant int := 83;
   KB_KEY_T : constant int := 84;
   KB_KEY_U : constant int := 85;
   KB_KEY_V : constant int := 86;
   KB_KEY_W : constant int := 87;
   KB_KEY_X : constant int := 88;
   KB_KEY_Y : constant int := 89;
   KB_KEY_Z : constant int := 90;
   KB_KEY_LEFT_BRACKET : constant int := 91;
   KB_KEY_BACKSLASH : constant int := 92;
   KB_KEY_RIGHT_BRACKET : constant int := 93;
   KB_KEY_GRAVE_ACCENT : constant int := 96;
   KB_KEY_WORLD_1 : constant int := 161;
   KB_KEY_WORLD_2 : constant int := 162;
   KB_KEY_ESCAPE : constant int := 256;
   KB_KEY_ENTER : constant int := 257;
   KB_KEY_TAB : constant int := 258;
   KB_KEY_BACKSPACE : constant int := 259;
   KB_KEY_INSERT : constant int := 260;
   KB_KEY_DELETE : constant int := 261;
   KB_KEY_RIGHT : constant int := 262;
   KB_KEY_LEFT : constant int := 263;
   KB_KEY_DOWN : constant int := 264;
   KB_KEY_UP : constant int := 265;
   KB_KEY_PAGE_UP : constant int := 266;
   KB_KEY_PAGE_DOWN : constant int := 267;
   KB_KEY_HOME : constant int := 268;
   KB_KEY_END : constant int := 269;
   KB_KEY_CAPS_LOCK : constant int := 280;
   KB_KEY_SCROLL_LOCK : constant int := 281;
   KB_KEY_NUM_LOCK : constant int := 282;
   KB_KEY_PRINT_SCREEN : constant int := 283;
   KB_KEY_PAUSE : constant int := 284;
   KB_KEY_F1 : constant int := 290;
   KB_KEY_F2 : constant int := 291;
   KB_KEY_F3 : constant int := 292;
   KB_KEY_F4 : constant int := 293;
   KB_KEY_F5 : constant int := 294;
   KB_KEY_F6 : constant int := 295;
   KB_KEY_F7 : constant int := 296;
   KB_KEY_F8 : constant int := 297;
   KB_KEY_F9 : constant int := 298;
   KB_KEY_F10 : constant int := 299;
   KB_KEY_F11 : constant int := 300;
   KB_KEY_F12 : constant int := 301;
   KB_KEY_F13 : constant int := 302;
   KB_KEY_F14 : constant int := 303;
   KB_KEY_F15 : constant int := 304;
   KB_KEY_F16 : constant int := 305;
   KB_KEY_F17 : constant int := 306;
   KB_KEY_F18 : constant int := 307;
   KB_KEY_F19 : constant int := 308;
   KB_KEY_F20 : constant int := 309;
   KB_KEY_F21 : constant int := 310;
   KB_KEY_F22 : constant int := 311;
   KB_KEY_F23 : constant int := 312;
   KB_KEY_F24 : constant int := 313;
   KB_KEY_F25 : constant int := 314;
   KB_KEY_KP_0 : constant int := 320;
   KB_KEY_KP_1 : constant int := 321;
   KB_KEY_KP_2 : constant int := 322;
   KB_KEY_KP_3 : constant int := 323;
   KB_KEY_KP_4 : constant int := 324;
   KB_KEY_KP_5 : constant int := 325;
   KB_KEY_KP_6 : constant int := 326;
   KB_KEY_KP_7 : constant int := 327;
   KB_KEY_KP_8 : constant int := 328;
   KB_KEY_KP_9 : constant int := 329;
   KB_KEY_KP_DECIMAL : constant int := 330;
   KB_KEY_KP_DIVIDE : constant int := 331;
   KB_KEY_KP_MULTIPLY : constant int := 332;
   KB_KEY_KP_SUBTRACT : constant int := 333;
   KB_KEY_KP_ADD : constant int := 334;
   KB_KEY_KP_ENTER : constant int := 335;
   KB_KEY_KP_EQUAL : constant int := 336;
   KB_KEY_LEFT_SHIFT : constant int := 340;
   KB_KEY_LEFT_CONTROL : constant int := 341;
   KB_KEY_LEFT_ALT : constant int := 342;
   KB_KEY_LEFT_SUPER : constant int := 343;
   KB_KEY_RIGHT_SHIFT : constant int := 344;
   KB_KEY_RIGHT_CONTROL : constant int := 345;
   KB_KEY_RIGHT_ALT : constant int := 346;
   KB_KEY_RIGHT_SUPER : constant int := 347;
   KB_KEY_MENU : constant int := 348;  -- /usr/local/include/minifb/MiniFB_enums.h:153

   subtype mfb_key_mod is unsigned;
   KB_MOD_SHIFT : constant unsigned := 1;
   KB_MOD_CONTROL : constant unsigned := 2;
   KB_MOD_ALT : constant unsigned := 4;
   KB_MOD_SUPER : constant unsigned := 8;
   KB_MOD_CAPS_LOCK : constant unsigned := 16;
   KB_MOD_NUM_LOCK : constant unsigned := 32;  -- /usr/local/include/minifb/MiniFB_enums.h:163

   subtype mfb_window_flags is unsigned;
   WF_RESIZABLE : constant unsigned := 1;
   WF_FULLSCREEN : constant unsigned := 2;
   WF_FULLSCREEN_DESKTOP : constant unsigned := 4;
   WF_BORDERLESS : constant unsigned := 8;
   WF_ALWAYS_ON_TOP : constant unsigned := 16;  -- /usr/local/include/minifb/MiniFB_enums.h:171

  -- Opaque pointer
   type mfb_window is null record;   -- incomplete struct

   type mfb_timer is null record;   -- incomplete struct

  -- Event callbacks
   type mfb_active_func is access procedure (arg1 : access mfb_window; arg2 : Extensions.bool)
   with Convention => C;  -- /usr/local/include/minifb/MiniFB_enums.h:178

   type mfb_resize_func is access procedure
        (arg1 : access mfb_window;
         arg2 : int;
         arg3 : int)
   with Convention => C;  -- /usr/local/include/minifb/MiniFB_enums.h:179

   type mfb_keyboard_func is access procedure
        (arg1 : access mfb_window;
         arg2 : mfb_key;
         arg3 : mfb_key_mod;
         arg4 : Extensions.bool)
   with Convention => C;  -- /usr/local/include/minifb/MiniFB_enums.h:180

   type mfb_char_input_func is access procedure (arg1 : access mfb_window; arg2 : unsigned)
   with Convention => C;  -- /usr/local/include/minifb/MiniFB_enums.h:181

   type mfb_mouse_button_func is access procedure
        (arg1 : access mfb_window;
         arg2 : mfb_mouse_button;
         arg3 : mfb_key_mod;
         arg4 : Extensions.bool)
   with Convention => C;  -- /usr/local/include/minifb/MiniFB_enums.h:182

   type mfb_mouse_move_func is access procedure
        (arg1 : access mfb_window;
         arg2 : int;
         arg3 : int)
   with Convention => C;  -- /usr/local/include/minifb/MiniFB_enums.h:183

   type mfb_mouse_scroll_func is access procedure
        (arg1 : access mfb_window;
         arg2 : mfb_key_mod;
         arg3 : float;
         arg4 : float)
   with Convention => C;  -- /usr/local/include/minifb/MiniFB_enums.h:184

end minifb_enums;
