function Optics_Plot_LensIntensityProfile(filename)

[LensProfile, MaskTrueNum] = Image_ConcentricMean(filename);

CenterIntMean = mean(LensProfile(1:45));
Rng99pctInt = CenterIntMean*0.99;
createfigure(LensProfile, [0 length(LensProfile)],[CenterIntMean CenterIntMean],[Rng99pctInt Rng99pctInt],MaskTrueNum);

end

function createfigure(Y1, XData1, YData1, YData2, Y2)
%CREATEFIGURE(Y1, XData1, YData1, YData2, Y2)
%  Y1:  y �f�[�^�̃x�N�g��
%  XDATA1:  line xdata
%  YDATA1:  line ydata
%  YDATA2:  line ydata
%  Y2:  y �f�[�^�̃x�N�g��

%  MATLAB ����̎���������: 01-Sep-2019 23:23:44

% figure ���쐬
figure('Color',[1 1 1],'OuterPosition',[557 243 935 678]);

% axes ���쐬
axes1 = axes('YTick',[0 1000 2000 3000 4000 5000 6000 7000]);
hold(axes1,'on');

% ���W���� left �����A�N�e�B�u�ɂ���
yyaxis(axes1,'left');
% plot ���쐬
plot(Y1,'DisplayName','Intensity Profile',...
    'Color',[0 0.450980392156863 0.741176470588235]);

% line ���쐬
line(XData1,YData1,'DisplayName','Mean of Intensity(1-45 px)',...
    'LineStyle','--',...
    'Color',[0.149019607843137 0.149019607843137 0.149019607843137]);

% line ���쐬
line(XData1,YData2,'DisplayName','99 % of Mean(1-45 px)',...
    'Color',[0.149019607843137 0.149019607843137 0.149019607843137]);

% ylabel ���쐬
ylabel({'Intensity'});

% �c��̍��W���v���p�e�B�̐ݒ�
set(axes1,'YColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'YTick',[0 5000 10000 15000 20000 25000 30000 35000 40000 45000 50000 55000 60000 65000]);
% ���W���� right �����A�N�e�B�u�ɂ���
yyaxis(axes1,'right');
% plot ���쐬
plot(Y2,'DisplayName','Pixel Number of Mask',...
    'Color',[0.650980392156863 0.650980392156863 0.650980392156863]);

% ylabel ���쐬
ylabel({'Pixel Number [px]'});
% Axes �� Y ���͈̔͂�ێ����邽�߂Ɉȉ��̃��C���̃R�����g������
% ylim(axes1,[0 9000]);

% �c��̍��W���v���p�e�B�̐ݒ�
set(axes1,'YColor',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'YTick',[0 1000 2000 3000 4000 5000 6000 7000]);
% xlabel ���쐬
xlabel('Radius [px]');

% title ���쐬
title({'Lens Intensity Profile (Circular Mean)','Ba^+(455 [nm]) Luminousity: 1.00[��W/Sr/m^2/nm] SS: 30 [s] ISO: 6400 Blue-Ch'});

% Axes �� X ���͈̔͂�ێ����邽�߂Ɉȉ��̃��C���̃R�����g������
% xlim(axes1,[0 1296]);
box(axes1,'on');
% �c��̍��W���v���p�e�B�̐ݒ�
set(axes1,'FontName','Arial','FontSize',12,'LineStyleOrderIndex',2,'XGrid',...
    'on','XMinorGrid','on','XTick',...
    [0 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500],'XTickLabel',...
    {'0','100','200','300','400','500','600','700','800','900','1000','1100','1200','1300','1400','1500'},...
    'YGrid','on','YMinorGrid','on');
% legend ���쐬
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.627414597206878 0.150142453606651 0.237214358022864 0.125641022176824]);

end