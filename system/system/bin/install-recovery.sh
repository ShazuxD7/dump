#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/recovery:14971392:b523575a6d5e69c781c89aaf9abfa8419f15d2a1; then
  applypatch  EMMC:/dev/block/boot:9421312:6bd9242f39f80666ecf407a304b94f2ead3bd28c EMMC:/dev/block/recovery b523575a6d5e69c781c89aaf9abfa8419f15d2a1 14971392 6bd9242f39f80666ecf407a304b94f2ead3bd28c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
