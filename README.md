# EMF and Radiation Sensor (PIC16F877A, LCD, Analog Front-End)

🧲 A fully functional **Electromagnetic Field & Radiation Detection System** using a PIC16F877A microcontroller. The project includes **real-time display**, **analog signal amplification**, and a complete PCB layout with 3D visualization.

> Built using MikroC PRO for PIC + Proteus + Custom PCB Design

---

## 🚀 Features

- 📟 **LCD Display** (4-bit mode): shows EMF levels and system status.
- 🎛️ **Analog Front-End**: Two-stage amplifier circuit to boost EMF signal.
- 📈 **Real-Time EMF Detection**: Detects changes in electromagnetic fields.
- 🛠️ **Full PCB Design** with schematic + 3D view.
- 📂 **Organized files**: MikroC source, Proteus schematic, documentation images.

---

## 🔧 Hardware Used

| Component        | Description                       |
|------------------|-----------------------------------|
| PIC16F877A       | Main MCU                          |
| LM358 (2x)       | Operational amplifiers            |
| LCD 16x2         | User interface display            |
| Resistors/Capacitors | For analog signal conditioning   |
| EMF Probe / Antenna | Input pickup for EM fields      |

---

## 📁 File Structure

EMF-Sensor-Project/
├── MikroC/ # MikroC source code files (.c, .hex, .mcppi)
├── Proteus/ # Proteus schematic and PCB files (.pdsprj, .dsn)
├── Photo/ # Screenshots, 3D PCB render, final result
├── README.md # You're reading it!
└── LICENSE # MIT License
---

## 🧠 How It Works

The system amplifies low-level electromagnetic noise using two op-amps and feeds the signal to the ADC pin of the PIC16F877A. The software interprets the ADC value and shows an EMF intensity level on the LCD screen.

---

## 🛠 Tools Required

- [MikroC PRO for PIC](https://www.mikroe.com/mikroc/pic)
- [Proteus (ISIS + ARES)](https://www.labcenter.com/)
- Optional: Real hardware for physical implementation

---


## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 👤 Author

Project by **GarablueX** — built for learning, engineering practice, and open-source contribution.
