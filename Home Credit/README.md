# **OVERVIEW PROJECT**
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
2. Feature Engineering:  Berikut beberapa detail tahapan :
   * Handling Missing Values: Menangani missing data dengan median dan mengganti dengan nilai nol.
   * Mengganti data unknown dalam kolom kategorikal menggunakan mode.
   * Handling Anomaly.
   * Feature Encoding.
   * Creating New Features.
   * Data Aggregation.
   * Feature Selection.
3. Handling imbalance data : RandomUndersampling.
4. Modeling : LGBMClassifier.
5. Evaluasi Model : Area Under ROC curve.
![image](https://github.com/user-attachments/assets/39ba45cb-90da-405e-8c96-602aa10bf5e3)

# **Revisi**
Pada update terbaru ini, saya telah memperbaiki kesalahan yang ada pada model sebelumnya, yang berdampak pada penurunan hasil. 
Saya telah mengupdate beberapa teknik dalam feature engineering, seperti handling anomaly, handling missing value, pembuatan fitur baru, penghapusan beberapa fitur terendah berdasarkan LGBM feature importance. Meskipun sebelumnya ada penurunan, model terbaru ini diharapkan dapat memberikan insight yang lebih baik untuk memprediksi kemampuan pemohon pinjaman untuk melunasi pinjamannya. 

# **Link**
  - Source dataset : https://www.kaggle.com/competitions/home-credit-default-risk/data

### Enviroment 
Proyek ini dikembangkan menggunakan [Kaggle Notebook]

### Cara Menjalankan
1. Unduh lalu import notebook di kaggle.
2. Pastikan dataset sudah ditambahkan ke notebook melalui fitur `Add Input` di Kaggle.
4. Jalankan setiap sel di notebook secara berurutan.
