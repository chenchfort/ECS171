data = load('data.txt');
size(data);
mpg = data(:,1);
quantile(mpg, [.33,.66,1])
%     1. mpg:           continuous
%     2. cylinders:     multi-valued discrete
%     3. displacement:  continuous
%     4. horsepower:    continuous
%     5. weight:        continuous
%     6. acceleration:  continuous
%     7. model year:    multi-valued discrete
%     8. origin:        multi-valued discrete
%     9. car name:      string (unique for each instance)