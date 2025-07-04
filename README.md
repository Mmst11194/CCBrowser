# CC: Tweaked Web Tarayıcısı ve Web Sunucusu

Bu proje, [CC: Tweaked](https://tweaked.cc) üzerinde çalışan basit bir web tarayıcısı ve web sunucusudur. Minecraft içinde çalışan tamamen Lua tabanlı bu sistem, temel HTTP isteklerini işleyebilir ve ekran üzerinden basit bir web arayüzü sağlar.

## Özellikler

### 🌐 Web Tarayıcısı
- Basit ve metin tabanlı tarayıcı arayüzü
- Alan adlarına göre sayfa yönlendirme
- Yerel sayfa önbellekleme ve HTTP isteği engelleme
- Hatalı alan adlarında 404 hatası

### 📡 Web Sunucusu
- Aynı ağda birden fazla sunucu desteği
- Her alan adına özel sayfa sunma
- index.txt üzerinden içerik sunma
- Yalnızca belirlenen domainlerden gelen istekleri kabul etme
- Güvenlik için yabancı domainlere istek gönderilmez

## Gereksinimler

- Minecraft (Forge/Fabric) + [CC: Tweaked](https://www.curseforge.com/minecraft/mc-mods/cc-tweaked)
- Bilgisayar bloğu (tarayıcı için)
- Modem (sunucu-tarayıcı bağlantısı için)

## Kurulum

### Web Sunucusu
1. Bilgisayara `server` klasöründeki `server.lua` Lua dosyasını ve `server` klasöründeki `pages` klasörünü yükleyin.
2. Domain(local serverDomain = "istedigin.com") bilgilerini ve index(pages/index.txt) dosyasının içeriklerini düzenleyin.(isteğe bağlı)
4. Sunucuyu başlatmak için Bilgisayar bloğuna:
   ```lua
   server.lua

### Web Tarayıcısı
1. Bilgisayara `browser` klasöründeki `browser.lua` Lua dosyasını yükleyin
2. Tarayıcıyı başlatmak için Bilgisayar bloğuna:
   ```lua
   browser.lua

# NOT:
### Hata anında mycm.yazilim@gmail.com ile paylaşınız.
