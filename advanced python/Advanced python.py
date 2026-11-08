import pandas as pd

data = {
    "Patient_ID":,
    "Age":,
    "Condition": ["Diabetes", "Hypertension", "Diabetes", "Heart Disease", "Hypertension"],
    "Clinic_Connected": [True, False, True, True, False]
}

df = pd.DataFrame(data)

print("--- Full DataFrame ---")
print(df)
print("\n--- Summary Statistics ---")
print(df.describe())

