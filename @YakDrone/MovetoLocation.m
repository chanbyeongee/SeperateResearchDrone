function is_Complete = MovetoLocation(obj,x,y)

%x 값 이 - 이면 moveleft 함수 이용 
%x 값이  + 이면 moveright 이용
    try
        if( x < 0)
            moveleft(obj.mDrone,-x/100,'Speed',obj.cSpeed_set);
        else
            moveright(obj.mDrone,x/100,'Speed',obj.cSpeed_set);
        end
        
        if(y <0)
            moveup(obj.mDrone, -y/100,'Speed' , obj.cSpeed_set);
        else
            movedown(obj.mDrone, y/100,'Speed' , obj.cSpeed_set);
        end
        is_Complete = true;
    catch
        fprintf("에러발생!\n");
        is_Complete = false;
    end

end

