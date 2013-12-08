dofile "walker.lua"
dofile "chestSorter.lua"

XValue=32
YValue=32
MinimumNumberOfFreeSlots=3
numberOfLevels=24

writePath(XValue,YValue,numberOfLevels)
for i=1,#path do
if(emptySlots()<MinimumNumberOfFreeSlots) then
chestSorting()
end
if(turtle.detectUp() and not turtle.suckUp()) then
turtle.digUp()
end
turtle.digDown()
 
move(path[i])
end

if(emptySlots()>=2) then
turtle.digDown()
turtle.digUp()
chestSorting()


for i=1,numberOfLevels do 
move("up")

end
end