# 📘 Product Requirements Document (PRD)

**Titolo del progetto**: Simulatore Richiesta Prestiti – FinzEasy  
**Studente**: Alfredo Cavalieri  
**Corso di Laurea**: Informatica per le Aziende Digitali (L-31) – Università Pegaso  
**Data**: <!-- Inserisci la data -->

---

## 1. Obiettivo del prodotto

Sviluppare una web application full-stack che consenta agli utenti di:

- Simulare un prestito inserendo i parametri principali (capitale, tasso, durata)
- Inviare una richiesta di prestito compilando un semplice form
- Visualizzare lo storico delle richieste inviate

L’applicazione deve essere accessibile da browser, semplice da usare e conforme a un’architettura moderna RESTful API-based.

---

## 2. Descrizione del prodotto

**Nome prodotto**: FinzEasy – Simulatore Prestiti Online  
**Tipo di prodotto**: Applicazione web full-stack  
**Tecnologie**:

- **Front-end**: Angular 17, HTML/CSS, Bootstrap
- **Back-end**: Java 17, Spring Boot, REST API
- **Database**: postgres

---

## 3. Caratteristiche principali (Features)

| ID   | Funzionalità              | Descrizione                                                                   |
| ---- | ------------------------- | ----------------------------------------------------------------------------- |
| F-01 | Simulazione Prestito      | L’utente inserisce capitale, durata e tasso; riceve la rata mensile calcolata |
| F-02 | Invio Richiesta Prestito  | Form per inviare una richiesta reale, salvata in back-end                     |
| F-03 | Visualizzazione Richieste | L’utente visualizza le richieste inviate (mock autenticazione)                |
| F-04 | Interfaccia Responsive    | Design semplice e accessibile da desktop e mobile                             |
| F-05 | Comunicazione API REST    | Front-end e back-end comunicano via chiamate HTTP/JSON                        |

---

## 4. User Stories

```text
Come utente
Voglio simulare un prestito
Per capire se posso permettermelo
```

```text
Come utente
Voglio inviare una richiesta di prestito con i miei dati
Per essere ricontattato dalla banca/fintech
```

```text
Come utente
Voglio visualizzare lo storico delle mie richieste
Per tenere traccia delle simulazioni che ho inviato
```

---

## 5. Requisiti Funzionali

| ID    | Requisito                 | Priorità | Descrizione                                                              |
| ----- | ------------------------- | -------- | ------------------------------------------------------------------------ |
| RF-01 | Calcolo rata              | Alta     | Il sistema deve calcolare la rata mensile sulla base dei dati forniti    |
| RF-02 | Salvataggio richiesta     | Alta     | La richiesta deve essere memorizzata nel backend (anche temporaneamente) |
| RF-03 | Visualizzazione richieste | Media    | L’utente deve poter vedere una lista delle sue richieste                 |
| RF-04 | UI chiara e semplice      | Alta     | L’interfaccia deve essere comprensibile anche a utenti non esperti       |
| RF-05 | API REST                  | Alta     | Il backend deve esporre endpoint RESTful per tutte le operazioni         |

---

## 6. Requisiti Non Funzionali

| ID     | Requisito            | Descrizione                                                            |
| ------ | -------------------- | ---------------------------------------------------------------------- |
| RNF-01 | Performance          | Il calcolo rata deve avvenire in meno di 1 secondo                     |
| RNF-02 | Usabilità            | L’interfaccia deve essere utilizzabile anche su dispositivi mobili     |
| RNF-03 | Affidabilità         | Il sistema deve gestire correttamente errori di input o di rete        |
| RNF-04 | Scalabilità simulata | Il codice deve essere strutturato in modo da poter crescere facilmente |
| RNF-05 | Manutenibilità       | Separazione chiara tra front-end e back-end, codice commentato         |

---

## 7. Casi d'Uso (UML semplificato)

```text
Attore: Utente

[Simula prestito]
    → Inserisce capitale, durata, tasso
    → Riceve rata calcolata

[Invia richiesta]
    → Compila form con i dati
    → Conferma invio

[Visualizza richieste]
    → Visualizza elenco richieste precedenti
```

---

## 8. Requisiti Tecnici

- Angular 17 con CLI
- Spring Boot 3.x, Java 17
- IDE consigliati: IntelliJ IDEA, VS Code
- API documentate via Swagger (OpenAPI)
- Repository Git con codice completo

---

## 9. Criteri di accettazione

- ✅ Tutte le funzionalità principali sono presenti e funzionanti
- ✅ API REST documentate e testabili
- ✅ Front-end responsivo e accessibile
- ✅ Codice pubblicato su GitHub
- ✅ Screenshot del funzionamento presenti nella relazione

---

## 10. Allegati (non inclusi nel file Markdown)

- UML e modelli ER (inseriti nella documentazione tecnica)
- Codice sorgente su GitHub
- Report PDF finale
- Screenshot del front-end in esecuzione
