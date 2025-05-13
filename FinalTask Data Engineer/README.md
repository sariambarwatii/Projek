# **Overview Projek**
# **Deskripsi Projek**
Bank menghadapi kesulitan dalam mengintegrasikan data dari berbagai sumber seperti Excel, CSV, dan SQL Server. Hal ini menyebabkan keterlambatan dalam pelaporan dan analisis. Untuk mengatasi hal tersebut, proyek ini bertujuan untuk:
- Mengotomatisasi pemrosesan data dengan ETL.
- Membangun Data Warehouse (DWH) yang andal.
- Mengimplementasikan Stored Procedure untuk analisis transaksi dan saldo pelanggan.
  
# **Dataset Sumber**
- transaction_excel (Excel)
- transaction_csv (CSV)
- transaction_db, account, customer, branch, city, state (SQL Server)

# **Arsitektur Projek**
```
Excel/CSV/SQL Server
        ↓
    ETL Process
        ↓
Data Warehouse (DWH)
→ DimAccount
→ DimCustomer
→ DimBranch
→ FactTransaction
```
# **Tahapan Pengerjaan**
1. Pembuatan Data Warehouse
    Membuat skema DWH dengan:
    - DimAccount
    - DimCustomer
    - DimBranch
    - FactTransaction
2. ETL Job
    ETL untuk Dimension Table:
    - Menggabungkan dan membersihkan data dari tabel-tabel terkait.
    - Konversi format tertentu.
    ETL untuk Fact Table:
    - Menggabungkan transaksi dari berbagai sumber.
    - Menjaga konsistensi nama kolom.
    - Mencegah duplikasi data dengan `tUniqRow`.
3. Stored Procedure
    - `DailyTransaction` → Menghitung jumlah dan total nominal transaksi per hari.
    - `BalancePerCustomer` → Mengambil saldo terbaru setiap pelanggan.


  
