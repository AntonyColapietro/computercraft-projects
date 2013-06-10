os.loadAPI("ocs/apis/sensor")

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
target="0,0,0"
invent=sensor.wrap("right")
details=invent.getTargetDetails(target)

  function initialize()
  invent=sensor.wrap("right")
  details=invent.getTargetDetails(target)
  slots=getSlots(details)
  getNames(slots)
  getOcc(slots)
  findEmpty(names)
  findDup(names)
 end
  
 function getSlots(tar)
  return tar.Slots  
 end

  function getNames(invslots)  
   for k,v in pairs(invslots) do
    names[k]=v.Name
   end
 end

 function getOcc(invslots)
 
  for k,v in pairs(invslots) do
   occ[k]=v.Size
  end
 
 end

 function findEmpty(names)
  ioe=1  --index of empty array
  
  for i=1,16 do
     if names[i]=="empty" then
     	empty[ioe]=i
     	ioe=ioe+1
     end
  end   
 return empty
 end

 function findDup(names)
  firstdup=false  
    for i=1,16 do
      for j=i+1,16 do
        if not(i==j) and (names[i]==names[j]) and not firstdup and not (names[j]=="empty") then
             dup[i]=j
             firstdup=true
         end
        if(j==#names) and not firstdup then
             dup[i]=0
         end
       end
      firstdup=false
     end    
   return dup
  end
  
 function turnOn()
  initialize()
  end
 
--accessory function, mainly used for debugging/analysis
-- function printlist(array)
--    for i=1,#array do
--    print(array[i])
--    end
-- end    
    

function orderInEmpty(index)
 for i=first,#empty-1 do
   if index>empty[i] and index<empty[i+1] then
      table.insert(empty,i+1,index)
    return
     end
   if index>empty[#empty] then
      table.insert(empty,#empty+1,index)
    return
    end
   if index<empty[first] then
      table.insert(empty,1,index)
   return
   end
 end
end

--simple function to identify unique names of items in the inventory
function unique(array)
 for i=second,last do
   if(occ[i]>0 and dup[i]==0) then
    table.insert(unames,names[i])
    table.insert(unamespos,i)    
   end
 end 
 
end          


function cleanscrap() --remove elements with name in the bad name list
   local k
    for b=1,#badnames do
          k=foInNames(badnames[b])
                      while(k>0) do
                          turtle.select(k)
                          turtle.drop()
                          k=dup[k]
                       end
     end                 
end

function foInNames(string) --give the first occurrence of an element given its name

     for i=2,#names do
           if(string==names[i]) then
                return i
           end
      end
 
return 0

end

 
function smartMerge()
  unique(names)
     local p  --will point to first slot of unique name [i] in the inventory
     local next  
         for i=1,#unames do
              p=foInNames(unames[i])
           if( p>0)
           then next=dup[p]
           else next=0
           end
               while(next>0) do         
                 turtle.select(next)
                 turtle.transferTo(p)
                 if occ[p] + occ[next]>64 then
                  p=next
                  end
                 next=dup[next]  --trick to find other duplicates
                 end        
         end
   end

function updateOcEmpty()
local newempty={} 
 for i=2,#names do
    occ[i]=turtle.getItemCount(i)
    if occ[i]==0 then
      table.insert(newempty,i)
     end     
  end
 empty=newempty 
end     

function smartOrder()
first=1
   for i=empty[first],#names-1 do
         if occ[i]>0 then         
          turtle.select(i)
          turtle.transferTo(empty[first])
          orderInEmpty(i)
          table.remove(empty,first)
          end
      end
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

end

function invSorter()
  initialize()
  cleanInv()
  cleanVar()  
  
end
