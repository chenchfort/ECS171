% 1. mpg:           continuous
% 2. cylinders:     multi-valued discret
% 3. displacement:  continuous
% 4. horsepower:    continuous
% 5. weight:        continuous
% 6. acceleration:  continuous
% 7. model year:    multi-valued discrete
% 8. origin:        multi-valued discrete

%problem 1
load('data.txt');
mpg = data(:,1);
boundary = quantile(mpg, [.33,.66]);

%problem 2
low = (mpg < boundary(1));
med = 2 * (mpg >= boundary(1) & mpg <= boundary(2));
high = 3 * (mpg > boundary(2));

label = low + med + high;
gplotmatrix(data, [], label);

%problem 3 - OLS.m

%problem 4
rng(100);
[training, trainingSampleIndex] = datasample(data, 280, 'Replace', false);
testing = [];

for i = 1:392
  if ~ismember(i, trainSampleIndex)
    training = [training; data(i, :)];
  end
end

for i = 2:8
  hold off
  figure
  scatter(testing(:,i), mpg(281:392))
  hold
  xlabel(sprintf('#%d feature', i));
  ylabel('mpg');
  t = (min(data(:,i)):0.1:max(data(:,i)))';

  for j = 0:4 
    prediction = OLS(training(:, i), mpg(1:280), j);
    l = [];
    for k = 0 : j
        l = [l t.^k ];    
    end
    ypred = l * prediction;
    plot(t, ypred)


     test = [];
    for k = 0: j
      test = [test training(:,i).^k] ;   
    end

    y = test * prediction;
    mse1 = sum((y-mpg(1:280)).^2)/280


    test = [];
     for k = 0: j
      test = [test training(:,i).^k] ;   
    end
    y = test * prediction;
    mse2 = sum((y-mpg(281:392)).^2)/112;

  end
end


