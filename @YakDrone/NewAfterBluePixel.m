function nDistance = NewAfterBluePixel(obj)

% 원들을 검출 한 //obj.aBestCircle(완전 완벽한 원이라고 생각되는 원이 있는 배열임)
% 이거의 반지름을 계산한다음
% return값으로 몇m 이동해야 하는지 return해주세요!  

    nX_size, nY_size = size(obj.aBestCircle);



% 위에서부터 최초로 1이 나타나는 y값 찾고
% 찾으면 break 건후에
% 아래서부터 최초로 1이 나타나는 y값 찾고
% 서로뺌 => 지름 
    obj.nBestCenter_X;
    nMin_Y;
    nMax_Y;
    for  i =  0 : nY_size
        if(obj.aBestCircle(i,obj.nBestCenter_X))
            nMin_Y = i;
            break;
        end
    end
        
    for  i =  nY_size : 0
        if(obj.aBestCircle(i,obj.nBestCenter_X))
            nMax_Y = i;
            break;
        end
    end
    
    Circle_r = nMax_Y- nMin_Y;

    nDistance = round((Circle_r/20)*10,1) + 0.2; %대충 쓴거임.
    %  Circle_r 에 비례? 해서 nDistance 이동 
end
