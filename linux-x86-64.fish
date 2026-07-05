#!/usr/bin/env fish


# On Linux, `-flto=thin` should be faster than `-flto=full`.  
# BOLT is currently having problems with fully static binaries, and making the binaries static outweigh the benefit of BOLT.
# In the future if BOLT can actually be used, this is the way you can perform BOLT on your own build.
# 1. Add `-Wl,--emit-relocs,-znow` to `LDFLAGS`.
# 2. Add these commands after `build.sh` PGO build:
# ```sh
# perf record -e cycles:u -j any,u -o SolLevante/perf.data -- Bin/Release/SvtAv1EncApp -i SolLevante/SolLevante.y4m -b /dev/null --preset 2 --crf 20.00 --lineart-psy-bias 5 --texture-psy-bias 5
# perf2bolt -p SolLevante/perf.data -o SolLevante/perf.fdata Bin/Release/SvtAv1EncApp
# llvm-bolt Bin/Release/SvtAv1EncApp -o Bin/Release/SvtAv1EncApp.bolt -data=SolLevante/perf.fdata --relocs --remove-symtab --eliminate-unreachable --hugify --align-blocks --reorder-blocks=ext-tsp --reorder-functions-use-hot-size --use-edge-counts --min-branch-clusters --split-functions --split-strategy=profile2 --split-eh --split-all-cold --frame-opt=all --frame-opt-rm-stores --reg-reassign --use-aggr-reg-reassign --inline-memcpy --inline-ap --shorten-instructions --infer-fall-throughs --infer-stale-profile --equalize-bb-counts --iterative-guess --indirect-call-promotion=all --indirect-call-promotion-use-mispredicts --icp-eliminate-loads --jump-tables=aggressive --simplify-rodata-loads --plt=all --icf=1 --peepholes=all --eliminate-unreachable --elim-link-veneers --group-stubs --fix-block-counts --fix-func-counts --match-profile-with-function-hash --match-with-call-graph --use-compact-aligner --preserve-blocks-alignment --x86-align-branch-boundary-hot-only --x86-strip-redundant-address-size --tail-duplication=cache --simplify-conditional-tail-calls --sctc-mode=heuristic --dyno-stats --icp-mp-threshold=1
# ```


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
