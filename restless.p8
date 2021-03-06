pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
-- restless in a small world
-- - codeartisticninja and fennesz

map = {
	sizex = 32,
	sizey = 32
}

cam = {
	x = 0,
	y = 0
}

player = {
	x = 64,
	y = 64,
	dx = 0,
	dy = 0,
	state = -1,
	sprite = 76,
	flipped = false,
	hover = 0,
	shake = 0
}
dialog = {
	npcdialogdistance = 8,
	script = nil,
	pos = 0,
	col = 0
}

currentlevel = 1
drawnumber = 1

levels = {
	{
		help = "use arrows to move",
		chars = {}
	},
	{
		help = "press x to listen in",
		chars = {
			richard = {
				x = 14.5,
				y = 13.5,
				sprite = 64,
				script = {
					"richard: when should i tell the others that he's gone?",
					"richard: his body is still being examined, maybe i should just wait until his cause of death is known.",
					"richard: no matter what, it was too early for peter.",
					"richard: ...",
					"richard: at least now, i can be sure he won't tell anyone."
				}
			},
			paul = {
				x =7,
				y = 20,
				sprite = 65,
				script = {
					"paul: there is such an odd breeze out tonight.",
					"paul: i should have stayed home.",
					"paul: i get the feeling that something bad has happened."
				}
			},
			tim = {
				x = 9,
				y = 6,
				sprite = 68,
				script = {
					"tim: they say that after you die you're rooted to a place.",
					"tim: like a leaf caught in a spiderweb."
				}
			},
			animal = {
				x = 46/8,
				y = 64/8,
				sprite = 88,
				firstsprite = 88,
				maxsprite = 92,
				repititionnumber = 4,
				talkedto = true,
				script = {
					"rabbit: ...!"
				}
			}
		}
	},
	{
		chars = {
			john = {
				x = 11/8,
				y = 53/8,
				sprite = 66,
				script = {
					"john: ...and then i totally punched him in the face!",
					"john: yeah!",
					"john: dude thought he could tell me what's what... hah!",
					"john: can't wait to tell the guys about that idiot."
				}
			},
			dave = {
				x = 111/8,
				y = 53/8,
				sprite = 67,
				script = {
					"dave: preacher richard said he had a woodworking job for me.",
					"dave: no matter what, i'll deliver.",
					"dave: maybe a new pew for the church? hmm. it has to match the others..."
				}
			},
			richard = {
				x = 7.5,
				y = 19.5,
				sprite = 64,
				script = {
					"richard: maybe she isn't home?",
					"richard: i can always say i was just here to spread the word of god.",
					"richard: sharon has such nice feet, i want to worship them.",
					"richard: ...",
					"richard: i swear... on the bible... this is the last time i do this!"
				}
			},
			tim = {
				x = 28,
				y = 4,
				sprite = 68,
				script = {
					"tim: maybe if i eat it here.",
					"tim: no one will see me if i freak out again.",
					"tim: is someone watching me?"
				}
			},
			animal = {
				x = 116/8,
				y = 30/8,
				sprite = 100,
				firstsprite = 100,
				maxsprite = 104,
				repititionnumber = 4,
				talkedto = true,
				script = {
					"dog: woof!",
					"dog: bark!"
 			}
			}
		}
	},
	{
		chars = {
			sharon = {
				x = 18,
				y = 6,
				sprite = 82,
				script = {
					"sharon: richard is so disgusting... ugh!",
					"sharon: he's so nice to me though.",
					"sharon: where is fluffy? he's such a cute rabbit."
				}
			},
			john = {
				x = 15,
				y = 6,
				sprite = 66,
				script = {
					"john: sharon is so pretty.",
					"john: if i was some other kind of guy, i would romance her.",
					"john: ...",
					"john: not that i give a shit about her and her stupid rabbit."
				}
			},
			dave = {
				x = 13,
				y = 17,
				sprite = 67,
				script = {
					"dave: maybe preacher richard is finally going to tell me about that woodworking project.",
					"dave: i can't do a proper job with all that secrecy.",
					"dave: i need to get my tools ready, dammit! what's so important?"
				}
			},
			richard = {
				x = 23.5,
				y = 12,
				sprite = 64,
				script = {
					"richard: i can't say that i miss peter, but i have to be graceous.",
					"richard: ... in the name of the lord.... of course.",
					"richard: forgive my sins.",
					"richard: ...",
					"richard: i think this will be a good spot for peter."
				}
			},
			animal = {
				x = 46/8,
				y = 64/8,
				sprite = 96,
				firstsprite = 96,
				maxsprite = 100,
				repititionnumber = 4,
				talkedto = true,
				script = {
					"chicken: cluck!",
					"chicken: bwaark!",
					"chicken: uaark!",
					"chicken: donald trump!"
 			}
			}
			
		}
	},
	{
		chars = {
			sharon = {
				x = 12.5,
				y = 15,
				sprite = 82,
				script = {
					"sharon: oh noooo! fluffy!",
					"sharon: poor little fluffy...",
					"sharon: *sobs*"
				}
			},
			john = {
				x = 10,
				y = 15,
				sprite = 66,
				script = {
					"john: the rabbit is dead.",
					"john: oh, bohooo - someone killed it.",
					"john: we're all gonna die anyway."
				}
			},
			dave = {
				x = 11,
				y = 15,
				sprite = 67,
				script = {
					"dave: they say death is the road to glory.",
					"dave: ... but there is no glory in a dead rabbit."
				}
			},
			richard = {
				x = 10,
				y = 13,
				sprite = 64,
				script = {
					"richard: the lord giveth, and the lord taketh away....",
					"richard: ... i need to get rid of my sinful thoughts.",
					"richard: how can i look at sharon this way, even now?",
					"richard: ...",
					"richard: only the lord can judge the person who did this."
				}
			},
			tim = {
				x = 12,
				y = 12,
				sprite = 68,
				script = {
					"tim: we're all prone to see intent behind cruel accidents.",
					"tim: i wish i could look away.",
					"tim: but all i see is my own paranoia."
				}
			},

			paul = {
				x =11,
				y = 12,
				sprite = 65,
				script = {
					"paul: it wasn't my fault, it wasn't my fault, it wasn't my fault...",
					"paul: ... was it?"
				}
			},

			animal = {
				x = 8,
				y = 16,
				sprite = 96,
				firstsprite = 96,
				maxsprite = 100,
				repititionnumber = 4,
				talkedto = true,
				script = {
					"chicken: cluck!"
 			}
			},

			animal = {
				x = 8,
				y = 8,
				sprite = 100,
				firstsprite = 100,
				maxsprite = 104,
				repititionnumber = 4,
				talkedto = true,
				script = {
					"dog: woof!"
 			}
			},

			deadanimal = {
				x = 12,
				y = 14,
				sprite = 92,
				talkedto = false,
				dead = true,
				script = {
					"fluffy the rabbit is dead, but the cause of death is uncertain."
 				}
			}
		}
	},
	{
		help = "the following night...",
		chars = {
			deadanimal = {
				x = 20,
				y = 20,
				sprite = 92,
				talkedto = false,
				dead = true,
				script = {
					"the rabbit has recently been dug up, and is missing a foot."
 				}
			},
			paul = {
				x =20.5,
				y = 20,
				sprite = 65,
				script = {
					"paul looks at a bloody rabbits foot in his hand.",
					"paul: ... this better be worth it!",
					"paul pushes the rabbit back into its grave."
				}
			},
		}
	},
	{
		chars = {
		sharon = {
			x = 4.5,
			y = 12,
			sprite = 82,
			script = {
			"sharon: i miss fluffy so much...  i wish peter was here.",
			"sharon: he's the only one who can cheer me up, and motivate me.",
			"sharon: i'm so ugly..."
			}
		},
		john = {
			x = 18,
			y = 1,
			sprite = 66,
			script = {
			"john: if peter was here right now,",
			"john: i'd kick his ass once for being here,",
			"john: twice for insinuating that i'm too sensitive.",
			"john: heh... the boys would get a kick out of that."
			}
		},
		dave = {
			x = 24,
			y = 6,
			sprite = 67,
			script = {
			"dave: *sigh*... the coffin will never be good enough.",
			"dave: not even if it was for fluffy...",
			"dave: i suck at this. i'm a one-armed freak."
			}
		},
		richard = {
			x = 20,
			y = 14,
			sprite = 64,
			script = {
			"richard: peter... the apostle? no... peter...",
			"richard: he has been in my thoughts a lot lately.",
			"richard: i can still feel his presence in my church sometimes."
			}
		},
		tim = {
			x = 15,
			y = 23,
			sprite = 68,
			script = {
			"tim: you never know what you've lost until it's gone.",
			"tim: ...",
			"tim: what a cliche this is."
			}
		},

		paul = {
			x =11,
			y = 12,
			sprite = 65,
			script = {
			"paul: sharon is going to find out about the rabbit, she is going to find out.",
			"paul: oh no! i just know it! she'll see that the grave was disturbed..."
			}
		},

		animal = {
			x = 8,
			y = 16,
			sprite = 96,
			firstsprite = 96,
			maxsprite = 100,
			repititionnumber = 4,
			talkedto = true,
			script = {
			"chicken: cluck!"
			}
		},

		animal = {
			x = 8,
			y = 8,
			sprite = 100,
			firstsprite = 100,
			maxsprite = 104,
			repititionnumber = 4,
			talkedto = true,
			script = {
				"dog: woof!"
				}
			}
		}
	},
	{
		chars = {
			sharon = {
				x = 12.5,
				y = 15,
				sprite = 82,
				script = {
				"sharon: poor peter.",
				"sharon: he was always seemed so happy.",
				"sharon: *sobs*"
				}
			},
			john = {
				x = 9,
				y = 15,
				sprite = 66,
				script = {
				"john: so uhm... i went to peter's house... but he wasn't home...",
				"john: but i found this note on the table...",
				"john: \"goodbye cruel world\"",
				"john: way to be a downer, peter. i was just gonna punch you a little..."
				}
			},
			dave = {
				x = 10.5,
				y = 16,
				sprite = 67,
				script = {
				"dave: what... so now i have to make another coffins...?",
				"dave: oh... i guess it wasn't for fluffy in the first place...",
				"dave: would be kinda unusual to bury pets in a coffin.",
				}
			},
			richard = {
				x = 9,
				y = 13,
				sprite = 64,
				script = {
				"richard: i'm so sorry i didn't tell you this earlier..",
				"richard: i guess now we know why he died.",
				"richard: i never knew he was in such a hurry to die."
				}
			},
			tim = {
				x = 12,
				y = 13,
				sprite = 68,
				script = {
				"tim: fuck... i thought it was just a dream...",
				"tim: i guess it's always the good ones who go first...",
				"tim: ...",
				"tim: how much did i take..?"
				}
			},

			paul = {
				x =11,
				y = 12,
				sprite = 65,
				script = {
				"paul: i knew it! i knew something bad had happened.",
				"paul: something bad always happens when i'm around..."
				}
			},
		}
	},
	{
		chars = {
			john = {
				x = 11/8,
				y = 53/8,
				sprite = 66,
				script = {
					"john: i can't focus.",
					"john: fucking peter keeps getting back on my mind... why? he was such a freak.",
					"john: he would always put on that pretense, telling me he \"worried about me\".",
					"john: as if i was one of those nutcases bottling up their feelings or some shit.",
					"john: peter... if you hear me right now... you were such an idiot."
				}
			},
			dave = {
				x = 111/8,
				y = 53/8,
				sprite = 67,
				script = {
					"dave: i can't measure while hammering, i can't hold the fucking saw and the...",
					"dave: *sigh*... do i set impossible standards for myself?",
					"dave: what would peter say if he was here?",
					"dave: ...",
					"dave: \"you're too hard on yourself, dave!\", thats what he'd say... heh..."
				}
			},
			richard = {
				x = 16,
				y = 14.5,
				sprite = 64,
				script = {
					"richard: when the coroner arrives... when peter arrives...",
					"richard: can i look in his face again?",
					"richard: can i see him as god would, and not as his friend? his...",
					"richard: honestly, he was more strong than i. suicide...",
					"richard: maybe... maybe i can honor him by striving even harder to be a better person."
				}
			},
			tim = {
				x = 28,
				y = 4,
				sprite = 68,
				script = {
					"tim: when i was a child i stood above a pond.",
					"tim: i looked into it, and saw my own reflection.",
					"tim: but then i lost my watch, and it plopped into it, destroying me with the ripples.",
					"tim: who am i now? has time taken me away?",
					"tim: how can i stay grounded now? without peter?"
				}
			},
			
			paul = {
				x =7,
				y = 20,
				sprite = 65,
				script = {
					"paul: peter used to say that, all i was in control of, was my own actions.",
					"paul: ... he told me to believe in myself.",
					"paul: what is belief? and who am i? a sicko who cuts off the limbs of dead pets.",
					"paul: dear beloved pets... and for what?"
				}
			},
			
			sharon = {
				x = 18,
				y = 6,
				sprite = 82,
				script = {
					"sharon: i can't believe any of this is happening.",
					"sharon: i will never get over this.",
					"sharon: my make-up is running, but i don't even care at this point.",
					"sharon: .... that's a lie, i do care - and i hate myself for it!"
				}
			},

			animal = {
				x = 116/8,
				y = 30/8,
				sprite = 100,
				firstsprite = 100,
				maxsprite = 104,
				repititionnumber = 4,
				talkedto = true,
				script = {
					"dog: what are you talking to me for?"
 				}	
			},

			animal = {
				x = 8,
				y = 16,
				sprite = 96,
				firstsprite = 96,
				maxsprite = 100,
				repititionnumber = 4,
				talkedto = true,
				script = {
				"chicken: cuck!"
				}
			},

			
		}
	},
	{
		help = "after peters funeral...",
		chars = {
			grave = {
				x = 24.5,
				y = 11.5,
				sprite = 119,
				talkedto = true,
				dead = true,
				script = {
				"\"here lies peter\""
				}
			},
			john = {
				x = 11/8,
				y = 53/8,
				sprite = 66,
				script = {
				"john: man... that guy, peter... i guess he wasn't such an oddball after all...",
				"john: i mean, if it wasn't for him, i never would have told sharon how i feel about her...",
				"john: and now we're getting married! who would have thought she was a sucker for emotional guys...",
				"john: heh... thanks, peter... you idiot..."
				}
			},
			dave = {
				x = 111/8,
				y = 53/8,
				sprite = 67,
				script = {
				"dave: i've gotten more work done in the last couple of days, than i have in forever!",
				"dave: ... not always great work, but... the customers seems happy...",
				"dave: and, boy, do i feel better about myself!",
				"dave: ...",
				"dave: peter... wherever you are... i owe you one..."
				}
			},
			tim = {
				x = 28,
				y = 4,
				sprite = 68,
				script = {
				"tim: dear peter... am i still crazy for talking to a dead guy..?",
				"tim: i swear i haven't touched the stuff for several days now!",
				"tim: the others may not admit it, but... i think you are the best martyr the village has ever had.",
				"tim: ...",
				"tim: let's hope paul doesn't cut off your foot."
				}
			},
			
			paul = {
				x =7,
				y = 20,
				sprite = 65,
				script = {
				"paul: i am in control of my own life... me and no one else..!",
				"paul: not the stars or a rabbit's foot or any of that nonsense...",
				"paul: besides... i gave fluffy's foot to sharon as something to remember him by...",
				"paul: thanks for believing in me, peter... when i couldn't do so myself..."
				}
			},
			
			sharon = {
				x = 18,
				y = 6,
				sprite = 82,
				script = {
				"sharon: i am beautiful... i know that now...",
				"sharon: not just because johnny tells me every day... but because peter taught me how to love myself...",
				"sharon: i never thought my johnny could be such a sweetheart. once you get to know him.",
				"sharon: ...",
				"sharon: peter was such a sweet guy... i'm surprised he was still single when he died..."
				}
			},
			richard = {
				x = 23.5,
				y = 12.5,
				sprite = 64,
				script = {
					"richard is tending to peter's grave.",
					"richard: your funeral was great.",
					"richard: ...",
					"richard: if you're listening, i still have those thoughts peter.",
					"richard: ... but you'll be happy to know that i haven't acted on them.",
					"richard: i guess you did help me after all, huh?",
				}
			},
		}
	},
	{
		help = "hold x to let go",
		chars = {
			grave = {
				x = 24.5,
				y = 11.5,
				sprite = 119,
				talkedto = true,
				dead = true,
				script = {
					"\"here lies peter\""
				}
			},
		}
	}
}

function _init()
	currentlevel = 1
	music(0)
end

function _update()
	if player.state == -1 then
		if (drawnumber % 30 == 1) or (drawnumber % 30 == 7) then
			player.hover += 1
		elseif (drawnumber % 30 == 15) or (drawnumber % 30 == 22) then
			player.hover -= 1
		end
		if btnp(5) then
			player.state += 1
		end
	elseif (player.state == 0) then
		for name,char in pairs(levels[currentlevel].chars) do
			if (drawnumber % 30 == 1) then
				if (rnd(5) < 2) then
					if not char.dead then
						char.flipped = not char.flipped
					end
				end
			end
		end
		if not isplayermoving() then
			if (drawnumber % 30 == 1) or (drawnumber % 30 == 7) then
				player.hover += 1
			elseif (drawnumber % 30 == 15) or (drawnumber % 30 == 22) then
				player.hover -= 1
			end
		end
		handleplayermovement()
	elseif (player.state == 1) then
		handledialog()
	elseif (player.state == 6) then
		handleascend()
	end
end

function _draw()
	drawnumber += 1
	if player.state == -1 then
		drawstart()
	elseif player.state == 7 then
		drawcredits()
	else
		handleanimal()
		cls()
		drawmap()
		if levels[currentlevel].help then
			camera(0,0)
			rectfill(0,0,128,6,0)
			print(centertxt(levels[currentlevel].help, 32), 0, 0, 7)
		end
		camera(cam.x ,cam.y)
		if (player.state == 1) then
			drawdiabox()
		end
	end
end

function handleanimal()
	if (drawnumber % 20 == 1 and levels[currentlevel].chars.animal != nil) then
		levels[currentlevel].chars.animal.sprite += 1
		if (levels[currentlevel].chars.animal.sprite > levels[currentlevel].chars.animal.maxsprite - 1) then
			levels[currentlevel].chars.animal.repititionnumber -= 1
			levels[currentlevel].chars.animal.sprite = levels[currentlevel].chars.animal.maxsprite - 2
		end
		if (levels[currentlevel].chars.animal.repititionnumber < 1) then
			startsprite = rnd(3)
			levels[currentlevel].chars.animal.sprite = levels[currentlevel].chars.animal.firstsprite + flr(startsprite)
			levels[currentlevel].chars.animal.repititionnumber = -flr(-rnd(3))
			moverandomdirection(levels[currentlevel].chars.animal)
		end
	end
end

function moverandomdirection(animal)
	direction = flr(rnd(4))
	if (direction < 1) then
		animal.x += .4
	elseif (direction < 2) then
		animal.x -= .4
	elseif (direction < 3) then
		animal.y -= .4
	else
		animal.y += .4
	end
end

function handleplayermovement()
	player.dx = 0
	player.dy = 0
	handlecontrols()
	player.x += player.dx
	player.y += player.dy
	handlemoveplayeraccrossmap()
	if isplayermoving() then
		player.hover = 0
		player.sprite += 1
		if player.sprite > 79 then
			player.sprite = 76
		end
	end
	cam.x = player.x - 63
	cam.y = player.y - 63
end

function isplayermoving()
	return player.dx != 0 or player.dy != 0
end

function handlecontrols()
	if (btn(0)) then
		player.dx = -1
		player.flipped = true
	end
	if (btn(1)) then
		player.dx = 1
		player.flipped = false
	end
	if (btn(2)) then
		player.dy = -1
	end
	if (btn(3)) then
		player.dy = 1
	end
	if (btnp(5) and npcwithinrange()) then
		sfx(3)
		dialog.pos = 1
		player.state = 1
	end
end

function drawmap()
	for y=-8,8,8 do
		for x=-8,8,8 do
			camera(map.sizex*x + cam.x, map.sizey*y + cam.y)
			mapdraw(0, 0, 0, 0, map.sizex,map.sizey)
		end
	end
	for y=-8,8,8 do
		for x=-8,8,8 do
			camera(map.sizex*x + cam.x, map.sizey*y + cam.y)
			spr(player.sprite,player.x + player.shake-4,player.y + player.hover-4,1,1,player.flipped)
			for name,char in pairs(levels[currentlevel].chars) do
				spr(char.sprite,char.x*8-4,char.y*8-4,1,1,char.flipped)
			end
		end
	end
end

function handlemoveplayeraccrossmap()
	moved = false
	if player.x < 0 then
		player.x += map.sizex * 8
		moved = true
	end
	if player.y < 0 then
		player.y += map.sizey * 8
		moved = true
	end
	if player.x > map.sizex * 8 then
		player.x -= map.sizex * 8
		moved = true
	end
	if player.y > map.sizey * 8 then
		player.y -= map.sizey * 8
		moved = true
	end
	if moved and allnpcstalkedto() then
		currentlevel += 1
		if currentlevel >= count(levels) then
			music(-1)
			player.state = 6
			currentlevel = count(levels)
		end
	end
end

function allnpcstalkedto()
	alltalkedto = true
	for name,char in pairs(levels[currentlevel].chars) do
		if not char.talkedto then
			alltalkedto = false
		end
	end
	return alltalkedto
end

-- dialog system --

function handledialog()
	if dialog.col < 4096 then
		dialog.col += 2
	end
	if btn(4) then
		dialog.pos = count(dialog.script)
		dialog.col = 0
	end
	if btnp(5) then
		if (dialog.pos < count(dialog.script)) then
			dialog.pos += 1
			dialog.col = 0
		elseif currentlevel == count(levels) then
			player.state = 6
		else
			player.state = 0
		end
		dialog.col = 0
	end
end

function npcwithinrange()
	inrange = false
	for name,char in pairs(levels[currentlevel].chars) do
		if (abs(char.x*8 - player.x) < dialog.npcdialogdistance and abs(char.y*8 - player.y) < dialog.npcdialogdistance) then
			inrange = true
			dialog.script = char.script
			char.talkedto = true
			dialog.col1 = 6
			dialog.col2 = 7
			if char.sprite == 82 then
				dialog.col1 = 14
				dialog.col2 = 15
			elseif char.sprite == 66 then
				dialog.col1 = 2
				dialog.col2 = 8
			elseif char.sprite == 67 then
				dialog.col1 = 9
				dialog.col2 = 10
			elseif char.sprite == 64 then
				dialog.col1 = 5
				dialog.col2 = 6
			elseif char.sprite == 68 then
				dialog.col1 = 1
				dialog.col2 = 13
			elseif char.sprite == 65 then
				dialog.col1 = 3
				dialog.col2 = 11
			end
		end
	end
	return inrange
end

function wordwrap(txt, w)
	p = 0
	word = ""
	out = ""
	for i = 1,#txt do
		c = sub(txt, i, i)
		p += 1
		word = word..c
		if (p > w) then
			out = out .. "\n"
			p = #word
		end
		if (c == " ") then
			out = out .. word
			word = ""
		end
	end
	out = out .. word
	return out
end

function firstword(txt)
	word = ""
	for i = 1,#txt do
		c = sub(txt, i, i)
		word = word..c
		if (c == ":") then
			return word
		end
	end
	return word
end

function centertxt(txt, w)
	while #txt < w do
		txt = txt .. " "
		txt = " " .. txt
	end
	return txt
end

function drawdiabox()
	camera(0,0)
	rectfill(0, 95, 127, 127, 0)
	-- rect(0, 96, 127, 127, 5)
	txt = dialog.script[dialog.pos]
	txt = wordwrap(txt, 32)
	txt = sub(txt,1,dialog.col)
	print(txt, 0, 98, dialog.col2)
	print(firstword(txt), 0, 98, dialog.col1)
end

-- ascend to the heavens! --

function handleascend()
	handleplayermovement()
	if (btn(5)) then
		player.hover -= .5
	end
	if (drawnumber % 60 == 0) or (drawnumber % 30 == 7) then
		player.shake += 1
	elseif (drawnumber % 60 == 30) or (drawnumber % 30 == 22) then
		player.shake -= 1
	end
	if player.hover < -80 then
		player.state += 1
	end
end

-- start screen --

function drawstart()
	cls()
	spr(player.sprite,player.x + player.shake-4,player.y + player.hover-4,1,1,player.flipped)
	
	camera(0,0)
	print("")
	print("")
	print("")
	print("")
	print("")
	print("")
	color(12)
	print(centertxt("restless in a small world",32))
	print("")
	print("")
	print("")
	print("")
	print("")
	print("")
	print("")
	print("")
	color(5)
	print(centertxt("press x to start",32))
end

-- credits --

function drawcredits()
	cls()
	camera(0,0)
	print("")
	print("")
	print("")
	print("")
	color(12)
	print(centertxt("rest in peace",32))
	print("")
	print("")
	color(6)
	print(centertxt("ldjam game made by",32))
	print("")
	color(5)
	print(centertxt("codeartistic.ninja",32))
	print(centertxt("and",32))
	print(centertxt("fennesz",32))
	print("")
	print("")
	print(centertxt("thank you for playing!",32))
end

__gfx__
00066000442424445d55d55533b33b3355155515ddddddddcccccccc00000000aaaaaaaabbbbbbbb99999999eeeeeeee11011011111110110101110001111101
0066660042444424d5555d5533b3b33355155515dddddddddddddddd000000009999999933333333444444442222222211111111011011101111111111111111
06656560444244445d5555553333333b11111111ddd1ddddddd1dddd000000009999999933333333444444442222222211101111111111111010110111010111
06656560242442425555d55d333333b351551551dd1d1dd1dd1d1dd1000000004999499953335333544454441222122210111101111110111111011111111111
06666660424424445d5555553b3333335155155111ddd11d11ddd11d101010109444944435553555455545552111211111111111111011101111111011111011
06666660242442445555d5d533333b3311111111dddddddddddddddd000000009999999933333333444444442222222201110111101111110110111110101110
0660666044442424d55d555533b3b33315555155dddddddddddddddd010101019999999933333333444444442222222211011111111011011011110111111111
06000600242444445555555d3b33333315555155dddddddddddddddd101010109999999933333333444444442222222211111101111111111110111111111011
00066000011010111121121155555555000090005555555500000000111111119999999933333333444444442222222200000000555555550000000055555555
00666600111101102112111155555555010010015555555500000000144444419999999933333333444444442222222200000000555555550000000055555555
06656560110111111111212255555555000999015555555500000000144444419999999933333333444444442222222200000000555555550000000055555555
06666660111110111211111155555555009199905555555500000000144444414999499953335333544454441222122200000000555555550000000055555555
06666660101011112112111155555555109919905555555500000000144441419444944435553555455545552111211100000000555555550000000055555555
06666660111101011111121155555555091999195555555500000000144444419999999933333333444444442222222200000000555555550000000055555555
06660660010110102121212155555555000000105555555500000000144444419999999933333333444444442222222200000000555555550000000055555555
00600060111111111112111155555555110010105555555500000000144444419999999933333333444444442222222200000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000004111411128882888122212221ddd1ddd55555555000000005555555500000000
55555555000000005555555500000000555555550000000055555555000000004111111428888882122222211dddddd155555555000000005555555500000000
5555555500000000555555550000000055555555000000005555555500000000110000118800008822000022dd0000dd55555555000000005555555500000000
55555555000000005555555500000000555555550000000055555555000000004100001428000082120000211d0000d155555555000000005555555500000000
55555555000000005555555500000000555555550000000055555555000000004100001128000088120000221d0000dd55555555000000005555555500000000
55555555000000005555555500000000555555550000000055555555000000004100001428000082120000211d0000d155555555000000005555555500000000
5555555500000000555555550000000055555555000000005555555500000000111111118888888822222222dddddddd55555555000000005555555500000000
55555555000000005555555500000000555555550000000055555555000000004444444422222222111111111111111155555555000000005555555500000000
33b33b3333333b3333b33b3333333333333333333333333333333333333333331444144428882888122212221ddd1ddd00000000555555550000000055555555
33b3b33333b3b3333333b33333b3b33333b3b3336333b3333333b33333b353331111111122222222111111111111111100000000555555550000000055555555
3333333b3333333b3333333b3333333b3333333b3333333b3333333b3433333b441444148828882822122212dd1ddd1d00000000555555550000000055555555
333333b333333333333333b3333333333336333333333333333335333333b3331111111122222222111111111111111100000000555555550000000055555555
3b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333331444144428882888122212221ddd1ddd00000000555555550000000055555555
33333b3333333b333333333333333b3333333b33333333b333333b33333333331111111122222222111111111111111100000000555555550000000055555555
33b3b3333333b3333333333333b3b33333b3b33333b3b35333b3333333b33333441444148828882822122212dd1ddd1d00000000555555550000000055555555
3b333333333333333b33333333333333333333333333333353333333333333361111111122222222111111111111111100000000555555550000000055555555
0066600000022000000110000044440000aaaa000000000055555555000000005555555500000000555555550000000000066000000660000006600000066000
0fcfff0000f62200001f11000f6f64000f6f6ff00000000055555555000000005555555500000000555555550000000000666600006666000066660000666600
00ffff0000ffff0000ffff0000ffff0000ffff000000000055555555000000005555555500000000555555550000000006656560066565600665656006656560
05777550033333307777777709999900099999900000000055555555000000005555555500000000555555550000000006656560066565600665656006656560
f055500ff0033030f077770f90777700099999090000000055555555000000005555555500000000555555550000000006666660066666600666666006666660
00555500000cc0f000ecc000f02442000fd44d0f0000000055555555000000005555555500000000555555550000000006666660066666600666666006666660
0050050000c00c0000c00c000022220000dd0d000000000055555555000000005555555500000000555555550000000006606660060666000066606006660660
00500500005005000010010000100100001001000000000055555555000000005555555500000000555555550000000006000600000060000006000000600060
0000000000444400009999000066660000ff66005555555500000000555555550000000000000000000000000000000000000000000000005555555500000000
0000000004fffd0000dff99006ffff000fdfff605555555500000000555555550007070000000000007070000007070000000000000000005555555500000000
0000000004fdfff00fffdf9006fdfdf00fdfdf6f5555555500000000555555550070700000707700007070000070700000000000000000005555555500000000
0000000000ffff0000ffff0900ffff0000ffff095555555500000000555555550707000007070000070700000707000000000000000000005555555500000000
000000000888888004444440eeeeeeee099999905555555500000000555555550777770007777700077777000777770000777000000000005555555500000000
000000008088880840444404f0eeee0f909999005555555500000000555555557777777077777770777777707777777077777700000000005555555500000000
000000000fccccf0f02222f0005555000f666600555555550000000055555555f7777770f7777770f7777777f7777770f7778700000000005555555500000000
0000000000c00c000020020000500500006006005555555500000000555555550770777707777777077077770770777707788870000000005555555500000000
00000000000000000000000000000000000000000000040000000400000000000000000007707770000000005555555500000000555555550000000055555555
00000000000000000000000000000000044000000044400000044000404440000000000055555555000000005555555500000000555555550000000055555555
00000000000000000000000000000000414400000414140000044000041414000000000055555555000000005555555500000000555555550000000055555555
00070000000000000000700000000000444404000042400000444000004240000000000055555555000000005555555500000000555555550000000055555555
00a70000000a000000007a0000700000004440000044400004141400004140000000000055555555000000005555555500000000555555550000000055555555
00077070000700000707700000077000004440000044400000424000004440000000000055555555000000005555555500000000555555550000000055555555
00077700000700000077700000077770004040000040400000440000004040000000000055555555000000005555555500000000555555550000000055555555
000090000090900000090000000900a0004040000040400000404000004040000000000055555555000000005555555500000000555555550000000055555555
1111110110661010411010110110101111101011111010111110101110dd51105555555500000000555555550000000055555555000000005555555500000000
1014411111666511411101101111011011119110111191101011011011ddd5015555555500000000555555550000000055555555000000005555555500000000
1114411106666651410111111101111111193111111c3111111111151d77dd515555555500000000555555550000000055555555000000005555555500000000
144664411667665041111111111111111a01111188011111011915490d7d7d505555555500000000555555550000000055555555000000005555555500000000
111441111677765540111011011110111b1118311b111c31104445141d77dd555555555500000000555555550000000055555555000000005555555500000000
10144111666766654111111144444444333113113331131111944954dd7dddd55555555500000000555555550000000055555555000000005555555500000000
1014410166676665411101111141041113113b1113113b1119449111dd7dddd55555555500000000555555550000000055555555000000005555555500000000
11144111666666654011111110411411101113111011131110111011ddddddd55555555500000000555555550000000055555555000000005555555500000000
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555555555555500000000555555550000000055555555000000005555555500000000
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
55555555000000005555555500000000555555550000000055555555000000000000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000000000000000000000000000000000000000000000000000000000005555555500000000555555550000000055555555000000005555555500000000
00000000000000000000000000000000000000000000000000000000000000005555555500000000555555550000000055555555000000005555555500000000
00000000000000000000000000000000000000000000000000000000000000005555555500000000555555550000000055555555000000005555555500000000
00000000000000000000000000000000000000000000000000000000000000005555555500000000555555550000000055555555000000005555555500000000
00000000000000000000000000000000000000000000000000000000000000005555555500000000555555550000000055555555000000005555555500000000
00000000000000000000000000000000000000000000000000000000000000005555555500000000555555550000000055555555000000005555555500000000
00000000000000000000000000000000000000000000000000000000000000005555555500000000555555550000000055555555000000005555555500000000
00000000000000000000000000000000000000000000000000000000000000005555555500000000555555550000000055555555000000005555555500000000
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
00000000555555550000000055555555000000005555555500000000555555550000000055555555000000005555555500000000555555550000000055555555
__label__
111011011110110dddddddddddddddddddddddddddddddddddddddddddddddd11110144411101101111111111110110111101101dddddd1111111111dddddd11
101111111011111ddd1ddddddd1ddddddd1ddddddd1ddddddd1ddddddd1dddd1101141414011111101011011101111111011111dd0000dddd1ddd1ddd0000ddd
111101111111011dd1d1dd1dd1d1dd1dd1d1dd1dd1d1dd1dd1d1dd1dd1d1dd111111042411110111111011111111011111110111d0000d1111111111d0000d11
01011111010111111ddd11d11ddd11d11ddd11d11ddd11d11ddd11d11ddd11d10101144401011111111111010101111101011111d0000dd1ddd1ddd1d0000dd1
111010111110101dddddddddddddddddddddddddddddddddddddddddddddddd11110144411101010110111111110101111101011d0000d1111111111d0000d11
101101001011010dddddddddddddddddddddddddddddddddddddddddddddddd0101104041011010101111010101101001011010dddddddddd1ddd1dddddddddd
111111111111111dddddddddddddddddddddddddddddddddddddddddddddddd11111141411111111110111111111111111111111111111111111111111111111
11010110110101155155515551555151111111155155515551555155515551501101011011111010101110001101011011010111ddd1ddd111111111ddd1ddd1
11101101111011055155515551555151444444155155515551555155515551511110110111111111111111111110110111101101111111114444441111111111
1011111110111111111111111111111144444411111111111111111111111111101111111010111101011011101111111011111dd1ddd1d14444441dd1ddd1dd
11110111111101151551551515515511444444151551551515515515155155111111011111111111111011111111011111110111111111114444441111111111
01011111010111151551551515515511444414151551551515515515155155110101111111110111111111010101111101011111ddd1ddd144441411ddd1ddd1
11101011111010111111111111111111444444111111111111111111111111111110101101011100110111111110101111101011111111114444441111111111
1011010010110101555515515555155144444411555515515555155155551550101101011111111101111010101101001011010dd1ddd1d14444441dd1ddd1dd
11111111111111115555155155551551444444115555155155551551555515511111111111110111110111111111111111111111111111114444441111111111
11010110110101101101011011010111121121101101011011010110110101101101011010111000110101101101011011010110110101111211211110110110
11101101111011011110110111101102112111111110110111101101111011011110110111111111111044441110110111101101111011021121111111111111
10111111101111111011111110111111111212211011111110111111101111111011111101011011101146f6f011111110111111101111111112122111011111
111101111111011111110111111101112111111111110111111101111111011111110111111011111111ffff1111011111110111111101112111111101111011
01011111010111110101111101011112112111110101111101011111010111110101111111111101010199999101111101011111010111121121111111111111
11101011111010111110101111101011111121111110101111101011111010111110101011011111111077771910101111101011111010111111211011101111
10110100101101001011010010110102121212101011010010110100101101001011010101111010101124421f11010010110100101101021212121110111110
11111111111111111111111111111111112111111111111111111111111111111111111111011111111122221111111111111111111111111121111111111011
11010110110101101101011011010111121121111211211112112111121121111211211112112111121111111211211112112111121121111211211112112111
11101101111011011110110111101102112111121121111211211112112111121121111211211112112111121121111211211112112111121121111211211112
10111111101111111011111110111111111212211112122111121221111212211112122111121221111212211112122111121221111212211112122111121221
11110111111101111111011111110111211111112111111121111111211111112111111121111111211111112111111121111111211111112111111121111111
01011111010111110101111101011112112111121121111211211112112111121121111211211112112111121121111211211112112111121121111211211112
11101011111010111110101111101011111121111111211111112111111121111111211111112111111121111111211111112111111121111111211111112111
10110100101101001011010010110102121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212
11111111111111111111111111111111112111111121111111211111112111111121111111211111112111111121111111211111112111111121111111211111
bbbbbbbbbbbbbbb011010111101101111211211011010110110101101101011010111000110101111111011cccccccc010111000110101101101011110110111
333333333333333111101101111111121121111111101101111011011110110111111111111011001101110dddddddd111111111111011011110110111111111
333333333333333110111111110111111112122110111111101111111011111101011011101111111111111ddd1dddd101011011101111111011111111011111
333533353335333111110111011110112111111111110111111101111111011111101111111101111111011dd1d1dd1111101111111101111111011101111011
55535553555355510101111111111112112111110101111101011111010111111111110101011111110111011ddd11d111111101010111110101111111111111
333333333333333111101010111011111111211111101011111010111110101011011111111010110111111dddddddd011011111111010111110101011101110
333333333333333010110101101111121212121010110100101101001011010101111010101101011101101dddddddd101111010101101001011010110111111
333333333333333111111111111110111121111111111111111111111111111111011111111111111111111dddddddd111011111111111111111111111111011
333333333333333bbbbbbbb11111011112112110110101101101011010111000110101101101011cccccccc55155515cccccccc0110101101101011011010110
3333333333333333333333301101110211211111111011011110110111111111111011011110110dddddddd55155515dddddddd1111011011110110111101101
3333333333333333333333311111111111121221101111111011111101011011101111111011111ddd1dddd11111111ddd1dddd1101111111011111110111111
3335333533353335333533311111011121111111111101111111011111101111111101111111011dd1d1dd151551551dd1d1dd11111101111111011111110111
555355535553555355535551110111021121111101011111010111111111110101011111010111111ddd11d5155155111ddd11d1010111110101111101011111
3333333333333333333333310111111111112111111010111110101011011111111010111110101dddddddd11111111dddddddd1111010111110101111101011
3333333333333333333333311101101212121210101101001011010101111010101101001011010dddddddd15555155dddddddd0101101001011010010110100
3333333333333333333333311111111111211111111111111111111111011111111111111111111dddddddd15555155dddddddd1111111111111111111111111
88828882888288828882888010111001121121101101011010111000101110001011100011010115515551500009000551555150110101101101011011010110
88888822222222228888882111111112112111111110110111111111111111111111111111101105515551501001001551555151111011011110110111101101
80000888828882888000088101011011111212211011111101011011010110110101101110111111111111100099901111111111101111111011111110111111
80000822222222228000082111101111211111111111011111101111111011111110111111110115155155100919990515515511111101111111011111110111
80000882888288828000088111111102112111110101111111111101111111011111110101011115155155110991990515515511010111110101111101011110
80000822222222228000082011011111111121111110101011011110110111101101111111101011111111109199919111111111111010111110101111101014
88888888828882888888888101111012121212101011010101111011011110110111101010110101555515500000010155551550101101001011010010110101
22222222222222222222222111011111112111111111111111011111110111111101111111111111555515511001010155551551111111111111111111111111
8882888111111112888288801101011112112110110101101011100010111000111110101101011551555155515551555155515cccccccccccccccccccccccc0
2222222144444412222222211110110211211111111011011111111111111111111111111110110551555155515551555155515dddddddddddddddddddddddd1
8288828144444418828882811011111111121221101111110101101101011011101011111011111111111111111111111111111ddd1ddddddd1ddddddd1dddd1
2222222144444412222222211111011121111111111101111110111111101111111111111111011515515515155155151551551dd1d1dd1dd1d1dd1dd1d1dd11
888288814444141288828881010111121121111101011111111111011111116611110111010111151551551515515515155155111ddd11d11ddd11d11ddd11d1
2222222144444412222222211110101111112111111010101101111011011666610111011110101111111111111111111111111dddddddddddddddddddddddd1
8288828144444418828882801011010212121210101101010111101101116565661111101011010155551551555515515555155dddddddddddddddddddddddd0
2222222144444412222222211111111111211111111111111101111111016565661101111111111155551551555515515555155dddddddddddddddddddddddd1
10111001121121101011100011010111121121101101011011010110111166666611100011010115515551555155515551555155515551555155515551555150
11111112112111111111111111101102112111111110110111101101111166666611111111101105515551555155515551555155515551555155515551555151
01011011111212210101101110111111111212211011111110111111101016660601101110111111111111111111111111111111111111111111111111111111
11101111211111111110111111110111211111111111011111110111111111611110111111110115155155151551551515515515155155151551551515515511
11111102112111111111110101011112112111110101111101011111111101111111110101011115155155151551551515515515155155151551551515515511
11011111111121101101111111101011111121111110101111101011010111001101111111101011111111111111111111111111111111111111111111111111
01111012121212110111101010110102121212101011010010110101111111110111101010110101555515515555155155551551555515515555155155551550
11011111112111111101111111111111112111111111111111111111111101111101111111111111555515515555155155551551555515515555155155551551
10111001121121111211211112112111121121111211211011010110111110101011100011010115515551500000000551555155515551555155515551555150
11111112112111121121111211211112112111121121111111101101111111111111111111101105515551500000000551555155515551555155515551555151
01011011111212211112122111121221111212211112122110111111101011110101101110111111111111100000000111111111111111111111111111111111
11101111211111112111111121111111211111112111111111110111111111111110111111110115155155100000000515515515155155151551551515515511
11111102112111121121111211211112112111121121111101011111111101111111110101011115155155110101010515515515155155151551551515515510
11011111111121111111211111112111111121111111211111101011010111001101111111101011111111100000000111111111111111111111111111111114
01111012121212121212121212121212121212121212121010110101111111110111101010110101555515501010101155551551555515515555155155551551
11011111112111111121111111211111112111111121111111111111111101111101111111111111555515510101010155551551555515515555155155551551
10111000110101101101011011010110110101111211211112112110111110101011100011010110110101111211211011010110110101101101011011010110
11111111111011011110110111101101111011021121111211211111111111111111111111101101111011021121111111101101111011011110110111101101
01011011101111111011111110111111101111111112122111121221101011110101101110111111101111111112122110111111101111111011111110111111
11101111111101111111011111110111111101112111111121111111111111111110111111110111111101112111111111110111111101111111011111110111
11111101010111110101111101011111010111121121111211211111111101111111110101011111010111121121111101011111010111110101111101011111
11011111111010111110101111101011111010111111211111112111010111001101111111101011111010111111211111101011111010111110101111101011
01111010101101001011010010110100101101021212121212121211111111110111101010110100101101021212121010110100101101001011010010110100
11011111111111111111111111111111111111111121111111211111111101111101111111111111111111111121111111111111111111111111111111111111
aaaaaaaaaaaaaaaaaaaaaaa111110110110101101101011112112111121121101101011011010110110101111211211011010110110101101101011111110111
99999999999999999999999011011101111011011110110211211112112111111110110111101101111011021121111111101101111011011110110011011100
99999999999999999999999111111111101111111011111111121221111212211011111110111111101111111112122110111111101111111011111111111111
99949994999499949994999111110111111101111111011121111111211111111111011111110111111101112111111111110111111101111111011111110111
44494449444944494449444111011101010111110101111211211112112111110101111101011111010111121121111101011111010111110101111111011101
99999999999999999999999101111111111010111110101111112111111121111110101111101011111010111111211111101011111010111110101101111111
99999999999999999999999111011010101101001011010212121212121212101011010010110100101101021212121010110100101101001011010111011011
99999999999999999999999111111111111111111111111111211111112111111111111111111111111111111121111111111111111111111111111111111111
99999999999999999999999aaaaaaaa0110101101101011112112111121121111211211112112111121121111211211011010110110101111111011111110111
99999999999999999999999999999991111011011110110211211112112111121121111211211112112111121121111111101101111011001101110011011100
99999999999999999999999999999991101111111011111111121221111212211112122111121221111212211112122110111111101111111111111111111111
99949994999499949994999499949991111101111111011121111111211111112111111121111111211111112111111111110111111101111111011111110111
44494449444944494449444944494441010111110101111211211112112111121121111211211112112111121121111101011111010111111101110111011101
99999999999999999999999999999991111010111110101111112111111121111111211111112111111121111111211111101011111010110111111101111111
99999999999999999999999999999990101101001011010212121212121212121212121212121212121212121212121010110100101101011101101111011011
99999999999999999999999999999991111111111111111111211111112111111121111111211111112111111121111111111111111111111111111111111111
44414444111411114441444411141110110101101101011011010111121121101101011011010110110101101101011011010110110101101111101011111010
11111114111111411111111411111141111011011110110111101102112111111110110111101101111011011110110111101101111011011111111111111111
41444141100001144144414110000111101111111011111110111111111212211011111110111111101111111011111110111111101111111010111110101111
11111114100001411111111410000141111101111111011111110111211111111111011111110111111101111111011111110111111101111111111111111111
44414444100001114441444410000111010111110101111101011112112111110101111101011111010111110101111101011111010111111111011111110111
11111114100001411111111410000141111010111110101111101011111121111110101111101011111010111110101111101011111010110101110101011101
41444141111111144144414111111110101101001011010010110102121212101011010010110100101101001011010010110100101101011111111111111110
11111114444444411111111444444441111111111111111111111111112111111111111111111111111111111111111111111111111111111111011111110111
44414441444144411111111144414440101110001101011011010111121121101101011011111010101110001101011011111010111110101011100010111000
11111111111111114444441111111111111111111110110111101102112111111110110111111111111111111110110111111111111111111111111111111111
41444144414441414444441441444141010110111011111110111111111212211011111110101111010110111011111110101111101011110101101101011011
11111111111111114444441111111111111011111111011111110111211111111111011111111111111011111111011111111111111111111110111111101111
44414441444144414444141144414441111111010101111101011112112111110101111111110111111111010101111111110111111101111111110111111101
11111111111111114444441111111110110111111110101111101011111121111110101101011100110111111110101101011101010111001101111011011111
41444144414441414444441441444141011110101011010010110102121212101011010111111111011110101011010111111111111111110111101101111011
11111111111111114444441111111111110111111111111111111111112111111111111111110111110111111111111111110111111101111101111111011111
10110111101101111211211010111000166610001011100112112111121121101011100010111000111110101011100010111000101110001011100011111010
11111111111111121121111111111111fcfff1111111111211211112112111111111111111111111111111111111111111111111111111111111111111111111
110111111101111111121221010110110ffff0110101101111121221111212210101101101011011101011110101101101011011010110110101101110101111
01111011011110112111111111101111177711111110111121111111211111111110111111101111111111111110111111101111111011111110111111111111
1111111111111112112111111111110f111111f11111110211211112112111111111110111111101111101111111110111111101111111011111110111110111
11101110111011111111211011011110111111101101111111112111111121101101111011011111010111001101111011011110110111101101111101011100
10111111101111121212121101111011011110110111101212121212121212110111101101111011111111110111101101111011011110110111101111111111
11111011111110111121111111011111110111111101111111211111112111111101111111011111111101111101111111011111110111111101111111110111
11010110110101111211211112112111121121111211211112112110101110001011100111110110110101101111101011111010111110101011100010111000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080013b46d3d09000000000000000000000000000000000000000000000000
__map__
1111111111111111111111110c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11740f0c0e0f110e0e0e0e0e0c0c750c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11110c1111111111111111110c0e0c0c0c0b0b111111110a0a0a111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110c0c0c1111060606061111110c0c110b1b1b0b0d0d0a1a1a1a0a0c11111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110c0c111106050505050611110e11112b3b2b3b0d0d2a3a2a3a2a1111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11110c1111040417040404110f0e11113b173b3b110d3a173a3a3a0c0c0c110f0f0f11111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110e0e1111111112111111110e11111111120c11110e0e120e0e0e0e0d0c0f0f0f0f0f111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110e111111111112121212121212121212121212121212120e0e0d0e0e0e0f0f0f110f111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110e110909110c121111110e110d060e11110c0c1111110e0e0d110e0e0c110e0f0f11111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110e091919090d1211110e1111060406111111111111111111111111110d0d0f0f110e111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111392939290e12110e0e0e110414041111117373737373731111110d110f0e0e0e0e111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111393917391112110e0e0f110404040606061170117111117211110d0d0f0d0e0e1111110e0e0e11111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11110e0e120e111211110f0e110404040404041174117511767211110d0f0f0d0e0e0e0f0f110e0e0e0e0e11111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111110e1212121212110f0e1104070404040473737373737372110d0f0f0f110e0f0f0f0f110e0e0e0e1111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11110e0e1111111112120f0e1111121111111111111111111111110d0f0f0e0e0f0f0f0f11110f0e0e111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111110808080d11111212111111121111110d0d1111111111110d0d0f0f110e0f0e0f0f0f0f110e11111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11110818181808111112121212121211110d0d0d0d0d0d0d0d0d0d0d0d110d110f0e11110f11111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110c2838283828111111121111111111110f0f11110f0f0f0f110d110d0d11111111110c1111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110c38383817380e111112110f0e110f0f0e0e0f0f0f0f0f0f0d0d0d0d0d111111110c111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110c0c0c0c120e0e0e12120e0e0f0e0e0e0e0f0e0f0f0f0f0d0f0f0f0d111111110c0c0c0c0c111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
111111111112121212120e0e0d110f0f0f0e0e0f0f0f0f0f0f0f0f1111111111110c11110c0c0c1111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111110c11110e0e0e0c0c0d0d0d0f0f0f0e11110f0f0d0f0f0f1111111111110c0c0c0c0c0c111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110c0c0c110c0c0c0c0d0d110d0e0e0d75110d110f0c111111751111111111110c0c0c0e0c0c110e11111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110c0c0c0c0c110d0d0d0d0c0e0e0e110c0c0c740c0c111111110d0d0d1111110c0c0e0c0c11110e11111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
110c11110d0d0d0d0d0d0c0d0e0e0e0c0c0c0c0c0c0c111111110d1111111111110c0e0e0e110e0e11111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
111111110d0d0d741111110d110d0d0c0c0c0c0c0c0c111111110d0d1111111111110e0e0e0e0e1111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111110d111111110c0c0d0c110c0d0d0d0d0d11111111110d0d1111111111110c0e0e0e111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111110c1111110c0c0c0c0d0d110c0c0d0d0d0d11111111110d0d740d0d111111110c0e1111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111110c11110c0c0d0d0d0d0d1111111111111111741111110d0d1111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111110c110d0d0d0d0d0c0d0c11111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11110c0c0d0c0c0c0d0d0d0c1111111111111111111111111111111111117411111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111110d110c1111110d0c111111111111111111111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011b02210c7531c7033c6173c6060c6350c6020c6010c6000c7530c6053c6161c5001d5001c5003c617184000c7531c4003c6161a3000c635182001a2001c2000c7531c1003c6171a0000c6031a0003c61618000
011b00210c155184402605000000150501c0001505001000150500000015050000000000000000000000000000000000000c155184402605000000150501c0001505001000180500000015050000000000000000
011b00000000018050000000000013000000001e0000000007000000000d00028040290400000003000140500100014050010001405005000010002e030300400b0000d000100000000000000000000000000000
000200000600001000040000500006000052000330003300040200303002040010400104001040010400104001040010400104002040030300302004023050100601006010010000200001000010000000000000
0010000000000250501c050000001f0502205026050000000000016050180501b050000001e0502005024050270500d0502b0500d0502f05034050000003a050000003f05000000160500f050070500000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 00404244
00 00014344
00 00024344
02 00434344
02 00444344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

