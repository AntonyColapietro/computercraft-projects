badnames={"Cobblestone", "Dirt", "Gravel","Flint"} --filter list for undesired ores
names={}
slots={}
first=1
second=2  -- slot 1 is for the chest (chests) used for sorting...
last=16 -- last slot of the turtle variable
numberOfItems=0

function sortAllItems()
chest=peripheral.wrap("front")
chest.condenseItems()
slots=chest.getAllStacks()
getNames(slots)
numberOfItems=#names
cleanscrap()
if(numberOfItems<12) then

for index=first,numberOfItems do
turtle.suck()
end
turtle.dig()
end
end 
 

  function getNames(invslots) 
  i=first 
   for k,v in pairs(invslots) do    
        names[i]=v.name
        i=i+1
   end
    
    end

 

function cleanscrap() --remove elements with name in the bad name list
  
    for o=1,#names do
    for b=1,#badnames do
         if(badnames[b]==names[o]) then
          chest.destroyStack(o)
           numberOfItems=numberOfItems-1
          end
     end  
     end

end


function chestSorting()

turtle.select(first)
turtle.turnLeft()
turtle.turnLeft()
turtle.place()
dropAll()
sortAllItems()
turtle.turnLeft()
turtle.turnLeft()
end

--drop all items in inventory in the chest in front of the turtle
function dropAll()
  for i=second,last do
    turtle.select(i)
    turtle.drop()
  end
turtle.select(first)
end