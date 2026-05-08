# Install and load necessary packages
install.packages(c("f1dataR", "dplyr", "ggplot2"))
library(f1dataR)
library(dplyr)
library(ggplot2)
library(tidyverse)

# Set the season and round for the Imola Grand Prix 2025
season_year <- 2025
imola_round <- 7 # Assuming it's the 7th round, adjust if necessary

# Set up fastf1
setup_fastf1()

# Load lap data using load_session_laps()
imola_session_laps <- load_session_laps(season = season_year, round = imola_round, session = "Q")

head(imola_session_laps)
str(imola_session_laps)
names(imola_session_laps)

# Driver and Team Colours
driver_colours <- c(
  "Norris" = "#FF8700",
  "Piastri" = "#FF8700",
  "Verstappen" = "#1E41FF",
  "Tsunoda" = "#1E41FF",
  "Russell" = "#00D2BE",
  "Antonelli" = "#00D2BE",
  "Albon" = "#005AFF",
  "Sainz" = "#005AFF",
  "Stroll" = "#006F62",
  "Alonso" = "#006F62",
  "Hulkenberg" = "#00FF00",
  "Bortoleto" = "#00FF00",
  "Leclerc" = "#DC0000",
  "Hamilton" = "#DC0000",
  "Gasly" = "#FF87BC",
  "Colapinto" = "#FF87BC",
  "Ocon" = "#C0C0C0",
  "Bearman" = "#C0C0C0",
  "Lawson" = "steelblue",
  "Hadjar" = "steelblue"
)

# 1. Select, Clean, and Filter Data
# Check for required columns before proceeding
required_cols <- c("driver", "sector1time", "sector2time", "sector3time", "is_accurate", "compound")
if (!all(required_cols %in% names(imola_session_laps))) {
  stop("Error: One or more required columns are missing from the loaded data.")
}

imola_laps_filtered <- imola_session_laps %>%
  select(driver, sector1time, sector2time, sector3time, is_accurate, compound) %>%
  na.omit() %>%
  filter(is_accurate == TRUE, compound == "SOFT") %>%
  mutate(
    Sector1Time_seconds = as.numeric(sector1time, units = "secs"),
    Sector2Time_seconds = as.numeric(sector2time, units = "secs"),
    Sector3Time_seconds = as.numeric(sector3time, units = "secs")
  )

# 2. Calculate Best Sector Times for Each Driver
best_sector_times <- imola_laps_filtered %>%
  group_by(driver) %>%
  summarise(
    BestSector1Time = min(Sector1Time_seconds, na.rm = TRUE),
    BestSector2Time = min(Sector2Time_seconds, na.rm = TRUE),
    BestSector3Time = min(Sector3Time_seconds, na.rm = TRUE)
  )

# 3. Recode Driver Names for Consistency
best_sector_times$driver <- recode(
  best_sector_times$driver,
  "NOR" = "Norris",
  "PIA" = "Piastri",
  "VER" = "Verstappen",
  "TSU" = "Tsunoda",
  "RUS" = "Russell",
  "ANT" = "Antonelli",
  "ALB" = "Albon",
  "SAI" = "Sainz",
  "STR" = "Stroll",
  "ALO" = "Alonso",
  "HUL" = "Hulkenberg",
  "LEC" = "Leclerc",
  "HAM" = "Hamilton",
  "GAS" = "Gasly",
  "COL" = "Colapinto",
  "OCO" = "Ocon",
  "BEA" = "Bearman",
  "BOR" = "Bortoleto",
  "LAW" = "Lawson",
  "HAD" = "Hadjar"
)

# 4. Create and Save Plots for Each Sector Separately

# Plot for Sector 1
p1 <- ggplot(best_sector_times, aes(x = BestSector1Time, y = reorder(driver, -BestSector1Time), colour = driver)) +
  geom_point(size = 4) +
  labs(
    title = "Best Sector 1 Times - Imola 2025 Quali",
    x = "Best Time (seconds)",
    y = "Driver"
  ) +
  scale_colour_manual(values = driver_colours, na.value = "grey50") +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

print(p1)
ggsave("imola_best_sector1_times_dotplot_quali.png", plot = p1, width = 8, height = 6)

# Plot for Sector 2
p2 <- ggplot(best_sector_times, aes(x = BestSector2Time, y = reorder(driver, -BestSector2Time), colour = driver)) +
  geom_point(size = 4) +
  labs(
    title = "Best Sector 2 Times - Imola 2025 Quali",
    x = "Best Time (seconds)",
    y = "Driver"
  ) +
  scale_colour_manual(values = driver_colours, na.value = "grey50") +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

print(p2)
ggsave("imola_best_sector2_times_dotplot_quali.png", plot = p2, width = 8, height = 6)

# Plot for Sector 3
p3 <- ggplot(best_sector_times, aes(x = BestSector3Time, y = reorder(driver, -BestSector3Time), colour = driver)) +
  geom_point(size = 4) +
  labs(
    title = "Best Sector 3 Times - Imola 2025 Quali",
    x = "Best Time (seconds)",
    y = "Driver"
  ) +
  scale_colour_manual(values = driver_colours, na.value = "grey50") +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

print(p3)
ggsave("imola_best_sector3_times_dotplot_quali.png", plot = p3, width = 8, height = 6)

# Install and load necessary packages
install.packages(c("f1dataR", "dplyr", "ggplot2"))
library(f1dataR)
library(dplyr)
library(ggplot2)
library(tidyverse)

# Set the season and round for the Imola Grand Prix 2025
season_year <- 2025
imola_round <- 9 # Assuming it's the 7th round, adjust if necessary

# Set up fastf1
setup_fastf1()

# Load lap data using load_session_laps()
monaco_p2_session_laps <- load_session_laps(season = season_year, round = imola_round, session = "Q")

head(monaco_p2_session_laps)
str(monaco_p2_session_laps)
names(monaco_p2_session_laps)

# Driver and Team Colours
driver_colours <- c(
  "Norris" = "#FF8700",
  "Piastri" = "#FF8700",
  "Verstappen" = "#1E41FF",
  "Tsunoda" = "#1E41FF",
  "Russell" = "#00D2BE",
  "Antonelli" = "#00D2BE",
  "Albon" = "#005AFF",
  "Sainz" = "#005AFF",
  "Stroll" = "#006F62",
  "Alonso" = "#006F62",
  "Hulkenberg" = "#00FF00",
  "Bortoleto" = "#00FF00",
  "Leclerc" = "#DC0000",
  "Hamilton" = "#DC0000",
  "Gasly" = "#FF87BC",
  "Colapinto" = "#FF87BC",
  "Ocon" = "#C0C0C0",
  "Bearman" = "#C0C0C0",
  "Lawson" = "steelblue",
  "Hadjar" = "steelblue"
)

# 1. Select, Clean, and Filter Data
# Check for required columns before proceeding
required_cols <- c("driver", "sector1time", "sector2time", "sector3time", "is_accurate", "compound")
if (!all(required_cols %in% names(monaco_p2_session_laps))) {
  stop("Error: One or more required columns are missing from the loaded data.")
}

monaco_p2_laps_filtered <- monaco_p2_session_laps %>%
  select(driver, sector1time, sector2time, sector3time, is_accurate, compound) %>%
  na.omit() %>%
  filter(is_accurate == TRUE, compound == "SOFT") %>%
  mutate(
    Sector1Time_seconds = as.numeric(sector1time, units = "secs"),
    Sector2Time_seconds = as.numeric(sector2time, units = "secs"),
    Sector3Time_seconds = as.numeric(sector3time, units = "secs")
  )

# 2. Calculate Best Sector Times for Each Driver
best_sector_times <- monaco_p2_laps_filtered %>%
  group_by(driver) %>%
  summarise(
    BestSector1Time = min(Sector1Time_seconds, na.rm = TRUE),
    BestSector2Time = min(Sector2Time_seconds, na.rm = TRUE),
    BestSector3Time = min(Sector3Time_seconds, na.rm = TRUE)
  )

# 3. Recode Driver Names for Consistency
best_sector_times$driver <- recode(
  best_sector_times$driver,
  "NOR" = "Norris",
  "PIA" = "Piastri",
  "VER" = "Verstappen",
  "TSU" = "Tsunoda",
  "RUS" = "Russell",
  "ANT" = "Antonelli",
  "ALB" = "Albon",
  "SAI" = "Sainz",
  "STR" = "Stroll",
  "ALO" = "Alonso",
  "HUL" = "Hulkenberg",
  "LEC" = "Leclerc",
  "HAM" = "Hamilton",
  "GAS" = "Gasly",
  "COL" = "Colapinto",
  "OCO" = "Ocon",
  "BEA" = "Bearman",
  "BOR" = "Bortoleto",
  "LAW" = "Lawson",
  "HAD" = "Hadjar"
)

# 4. Create and Save Plots for Each Sector Separately

# Plot for Sector 1
p1 <- ggplot(best_sector_times, aes(x = BestSector1Time, y = reorder(driver, -BestSector1Time), colour = driver)) +
  geom_point(size = 4) +
  labs(
    title = "Best Sector 1 Times - Monaco FP2",
    x = "Best Time (seconds)",
    y = "Driver"
  ) +
  scale_colour_manual(values = driver_colours, na.value = "grey50") +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

print(p1)
ggsave("imola_best_sector1_times_dotplot_quali.png", plot = p1, width = 8, height = 6)

# Plot for Sector 2
p2 <- ggplot(best_sector_times, aes(x = BestSector2Time, y = reorder(driver, -BestSector2Time), colour = driver)) +
  geom_point(size = 4) +
  labs(
    title = "Best Sector 2 Times - Monaco FP2",
    x = "Best Time (seconds)",
    y = "Driver"
  ) +
  scale_colour_manual(values = driver_colours, na.value = "grey50") +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

print(p2)
ggsave("imola_best_sector2_times_dotplot_quali.png", plot = p2, width = 8, height = 6)

# Plot for Sector 3
p3 <- ggplot(best_sector_times, aes(x = BestSector3Time, y = reorder(driver, -BestSector3Time), colour = driver)) +
  geom_point(size = 4) +
  labs(
    title = "Best Sector 3 Times - Monaco FP2",
    x = "Best Time (seconds)",
    y = "Driver"
  ) +
  scale_colour_manual(values = driver_colours, na.value = "grey50") +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

print(p3)
ggsave("imola_best_sector3_times_dotplot_quali.png", plot = p3, width = 8, height = 6)

