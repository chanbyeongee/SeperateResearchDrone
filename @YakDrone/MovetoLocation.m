function is_Complete = MovetoLocation(obj,x,y)

%x 값 이 - 이면 moveleft 함수 이용 
%x 값이  + 이면 moveright 이용
    
    if( x < 0)
        moveleft(obj.mDrone,0.5);
    else
        moveright(obj.mDrone,0.5);
    end
    
    if(y>0)
        moveup(obj.mDrone, 0.5);
    else
        movedown(obj.mDrone, 0.5);
    end
    is_Complete = true;
    
end

