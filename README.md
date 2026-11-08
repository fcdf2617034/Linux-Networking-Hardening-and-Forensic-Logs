# Linux Networking, Hardening, Access Controls & Forensic Log Analysis (WADF Module 1, Week 4)
**Course:** WADF-2026 – Web Application & Digital Forensics Fundamentals  
**Student Name:** Kenneth Ukata  
**Registration Number:** fcdf2617034  
**Environment:** Debian Linux (Kali Linux `kali@KENNETH`)  

---

## 📌 Lab Overview
This repository contains terminal logs, command executions, permission design layouts, and evidence documentation for **WADF Module 1, Week 4 (Labs 7 & 8)**[cite: 87]. The final module of this series focuses on network interface configurations, socket binding analysis, security auditing, multi-tenant directory access controls (`SetGID`, `Sticky Bit`), automated user onboarding scripts, tape archiving integrity tests, and regex-based forensic log parsing[cite: 88, 89, 91, 92, 93, 94].

---

## 🛠️ Utilities & Concepts Covered
* **Network Interfaces & Routing:** Examining hardware gateways, IP assignments (`192.168.1.50`), and default routing tables[cite: 88].
* **Socket Bindings & Security Audit:** Differentiating between secure Loopback bindings (`127.0.0.1` / `::1`) and exposed Wildcard bindings (`0.0.0.0` / `::`)[cite: 89].
* **System Hardening:** Auditing privilege configurations (`sudo -l`), checking SSH setups, evaluating package upgrade backlogs, and implementing firewall practices[cite: 90].
* **Advanced Access Controls:** Enforcing **SetGID (`2/g+s`)** for group-inheriting shared folders and **Sticky Bits (`1/+t`)** to secure multi-tenant dropboxes against unauthorized deletions[cite: 91, 92].
* **Automation & Cryptographic Backups:** Structuring user provisioning Bash scripts and performing `tar` archive extractions with recovery verification[cite: 92, 93, 94].
* **Forensic Log Parsing:** Leveraging regular expressions and text utilities (`grep`, `awk`) to isolate brute-force login attempts and suspicious access vectors[cite: 94].

---

## 📂 Key Practical Modules Covered

### Lab 7A & 7B: Network Diagnostics & Socket Bindings
* Verified active network interfaces, gateway configurations, and IP assignments[cite: 88].
* Analyzed listening ports to evaluate risk vectors:
  * **Loopback Bindings (`127.0.0.1` / `::1`):** Restricted entirely to internal machine communication[cite: 89].
  * **Wildcard Bindings (`0.0.0.0` / `::`):** Exposed to local networks or the public internet, requiring strict firewall protection[cite: 89].

### Lab 7C: System Hardening & Security Audit
* Inspected administrative rights (`sudo -l`), service configurations, and software update status (identified 1,442 upgradable packages)[cite: 90].
* **Troubleshooting Note:** Encountered an unclosed quote terminal prompt loop; successfully resolved by executing `Ctrl + C` to reset the session before re-running administrative checks[cite: 90].
* **Hardening Policies:** Enforced rules to disable SSH root login, mandate key-based authentication, and activate host-level firewalls (`UFW`)[cite: 90].

### Lab 8A & 8B: Multi-Tenant Access Controls (`SetGID` & `Sticky Bit`)
* Configured departmental directory structures (`/engineering`, `/sales`, `/is`)[cite: 91, 92].
* **SetGID (`g+s`):** Forced files created within a shared team directory to inherit the parent folder's group ownership automatically[cite: 91].
* **Sticky Bit (`+t`):** Restricted file deletion privileges so that only the file owner, directory owner, or root can delete files within public dropboxes[cite: 91]. Validated isolation matrices via cross-departmental access tests[cite: 92].

### Lab 8C & 8D: Automated Onboarding & Tape Archiving
* Engineered a defensive Bash automation script to streamline user provisioning, handle path restrictions, generate secure temporary credentials, and set up strict home directory permissions[cite: 92, 93].
* Packaged static log files into a consolidated tape archive container (`/archive/log.tar`), verified structure indexes, and tested extraction validation pipelines into `/backup`[cite: 93, 94].

### Lab 8E: Forensic Log Parsing & Brute-Force Detection
* Processed system event logs (`auth-events.log`) utilizing regex patterns to isolate unauthorized connection attempts and filter out IP addresses meeting or exceeding thresholds of 3 sequential authorization failures[cite: 94].

---

## 💡 Key Takeaway & Reflection
> *"Combining secure file permissions, automated access control provisioning, and regex-driven log analysis bridges the gap between basic system administration and proactive security hardening."*
