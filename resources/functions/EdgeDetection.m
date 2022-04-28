function new_image = EdgeDetection(Image)
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치

raw_frame = rgb2hsv(Image);
frame = rgb2gray(Image);

filter = uint8((raw_frame(:,:,1) > 0.5) & (raw_frame(:,:,1) < 0.8));

filtered = frame .* filter ;
filtered = filtered + ((1-filtered) .* 255);

mask = ones(3,3)/9;

filtered = imfilter(filtered,mask);


my_edge = edge(filtered,"canny");

params.minMajorAxis = 100;
params.maxMajorAxis = 800;

[center, rad, metric] = imfindcircles(Image,[20 1000]);

imshow(Image);

viscircles(center,rad);

end

