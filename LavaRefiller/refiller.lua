dofile "walker.lua"
P=D
function refill()
for u=1,15 do
move(W)
while(turtle.placeDown()) do
turtle.refuel()
move(W)
end
move(W)
move(P)
move(P)
invert()
end

end
function invert()
if(P==D) then
 P=A
else
P=D
end
end