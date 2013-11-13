W="forward"
S="back"
D="right"
A="left"
E="up"
Q="down"
path={W}   --counting first step
ypath={}
xpathD={D,D}
xpathA={A,A}
zpathO={Q,Q,Q,S}  --path used for odd Z transitions or even Z transitions
zpathE={Q,Q,S}
zpathL={Q,S}  --corner case in odd Z transitions
FIRST=1


  function updatePath(list)
   for i=1,#list do
      writeStep(path,list[i],#path+1)
    end
  end


 function writePlan(x,y,index)
 if x%2==0 then             --if x is even, then all the plans have the same path
  for i=1,x do
    updatePath(ypath)     
    corner(i)
  end
else   
   if index%2==1  then
     for i=1,x do
       updatePath(ypath)
       corner(i)
     end
   else
      for i=1,x do
        updatePath(ypath)
        corner(i+1)
      end
   end
end
  updatePath(ypath)
end


 function corner(index)
    if index%2==1 then
        updatePath(xpathD)
    else
        updatePath(xpathA)
   end
end

  function writePath(x,y,z)
   --initiliaze parts of the path
   local x1=x-1        --local variables for transitions (transitions between blocks, for x and y their number is equal to number of blocks -1)
   local y1=y-1
   local z1=z+2     --count level over the turtle at home position (if turtle start at height N, then it will stop at height N-z1, digging  N+1 levels of blocks) 
   for j=2,y1 do     --ypath (excluded first step, change of column right/left (x) and change of level (S key count as a W fo walker.lua) (z))
    writeStep(ypath,W,FIRST)
   end
   writeCube(x1,y1,z1)
  end

  function writeCube(x,y,z)
   if z<3 then   --handle cases where it could be dig just 1 level or Z<0
    writePlan(x,y,FIRST)
    return
  end
   local rest=z%3
   local div=math.floor(z/3)
   
   if rest==0 then
     for i=1,div do
       writePlan(x,y,i)
       if(i<div) then
       updatePath(zpathO)
       end
     end
   end
   if rest==1 then
    for i=1,div do
      writePlan(x,y,i)
      if(i<div) then
       updatePath(zpathO)
      else
       updatePath(zpathL)
       writePlan(x,y,i+1)
      end
    end
  end
    if rest==2 then
      for i=1,div do
       writePlan(x,y,i)
        if(i<div) then
         updatePath(zpathO)
        else
         updatePath(zpathE)
         writePlan(x,y,i+1)
        end
      end
    end

end



  function writeStep(whichpath,direction,position)
             table.insert(whichpath,position,direction)
   end



  function getStep(step)
        return path[step]
  end



  function getPath()
        return path
   end
