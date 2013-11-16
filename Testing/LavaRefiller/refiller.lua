dofile "walker.lua"
P=D
maxLenght=16
maxRepetitions=2

function refill()
  move(Q)
  move(Q)
	for mr=1,maxRepetitions do
		for ml=1,maxLenght do
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
        if(mr<2) then
         move(W)
         move(P)
         move(W)
         move(W)
         move(P)
         invert() 
        end
   end
  move(E)
  move(E)
end

function invert()
  if(P==D) then
     P=A
   else
    P=D
   end
end