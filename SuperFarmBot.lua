term.clear()
print("Super Farm Bot v0.91")
print("made by Landstryder")

function fuelUp()
 print("checking fuel level and refueling")
 turtle.select(16)
 while turtle.getFuelLevel() < 1000 do
  if not turtle.refuel(1) then
  right() turtle.suck() left()
  end
  end
end

function sort()
turtle.select(1)
turtle.suckDown()
turtle.suckDown()
turtle.suckDown()
for it=1,3 do
for it=4,15 do turtle.suck() end
for it=4,15 do
turtle.select(it)
if turtle.compareTo(1) or turtle.compareTo(2) or turtle.compareTo(3) then 
left() turtle.drop() right()
end
end
end
for it=1,3 do
turtle.select(it)
turtle.dropDown()
end
end

function getStarted()
 print("starting cycle")
 fuelUp()
 up()
 flip()
 go(8)
 left()
 go(11)
end

function goHome()
 print("returning to Home station")
 go(19)
 left()
 go(13)
 down()
 dump()
 sort()
 dump()
end

--Basic Functions
function up(num)
  if num == nil then num = 1 end
  for it=1,num do
    while not turtle.up() do turtle.digUp() end
  end
end

function down(num)
  if num == nil then num = 1 end
  for it=1,num do
    while not turtle.down() do turtle.digDown() end
  end
end

function go(num)
  if num == nil then num = 1 end
  for it=1,num do
    while not turtle.forward() do turtle.dig() end
  end
end

function pick()
  turtle.digDown()
  turtle.suckDown()
end

function plant()
  turtle.select(1)
  turtle.placeDown()
end

function flip()
  turtle.turnLeft()
  turtle.turnLeft()
end

function left()
  turtle.turnLeft()
end

function right()
  turtle.turnRight()
end

function turnL()
  left()
  pick()
  plant()
  go()
  left()
end

function turnR()
  right()
  pick()
  plant()
  go()
  right()
end

function pickrow()
  for sub=1,5 do
    pick()
    plant()
    go()
  end
end

function picksector()
  pickrow()
  turnR()
  pickrow()
  turnL()
end

function pickcenter()
  for it=1,17 do
  pick()
  plant()
  go()
  end
end

function pickmelon()
  pick()
  go()
end

function melonrow()
  for it=1,17 do pickmelon() end
end

while true do --begin farm loop

getStarted()

--Pick first 5 patchs
for pikit=1,5 do
turtle.select(1) turtle.suckDown()
right()
go()
for it=1,2 do picksector() end
pickrow()
turnR()
pickrow()
pick()
plant()
go()
right()
go(5)
turtle.dropDown()
flip()
go(6)
flip()
end

--Melon patch
go()
turtle.suckDown()
right()
go(3)
right()
go()
pickcenter()
turnL()
pickcenter()
pick()
plant()
go()
left()
go(4)
turtle.dropDown()
flip()
go(2)
right()
go()
melonrow()
left()
pick()
go(3)
left()
melonrow()
pick()

function dump()
for it=1,15 do
  turtle.select(it)
  turtle.drop()
end
end

goHome()
print("taking a nap while the crops grow")
sleep(1800)
end
