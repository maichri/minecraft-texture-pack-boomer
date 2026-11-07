# Boomer Pack

Ressourcenpaket für unseren gemeinsamen Minecraft-Server (Java Edition 26.2, Pack-Format 88).

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

## Für den Server bauen

```sh
./scripts/build.sh
```

Erzeugt `dist/boomer-pack.zip` und gibt den SHA-1 aus. Das ZIP muss unter einer direkten Download-URL liegen, dann in `server.properties`:

```properties
resource-pack=https://example.com/boomer-pack.zip
resource-pack-sha1=<SHA-1 aus dem Build>
require-resource-pack=false
```

## Neue Minecraft-Version

Wenn der Server aktualisiert wird, `min_format`/`max_format` in `pack.mcmeta` anpassen.
Die aktuellen Nummern stehen im [Minecraft Wiki](https://minecraft.wiki/w/Pack_format).
