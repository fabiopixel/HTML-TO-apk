# BREW//POP Android Cloud Build

Questo progetto compila BREW//POP come APK Android nativo usando GitHub Actions.
Non serve Android Studio.

## Cosa fa il wrapper Android

- fullscreen immersivo nativo Android;
- status bar e navigation bar nascoste;
- swipe dal bordo per mostrarle temporaneamente;
- orientamento Portrait;
- WebView edge-to-edge hardware accelerated;
- gioco caricato localmente da `app/src/main/assets/index.html`;
- clipboard Duel nativa Android;
- condivisione Duel tramite share sheet Android;
- schermo mantenuto acceso durante il gioco;
- nessun `requestFullscreen()` JavaScript.

## Metodo da smartphone

### A. GitHub + caricamento dei file

1. Crea un repository vuoto su GitHub, per esempio `brew-pop-android`.
2. Carica **il contenuto di questa cartella**, mantenendo le sottocartelle.
3. Assicurati che esista:
   `.github/workflows/build-apk.yml`
4. Apri la scheda **Actions** del repository.
5. Apri **Build BREW POP APK**.
6. Premi **Run workflow**.
7. Al termine apri il run riuscito.
8. In **Artifacts**, scarica `BREW-POP-APK`.
9. Estrai lo ZIP dell'artifact e installa `BREW-POP-2.0.7.apk`.

La build `debug` è già firmata automaticamente ed è installabile.

## Se dal browser mobile è scomodo caricare le cartelle

Puoi usare Termux sul telefono:

```sh
termux-setup-storage
pkg update
pkg install git gh -y
gh auth login
cd /storage/emulated/0/Download/BREW_POP_ANDROID_CLOUD
git init
git add .
git commit -m "BREW POP Android"
gh repo create brew-pop-android --private --source=. --remote=origin --push
```

Poi apri GitHub nel browser → repository → **Actions** → **Build BREW POP APK**.

## Aggiornare il gioco in futuro

Sostituisci solo:

`app/src/main/assets/index.html`

con la nuova versione del gioco, fai commit/push e GitHub ricompilerà automaticamente l'APK.

## Nota condivisione Duel

L'URL interno `appassets.androidplatform.net` non viene mai condiviso.
Nell'APK il Duel usa il codice `BP2-...`, gli appunti Android nativi e il foglio Condividi del sistema.
