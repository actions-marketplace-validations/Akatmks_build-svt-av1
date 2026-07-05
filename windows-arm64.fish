#!/usr/bin/env fish


argparse "static=" "shared=" "pgo-parameters=" "base-arch-only=" "dovi-hdr10plus=" "ffms2=" "cmakeflags=" "cflags-profiling=" "ldflags-profiling=" "cflags-final=" "ldflags-final=" -- $argv
or return $status

set -g flag_static $_flag_static
set -g flag_shared $_flag_shared
set -g flag_pgo_parameters $_flag_pgo_parameters
set -g flag_base_arch_only $_flag_base_arch_only
set -g flag_dovi_hdr10plus $_flag_dovi_hdr10plus
set -g flag_ffms2 $_flag_ffms2
set -g flag_cmakeflags $_flag_cmakeflags
set -g flag_cflags_profiling $_flag_cflags_profiling
set -g flag_ldflags_profiling $_flag_ldflags_profiling
set -g flag_cflags_final $_flag_cflags_final
set -g flag_ldflags_final $_flag_ldflags_final

echo "[build-svt-av1] Init"
echo $flag_static
echo $flag_shared
echo $flag_pgo_parameters
echo $flag_base_arch_only
echo $flag_dovi_hdr10plus
echo $flag_ffms2
echo $flag_cmakeflags
echo $flag_cflags_profiling
echo $flag_ldflags_profiling
echo $flag_cflags_final
echo $flag_ldflags_final
