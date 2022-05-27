function is_Complete = MovetoLocation(obj,x,y)
%MOVETOLOCATION 이 함수의 요약 설명 위치
%   자세한 설명 위치

%x 값 이 - 이면 moveleft 함수 이용 
%x 값이  + 이면 moveright 이용
if( x < 0)
    moveleft(obj.mDrone, 'Distance',-x);
else
    moveright(obj.mDrone,'Distance',x);
end

%y 값이 - 이면 moveup 함수 이용
%y 값이 + 이면 movedown 함수 이용.
if(y <0)
    moveup(obj.mDrone, 'Distacne' , -y);
else
    movedown(obj.mDrone, 'Distacne' , y);
end

%? ?  출력은 뭐로함 ?

is_Complete = 1; %다 움직였으면 (사실 무조건 1일듯)
is_Complete = 0; %다 안 움직였으면(움직이고 있는중 이면, 움직일 수 없으면, 장애물 감지로 멈추면)

end

