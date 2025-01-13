# **Deskripsi Dataset**
Data yang digunakan berupa data primer yang diambil dari 6 subjek. Data diambil ketika subjek diberikan soal numerik level mudah dan sulit. Dataset terdiri atas 14 kolom channel EEG Emotiv.

# **Tujuan Proyek**
Untuk klasifikasi stress level ringan dan berat berdasarkan sinyal EEG pada mahasiswa yang mengerjakan permasalahan numerik.

# **Tahapan Pengolahan Data**
1. Preprocessing : pemotongan sinyal setiap 30 detik dan filtering Band Pass.
Sinyal hasil filtering akan digunakan untuk tahapan selanjutnya.
2. Feature Extraction : band power, statistical, dan entropy
3. Joining data.
4. Classification : dataset akhir terdiri atas 144x37 kolom. Model yang digunakan, yaitu random forest, decision tree, dan xgboost.
5. Evaluasi : akurasi. Performa terbaik pada model XGBoost dengan akurasi 87%.

```
             precision    recall  f1-score   support  
       0       0.95      0.79      0.86        24
       1       0.80      0.95      0.87        21

accuracy                           0.87        45
macro avg       0.88      0.87     0.87        45
weighted avg    0.88      0.87     0.87        45

[[19  5]
 [ 1 20]]
