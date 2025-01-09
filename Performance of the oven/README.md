Link alternatif : https://colab.research.google.com/drive/1aTZ2QeFlyF0Ud0iPd_huqq3Eb1f0xyhC?usp=sharing

**Tujuan Proyek** : Mengevaluasi performansi sistem melalui 4 variabel, yaitu Temperature (suhu), Pressure (tekanan), Flow (aliran), dan Oxygen Concentration (konsentrasi oksigen).

**Deskripi dataset** : Dataset ini diambil dari sistem Distributed Control System (DCS) pada unit Delayed Coker dengan tujuan membangun sebuah Digital Twin untuk Oxygen Analyzer dan mengevaluasinya. 
Terdapat 2 dataset yang akan dianalisi:
 *Dataset Temperatures 
 *Dataset F,P, dan %O2

**Tahapan Pengolahan Data**
1. Exploratory Data Analysis (EDA) : plot dataset dengan histogram dan time series. Tahapan ini untuk melihat periode data mana yang akan diambil untuk diproses. Periode waktu yang diambil : Februari hingga Juni 2017.
2. Preprocessing : Handling missing value dengan backward dan forward, mengecek korelasi antar feature dan melakukan penghapusan feature yang memiliki korelasi rendah (<0.8) dengan Target (%O2). Selanjutnya, dataset tanpa target direduksi dimensinya dengan PCA dengan n_components : 11.
3. Modeling : Menggunakan 2 jenis model Supervised regression, yaitu Linear Regression dan Super Vector Regression (SVR).
4. Evaluasi : Akurasi dan MSE.

Source dataset : https://www.kaggle.com/datasets/jorgecamilogamboa/cokerunit12
