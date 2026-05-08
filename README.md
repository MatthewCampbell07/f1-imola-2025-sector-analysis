# 🏎️ F1 Car Strength Analysis: Imola 2025

## Project Overview
This project investigates the performance characteristics of the 2025 F1 grid during the **Emilia Romagna Grand Prix**. By isolating **FP2 Medium-tyre stints**, the analysis identifies which cars excel in high-speed aero efficiency vs. low-speed mechanical grip.

## About the Author
I hold an **MSc in Sports Data Analytics** and an **MA (Hons) in International Business Management**. My background as a **golf analyst/app developer and video analyst** allows me to combine telemetry-driven insights with tactical race-day context.

## Sector Breakdown & Logic
To profile car strengths, I segmented the Imola circuit into three functional tests:
* **Sector 1 (Aero Efficiency):** High-speed corners and straight-line speed (Williams).
* **Sector 2 (Mechanical Grip):** Technical sections requiring traction and rotation (McLaren).
* **Sector 3 (Balance & Stability):** Flowing corners and exit stability (Norris/McLaren).

## Key Analytical Insights
* **Williams:** Demonstrated massive improvement, topping Sector 1. This confirms a car that is highly efficient in a straight line while remaining stable in higher-speed sweeps.
* **McLaren Dominance:** Topped Sector 2 and saw Lando Norris take Sector 3 by a significant margin, proving the MCL38 is currently the most versatile chassis for downforce-heavy sectors.
* **Haas Performance Dip:** After a strong early season, data shows a struggle with tyre degradation and mid-corner balance at Imola.

## Methodology & Tech Stack
* **Language:** R
* **Data Source:** `f1dataR` (Accessing FastF1 API data)
* **Visualisation:** `ggplot2`
* **Focus:** Lap time decomposition, sector-specific profiling, and tyre compound benchmarking.
