# **Link**
  - Open in Colab  : https://colab.research.google.com/drive/1pwG64VWwW8i8viFi2GiJ5yLMZOx6Bz91?usp=sharing
  - Source dataset : https://www.kaggle.com/competitions/home-credit-default-risk/data

# **Tujuan Proyek**
Proyek ini bertujuan untuk memprediksi kemampuan pemohon pinjaman dalam membayar kembali pinjaman.

# **Manfaat Proyek**
Proyek ini diharapakan dapat memberikan wawasan bagi perusahaan untuk memitigasi resiko kredit macet dengan mengidentifikasi calon peminjam yang beresiko tinggi. Model ini dapat digunakan untuk meningkatkan efisiensi keputusan kredit, menjaga kstabilan portofolio kredit, dan mendukung strategi bisnis berbasis data.

# **Deskripsi Dataset**
![image](https://github.com/user-attachments/assets/143a8f9b-ddca-49e9-bf31-83019c614251)
Pada proyek ini diambil 2 dataset, yaitu :
1. application_train.csv: dataset utama yang digunakan untuk melatih model, dengan kolom TARGET yang menunjukkan apakah pemohon mampu membayar pinjaman. Setiap baris dalam dataset ini mewakili satu aplikasi pinjaman.
2. previous_application.csv: dataset ini mencatat seluruh aplikasi pinjaman yang diajukan sebelumnya oleh klien yang ada dalam dataset utama. Setiap baris mewakili satu aplikasi pinjaman sebelumnya, yang memberikan lebih banyak konteks dan riwayat pinjaman klien.

# **Tahapan Pengolahan Data**:
1. Exploratory Data Analysis (EDA) : tahapan ini dilakukan pada kedua dataset.
2. Preprocessing : tahapan ini dilakukan pada kedua dataset. Berikut beberapa detail tahapan :
   * Handling Missing Values: Menangani missing data dengan median.
   * Mengganti data unknown dalam kolom kategorikal menggunakan mode.
   * Handling Outliers pada kolom **DAYS_EMPLOYED, DAYS_FIRST_DRAWING, DAYS_FIRST_DUE, DAYS_LAST_DUE_1ST_VERSION, DAYS_LAST_DUE, DAYS_TERMINATION.**
   * Mengonversi kolom **DAYS_BIRTH** ke satuan hari.
   * Feature Encoding.
   * Drop Feature dengan korelasi rendah dan proporsi nilai nol yang tinggi.
   * Handling Imbalanced Data: SMOTE oversampling.
3. Joining data menggunakan 'left'.
4. Modeling : Supervised Learning Classification dengan Random Forest serta hyperparameter tuning randomsearch.
5. Evaluasi Model : Area Under ROC curve.
![image](https://github.com/user-attachments/assets/e3ac2f33-326f-4b4e-8c94-c643db5e1b67)


