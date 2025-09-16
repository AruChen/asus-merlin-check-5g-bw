# check-5g-bw

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

A simple shell script for ASUS Merlin and similar routers to monitor the **5GHz Wi-Fi channel bandwidth**.  
If the channel bandwidth drops below **160MHz**, the script automatically restarts the `acsd` service to recover optimal performance.  

---

## ✨ Features
- ✅ Detects current 5GHz channel bandwidth (using `wl chanspec`)
- ✅ Automatically restarts `acsd` service if bandwidth is below 160MHz
- ✅ Easy to customize for different router interfaces (e.g. `eth7` or `eth8`)
- ✅ Lightweight & easy to deploy

---

## 📦 Installation
1. Download the script:
   ```bash
   wget https://raw.githubusercontent.com/<your-username>/<your-repo>/main/check_5g_bw.sh -O check_5g_bw.sh
   ```
2. Make it executable:
   ```bash
   chmod +x check_5g_bw.sh
   ```
---

## 🚀 Usage
Run the script manually:
   ```bash
   ./check_5g_bw.sh
   ```
Or add it to `cron` for periodic checks:
   ```bash
   */10 * * * * /jffs/scripts/check_5g_bw.sh >> /jffs/scripts/check_5g_bw.log 2>&1
   ```
(example: run every 10 minutes and log output)

---

## ⚙️ Configuration
Edit the `IFACE` variable inside the script to match your router’s 5GHz interface:
   ```script
   IFACE="eth7"  # or eth8 depending on your device
   ```

---

## 📝 Example Output
When bandwidth is 160MHz:
   ```output
   Current chanspec on eth7: 100/160
   ✅ Bandwidth is 160MHz, no action needed
   ```
When bandwidth drops below 160MHz:
   ```output
   Current chanspec on eth7: 100/80
   ⚠️ Bandwidth is below 160MHz, executing service restart_acsd ...

   ```

---

## 📄 License
This project is licensed under the [MIT License](LICENSE).

 ---

## 👤 Author
Aru – [GitHub Profile](https://github.com/AruChen)
