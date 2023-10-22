function [fig] = plotmetrics(FigName,MovTime,EucError_1s,linIndex,AspectRatio,totjerk,dir_error,ext_error)
    % Plots
    fig = figure('NumberTitle','off','Name',FigName,'WindowState', 'maximized','Visible','off');
    
    subplot(2,4,[1 5]);
    groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
    colors = ["#0072BD","#9C9C9C"];
    colors = colors(findgroups(groupname));
    hold on
    for i=1:size(MovTime,2)
        boxchart(MovTime(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(MovTime,1),1),"MarkerStyle","o","MarkerColor",colors(i));
    end 
    tmp_mean = mean(MovTime,"omitmissing");
    plot(tmp_mean,"_","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    tmp_std = std(MovTime,"omitmissing");
    tmp_pos_var = tmp_mean + tmp_std;
    tmp_neg_var = tmp_mean - tmp_std;
    patch([1:length(tmp_mean) fliplr(1:length(tmp_mean))], [tmp_neg_var fliplr(tmp_pos_var)], 'g','FaceAlpha',.3)
    hold off
    ax = gca;
    ax.XAxis.Categories = categorical(1:size(MovTime,2));
    title('MovTime among Trials')
    ylabel('Time [s]')
    xlabel('Trials')
    set(gca, 'Position', [0.03, 0.07, 0.25, 0.75]);
    
    % Prima riga
    subplot(2,4,2);
    groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
    colors = ["#0072BD","#9C9C9C"];
    colors = colors(findgroups(groupname));
    hold on
    for i=1:size(EucError_1s,2)
        boxchart(EucError_1s(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(EucError_1s,1),1),"MarkerStyle","o","MarkerColor",colors(i));
    end
    plot(mean(EucError_1s,"omitmissing"),"_","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    plot(mean(EucError_1s,"omitmissing")+std(EucError_1s,"omitmissing"),"*","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    hold off
    ax = gca;
    ax.XAxis.Categories = categorical(1:size(EucError_1s,2));
    title('Euclidean Error among Trials')
    
    ylabel('\epsilon [pixels]')
    xlabel('Trials')
    set(gca, 'Position', [0.315, 0.56, 0.195, 0.4]);
    
    subplot(2,4,3);
    groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
    colors = ["#0072BD","#9C9C9C"];
    colors = colors(findgroups(groupname));
    hold on
    for i=1:size(linIndex,2)
        boxchart(linIndex(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(linIndex,1),1),"MarkerStyle","o","MarkerColor",colors(i));
    end
    plot(mean(linIndex,"omitmissing"),"_","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    plot(mean(linIndex,"omitmissing")+std(linIndex,"omitmissing"),"*","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    hold off
    ax = gca;
    ax.XAxis.Categories = categorical(1:size(linIndex,2));
    title('Linearity Index among Trials')
    
    ylabel('L_i')
    xlabel('Trials')
    set(gca, 'Position', [0.55, 0.56, 0.195, 0.4]);
    
    subplot(2,4,4);
    groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
    colors = ["#0072BD","#9C9C9C"];
    colors = colors(findgroups(groupname));
    hold on
    for i=1:size(AspectRatio,2)
        boxchart(AspectRatio(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(AspectRatio,1),1),"MarkerStyle","o","MarkerColor",colors(i));
    end
    plot(mean(AspectRatio,"omitmissing"),"_","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    plot(mean(AspectRatio,"omitmissing")+std(AspectRatio,"omitmissing"),"*","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    hold off
    ax = gca;
    ax.XAxis.Categories = categorical(1:size(AspectRatio,2));
    title('Aspect Ratio among Trials')
    
    xlabel('Trials')
    ylabel('AR')
    set(gca, 'Position', [0.79, 0.56, 0.195, 0.4]);
    
    % Seconda riga
    subplot(2,4,6);
    groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
    colors = ["#0072BD","#9C9C9C"];
    colors = colors(findgroups(groupname));
    hold on
    for i=1:size(totjerk,2)
        boxchart(totjerk(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(totjerk,1),1),"MarkerStyle","o","MarkerColor",colors(i));
    end
    plot(mean(totjerk,"omitmissing"),"_","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    plot(mean(totjerk,"omitmissing")+std(totjerk,"omitmissing"),"*","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    plot(mean(totjerk,"omitmissing")-std(totjerk,"omitmissing"),"*","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    hold off
    ax = gca;
    ax.XAxis.Categories = categorical(1:size(totjerk,2));
    title('Jerk among Trials')
    
    xlabel('Trials')
    ylabel('Jerk')
    set(gca, 'Position', [0.315, 0.07, 0.195, 0.4]);
    
    subplot(2,4,7);
    groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
    colors = ["#0072BD","#9C9C9C"];
    colors = colors(findgroups(groupname));
    hold on
    for i=1:size(dir_error,2)
        boxchart(dir_error(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(dir_error,1),1),"MarkerStyle","o","MarkerColor",colors(i));
    end
    plot(mean(dir_error,"omitmissing"),"_","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    plot(mean(dir_error,"omitmissing")+std(dir_error,"omitmissing"),"*","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    hold off
    ax = gca;
    ax.XAxis.Categories = categorical(1:size(dir_error,2));
    title('Directional Error among Trials')
    
    xlabel('Trials')
    ylabel('\epsilon_{\theta} [°]')
    set(gca, 'Position', [0.55, 0.07, 0.195, 0.4]);

    subplot(2,4,8);
    groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
    colors = ["#0072BD","#9C9C9C"];
    colors = colors(findgroups(groupname));
    hold on
    for i=1:size(ext_error,2)
        boxchart(ext_error(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(ext_error,1),1),"MarkerStyle","o","MarkerColor",colors(i));
    end
    plot(mean(ext_error,"omitmissing"),"_","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    plot(mean(ext_error,"omitmissing")+std(ext_error,"omitmissing"),"*","Color",'r','LineStyle','none','LineWidth',1,"MarkerSize",9.2)
    hold off
    ax = gca;
    ax.XAxis.Categories = categorical(1:size(ext_error,2));
    title('Extent Error among Trials')
    
    xlabel('Trials')
    ylabel('ext error (pixel)')
    set(gca, 'Position', [0.79, 0.07, 0.195, 0.4]);
    
    legend({'Initial Test', 'Training 1', 'Training 2', 'Training 3', 'Training 4', 'Mid Test', 'Training 5', 'Training 6', 'Training 7', 'Training 8', 'Final Test'}, 'NumColumns',3, 'Position',[-0.073, 0.846, 0.4118, 0.1350])
end