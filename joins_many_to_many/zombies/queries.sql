-- SELECT victims.*, zombies.name AS zombie_name FROM victims
-- INNER JOIN bitings
-- ON bitings.victim_id = victims.id
-- INNER JOIN zombies
-- ON bitings.zombie_id = zombies.id;

-- SELECT victims.name as victim_name, zombies.name AS zombie_name, bitings.infected_on FROM victims
-- INNER JOIN bitings
-- ON bitings.victim_id = victims.id
-- INNER JOIN zombies
-- ON bitings.zombie_id = zombies.id;

SELECT zombies.*, victims.name AS victim_name, bitings.infected_on FROM zombies
INNER JOIN bitings
ON zombies.id = bitings.zombie_id
INNER JOIN victims
ON victims.id = bitings.victim_id;
