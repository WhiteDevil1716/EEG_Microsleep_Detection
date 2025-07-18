clc; clear; close all;

% Load or simulate EEG data
load('simulated_eeg.mat'); % loads eeg_data, time, fs

% Preprocess EEG
filtered_eeg = preprocessEEG(eeg_data, fs);

% Train classifier (dummy data for demo)
classifier = trainClassifier();

% Real-time simulation
window_size = 2; % seconds
step_size = 0.5; % seconds
samples_per_window = fs * window_size;
samples_step = fs * step_size;

figure;
for i = 1:samples_step:(length(filtered_eeg)-samples_per_window)
    segment = filtered_eeg(i:i+samples_per_window-1);
    features = extractFeatures(segment, fs);
    
    % Predict microsleep
    label = predict(classifier, features);
    
    % Plot EEG segment
    plot(time(i:i+samples_per_window-1), segment);
    xlabel('Time (s)'); ylabel('EEG Signal (µV)');
    ylim([-100 100]); grid on;
    
    % Check for microsleep and highlight on the plot
    if strcmp(label, 'Microsleep')
        % Title and alert
        title('⚠️ Microsleep Detected!', 'FontSize', 16, 'Color', 'r');
        sound(sin(1:3000), 10000); % Beep alert
        disp('⚠️ Microsleep Detected! Wake Up!');
        
        % Highlight microsleep period with shaded region
        hold on;
        area(time(i:i+samples_per_window-1), segment, 'FaceColor', 'r', 'FaceAlpha', 0.3); % Red shaded area
        hold off;
        
        % Add annotation text to show the event
        text(time(i + samples_per_window/2), 50, 'Microsleep!', 'FontSize', 12, 'Color', 'r');
    else
        title(''); % Clear title if not microsleep
    end
    
    pause(step_size);
end
