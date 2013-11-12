badnames={"Cobblestone", "Dirt", "Gravel","Flint"}
names={}
slots={}
occ={}
empty={}
dup={}
unames={}
unamespos={}
first=1
second=2  -- slot 1 is for the chest (chests) used for sorting...
last=16 -- last slot of the turtle variable

function sortAllItems()
chest=peripheral.wrap("front")
chest.condenseItems()
slots=chest.getAllStacks()
getNames(slots)
cleanscrap()
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
         end
     end  
     end

end



--drop all items in inventory in the chest in front of the turtle
function dropAll()
  for i=second,last do
    turtle.select(i)
    turtle.drop()
  end
turtle.select(first)
end
