# Link 
   * Open in Colab : https://colab.research.google.com/drive/1tnQ0bIEXphzIY-chYu1kd0ezJckxnZyY?usp=sharing
   * Source dataset : https://www.kaggle.com/datasets/jorgecamilogamboa/cokerunit12


# **Tujuan Proyek**  
Membangun dan mengevaluasi Digital Twin untuk sistem Oxygen Analyzer dengan menganalisis hubungan antara Temperature (suhu), Pressure (tekanan), Flow (aliran), dan Oxygen Concentration (konsentrasi oksigen).

# **Manfaat Proyek**
Proyek ini diharapkan dapat memberikan wawasan tentang hubungan antar variabel sehingga dapat digunakan untuk meningkatkan akurasi analisis gas pada sistem oxygen analyzer. Hasil ini dapat berpotensi digunakan dalam pengembangan sistem monitoring berbasis data untuk optimasi proses industri, misalnya meningkatkan performansi oven.

# **Deskripi dataset**  
Dataset ini diambil dari sistem Distributed Control System (DCS) pada unit Delayed Coker dengan tujuan membangun sebuah Digital Twin untuk Oxygen Analyzer. Pengumpulan data dilakukan dari 1/7/2016 hingga 17/6/2018.
Terdapat 2 dataset yang akan dianalisis:
 * Temperature : terdapat 20 kolom suhu yang berbeda dengan satuan °C.
 * F,P, dan %O2 : terdapat 19 kolom yang terdiri dari Flows, Pressure, dan Concentration of Oxygen.

# **Tahapan Pengolahan Data**
1. Exploratory Data Analysis (EDA) : plot dataset dengan histogram dan time series. Tahapan ini untuk melihat periode data mana yang akan diambil untuk diproses. Hasil periode waktu yang diambil adalah 15 Februari hingga 9 Juni 2017.
2. Preprocessing : Handling missing value dengan backward dan forward, mengecek korelasi antar feature dan melakukan penghapusan feature yang memiliki korelasi rendah dengan Target (%O2). Selanjutnya, dataset tanpa target direduksi dimensinya dengan PCA n_components = 11.
3. Joining data menggunakan 'left'.
4. Modeling : Menggunakan 2 jenis model Supervised regression, yaitu Linear Regression dan Super Vector Regression (SVR).
5. Evaluasi : R2 dan MSE.
   
   a. Linear Regression : R2 = R2: 0.9793, MSE = 0.5389
   
      ![image](https://github.com/user-attachments/assets/a6419f38-105a-4496-968d-a5d0800ac3d9)

   b. SVR : R2 = R2: 0.9807, MSE = 0.5024
   
      ![image](https://github.com/user-attachments/assets/b84fe65b-f368-4431-9512-e7e56576414d)

### Enviroment 
Proyek ini dikembangkan menggunakan [Kaggle Notebook]

### Cara Menjalankan
1. Unduh lalu import notebook di kaggle.
2. Pastikan dataset sudah ditambahkan ke notebook melalui fitur `Add Input` di Kaggle.
4. Jalankan setiap sel di notebook secara berurutan.

