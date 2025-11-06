here::i_am("code/00_clean_data.R")
data_path <- here::here("raw_data", "heart.csv")
heart <- readr::read_csv(data_path, show_col_types = FALSE)

library(labelled)
library(gtsummary)

var_label(heart) <- list(
  Age = "Age (years)",
  Sex = "Sex",
  ChestPainType = "Chest pain type",
  RestingBP = "Resting BP (mmHg)",
  Cholesterol = "Cholesterol (mg/dL)",
  FastingBS = "Fasting blood sugar (≥120 mg/dL)",
  RestingECG = "Resting ECG",
  MaxHR = "Max heart rate (bpm)",
  ExerciseAngina = "Exercise-induced angina",
  Oldpeak = "ST depression (oldpeak)",
  ST_Slope = "ST slope at peak exercise",
  HeartDisease = "Heart disease"
)

saveRDS(
  heart,
  file = here::here("output/clean_data.rds")
)