## **Link**
- Open in colab : https://colab.research.google.com/drive/1vMOtBGoWoBIoj6acousXXl8Tlgav9oAg?usp=sharing
- Source dataset : https://www.kaggle.com/datasets/praveengovi/emotions-dataset-for-nlp

## **Tujuan Proyek**  
Klasifikasi 6 emosi (anger, fear, joy, love, sadness, surprise) berdasarkan teks yang diberikan.

## **Deskripsi dataset** 
Daraset terdiri dari kolom teks dan labels. Terdapat 3 data, yaitu train (16000), test(2000), dan val(2000).

## **Tahapan Pengolahan Data** 
1. Load Dataset : membagi menjadi 2 bagian teks dan label.
2. EDA.
3. Label Encoding.
4. Tokenisasi dengan BERT.
5. Pembuatan dataset tensor.
6. Modeling dengan BERT.
7. Evaluasi : confusion matrix (akurasi = 93%)
   ![image](https://github.com/user-attachments/assets/e891a902-7e1a-4779-8265-6a3e4442a6ba)
   ![image](https://github.com/user-attachments/assets/89db68d8-2f04-4049-b95c-ecde44e456e6)

