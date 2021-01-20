config = {}
config.speeding = {}
config.shooting = {}

-- use phone_number instead of player name for 911 calls
config.phone_number = true

-- enable alerts when cops break the law and print to console
config.debug = true

-- sets report chance to 100%
config.debugchance = true

-- set timers after performing a check
config.speeding.success = 300 -- 30 seconds
config.speeding.fail = 15 -- 1.5 seconds

config.shooting.success = 150 -- 15 seconds
config.shooting.fail = 5 -- 0.5 seconds