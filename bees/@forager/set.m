function c=set(c,prop_name,val)


switch prop_name
case 'speed'
    c.speed=val; 

case 'pos'
   c.pos=val; 
   
case 'radius'
    c.radius=val; 

case 'memorySource'
   c.memorySource=val;
   
case 'memoryContent'
    c.memoryContent=val; 

case 'travelDistance'
   c.travelDistance=val;
otherwise 
   error('invalid field name')
end

