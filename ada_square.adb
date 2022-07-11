pragma Ada_2020;

with ada.text_io,
     minifb,
     minifb_enums,
     interfaces, -- shift_left, shift_right, unsigned_32
     -- C interop stuff
     interfaces.c, -- c types
     interfaces.c.extensions, -- bool
     interfaces.c.strings; -- new_string

use  minifb,
     minifb_enums,
     interfaces, -- shift_left, shift_right, unsigned_32
     interfaces.c, -- c types
     interfaces.c.strings; -- new_string

procedure ada_square is
    -- aliases
    subtype u32 is interfaces.c.unsigned;
    subtype s32 is integer;
    -- variables
    title:  chars_ptr := new_string("Ada Move Square");
    width:  constant u32 := 500;
    height: constant u32 := 500;
    white: constant unsigned_32 := (shift_left(255,16) or shift_left(255,8) or 255);
    square_size: constant u32 := 50;
    speed: constant s32 := 5;
    -- position
    x, y: s32 := 0;
    max_pos : constant s32 := s32(width - square_size - 1);
    window : access mfb_window := mfb_open_ex(title, width, height, WF_RESIZABLE);

    type Direction is (left, right, up, down);
    move :  array(Direction) of s32 := (others=>0);

    -- pixel buffer 
    pixels: array(0 .. (width * height)-1 ) of u32 := ( others=>0 );

    procedure draw_square(x, y: u32) is
        index: u32;
    begin
        for row in y .. y + square_size - 1 loop
            for col in x .. x + square_size - 1 loop
                index := row * width + col;
                pixels(index) := u32(white);
            end loop;
        end loop;
    end draw_square;

    procedure clear_screen is
    begin
        pixels := (others=>0);
    end;

    -- clamp in bounds of window
    procedure clamp(val: in out s32) is
    begin
        val := (if    val < 0 then 0
                elsif val > max_pos  then max_pos
                else  val);
    end clamp;

    -- keyboard function
    procedure keyboard(window: access mfb_window; key: mfb_key; modified: mfb_key_mod; pressed: extensions.bool) with convention => c;
    procedure keyboard(window: access mfb_window; key: mfb_key; modified: mfb_key_mod; pressed: extensions.bool) is
    begin 
        case key is
            when KB_KEY_ESCAPE  => mfb_close(window);
            when KB_KEY_LEFT    => move(left)   := (if pressed then -1 else 0);
            when KB_KEY_RIGHT   => move(right)  := (if pressed then  1 else 0);
            when KB_KEY_UP      => move(up)     := (if pressed then -1 else 0);
            when KB_KEY_DOWN    => move(down)   := (if pressed then  1 else 0);
            when others => null;
        end case;
    end keyboard;

begin
    mfb_set_keyboard_callback(window, keyboard'unrestricted_access);

    while mfb_wait_sync(window) loop
        exit when mfb_update_ex(window, pixels'address, width, height) < 0;
        -- update

        x := @ + (move(left) + move(right)) * speed;
        y := @ + (move(up) + move(down)) * speed;
        clamp(x);
        clamp(y);
        -- render
        clear_screen;
        draw_square(u32(x),u32(y));
    end loop;
end ada_square;
