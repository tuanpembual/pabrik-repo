# REPREPRO

## Pasang perkakas
`$ sudo apt-get install reprepro nginx`

## Duplikasi Lumbung ini
`$ git clone https://gitlab.com/BlankOn/reprepro-conf.git`

## Atur Halaman Arsip, salin konfigurasi dari repo ini.
`$ sudo cp setup/arsip.conf /etc/nginx/site-available/arsip`
`$ sudo ln -s /etc/nginx/site-available/arsip /etc/nginx/site-enabled/arsip`
`$ sudo /etc/init.d/nginx restart`

## Mengatur kunci gpg
`gpg --list-keys`

## Pengaturan Umum Reprepro
* Pengaturan Distribusi
`$ vim conf/distributions`
File ini berisi konfigurasi menganai cermin yg digunakan dan pengaturan lengkap distribusi.
```
Origin: BlankOn
Label: BlankOn
Codename: uluwatu
Suite: uluwatu
Components: main restricted extras extras-restricted
UDebComponents: main
Architectures: amd64 source
Version: 11.0
Description: BlankOn 11.0 Uluwatu
#SignWith: B81CA9B3
SignWith: 9120A048
# Jangan kasih "-" di kolom Update, nanti paket2 khas2 blankon akan dihapus
Update: merge.sid
DebIndices: Packages Release . .gz .bz2 tiffany.py
UDebIndices: Packages . .gz .bz2
DscIndices: Sources Release . .gz .bz2 tiffany.py
#Pull: pull.tambora pull.tambora-updates
Contents: udebs nodebs . .gz
ContentsArchitectures: amd64
ContentsComponents: main restricted extras extras-restricted
ContentsUComponents: main
Log: uluwatu.log
 --type=dsc changelogs
```

* Pengaturan Lingkungan Kerja
`$ vim conf/options`
```
basedir /data/repo/reprepro
confdir /data/repo/reprepro/conf
dbdir /data/repo/reprepro/db
outdir /data/repo/reprepro/arsip/blankon/
gnupghome /data/repo/.gnupg
```

* Pengaturan Sumber Arsip
`$ vim  conf/updates`
```
Name: merge.sid
Suite: sid
VerifyRelease: blindtrust
Method: http://mirrors.digitalocean.com/debian
Architectures: amd64 source
Components: main non-free>restricted contrib>extras
FilterList: install blacklist.unstable
```

## Menjalankan Reprepro
`$ reprepro -v -v -v update uluwatu`
`$ reprepro -v -v -v export uluwatu`

## Membekukan Rilis
* Tambahkan opsi ReadOnly pada conf/distributions dan hilangkan tiffany.py

## Selamat Menikmati Error dan Baca Log

