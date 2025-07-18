function model = trainClassifier()
    % Simulated training data
    wake_features = [rand(10,1)*2+3, rand(10,1)*0.5+1];
    micro_features = [rand(10,1)*2+6, rand(10,1)*0.5+2];
    
    X = [wake_features; micro_features];
    y = [repmat("Wake",10,1); repmat("Microsleep",10,1)];
    
    model = fitcsvm(X, y, 'KernelFunction', 'linear');
end

