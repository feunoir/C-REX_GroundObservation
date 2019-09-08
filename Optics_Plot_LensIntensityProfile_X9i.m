function Optics_Plot_LensIntensityProfile(filename)

[LensProfile, MaskTrueNum] = Image_ConcentricMean(filename);

CenterIntMean = mean(LensProfile(1:45));
Rng99pctInt = CenterIntMean*0.99;
createfigure(LensProfile, [0 length(LensProfile)],[CenterIntMean CenterIntMean],[Rng99pctInt Rng99pctInt],MaskTrueNum);

end

function createfigure(Y1, XData1, YData1, YData2, Y2)
%CREATEFIGURE(Y1, XData1, YData1, YData2, Y2)
%  Y1:  y データのベクトル
%  XDATA1:  line xdata
%  YDATA1:  line ydata
%  YDATA2:  line ydata
%  Y2:  y データのベクトル

%  MATLAB からの自動生成日: 01-Sep-2019 23:23:44

% figure を作成
figure('Color',[1 1 1],'OuterPosition',[557 243 935 678]);

% axes を作成
axes1 = axes('YTick',[0 1000 2000 3000 4000 5000 6000 7000]);
hold(axes1,'on');

% 座標軸の left 側をアクティブにする
yyaxis(axes1,'left');
% plot を作成
plot(Y1,'DisplayName','Intensity Profile',...
    'Color',[0 0.450980392156863 0.741176470588235]);

% line を作成
line(XData1,YData1,'DisplayName','Mean of Intensity(1-45 px)',...
    'LineStyle','--',...
    'Color',[0.149019607843137 0.149019607843137 0.149019607843137]);

% line を作成
line(XData1,YData2,'DisplayName','99 % of Mean(1-45 px)',...
    'Color',[0.149019607843137 0.149019607843137 0.149019607843137]);

% ylabel を作成
ylabel({'Intensity'});

% 残りの座標軸プロパティの設定
set(axes1,'YColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'YTick',[0 5000 10000 15000 20000 25000 30000 35000 40000 45000 50000 55000 60000 65000]);
% 座標軸の right 側をアクティブにする
yyaxis(axes1,'right');
% plot を作成
plot(Y2,'DisplayName','Pixel Number of Mask',...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863]);

% ylabel を作成
ylabel({'Pixel Number [px]'});
% Axes の Y 軸の範囲を保持するために以下のラインのコメントを解除
% ylim(axes1,[0 9000]);

% 残りの座標軸プロパティの設定
set(axes1,'YColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'YTick',[0 1000 2000 3000 4000 5000 6000 7000]);
% xlabel を作成
xlabel('Radius [px]');

% title を作成
title({'Lens Intensity Profile (Circular Mean)','Ba^+(455 [nm]) Luminousity: 1.00[μW/Sr/m^2/nm] SS: 30 [s] ISO: 6400 Blue-Ch'});

% Axes の X 軸の範囲を保持するために以下のラインのコメントを解除
% xlim(axes1,[0 1296]);
box(axes1,'on');
% 残りの座標軸プロパティの設定
set(axes1,'FontName','Arial','FontSize',12,'LineStyleOrderIndex',2,'XGrid',...
    'on','XMinorGrid','on','XTick',...
    [0 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500],'XTickLabel',...
    {'0','100','200','300','400','500','600','700','800','900','1000','1100','1200','1300','1400','1500'},...
    'YGrid','on','YMinorGrid','on');
% legend を作成
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.627414597206878 0.150142453606651 0.237214358022864 0.125641022176824]);

end