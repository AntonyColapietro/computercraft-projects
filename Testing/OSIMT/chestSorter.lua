badnames={"Cobblestone", "Dirt", "Gravel","Flint"}
names={}
slots={}
occ={}
empty={}
dup={}
unames={}
unamespos={}
first=1
second=2  -- slot 1 is for the power source
last=15   --slot 16 is for the sensor

chest=peripheral.wrap("front")
slots=chest.getAllStacks()
getNames(slots)
cleanscrap()
  
 

  function getNames(invslots)  
   for k,v in pairs(invslots) do    
        table.insert(names,b.name)
   end
    
    end

 

function cleanscrap() --remove elements with name in the bad name list
   local k
    for b=1,#badnames do
          k=foInNames(badnames[b])
                      while(k>0) do
                          chest.destroyStack(k)
                        
                       end
     end                 
end

function foInNames(string) --give the first occurrence of an element given its name

     for i=1,#names do
           if(string==names[i]) then
                return i
           end
      end
 
return 0

end

 



                         
function cleanInv()
 cleanscrap()
 updateOcEmpty()
 smartMerge()
 updateOcEmpty()
 if(#empty>0) then
 smartOrder()
 end
 turtle.select(1)
end

function cleanVar()
names={}
empty={}
dup={}
occ={}
slots={}
unames={}
details={}
invent={}
end




--select the first occurrence of an item in the inventory
function select(itemName)
  initialize()
  turtle.select(foInNames(itemName))
  cleanVar()
end

--drop all items in inventory in the chest in front of the turtle
function dropAll()
  for i=second,last do
    turtle.select(i)
    turtle.drop()
  end
turtle.select(first)
end
