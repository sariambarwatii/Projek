Link alternatif dengan Colab  : https://colab.research.google.com/drive/1lCXaj0VzArGeaRvVyxA9PDvSKhT4CV3z?usp=sharing
Source dataset : kaggle competitions download -c home-credit-default-risk

**Tujuan Proyek**: Proyek ini bertujuan untuk memprediksi kemampuan pemohon pinjaman dalam membayar kembali pinjaman.

**Deskripsi Dataset**:
1. application_train.csv: dataset utama yang digunakan untuk melatih model, dengan kolom TARGET yang menunjukkan apakah pemohon mampu membayar pinjaman. Setiap baris dalam dataset ini mewakili satu aplikasi pinjaman.
2. previous_application.csv: dataset ini mencatat seluruh aplikasi pinjaman yang diajukan sebelumnya oleh klien yang ada dalam dataset utama. Setiap baris mewakili satu aplikasi pinjaman sebelumnya, yang memberikan lebih banyak konteks dan riwayat pinjaman klien.

**Tahapan Pengolahan Data**:
1. Exploratory Data Analysis (EDA)
2. Preprocessing:
   * Handling Missing Values: Menangani missing data menggunakan teknik imputasi atau penghapusan data yang tidak relevan.
   * Handling Outliers.
   * Feature Encoding : Mengubah fitur kategorikal menjadi numerik menggunakan teknik encoding.
   * Handling Imbalanced Data: menggunakan oversampling pada kolom TARGET.
3. Modeling : Random Forest serta hyperparameter tuning dengan randomsearch.
4. Evaluasi Model : Confusion matrix dan ROC curve.
![image](https://github.com/user-attachments/assets/e3ac2f33-326f-4b4e-8c94-c643db5e1b67)


