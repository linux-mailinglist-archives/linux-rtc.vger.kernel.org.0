Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 825B376F0BB
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Aug 2023 19:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235065AbjHCRez (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Aug 2023 13:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbjHCRev (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Aug 2023 13:34:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F97FE72;
        Thu,  3 Aug 2023 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691084089; x=1722620089;
  h=date:from:to:cc:subject:message-id;
  bh=cpkBoV5sM0Dn+NSFA5wkVQ3j88Jr/EEl0ZyJKbI8VJ4=;
  b=iJFC5jsIz9Lm7vnBmWy/VbqS4oE/OD/4SEl2xYnq78m+cCPi8jBLLXyk
   9Y8/XpJANeiL8DCE/+D1TKyY4mE+crYAkxR+pWoX5cn9Ali1/XNSHei0N
   AJZd+Pk7EXFjjsSI/EtImX0mXBqV0ZCDsA3VDAPRUEJa6JQnWDfAF8M4W
   cxMQMc9kQEdBZSBZg/BnrvfhrvWZD3DCTxsl1Q9VLq+NqvlnIgOwucj60
   4Ui36a0tswLOwYJGQfBH5be+Qm5kN+aww474TYF02eikebzZDevs+grox
   ww03ughZgcGiVokZM3NwpwyIqXwwdHZDQ0zUDXzDrSWSnI0CUJZ0vF7TK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="433799184"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="433799184"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 10:34:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759218574"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="759218574"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Aug 2023 10:34:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qRcDj-0002G3-2K;
        Thu, 03 Aug 2023 17:34:43 +0000
Date:   Fri, 04 Aug 2023 01:34:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 fb4327106e5250ee360d0d8b056c1eef7eeb9a98
Message-ID: <202308040141.gUjtZ32J-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: fb4327106e5250ee360d0d8b056c1eef7eeb9a98  Add linux-next specific files for 20230803

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307281049.40t8s0uv-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307301850.i9xFNWT6-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308022221.APCRi7vk-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308031810.pQzGmR1v-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive type "c:namespace-push".
Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".
Documentation/gpu/todo.rst:469: WARNING: Unexpected indentation.
Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
arm-linux-gnueabi-ld: storage.c:(.text+0x27c): undefined reference to `__brelse'
arm-linux-gnueabi-ld: storage.c:(.text+0x9c): undefined reference to `__bread_gfp'
storage.c:(.text+0x22c): undefined reference to `__bread_gfp'
storage.c:(.text+0x64): undefined reference to `__brelse'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
drivers/mtd/nand/raw/qcom_nandc.c:3369 qcom_check_op() warn: was && intended here instead of ||?
drivers/rtc/rtc-pcf2127.c:1063 pcf2127_enable_ts() warn: missing error code? 'ret'
drivers/tty/serial/8250/8250_men_mcb.c:226 serial_8250_men_mcb_probe() warn: unsigned 'data->line[i]' is never less than zero.
sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:573: Error: pcrel too far

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-gemini_defconfig
|   |-- arm-linux-gnueabi-ld:storage.c:(.text):undefined-reference-to-__bread_gfp
|   |-- arm-linux-gnueabi-ld:storage.c:(.text):undefined-reference-to-__brelse
|   |-- storage.c:(.text):undefined-reference-to-__bread_gfp
|   `-- storage.c:(.text):undefined-reference-to-__brelse
|-- i386-randconfig-m021-20230730
|   |-- drivers-rtc-rtc-pcf2127.c-pcf2127_enable_ts()-warn:missing-error-code-ret
|   `-- drivers-tty-serial-8250_men_mcb.c-serial_8250_men_mcb_probe()-warn:unsigned-data-line-i-is-never-less-than-zero.
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- riscv-randconfig-m031-20230730
|   |-- drivers-mtd-nand-raw-qcom_nandc.c-qcom_check_op()-warn:was-intended-here-instead-of
|   `-- drivers-mtd-nand-raw-qcom_nandc.c-qcom_op_cmd_mapping()-error:uninitialized-symbol-ret-.
|-- sh-allmodconfig
|   |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
|   |-- standard-input:Error:pcrel-too-far
|   `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
|-- x86_64-allnoconfig
|   |-- Documentation-gpu-rfc-i915_scheduler.rst:WARNING:Unknown-directive-type-c:namespace-pop-.
|   |-- Documentation-gpu-rfc-i915_scheduler.rst:WARNING:Unknown-directive-type-c:namespace-push-.
|   |-- Documentation-gpu-todo.rst:WARNING:Unexpected-indentation.
|   `-- Warning:kernel-Kconfig.kexec-references-a-file-that-doesn-t-exist:file:Documentation-s390-zfcpdump.rst
`-- x86_64-randconfig-m001-20230730
    `-- drivers-tty-serial-8250_men_mcb.c-serial_8250_men_mcb_probe()-warn:unsigned-data-line-i-is-never-less-than-zero.

elapsed time: 729m

configs tested: 132
configs skipped: 4

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r032-20230803   gcc  
alpha                randconfig-r036-20230803   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230802   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                  randconfig-r004-20230801   clang
arm                  randconfig-r023-20230731   gcc  
arm                  randconfig-r046-20230802   clang
arm                        realview_defconfig   gcc  
arm                        spear3xx_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230801   gcc  
hexagon              randconfig-r016-20230801   clang
hexagon              randconfig-r035-20230803   clang
hexagon              randconfig-r041-20230802   clang
hexagon              randconfig-r045-20230802   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230731   gcc  
i386                 randconfig-i002-20230731   gcc  
i386                 randconfig-i003-20230731   gcc  
i386                 randconfig-i004-20230731   gcc  
i386                 randconfig-i005-20230731   gcc  
i386                 randconfig-i006-20230731   gcc  
i386                 randconfig-i011-20230802   gcc  
i386                 randconfig-i012-20230802   gcc  
i386                 randconfig-i013-20230802   gcc  
i386                 randconfig-i014-20230802   gcc  
i386                 randconfig-i015-20230802   gcc  
i386                 randconfig-i016-20230802   gcc  
i386                 randconfig-r025-20230731   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230731   gcc  
loongarch            randconfig-r031-20230803   gcc  
loongarch            randconfig-r034-20230803   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r005-20230801   gcc  
microblaze           randconfig-r013-20230801   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                 randconfig-r011-20230801   gcc  
mips                          rb532_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230801   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230731   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r014-20230801   clang
powerpc              randconfig-r022-20230731   clang
powerpc              randconfig-r026-20230731   clang
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230802   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230801   clang
s390                 randconfig-r044-20230802   gcc  
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                   randconfig-r006-20230801   gcc  
sh                           se7724_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230801   gcc  
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
