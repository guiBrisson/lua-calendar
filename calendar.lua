local calendar = {}
calendar.__index = calendar

-- A year is leap if divisible by 4.
-- Excepet if divisible by 100, unless also divisible by 400
local function isLeapYear(year)
    return year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)
end

local function getDaysInMonth(year, month)
    local daysInMonth = {
        31, 28, 31, 30, 31, 30,
        31, 31, 30, 31, 30, 31
    }

    if isLeapYear(year) then
        daysInMonth[2] = 29
    end

    return daysInMonth[month]
end

-- Zelle's Conngruence formula
local function getFirstWeekDay(year, month)
    if month < 3 then
        month = month + 12
        year = year - 1
    end

    local q = 1                      -- first day of the month
    local m = month                  -- month
    local K = year % 100             -- year of the century
    local J = math.floor(year / 100) -- zero-based century
    local h = (q + math.floor((13 * (m + 1)) / 5) + K + math.floor(K / 4) + math.floor(J / 4) + 5 * J) % 7

    return (h + 6) % 7 -- Convert to 0=Sunday, 1=Monday, ..., 6=Saturday
end

local function generateMonth(year, month, weekStart)
    weekStart = weekStart or 0
    local firstWeekday = getFirstWeekDay(year, month)
    local daysInMonth = getDaysInMonth(year, month)
    local monthGrid = {}
    local week = {}

    -- Add padding for days before the first day of the month
    local padding = (firstWeekday - weekStart) % 7
    for _ = 1, padding do
        table.insert(week, 0) -- 0 represents as "not part of the month"
    end

    for day = 1, daysInMonth do
        table.insert(week, day)
        if #week == 7 then
            table.insert(monthGrid, week)
            week = {}
        end
    end

    -- Add padding for the days after the last day of the month
    if #week > 0 then
        while #week < 7 do
            table.insert(week, 0)
        end
        table.insert(monthGrid, week)
    end

    return monthGrid
end

function calendar:print()
    for _, week in ipairs(self.grid) do
        print(table.unpack(week))
    end
end

local function new(month, year, weekStart)
    weekStart = weekStart or 0
    local monthGrid = generateMonth(year, month, weekStart)
    return setmetatable({ grid = monthGrid }, calendar)
end

return setmetatable({},
    { __call = function(_, ...) return new(...) end })
