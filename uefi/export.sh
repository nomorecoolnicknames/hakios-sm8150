#!/bin/bash
# Save the vayu platform from Mu-Silicium/ into files/ here (uefi/export.sh runs this; HakiOS's own changes are uefi/'s).
set -e
cd "$(dirname "$(readlink -f "$0")")"
MU=${MU:-../../../Mu-Silicium}
rm -rf files
mkdir -p files/Resources/Configs files/Resources/DTBs files/Platforms/Xiaomi
cp -r $MU/Platforms/Xiaomi/vayuPkg files/Platforms/Xiaomi/
cp $MU/Resources/Configs/vayu.toml files/Resources/Configs/
cp $MU/Resources/DTBs/vayu.dtb files/Resources/DTBs/
find files -name __pycache__ -prune -exec rm -rf {} +
echo "devices/vayu/uefi/export.sh: $(find files -type f | wc -l) files"
