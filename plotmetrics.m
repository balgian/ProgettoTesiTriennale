function [fig] = plotmetrics(FigName,MovTime,EucError_1s,linIndex,AspectRatio,totjerk,dir_error,ext_error)
    % Plots
    fig = figure('NumberTitle','off','Name',FigName,'WindowState', 'maximized','Visible','off');
    
    subplot(2,4,[1 5]);
    groupname = {'A','B','B','B','B','A','B','B','B','B','A'};
    colors = ["#0072BD","#9C9C9C"];
    colors = colors(findgroups(groupname));
    hold on
    for i=1:size(MovTime,2)
        b(i) = boxchart(MovTime(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(MovTime,1),1));
        scatter(i+0.5,MovTime(:,i), 'filled' ,'MarkerFaceColor',colors(i), 'MarkerEdgeColor',colors(i),'jitter','on','JitterAmount',0.05, 'MarkerFaceAlpha', 0.5);
    end
    hold off
    ylim([min(quantile(MovTime,0.25)-1.5*iqr(MovTime)) max(quantile(MovTime,0.75)+1.5*iqr(MovTime))]);
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
        boxchart(EucError_1s(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(EucError_1s,1),1));
        scatter(i+0.5,EucError_1s(:,i), 'filled' ,'MarkerFaceColor',colors(i), 'MarkerEdgeColor',colors(i),'jitter','on','JitterAmount',0.05, 'MarkerFaceAlpha', 0.5);
    end
    hold off
    ylim([min(quantile(EucError_1s,0.25)-1.5*iqr(EucError_1s)) max(quantile(EucError_1s,0.75)+1.5*iqr(EucError_1s))]);
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
        boxchart(linIndex(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(linIndex,1),1));
        scatter(i+0.5,linIndex(:,i), 'filled' ,'MarkerFaceColor',colors(i), 'MarkerEdgeColor',colors(i),'jitter','on','JitterAmount',0.05, 'MarkerFaceAlpha', 0.5);
    end
    hold off
    ylim([min(quantile(linIndex,0.25)-1.5*iqr(linIndex)) max(quantile(linIndex,0.75)+1.5*iqr(linIndex))]);
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
        boxchart(AspectRatio(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(AspectRatio,1),1));
        scatter(i+0.5,AspectRatio(:,i), 'filled' ,'MarkerFaceColor',colors(i), 'MarkerEdgeColor',colors(i),'jitter','on','JitterAmount',0.05, 'MarkerFaceAlpha', 0.5);
    end
    hold off
    ylim([min(quantile(AspectRatio,0.25)-1.5*iqr(AspectRatio)) max(quantile(AspectRatio,0.75)+1.5*iqr(AspectRatio))]);
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
        boxchart(totjerk(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(totjerk,1),1));
        scatter(i+0.5,totjerk(:,i), 'filled' ,'MarkerFaceColor',colors(i), 'MarkerEdgeColor',colors(i),'jitter','on','JitterAmount',0.05, 'MarkerFaceAlpha', 0.5);
    end
    hold off
    ylim([min(quantile(totjerk,0.25)-1.5*iqr(totjerk)) max(quantile(totjerk,0.75)+1.5*iqr(totjerk))]);
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
        boxchart(dir_error(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(dir_error,1),1));
        scatter(i+0.5,dir_error(:,i), 'filled' ,'MarkerFaceColor',colors(i), 'MarkerEdgeColor',colors(i),'jitter','on','JitterAmount',0.05, 'MarkerFaceAlpha', 0.5);
    end
    hold off
    ylim([min(quantile(dir_error,0.25)-1.5*iqr(dir_error)) max(quantile(dir_error,0.75)+1.5*iqr(dir_error))]);
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
        boxchart(ext_error(:,i),'MarkerStyle','none','BoxFaceColor',colors(i),'XData',i*ones(size(ext_error,1),1));
        scatter(i+0.5,ext_error(:,i), 'filled' ,'MarkerFaceColor',colors(i), 'MarkerEdgeColor',colors(i),'jitter','on','JitterAmount',0.05, 'MarkerFaceAlpha', 0.5);
    end
    hold off
    ylim([min(quantile(ext_error,0.25)-1.5*iqr(ext_error)) max(quantile(ext_error,0.75)+1.5*iqr(ext_error))]);
    ax = gca;
    ax.XAxis.Categories = categorical(1:size(ext_error,2));
    title('Extent Error among Trials')
    
    xlabel('Trials')
    ylabel('ext error (pixel)')
    set(gca, 'Position', [0.79, 0.07, 0.195, 0.4]);
    
    legend(b, {'Initial Test', 'Training 1', 'Training 2', 'Training 3', 'Training 4', 'Mid Test', 'Training 5', 'Training 6', 'Training 7', 'Training 8', 'Final Test'}, 'NumColumns',3, 'Position',[-0.073, 0.846, 0.4118, 0.1350])
end