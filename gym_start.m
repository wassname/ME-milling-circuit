%% gym_start
% Sets up simulation environment
function [options] = gym_start()

loadmode = 4;
faultmode = 3;
RandomSeedNumber = 3;   % Seed for the random walks

%% Specify fault, fault time and stop time
faultsvec = {'pse sensor','liner wear','no fault'};
fault = faultsvec(faultmode); % faultmode specified in main.m

fault_time = 14*24; % default 90 days NOC, 14 days NOC test
stop_time = 3*24+fault_time; % default 30 days fault data

%% Run simulation
clear options;

rng(RandomSeedNumber); % use specified random seed
fprintf('Run started at %s\n',datestr(now));

[options,seeds] = params_SAGmill('fault',fault,'fault time',fault_time,'stop time',stop_time);

end

