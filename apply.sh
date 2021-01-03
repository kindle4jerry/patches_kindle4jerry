#!/bin/bash
#一点点变量定义
p_dir=$(dirname $(readlink -f $0))
cd ..
work_dir=$(dirname $(readlink -f $0))
echo $p_dir
echo $work_dir

#修复v9声音part1
cd $work_dir/system/core
git am $p_dir/0001-fix-honor-v9-no-voice-in-system-core.patch

#修复V9声音part2v2
cd $work_dir/device/phh/treble/
git am $p_dir/0001-fix-honor-v9-no-voice-in-device-phh-treble.patch

#加入免费ROM声明
cd $work_dir/packages/apps/Settings/
git am $p_dir/0001-Add-kindle4jerry-free-rom-announcement.patch

#修复p10等机型无指纹
cd $work_dir/device/phh/treble
git am $p_dir/0001-fix-huawei-phone-unkonw-fingerprint.patch

#UI信号显示
cd $work_dir/frameworks/base
git am $p_dir/0001-Just-change-UI-signal-icon-because-the-GSI-cannot-ge.patch

