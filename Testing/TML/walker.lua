W="forward"
S="back"
D="right"
A="left"
E="up"
Q="down"
FIRST=1
dofile "mapper"

function turnAround() 
    turtle.turnRight()
    turtle.turnRight()
end

function isPassed(direction)
   if direction==W then
   return turtle.forward()
   end
   if direction==S then
    turnAround()
    return turtle.forward()
   end
   if direction==D  then
    turtle.turnRight()
    return turtle.forward()
   end
   if direction==A then
    turtle.turnLeft()
    return turtle.forward()
   end
   if direction==E then
    return turtle.up()
   end
   if direction==Q then
    return turtle.down()
   end

end


function check(direction)
   if direction==W or direction==D or direction==A or direction==S then
      turtle.dig()
      turtle.attack()
   end
   if direction==E then
      turtle.digUp()
      turtle.attackUp()
   end
   if direction==Q then
      turtle.digDown()
      turtle.attackDown()
   end
end

function move(direction)
   local passed=isPassed(direction)
   local limitofchecks=0
        while not (passed) and limitofchecks<20 do
            check(direction)
            limitofchecks=limitofchecks+1
            sleep(1)
           if direction==W or direction==D or direction==A or direction==S then
          	  passed=isPassed(W)
        		 else
        		    passed=isPassed(direction)
            end
        end
       if not (passed) then
            print("Error:Obstacle found on the way")
         -- goHome() TODO: implement this concept
         -- maybe move(direction) can return a boolean to get success/error of the movement

        else
       -- need to think about this case
       end
end                     
           
                   

