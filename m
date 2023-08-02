Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF2776D474
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Aug 2023 18:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjHBQ7c (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Aug 2023 12:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbjHBQ7a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Aug 2023 12:59:30 -0400
Received: from mgamail.intel.com (unknown [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BF31981;
        Wed,  2 Aug 2023 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690995569; x=1722531569;
  h=date:from:to:cc:subject:message-id;
  bh=YAa8C+9fXldrfDuD79ReT82liqUqtGAj2Rws1MSR5qU=;
  b=LylDWaEpQ0brcW9j/DfMb7UkWieH9RQ6yW2P9HwacIDk/BmJegHo10Lp
   yNxHscKGbeqKpNobsmV22jYBZ6iocx5hjKPKg/QJZddUW0m+fZTQv4POg
   eWuF5YIosNLWTyC2hl89L5MfXpAMmAaJf25NyjuaD0rlrj8YLXq194ahc
   UNKKLFrlWH41b/AnCV4bDAF/b3HjdwmkZuySHong6VryTaMSEwzmZ8Ltb
   wqf2U2EirPc+7l6KHnUHlBhjj6AH1AO61702I8+8E6dwBbt1NoYW/M8kI
   sDdPo46RTXId06j+0wAY+iemn7hZi+MHoo2rVWGOk4P3nBArIKYIlqqAD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368545393"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="368545393"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 09:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="729203842"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="729203842"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Aug 2023 09:59:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qRFC1-0001M3-1c;
        Wed, 02 Aug 2023 16:59:25 +0000
Date:   Thu, 03 Aug 2023 00:58:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 626c67169f9972fffcdf3bc3864de421f162ebf5
Message-ID: <202308030044.0cNCiDHF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 626c67169f9972fffcdf3bc3864de421f162ebf5  Add linux-next specific files for 20230802

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307281049.40t8s0uv-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202307301850.i9xFNWT6-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308022221.APCRi7vk-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive type "c:namespace-push".
Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".
Documentation/gpu/todo.rst:469: WARNING: Unexpected indentation.
Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/clk/qcom/lcc-msm8960.c:26:24: sparse: sparse: symbol 'pxo_parent_data' was not declared. Should it be static?
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
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
|-- microblaze-randconfig-r073-20230802
|   `-- drivers-clk-qcom-lcc-msm8960.c:sparse:sparse:symbol-pxo_parent_data-was-not-declared.-Should-it-be-static
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

elapsed time: 723m

configs tested: 132
configs skipped: 5

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230731   gcc  
alpha                randconfig-r034-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r001-20230801   gcc  
arc                  randconfig-r036-20230731   gcc  
arc                  randconfig-r043-20230801   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                                 defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                  randconfig-r023-20230731   gcc  
arm                  randconfig-r035-20230731   clang
arm                  randconfig-r046-20230801   gcc  
arm                         socfpga_defconfig   clang
arm                          sp7021_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230731   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230801   gcc  
csky                 randconfig-r032-20230731   gcc  
hexagon              randconfig-r002-20230801   clang
hexagon              randconfig-r004-20230801   clang
hexagon              randconfig-r041-20230801   clang
hexagon              randconfig-r045-20230801   clang
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
i386                 randconfig-r025-20230731   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r016-20230731   gcc  
loongarch            randconfig-r024-20230731   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r005-20230801   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                          malta_defconfig   clang
nios2                               defconfig   gcc  
openrisc                         alldefconfig   gcc  
openrisc             randconfig-r014-20230731   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230731   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc              randconfig-r022-20230731   clang
powerpc              randconfig-r026-20230731   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230801   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230801   clang
sh                               allmodconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r015-20230731   gcc  
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
x86_64               randconfig-r031-20230731   gcc  
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
