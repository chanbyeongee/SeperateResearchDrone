function nCenter_x,nCenter_y,is_forward = DetectCircle(obj)
%DETECTCIRCLE 이 함수의 요약 설명 위치
%   자세한 설명 위치

frame = obj.mCam.capture();

result = CannyEdegeDetect(image);

current_x, current_Y = find_center(result);


x= current_x;
y=current_y;
forward = 0;

화면중앙을 0,0 이라 생각하고

1인 곳들의 좌표를 다 더해서 평균 그 값(0,0)이 우리 가설정한 오차범위

그 오차를 찾음



end

