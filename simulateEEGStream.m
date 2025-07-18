function [eeg_data, time] = simulateEEGStream(fs, duration)
    time = 0:1/fs:duration;
    alpha_wave = sin(2 * pi * 10 * time);  % 10 Hz alpha rhythm
    noise = 0.5 * randn(size(time));       % Random noise
    microsleep = rand(size(time)) < 0.01;  % Random short microsleep
    eeg_data = alpha_wave + noise + microsleep .* sin(2*pi*3*time);
end