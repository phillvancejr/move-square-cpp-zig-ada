#include <stdio.h>
#include <minifb/MiniFB.h>
#include <array>
#include <algorithm>

constexpr auto window_size = 500;
auto title = "CC Move Square";
auto pixels = std::array<unsigned int, window_size * window_size>{0};
constexpr auto square_size = 50;
constexpr auto white = (255 << 16) | (255 << 8) | 255;
auto x = 0;
auto y = 0;
constexpr auto speed = 10;
constexpr auto max_pos = window_size - square_size;

enum Direction { left, right, up, down };

auto move = std::array<int, 4>{0};

void draw_square(int x, int y) {
    for (auto row = y; row < y + square_size; row++ ) {
        for (auto col = x; col < x + square_size; col++) {
            auto index = row * window_size + col;
            pixels[index] = white;
        }
    }
}

auto clear_screen = []{ std::fill(pixels.begin(), pixels.end(), 0); };

int main()
{
    auto window = mfb_open_ex(title, window_size, window_size, WF_RESIZABLE);

    mfb_set_keyboard_callback(window, [](mfb_window* window, mfb_key key, mfb_key_mod mod, bool pressed) {
        switch(key) {
        case KB_KEY_ESCAPE: mfb_close(window);break;
        case KB_KEY_LEFT:
            move[left] = pressed ? -1 : 0;
            break;
        case KB_KEY_RIGHT:
            move[right] = pressed ? 1 : 0;
            break;
        case KB_KEY_UP:
            move[up] = pressed ? -1 : 0;
            break;
        case KB_KEY_DOWN:
            move[down] = pressed ? 1 : 0;
            break;
        default:
            break;
    }});

    while (mfb_wait_sync(window)) {
        if (mfb_update_ex(window, pixels.data(), window_size, window_size) < 0)
            break;
        // update
        x += (move[left] + move[right]) * speed;
        y += (move[up] + move[down]) * speed;
        x = std::clamp(x, 0, max_pos);
        y = std::clamp(y, 0, max_pos);
        // render
        clear_screen();	
        draw_square(x, y);
    }
}
