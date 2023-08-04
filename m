Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7FD7707A6
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Aug 2023 20:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjHDSO5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Aug 2023 14:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjHDSOz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Aug 2023 14:14:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746A449C3;
        Fri,  4 Aug 2023 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691172893; x=1722708893;
  h=date:from:to:cc:subject:message-id;
  bh=JUSvYJ2K8nncmg9Wp0d1aynk9GTCLWeItxuyiq5YkrY=;
  b=UWWHYGiWf26UMVqJtEHSi8nYx0pJxe9sYPS5cIfifAJu2U4LTDE72H9L
   stRK5tXpQq1pJJn+I4r/9ASwUMwIp/yJlaiqKW9OdMENJDzOVrSzbYTgV
   gqcdnjdrhXTotEHFedsnACpP25JDwCopVSTMav+AkB9ioz7+JG+Zo5RBe
   umUqDJvC+a7JFlY1ErLqJQ2y1AxENI2q54OZipA4OQv36iMgDahxkKMTf
   uVwGb1qjXnAzv9nM6CqvbV/Wy51TJWVqZ6ow2k5VcUKEhbRCcuvfboV9F
   iDIc2OAjFTqFX51mkB5T1E1nC5/dWPhNQtdYUjrKMvPkDxSXoLnsWgxpq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="434064037"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="434064037"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 11:14:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="759674890"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="759674890"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2023 11:14:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qRzJz-000326-1a;
        Fri, 04 Aug 2023 18:14:43 +0000
Date:   Sat, 05 Aug 2023 02:14:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 bdffb18b5dd8071cd25685b966f380a30b1fadaa
Message-ID: <202308050257.dIHeWjtZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: bdffb18b5dd8071cd25685b966f380a30b1fadaa  Add linux-next specific files for 20230804

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307181450.sfbuvMf5-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307281049.40t8s0uv-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307301850.i9xFNWT6-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308041501.2T8kM1gb-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive type "c:namespace-push".
Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".
Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
drivers/regulator/max77857-regulator.c:56:24: warning: cast to smaller integer type 'enum max77857_id' from 'void *' [-Wvoid-pointer-to-enum-cast]
kernel/watchdog.c:111:12: warning: 'hardlockup_all_cpu_backtrace_proc_handler' defined but not used [-Wunused-function]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/rtc/rtc-pcf2127.c:1063 pcf2127_enable_ts() warn: missing error code? 'ret'
drivers/tty/serial/8250/8250_men_mcb.c:226 serial_8250_men_mcb_probe() warn: unsigned 'data->line[i]' is never less than zero.
sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:573: Error: pcrel too far

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-m021-20230730
|   |-- drivers-rtc-rtc-pcf2127.c-pcf2127_enable_ts()-warn:missing-error-code-ret
|   `-- drivers-tty-serial-8250_men_mcb.c-serial_8250_men_mcb_probe()-warn:unsigned-data-line-i-is-never-less-than-zero.
|-- i386-randconfig-r073-20230802
|   `-- kernel-watchdog.c:warning:hardlockup_all_cpu_backtrace_proc_handler-defined-but-not-used
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- sh-allmodconfig
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
|-- x86_64-allnoconfig
|   |-- Documentation-gpu-rfc-i915_scheduler.rst:WARNING:Unknown-directive-type-c:namespace-pop-.
|   |-- Documentation-gpu-rfc-i915_scheduler.rst:WARNING:Unknown-directive-type-c:namespace-push-.
|   `-- Warning:kernel-Kconfig.kexec-references-a-file-that-doesn-t-exist:file:Documentation-s390-zfcpdump.rst
|-- x86_64-randconfig-m001-20230730
|   `-- drivers-tty-serial-8250_men_mcb.c-serial_8250_men_mcb_probe()-warn:unsigned-data-line-i-is-never-less-than-zero.
`-- x86_64-randconfig-x012-20230731
    `-- kernel-watchdog.c:warning:hardlockup_all_cpu_backtrace_proc_handler-defined-but-not-used
clang_recent_errors
|-- mips-cavium_octeon_defconfig
|   `-- clang:error:unknown-argument:msym32
`-- riscv-randconfig-r021-20230731
    `-- drivers-regulator-max77857-regulator.c:warning:cast-to-smaller-integer-type-enum-max77857_id-from-void

elapsed time: 782m

configs tested: 127
configs skipped: 3

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230803   gcc  
arc                  randconfig-r026-20230731   gcc  
arc                  randconfig-r033-20230731   gcc  
arc                  randconfig-r043-20230731   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                  randconfig-r024-20230731   gcc  
arm                  randconfig-r046-20230731   gcc  
arm                           sama7_defconfig   clang
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230803   clang
csky                                defconfig   gcc  
hexagon              randconfig-r003-20230731   clang
hexagon              randconfig-r041-20230731   clang
hexagon              randconfig-r045-20230731   clang
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230801   gcc  
i386                 randconfig-i002-20230801   gcc  
i386                 randconfig-i003-20230801   gcc  
i386                 randconfig-i004-20230801   gcc  
i386                 randconfig-i005-20230801   gcc  
i386                 randconfig-i006-20230801   gcc  
i386                 randconfig-i011-20230731   clang
i386                 randconfig-i012-20230731   clang
i386                 randconfig-i013-20230731   clang
i386                 randconfig-i014-20230731   clang
i386                 randconfig-i015-20230731   clang
i386                 randconfig-i016-20230731   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze           randconfig-r025-20230731   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                 randconfig-r022-20230731   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r035-20230731   gcc  
nios2                randconfig-r036-20230731   gcc  
openrisc             randconfig-r012-20230803   gcc  
openrisc             randconfig-r016-20230803   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230731   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r004-20230731   gcc  
powerpc                     tqm8548_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230731   gcc  
riscv                randconfig-r021-20230731   clang
riscv                randconfig-r042-20230731   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r034-20230731   gcc  
s390                 randconfig-r044-20230731   clang
sh                               allmodconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                   randconfig-r005-20230731   gcc  
sh                          sdk7780_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230731   gcc  
sparc                randconfig-r015-20230803   gcc  
sparc64              randconfig-r001-20230731   gcc  
sparc64              randconfig-r011-20230803   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x011-20230731   gcc  
x86_64               randconfig-x012-20230731   gcc  
x86_64               randconfig-x013-20230731   gcc  
x86_64               randconfig-x014-20230731   gcc  
x86_64               randconfig-x015-20230731   gcc  
x86_64               randconfig-x016-20230731   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
