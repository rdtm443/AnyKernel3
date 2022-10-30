# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Nexus Kernel
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=lmi
device.name2=lmipro
supported.versions=11 - 13
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

case "$ZIPFILE" in
  *66fps*|*66hz*)
    ui_print "  • Setting 66 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=1"
    ;;
  *69fps*|*69hz*)
    ui_print "  • Setting 69 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=2"
    ;;
  *72fps*|*72hz*)
    ui_print "  • Setting 72 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=3"
    ;;
  *77fps*|*77hz*)
    ui_print "  • Setting 77 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=4"
    ;;
  *79fps*|*79hz*)
    ui_print "  • Setting 79 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=5"
    ;;
  *80fps*|*80hz*)
    ui_print "  • Setting 80 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" "msm_drm.framerate_override=6"
    ;;
  *)
    ui_print "  • Setting 60 Hz refresh rate"
    patch_cmdline "msm_drm.framerate_override" ""
    ;;
esac

## AnyKernel boot install
dump_boot;
flash_dtbo;

# begin ramdisk changes
# end ramdisk changes

write_boot;
## end boot install


# shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;
#patch_vbmeta_flag=auto;

# reset for vendor_boot patching
#reset_ak;


## AnyKernel vendor_boot install
#split_boot; # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

#flash_boot;
## end vendor_boot install

