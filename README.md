# Boomer Pack

Ressourcenpaket für unseren gemeinsamen Minecraft-Server (Java Edition 26.3, Pack-Format 97).

## Inhalt

- **Cowboyhut**: Ein geschnitzter Kürbis, der im Amboss „Cowboyhut“, „cowboyhut“, „Cowboy Hut“, „Cowboyhat“ oder „Cowboy Hat“ heißt,
  wird als Cowboyhut angezeigt (in der Hand und auf dem Kopf). Das Kürbis-Overlay beim Tragen ist ausgeblendet.
- **Gemälde**: Die Vanilla-Gemälde *Fighters* und *Changing* (beide 4×2 Blöcke) zeigen Screenshots vom Server
  (Endportal und Turm, 2026-11-02). Gezielt platzieren:
  `/give @s painting[painting/variant="minecraft:fighters"]` bzw. `"minecraft:changing"`.

## Struktur

```
pack.mcmeta                     Metadaten (Name, Beschreibung, Pack-Format)
pack.png                        Icon in der Paketliste (optional, 64×64 oder 128×128 PNG)
assets/minecraft/
  textures/block/               Block-Texturen, z. B. stone.png
  textures/item/                Item-Texturen, z. B. diamond_sword.png
  textures/entity/              Mob- und Entity-Texturen
  models/block/, models/item/   Eigene Modelle (JSON)
scripts/build.sh                Baut das ZIP für den Server
```

Eine Textur ersetzt das Original, wenn sie denselben Pfad und Dateinamen hat wie im Vanilla-Paket.
Die Originaldateien liegen im Spiel-JAR unter
`~/Library/Application Support/minecraft/versions/<version>/<version>.jar` (lässt sich wie ein ZIP entpacken).

## Lokal testen

Das Repo per Symlink in den Ressourcenpaket-Ordner einhängen, dann sind Änderungen sofort im Spiel sichtbar:

```sh
ln -s "$PWD" ~/Library/Application\ Support/minecraft/resourcepacks/boomer-pack
```

Im Spiel lädt `F3` + `T` die Ressourcen neu.

## Neue Version veröffentlichen

```sh
git tag v1.0.0
git push origin v1.0.0
```

GitHub Actions baut daraufhin das ZIP und legt ein [Release](https://github.com/maichri/minecraft-texture-pack-boomer/releases) an.
In der Release-Beschreibung stehen URL und SHA-1 fertig zum Kopieren für `server.properties`:

```properties
resource-pack=https://github.com/maichri/minecraft-texture-pack-boomer/releases/download/v1.0.0/boomer-pack.zip
resource-pack-sha1=<SHA-1 aus dem Release>
require-resource-pack=false
```

URL und Hash gehören immer zusammen. Nach jedem neuen Release beides aktualisieren und den Server neu starten.

Lokal bauen (z. B. zum Testen des ZIPs): `./scripts/build.sh` erzeugt `dist/boomer-pack.zip` und gibt den SHA-1 aus.

## Neue Minecraft-Version

Wenn der Server aktualisiert wird, `min_format`/`max_format` in `pack.mcmeta` anpassen.
Die aktuellen Nummern stehen im [Minecraft Wiki](https://minecraft.wiki/w/Pack_format).
