dofile "walker.lua"
P=D
maxLenght=7
maxRepetitions=8
maxGoDownNumber=1
function refill()
  for i=1,maxGoDownNumber do
  move(Q)
  end
  for mr=1,maxRepetitions do
    for ml=1,maxLenght do
        lookForLavaOrGoOn()
       end
        if(mr<maxRepetitions) then
         lookForLavaOrGoOn()
         move(P)
         lookForLavaOrGoOn()
         lookForLavaOrGoOn()
         move(P)
         invert() 
        end
   end
   for i=1,maxGoDownNumber do
     move(E)
   end
end



function invert()
  if(P==D) then
     P=A
   else
    P=D
   end
end


function lookForLavaOrGoOn()
    if(turtle.place()) then
            turtle.refuel()        --first refill from in front of the turtle

              move(W)

            if(turtle.placeUp()) then  --refill from the layer above
              turtle.refuel()
              end
            if(turtle.placeDown()) then  --refill from the bottom layer
            turtle.refuel()
              end

             turtle.turnRight()
            
            if(turtle.place()) then        --refill from the right side
            turtle.refuel()
              end

            turtle.turnLeft()
              turtle.turnLeft()

            if(turtle.place()) then          --refill from the left side
            turtle.refuel()
              end

              turtle.turnRight()      --turn in the original orientation
          
             else
              move(W)

           end



 end