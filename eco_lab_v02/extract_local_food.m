function [loc_food,xmin,ymin]=extract_local_food(cpos,spd)

%Extracts array representing distribution of food available in the local
%area of an agent at position cpos [x,y] and with search radius =spd.
%This function also makes corrections in the case that the agent is close
%to the model edge

global ENV_DATA

%ENV_DATA is a data structure containing information about the model
   %environment
   %    ENV_DATA.shape - shape of environment - FIXED AS SQUARE
   %    ENV_DATA.units - FIXED AS KM
   %    ENV_DATA.bm_size - length of environment edge in km
   %    ENV_DATA.food is  a bm_size x bm_size array containing distribution
   %    of food

if cpos(1)>ENV_DATA.bm_size-spd %位置贴近边缘的兔子，觅食横坐标最大值是bm.size
    xmax=ENV_DATA.bm_size;
else
    xmax=cpos(1)+spd; %位置不在边缘的兔子，觅食横坐标最大值是当前位置x坐标+speed
end
if cpos(1)<spd+1 %和x=1的距离小于speed，觅食横坐标最小值是0。（注意是一个数字，横坐标最小是1）
    xmin=1;
else
    xmin=cpos(1)-spd; %相反，觅食横坐标最小值是当前位置x坐标-speed
end
if cpos(2)>ENV_DATA.bm_size-spd
    ymax=ENV_DATA.bm_size;
else
    ymax=cpos(2)+spd;
end
if cpos(2)<spd+1
    ymin=1;
else
    ymin=cpos(2)-spd;
end

%取出行为xmin到xmax，列为ymin到ymax的元素
loc_food=ENV_DATA.food(xmin:xmax,ymin:ymax);    %extract distribution of food within the local search radius

