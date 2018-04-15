%% gym_step
% steps the simulation by n steps
function [logs] = gym_step(options, steps)

if nargin < 3
    steps = 1;

%% add more time to simulation
options.simulation.stoptime = options.simulation.stoptime + steps;

sim('MillCircuit');

%% Get output data and return it
n = steps - 1;
element_list = getElementNames(logsout);
element = logsout.get(element_list{1});
time = element.Values.Time;
fprintf("steps: %g, ending at time %g", length(element.Values.Time), element.Values.Time(end));
time = time(end-n:end);
A = time;

for idx_element = 1:length(element_list)
    element = logsout.get(element_list{idx_element});
    A = cat(2,A,element.Values.Data(end-n:end));
end
data = array2table(A,'VariableNames',{'time',element_list{:}});

logs = table2struct(data, 'ToScalar', true);

end
