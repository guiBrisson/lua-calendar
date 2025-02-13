# Calendar Library in Lua

A simple and lightweight Lua library for generating and displaying monthly calendars.
This library provides functionality to generate a calendar grid for any given month
and year, and includes a helper function to print the calendar in a readable format.

---

## Installation

1. Download the `calendar.lua` file.
2. Place the file in your project directory.
3. Require the module in your Lua script:

   ```lua
   local calendar = require 'calendar'
   ```

---

## Usage

### Creating a Calendar

To create a calendar for a specific month and year, call the `calendar` module like
a function:

```lua
local calendar = require 'calendar'
local c = calendar(month, year, week_start)
```

- `month`: The month (1–12).
- `year`: The year (e.g., 2023).
- `week_start` (optional): The starting day of the week (`0` for Sunday, `1`
for Monday, etc.). Default is `0`.

### Accessing the Calendar Grid

The calendar grid is stored in the `grid` property of the returned object.
It is a 2D table where each row represents a week, and each cell represents a day.
Days that are not part of the month are represented by `0`.

Example:

```lua
local c = calendar(2, 2025) -- February 2025
local grid = c.grid
```

The `grid` for February 2025 looks like this:

```lua
{
    {0,  0,  0,  0,  0,  0,  1 },
    {2,  3,  4,  5,  6,  7,  8 },
    {9,  10, 11, 12, 13, 14, 15},
    {16, 17, 18, 19, 20, 21, 22},
    {23, 24, 25, 26, 27, 28, 0 }
}
```

### Printing the Calendar

You can print the calendar in a readable format using the `print` method:

```lua
c:print()
```

Output for February 2025:

```
0  0  0  0  0  0  1
2  3  4  5  6  7  8
9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28  0
```

---

## Example

Here’s a complete example:

```lua
local calendar = require 'calendar'

-- Create a calendar for February 2025
local c = calendar(2, 2025)

-- Access the calendar grid
local grid = c.grid

-- Print the calendar
c:print()
```

---

## License

This project is licensed under the MIT License.

---

Enjoy using the Lua Calendar Library! 😊
