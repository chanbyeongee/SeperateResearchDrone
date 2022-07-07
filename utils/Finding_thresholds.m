clear drone;
disp("Clear!");
%%

drone = ryze();
cam = camera(drone);

step = 0.005;

th_down = 0.800;
th_up = 0.900;

while 1
    frame = snapshot(cam);
    subplot(2,1,1),subimage(frame);
    pause(1);

    hsv = rgb2hsv(frame);

    h = hsv(:,:,1);
    s= hsv(:,:,2);
 
    filter = s > 0.4;

    if(th_up - th_down)<0
        binary_res = (th_down<h)+(h<th_up);
        binary_res = binary_res .* filter;
    else
        binary_res = (th_down<h)&(h<th_up);
        binary_res = binary_res .* filter;
    end
    subplot(2,1,2),subimage(binary_res);
    disp("th_down: "+th_down+" th_up:" +th_up);

    x=input("(quit: q, th_up-up: a, th_down-up: s, th_up-down: d, th_down-down: f) input: ",'s');
    disp(newline);
    
    if x=='q'
        disp("final th_up: "+th_up+" th_down: "+th_down);
        break;
    elseif x == 'a'
        th_up = th_up + step;
    elseif x == 's'
        th_down = th_down + step;
    elseif x == 'd'
        th_up = th_up - step;
    elseif x == 'f'
        th_down = th_down - step;
    end

    if th_down<0 
        disp("Cannot down th_down")
        th_down = 0;
    elseif th_down>0.999
        disp("Cannot up th_down")
        th_down = 0.999;
    elseif th_up<0
        disp("Cannot down th_up")
        th_up = 0;
    elseif th_up>0.999
        disp("Cannot up th_up")
        th_up = 0.999;
    end

end