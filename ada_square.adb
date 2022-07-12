pragma Ada_2020;

with minifb; use minifb;
with minifb_enums; use minifb_enums;
with interfaces; use interfaces; -- shift_left; shift_right; unsigned_32
-- C interop stuff
with interfaces.c; use interfaces.c;-- c types
with interfaces.c.extensions; -- bool
with interfaces.c.strings; use interfaces.c.strings; -- new_string

procedure ada_square is
    title:  chars_ptr := new_string("Ada Move Square");
	window_size : constant := 500;
    square_size : constant := 50;
    speed		: constant := 10;
    white		: constant unsigned_32 := (shift_left(255,16) or shift_left(255,8) or 255);
	max_pos		: constant := window_size - square_size -1;
		
	x, y : integer := 0;

    -- clamp in bounds of window
    function clamp(val: integer) return integer is (if val < 0 then 0
                                                    elsif val > max_pos then max_pos
    else val);

    type Direction is (left, right, up, down);
    move :  array(Direction) of integer := (others=>0);

    -- pixel buffer 
    pixels: array(0 .. (window_size ** 2)-1) of natural := ( others=>0 );

    procedure draw_square(x, y: integer) is
        index: integer;
    begin
        for row in y .. y + square_size  loop
            for col in x .. x + square_size  loop
                index := row * window_size + col;
                pixels(index) := natural(white);
            end loop;
        end loop;
    end draw_square;

    procedure clear_screen is 
    begin
        pixels := (others=>0);
    end;

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

    window : access mfb_window := mfb_open_ex(title, window_size, window_size, WF_RESIZABLE);

begin
    mfb_set_keyboard_callback(window, keyboard'unrestricted_access);

    while mfb_wait_sync(window) loop
        exit when mfb_update_ex(window, pixels'address, window_size, window_size) < 0;
        -- update
		x := clamp(@ + (move(left) + move(right)) * speed);
		y := clamp(@ + (move(up) + move(down)) * speed);
        ---- render
        clear_screen;
        draw_square(x,y);
    end loop;
end ada_square;
