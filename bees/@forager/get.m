function val=get(c,prop_name)

switch prop_name
   
case 'speed'
   val=c.speed;
case 'pos'
    val=c.pos;
case 'radius'
     val=c.radius;
case 'memorySource'
     val=c.memorySource;  
case 'memoryContent'
     val = c.memoryContent;
case 'travelDistance'
     val = c.travelDistance;     
otherwise 
   error('invalid field name')
end

