#!/bin/bash
#一点点变量定义
p_dir=$(dirname $(readlink -f $0))
cd ..
work_dir=$(dirname $(readlink -f $0))
echo $p_dir
echo $work_dir

#修复qq不认识安卓10截图的问题，让安卓10适配qq
cd $work_dir/frameworks/base
git am $p_dir/0001-Fix-the-Screenshots-MediaStore-for-rubbish-QQ.patch
#do done

#增加COR HWI的OVERLAY
#cd $work_dir/vendor/hardware_overlay
#git am $p_dir/0001-ADD-overlay-for-COR-and-HWI.patch
#现在已经直接丢hardware_overlay里面

#修复存储卡可读写之一
cd $work_dir/frameworks/base
git am $p_dir/0001-Fix-ExSDCard-Read-Write.patch

#修复存储卡可读写之二
cd $work_dir/system/vold
git am $p_dir/0001-Fix-ExSDCard-Read-Write-2.patch

#修复960，970双卡问题(CDMA依然玄学)
#注意PHH有一个commit是修这个的，注意一下代码版本的时间,2020-01-14
#https://github.com/phhusson/device_phh_treble/commit/21cbb9b4c447bc04b875676b64b254db84fb9fe5
#cd $work_dir/device/phh/treble
#git am $p_dir/0001-Fix-DualSIM-CDMA-960-970.patch

#暴力修复部分手机卡导致设置向导FC
cd $work_dir/package/apps/SetupWizard
git am $p_dir/0001-Remove-SetupWizard.patch

#暴力修复AudioFX开启的时候，拖动进度条有哲学的声音(960 970都是有人有有人没有)
cd $work_dir/package/apps/AudioFX
git am $p_dir/0001-Remove-AudioFX.patch

#修复v9声音part1
cd $work_dir/system/core
git am $p_dir/0001-fix-honor-v9-novoice.patch

#修复V9声音part2v2
cd $work_dir/device/phh/treble/
git am $p_dir/0001-Fix-V9-Voice.patch

#加入免费ROM声明，加入恰饭二维码
cd $work_dir/packages/apps/Settings/
git am $p_dir/0001-add-eat-qrcode.patch

#大佬的黑阈补丁
cd $work_dir/frameworks/base
git am $p_dir/0001-services-Support-brevent.patch

