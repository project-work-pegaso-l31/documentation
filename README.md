# FinEdge Ledger

> Gestionale didattico per clienti, conti correnti e movimenti bancari  
> Spring Boot + React / Vite – Università Telematica Pegaso, PW-L31

---

## Contenuto del repository

| Percorso                   | Scopo                                                                   |
| -------------------------- | ----------------------------------------------------------------------- |
| **backend/**               | API REST Spring Boot (port 8080)                                        |
| **frontend/**              | Interfaccia React + Vite (port 5173)                                    |
| **documentation/**         | UML, ER-diagram, BRD, PRD, OpenAPI `api-docs.yaml`                      |
| **windows_setup.cmd**      | _Script_ che scarica **tutte** le dipendenze (Maven + npm) con un click |
| **GUIDA_AVVIO_WINDOWS.md** | Istruzioni passo-passo per avviare il progetto su Windows               |

---

## Demo veloce

1. **Clona** il repo
   ```bash
   git clone https://github.com/<TUO-UTENTE>/finedge-ledger.git
   cd finedge-ledger
   ```

````

2. **Esegui lo script** di setup una sola volta

   ```cmd
   windows_setup.cmd
   ```

3. Segui la **GUIDA\_AVVIO\_WINDOWS.md** per lanciare:

   * `mvnw spring-boot:run` → backend (Swagger su `localhost:8080`)
   * `npm run dev` → frontend (`localhost:5173`)

Il sistema parte con 5 clienti demo, conti multipli e movimenti datati da gennaio 2025 per test immediato.

---

## Licenza

MIT License – uso accademico e personale consentito.

````

---

### Cosa fare

1. **Sostituisci** l’attuale `README.md` con il contenuto sopra.
2. Committa:

```bash
git add README.md
git commit -m "docs: README semplificato – rimanda a guida e script setup"
git push
```
