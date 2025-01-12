## **LINK**
- https://www.kaggle.com/datasets/mirichoi0218/insurance

## **Tujuan Proyek**
Melakukan clustering pada dataset ke dalam 3 cluster yang akan membantu dalam memprediksi biaya medis pasien.

## **Deskripsi Dataset**

## **Tahapan Pengolahan Data**
### **a. Clustering**
1. EDA : melihat distribusi data numerikan dan diagram batang data ketegorikal, meninjau korelasi antar feature (age, bmi, smoker, dan charges)
2. Preprocessing : membuat kolom baru charges/age, feature encoding
3. Clustering : Kmeans dengan K=3
4. Evaluasi : silhoutte score
5. Analisis hasil cluster : distribusi nilai pada data numerik dan kategrikal tiap feature.
### **b. Klasifikasi**
1. Preprocessing : handling imbalance kelas dengan SMOTE
2. Klasifikasi : Decision Tree dan Random Forest
