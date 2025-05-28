# 📘 Business Requirements Document (BRD)

**Titolo del progetto**: Simulatore Richiesta Prestiti – FinzEasy  
**Studente**: Alfredo Cavalieri  
**Corso di Laurea**: Informatica per le Aziende Digitali (L-31) – Università Pegaso  
**Data**: <!-- Inserisci la data -->

---

## 1. Introduzione

### 1.1 Scopo del documento

Questo documento definisce i requisiti di business per lo sviluppo di un’applicazione web full-stack API-based per simulare e gestire richieste di prestito da parte di utenti.  
Il progetto si colloca nel contesto accademico del Project Work previsto dal CdS L-31.

### 1.2 Obiettivo del progetto

Offrire una soluzione software che consenta agli utenti di:

- simulare un prestito inserendo capitale, durata e tasso,
- inviare una richiesta di prestito,
- visualizzare lo storico delle richieste effettuate.

L’obiettivo secondario è familiarizzare con tecnologie moderne (Java + Angular) e con un’architettura API RESTful in ambito finanziario.

---

## 2. Contesto di Business

Le imprese del settore finanziario (come banche e fintech) gestiscono quotidianamente migliaia di richieste di prestito.  
Digitalizzare questi processi significa offrire un accesso rapido, sicuro e scalabile ai clienti, migliorando l’esperienza utente e l’efficienza interna.

La fintech simulata, **FinzEasy**, vuole introdurre un sistema semplice per simulare e raccogliere richieste di prestito online, accessibile via browser.

---

## 3. Ambito del progetto

### 3.1 In Scope ✅

- Simulazione della rata di un prestito a partire da input utente
- Invio e salvataggio di richieste di prestito
- Visualizzazione richieste inviate (mock utente)
- UI responsive e semplice
- Architettura full-stack API-based

### 3.2 Out of Scope ❌

- Autenticazione reale degli utenti
- Calcolo del merito creditizio
- Integrazione con sistemi bancari reali
- Approfondimenti fiscali o legali sui prestiti

---

## 4. Stakeholder

| Nome            | Ruolo           | Interesse                                              |
| --------------- | --------------- | ------------------------------------------------------ |
| Studente        | Sviluppatore    | Realizzare il progetto didattico secondo la traccia    |
| Docente         | Valutatore      | Verifica coerenza, completezza e qualità del lavoro    |
| Utente simulato | Cliente fintech | Simulare e richiedere prestiti online in modo semplice |

---

## 5. Requisiti di Business

| ID    | Requisito                 | Descrizione                                                                |
| ----- | ------------------------- | -------------------------------------------------------------------------- |
| BR-01 | Simulazione prestito      | L’utente deve poter calcolare la rata in base a capitale, durata e tasso.  |
| BR-02 | Richiesta prestito        | L’utente deve poter inviare una richiesta compilando i propri dati.        |
| BR-03 | Visualizzazione richieste | L’utente deve poter visualizzare le richieste inviate.                     |
| BR-04 | Architettura API-based    | Il sistema deve comunicare tramite API REST tra frontend e backend.        |
| BR-05 | Interfaccia user-friendly | L’app deve essere semplice e chiara da usare anche per utenti non tecnici. |

---

## 6. Vincoli e Assunzioni

### 6.1 Vincoli

- Deve essere usata una tecnologia back-end object-oriented (Java)
- Il front-end deve essere sviluppato in Angular
- Il progetto deve essere documentato e pubblicato su GitHub

### 6.2 Assunzioni

- Gli utenti non necessitano di autenticazione per l’uso base
- I dati salvati non devono essere persistenti in ambiente reale (si può usare H2 o mock)

---

## 7. Success Criteria

- Il progetto è completo e funzionante (simula, salva, visualizza richieste)
- La documentazione tecnica e le API sono presenti
- Il codice è pubblicato su un repository Git
- Il front-end è accessibile e usabile
