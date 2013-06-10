-- kateqwerty's turtle code. GPL'd
-- digger v0.14

dofile "diglibSorter"

xc=70 --x of square to dig
yc=70 --y of square to dig
zc=12 --how much to go deep
side=false --dig on the side
twolev=true --dig two levels at a time

if side==true then
   zc=zc-1
end
print("Initial fuel=",fuel())
if side then
	digFirstLevel(xc,yc)
end
if twolev then
	for i=1,zc/2 do
		digTwoLevels(xc,yc)
		print("Done level ",i*2)
	end
	if (zc % 2)==1 then
		digLevel(xc,yc)
	end
else
	for i=1,zc do
		digLevel(xc,yc)
		print("Done level ",i)
	end
end
home()
print("Success")

