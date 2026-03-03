% RUN_ANALYSIS_TEMPLATE
% This is a minimal entry point template.
% You likely need to adapt this to your own data organisation.
%
% 1) Add repo src/ to path
% 2) Load your precomputed 99_all_data.mat (or build it using importAlldataLee* utilities)
% 3) Call the plotting functions (ErrorLee*/HistLee*) as needed.

repoRoot = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(repoRoot,'..','src')));

disp('Path added. Now edit this template to point to your data and run the desired analyses.');
