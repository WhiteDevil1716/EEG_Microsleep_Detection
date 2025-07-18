# EEG_Microsleep_Detection
# 🧠 Real-Time EEG Microsleep Detection System

A MATLAB-based system that simulates and analyzes EEG signals in real time to detect microsleep episodes. Designed for research, educational, or neurocognitive monitoring purposes, this project showcases signal processing, feature extraction, and basic machine learning techniques in a live visualization loop.

Built entirely in MATLAB, the system simulates EEG input, processes it, classifies alertness states, and alerts the user in real time when a microsleep event is detected.

---

# 📌 Project Overview

This project serves as a foundational framework for real-time EEG-based alertness monitoring. Using bandpower analysis and spectral entropy, it identifies patterns in brain activity that correspond to microsleep events — brief lapses in attention that are crucial in safety-critical contexts like driving or operating machinery.

---

# 🧠 Features

- 📈 EEG Signal Preprocessing – Bandpass filter (0.5–30 Hz) to remove noise.

- ⚡ Real-Time Sliding Window Detection – Dynamic feature extraction over time.

- 🧠 Feature Engineering – Uses theta band power and spectral entropy.

- 🤖 Machine Learning Classification – Basic SVM classifier to detect microsleep states.

- 🔊 Alert System – Beep and red plot area to warn about microsleep events.

- 📉 Live Plotting – Continuous visualization of EEG segments with overlays.

---

# ⚙️ Tech Stack

Language	-  MATLAB

Signal Analysis	-  FFT, Bandpass

ML Classifier	-  SVM (fitcsvm)

Visualization	-  MATLAB Plotting

Data	Simulated -  EEG

---

# 🚀 Getting Started
### ✅ Prerequisites

MATLAB (R2019b or later recommended)

Signal Processing Toolbox

### 🛠️ Installation

```bash

# Clone or download the project files into a MATLAB folder
git clone https://github.com/YourUsername/EEG-Microsleep-Detection.git
cd EEG-Microsleep-Detection
```

# 📂 Project Structure

```bash

EEG-Microsleep-Detection/
├── main.m                 # Main file to simulate and detect microsleep
├── extractFeatures.m      # Feature extraction logic (theta power & entropy)
├── preprocessEEG.m        # Bandpass filter implementation (0.5–30 Hz)
├── trainClassifier.m      # Dummy classifier using SVM
├── simulateEEGStream.m    # Optional EEG signal simulator
├── simulated_eeg.mat      # Sample EEG dataset with time & fs
└── README.md              # Project documentation
```

---

# 💻 Usage

### 🧪 Run the Simulation

Open main.m in MATLAB and press Run ▶️

You’ll see a live EEG signal plotted in a figure window. If a microsleep event is detected:

A red-shaded region will highlight the EEG segment.

An alert beep will sound.

A message will be displayed in the MATLAB console and on the plot.

---

### 🔍 Feature Extraction

Extracted from each EEG segment (2-second window):

```bash
% Theta Band Power (4–7 Hz)
theta_power = bandpower(segment, fs, [4 7]);

% Spectral Entropy
psd = abs(fft(segment)).^2;
p_norm = psd / sum(psd);
spectral_entropy = -sum(p_norm .* log2(p_norm + eps));

% Combined features
features = [theta_power, spectral_entropy];
```

---

# 🧠 Classifier Logic

A basic linear SVM is trained on simulated data to distinguish between:

State      	Theta Power  	Entropy

Wake	        3–5	         ~1.0

Microsleep	  6–8	         ~2.0

```bash
model = fitcsvm(X, y, 'KernelFunction', 'linear');
```
You can easily swap this out with a real EEG dataset and retrain the model.

---

# 📊 Example Output

### 🔁 Simulation Window

```bash
⚠️ Microsleep Detected! Wake Up!
```

---

# 🧠 Applications

- Drowsiness detection in drivers

- Fatigue monitoring for machine operators

- Sleep study tools for researchers

- Educational demo for EEG analysis and ML

---

# 💡 Future Enhancements

- 🤖 Deep Learning: Replace SVM with CNN/LSTM for sequence learning

- 📡 Real Device Integration: Use Muse/OpenBCI headsets

- 🧾 Logging: Save detected events with timestamps

- 🌐 Web/IoT: Send alerts to dashboard or mobile

---

# 👨‍💼 Author
Rithvik R
<br>🔗 GitHub: @WhiteDevil1716
<br>📧 Email: rithvik1528@gmail.com

