%% Circle Generatiomn  Movie

imgDim = 400;   %image dimention
numFrm = 250;   %number of frame
%
cnt_mean1 = 150;   %central mean x
cnt_mean2 = 150;   %central mean y
cnt_var1 = 1;      %variance x
cnt_var2 = 1;      %variance y
rad = 50;         %radius
r_mean = 100;      %RGB properties
g_mean = 20;
b_mean = 15;
r_var = .01;
g_var = .01;
b_var = .01;
%
shft1 = 80;    %change in process
shft2 = 110;
radShft = .5;

Npix_resolution =[imgDim imgDim];
%% Estimator Parameters

F_update = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1];

Npop_particles = 4000;

Xstd_rgb = 50;
Xstd_pos = 25;
Xstd_vec = 5;

Xrgb_trgt = [255; 0; 0];

%% Controller Parameters
RefPnt = [cnt_mean1, cnt_mean2];
Kp = .3;
Ki = .8;
Kd = .1;

%% Object Tracking by Particle Filter

for k = 1: numFrm
    
    % Generating Image
    if k == 1
        Y_k = F_generateRGB_Cir(imgDim, rad, cnt_mean1, cnt_mean2, ...
            cnt_var1, cnt_var2, r_mean, g_mean, b_mean, r_var, g_var, b_var);
        imagesc(Y_k)
        hold on
        mov3(k) = getframe();
    elseif k < 50
        Y_k = F_generateRGB_Cir(imgDim, rad, cnt_mean1 , cnt_mean2 - 1.3, ...
            cnt_var1, cnt_var2, r_mean, g_mean, b_mean, r_var, g_var, b_var);
        imagesc(Y_k)
        hold on
        mov3(k) = getframe();
    elseif k <= 100  %shift from incontrol to out of control
        cnt_meanOC1 = cnt_mean1 + shft1;
        cnt_meanOC2 = cnt_mean2 + shft2;
        Y_k = F_generateRGB_Cir(imgDim, rad, cnt_meanOC1, cnt_meanOC2- 1.3, ...
            cnt_var1, cnt_var2, r_mean, g_mean, b_mean, r_var, g_var, b_var);
        imagesc(Y_k)
        hold on
        mov3(k) = getframe();
    elseif k <= numFrm  %change size of the radius
        cnt_meanOC1 = cnt_mean1;
        cnt_meanOC2 = cnt_mean2;
        rad_OC = (1.7 + radShft)*rad; %rad; %(1 + radShft)*rad;
        Y_k = F_generateRGB_Cir(imgDim, rad_OC, cnt_meanOC1, cnt_meanOC2, ...
            cnt_var1, cnt_var2, r_mean, g_mean, b_mean, r_var, g_var, b_var);
         imagesc(Y_k)
        hold on
        mov3(k) = getframe();
    end
    
end
% figure;
% plot(Xm(1,:), Xm(2,:));  %mean of x , y
% plot(dis);
% plot(Xm(1,:), 'r--')  %mean of x, y in time
% hold on
% plot(Xm(2,:), 'b-')
% legend('Changes in X1', 'Changes in X2')


v = VideoWriter('F_Test_Movie11.avi');
open(v)
writeVideo(v,mov3)
close(v)