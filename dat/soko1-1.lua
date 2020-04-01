-- NetHack 3.6	sokoban.des	$NHDT-Date: 1432512784 2015/05/25 00:13:04 $  $NHDT-Branch: master $:$NHDT-Revision: 1.13 $
--	Copyright (c) 1998-1999 by Kevin Hugo
-- NetHack may be freely redistributed.  See license for details.
--
des.level_init({ style = "solidfill", fg = " " });

des.level_flags("mazelevel", "noteleport", "premapped", "solidify");
des.map([[
--------------------------
|........................|
|.......|---------------.|
-------.------         |.|
 |...........|         |.|
 |...........|         |.|
--------.-----         |.|
|............|         |.|
|............|         |.|
-----.--------   ------|.|
 |..........|  --|.....|.|
 |..........|  |.+.....|.|
 |.........|-  |-|.....|.|
-------.----   |.+.....+.|
|........|     |-|.....|--
|........|     |.+.....|  
|...|-----     --|.....|  
-----            -------  
]]);

place = selection.new();
place:set(16,11);
place:set(16,13);
place:set(16,15);

des.stair("down", 01, 01);
des.region(selection.area(00,00,25,17),"lit");
des.non_diggable(selection.area(00,00,25,17));
des.non_passwall(selection.area(00,00,25,17));

-- Boulders
des.object("boulder", 03, 05);
des.object("boulder", 05, 05);
des.object("boulder", 07, 05);
des.object("boulder", 09, 05);
des.object("boulder", 11, 05);
--
des.object("boulder", 04, 07);
des.object("boulder", 04, 08);
des.object("boulder", 06, 07);
des.object("boulder", 09, 07);
des.object("boulder", 11, 07);
--
des.object("boulder", 03, 12);
des.object("boulder", 04, 10);
des.object("boulder", 05, 12);
des.object("boulder", 06, 10);
des.object("boulder", 07, 11);
des.object("boulder", 08, 10);
des.object("boulder", 09, 12);
--
des.object("boulder", 03, 14);

-- Traps
des.trap("hole", 08, 01);
des.trap("hole", 09, 01);
des.trap("hole", 10, 01);
des.trap("hole", 11, 01);
des.trap("hole", 12, 01);
des.trap("hole", 13, 01);
des.trap("hole", 14, 01);
des.trap("hole", 15, 01);
des.trap("hole", 16, 01);
des.trap("hole", 17, 01);
des.trap("hole", 18, 01);
des.trap("hole", 19, 01);
des.trap("hole", 20, 01);
des.trap("hole", 21, 01);
des.trap("hole", 22, 01);
des.trap("hole", 23, 01);

des.monster({ id = "giant mimic", appear_as = "obj:boulder" });
des.monster({ id = "giant mimic", appear_as = "obj:boulder" });

-- Random objects
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "=" });
des.object({ class = "/" });

-- Rewards
des.door("locked", 23, 13);
des.door("closed", 17, 11);
des.door("closed", 17, 13);
des.door("closed", 17, 15);

des.region({ region={18,10, 22,16}, lit = 1, type = "zoo",
	     prefilled = 0, irregular = 1 });

px, py = selection.rndcoord(place);
if math.random(0, 99) < 75 then
   des.object({ id="bag of holding", x=px, y=py,
		buc="not-cursed", achievement=1 });
else
   des.object({ id="amulet of reflection", x=px, y=py,
		buc="not-cursed", achievement=1 });
end
des.engraving({ x = px, y = py, type = "burn", text = "Elbereth" });
des.object({ id = "scare monster", x = px, y = py, buc = "cursed" });
