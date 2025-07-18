function features = extractFeatures(segment, fs)
    % Compute power in theta band (4–7 Hz)
    theta_power = bandpower(segment, fs, [4 7]);

    % Compute spectral entropy
    psd = abs(fft(segment)).^2;
    p_norm = psd / sum(psd);
    spectral_entropy = -sum(p_norm .* log2(p_norm + eps));

    features = [theta_power, spectral_entropy];
end
