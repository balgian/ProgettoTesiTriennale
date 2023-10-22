% Cleaning
close all
clear
clc

% Import
addpath('..\NeededImportations')
import sav_golay.*
import computereachmetrics.*
import plotmetrics.*
import filemetrics.*
%_____________________________________

%Sreaching data's subjects
choosenfiles = string({dir("..\SubjectsData\Practice").name});

%Deleting not usefull files
choosenfiles = choosenfiles(contains(choosenfiles,"_PracticeLog.txt"));
choosenfilesbis = choosenfiles(contains(choosenfiles,"Bis"));
choosenfiles = choosenfiles(~contains(choosenfiles, choosenfilesbis));

% Nose and shoulders------------------------------------------------------
% Import first table
file = append("..\SubjectsData\Practice\",choosenfiles(1));
file = readtable(file);
columns_name = string(file.Properties.VariableNames);

% Calculate first subject metrics
[MovTime_target,EucError_1s_target,linIndex_target,AspectRatio_target,totjerk_target,dir_error_target,ext_error_target] = filemetrics(file);

fig = plotmetrics(append("Subjects nose and shoulders: Metrics of subject ",erase(choosenfiles(1),["S","_PracticeLog.txt"])),MovTime_target,EucError_1s_target,linIndex_target,AspectRatio_target,totjerk_target,dir_error_target,ext_error_target);
fig.Visible = 'on';

% Mean of first subject's blocks
[MovTime_block,EucError_1s_block,linIndex_block,AspectRatio_block,totjerk_block,dir_error_block,ext_error_block] = deal(NaN(length(choosenfiles),file.block(end)));
MovTime_block(1,:,1) = mean(MovTime_target,1,"omitmissing");
EucError_1s_block(1,:,1) = mean(EucError_1s_target,1,"omitmissing");
linIndex_block(1,:,1) = mean(linIndex_target,1,"omitmissing");
AspectRatio_block(1,:,1) = mean(AspectRatio_target,1,"omitmissing");
totjerk_block(1,:,1) = mean(totjerk_target,1,"omitmissing");
dir_error_block(1,:,1) = mean(dir_error_target,1,"omitmissing");
ext_error_block(1,:,1) = mean(ext_error_target,1,"omitmissing");

for i=2:length(choosenfiles)
    % Import tables
    file = append("..\SubjectsData\Practice\",choosenfiles(i));
    file = readtable(file);

    [tmpMovTime,tmpEucError_1s,tmplinIndex,tmpAspectRatio,tmptotjerk,tmpdir_error,tmpext_error] = filemetrics(file);

    % fig = plotmetrics(append("Subjects nose and shoulders: Metrics of subject ",erase(choosenfiles(i),["S","_PracticeLog.txt"])),tmpMovTime,tmpEucError_1s,tmplinIndex,tmpAspectRatio,tmptotjerk,tmpdir_error,tmpext_error);
    % fig.Visible = 'on';

    % Sum of all targets
    MovTime_target = MovTime_target + tmpMovTime;
    EucError_1s_target = EucError_1s_target + tmpEucError_1s;
    linIndex_target = linIndex_target + tmplinIndex;
    AspectRatio_target = AspectRatio_target + tmpAspectRatio;
    totjerk_target = totjerk_target + tmptotjerk;
    dir_error_target = dir_error_target + tmpdir_error;
    ext_error_target = ext_error_target + tmpext_error;

    % Mean of i-th subject's blocks
    MovTime_block(i,:,1) = mean(tmpMovTime,1,"omitmissing");
    EucError_1s_block(i,:,1) = mean(tmpEucError_1s,1,"omitmissing");
    linIndex_block(i,:,1) = mean(tmplinIndex,1,"omitmissing");
    AspectRatio_block(i,:,1) = mean(tmpAspectRatio,1,"omitmissing");
    totjerk_block(i,:,1) = mean(tmptotjerk,1,"omitmissing");
    dir_error_block(i,:,1) = mean(tmpdir_error,1,"omitmissing");
    ext_error_block(i,:,1) = mean(tmpext_error,1,"omitmissing");

end
MovTime_target = MovTime_target/i;
EucError_1s_target = EucError_1s_target/i;
linIndex_target = linIndex_target/i;
AspectRatio_target = AspectRatio_target/i;
totjerk_target = totjerk_target/i;
dir_error_target = dir_error_target/i;
ext_error_target = ext_error_target/i;
clearvars i tmpMovTime tmpEucError_1s tmplinIndex tmpAspectRatio tmptotjerk tmpdir_error tmpext_error file choosenfiles

fig = plotmetrics("Subjects nose and shoulders: Average metrics for each target",MovTime_target,EucError_1s_target,linIndex_target,AspectRatio_target,totjerk_target,dir_error_target,ext_error_target);
fig.Visible = 'on';

fig = plotmetrics("Subjects nose and shoulders: Average metrics for each block",MovTime_block,EucError_1s_block,linIndex_block,AspectRatio_block,totjerk_block,dir_error_block,ext_error_block);
fig.Visible = 'on';

% Shoulders---------------------------------------------------------------
% Import first table
file = append("..\SubjectsData\Practice\",choosenfilesbis(11));
file = readtable(file);
file = [file(:,1),table(zeros(size(file,1),1),zeros(size(file,1),1),'VariableNames',{'x' 'y'}),file(:,2:19)];
file.Properties.VariableNames = columns_name;

% Calculate first subject metrics
[MovTime_target,EucError_1s_target,linIndex_target,AspectRatio_target,totjerk_target,dir_error_target,ext_error_target] = filemetrics(file);

% fig = plotmetrics(append("Subjects shoulders: Metrics of subject ",erase(choosenfilesbis(1),["S","_Bis_PracticeLog.txt"])),MovTime_target,EucError_1s_target,linIndex_target,AspectRatio_target,totjerk_target,dir_error_target,ext_error_target);
% fig.Visible = 'on';

% Mean of first subject's blocks
[MovTime_block,EucError_1s_block,linIndex_block,AspectRatio_block,totjerk_block,dir_error_block,ext_error_block] = deal(NaN(length(choosenfilesbis),file.block(end)));
MovTime_block(1,:,1) = mean(MovTime_target,1,"omitmissing");
EucError_1s_block(1,:,1) = mean(EucError_1s_target,1,"omitmissing");
linIndex_block(1,:,1) = mean(linIndex_target,1,"omitmissing");
AspectRatio_block(1,:,1) = mean(AspectRatio_target,1,"omitmissing");
totjerk_block(1,:,1) = mean(totjerk_target,1,"omitmissing");
dir_error_block(1,:,1) = mean(dir_error_target,1,"omitmissing");
ext_error_block(1,:,1) = mean(ext_error_target,1,"omitmissing");

for i=2:length(choosenfilesbis)
    % Import tables
    file = append("..\SubjectsData\Practice\",choosenfilesbis(i));
    file = readtable(file);
    file = [file(:,1),table(zeros(size(file,1),1),zeros(size(file,1),1),'VariableNames',{'x' 'y'}),file(:,2:19)];
    file.Properties.VariableNames = columns_name;

    [tmpMovTime,tmpEucError_1s,tmplinIndex,tmpAspectRatio,tmptotjerk,tmpdir_error,tmpext_error] = filemetrics(file);

    % fig = plotmetrics(append("Subjects shoulders: Metrics of subject ",erase(choosenfilesbis(i),["S","_Bis_PracticeLog.txt"])),tmpMovTime,tmpEucError_1s,tmplinIndex,tmpAspectRatio,tmptotjerk,tmpdir_error,tmpext_error);
    % fig.Visible = 'on';

    % Sum of all targets
    MovTime_target = MovTime_target + tmpMovTime;
    EucError_1s_target = EucError_1s_target + tmpEucError_1s;
    linIndex_target = linIndex_target + tmplinIndex;
    AspectRatio_target = AspectRatio_target + tmpAspectRatio;
    totjerk_target = totjerk_target + tmptotjerk;
    dir_error_target = dir_error_target + tmpdir_error;
    ext_error_target = ext_error_target + tmpext_error;

    % Mean of i-th subject's blocks
    MovTime_block(i,:,1) = mean(tmpMovTime,1,"omitmissing");
    EucError_1s_block(i,:,1) = mean(tmpEucError_1s,1,"omitmissing");
    linIndex_block(i,:,1) = mean(tmplinIndex,1,"omitmissing");
    AspectRatio_block(i,:,1) = mean(tmpAspectRatio,1,"omitmissing");
    totjerk_block(i,:,1) = mean(tmptotjerk,1,"omitmissing");
    dir_error_block(i,:,1) = mean(tmpdir_error,1,"omitmissing");
    ext_error_block(i,:,1) = mean(tmpext_error,1,"omitmissing");

end
MovTime_target = MovTime_target/i;
EucError_1s_target = EucError_1s_target/i;
linIndex_target = linIndex_target/i;
AspectRatio_target = AspectRatio_target/i;
totjerk_target = totjerk_target/i;
dir_error_target = dir_error_target/i;
ext_error_target = ext_error_target/i;
clearvars i tmpMovTime tmpEucError_1s tmplinIndex tmpAspectRatio tmptotjerk tmpdir_error tmpext_error file choosenfilesbis

fig = plotmetrics("Subjects shoulders: Average metrics for each target",MovTime_target,EucError_1s_target,linIndex_target,AspectRatio_target,totjerk_target,dir_error_target,ext_error_target);
fig.Visible = 'on';

fig = plotmetrics("Subjects shoulders: Average metrics for each block",MovTime_block,EucError_1s_block,linIndex_block,AspectRatio_block,totjerk_block,dir_error_block,ext_error_block);
fig.Visible = 'on';