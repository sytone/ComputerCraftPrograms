-- Copyright DiabolusNeil 2013
-- GitHub 1.0 | Last Updated Nov 15, 2013
-- Protected by GNU LGPL: http://bit.ly/17YzEWB

local tArgs = {...}
if #tArgs < 4 or #tArgs > 4 then
  print("Usage: github <author> <repo> <path> <program>")
  return
end

local author = tArgs[1]
local repo = tArgs[2]
local path = tArgs[3]
local prog = tArgs[4]

local getUrl = http.get(
"https://raw.github.com/"..author.."/"..repo.."/"..path
)

local errors = {}

if not http then
  table.insert(errors,"Requires HTTP API")
end
if not getUrl then
  table.insert(errors,"Connection trouble")
end
if fs.exists(prog) then
  table.insert(errors,"Program already exists")
end
if #errors > 0 then
  print("Failed! Errors detected:")
  for i = 1, #errors do
    print(errors[i])
  end
else
  local file = fs.open(prog,"w")
  file.write(getUrl.readAll())
  file.close()
  print("Success! Downloaded '"..prog..".")
end
