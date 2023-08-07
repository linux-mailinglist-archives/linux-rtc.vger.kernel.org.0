Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A85772DC7
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Aug 2023 20:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjHGSXm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Aug 2023 14:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjHGSXh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Aug 2023 14:23:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262271FCE;
        Mon,  7 Aug 2023 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691432586; x=1722968586;
  h=date:from:to:cc:subject:message-id;
  bh=2DgVD2YvnzYf2SL/zG7f5FwCph5doUeAjz6JPSbtOOg=;
  b=LT9MAyVcfDtIFbddTySdCQUDC8pdgrlwkT+GZf2eypYMqHJDyIqVhPMa
   NY2aWEDRRwMSg+e3xnJd+0n2ZDNz+hX2F7RustqgSi8ojF6JRXZfrhLQX
   er54WzAC+v5zL6xm4/BPW924NZ1mKZ22lLFcmrFaSGqc937NXQQpDayXE
   JmkgSNB64QEDBbXywP9r5biPbhETOnjxvuAAEWJheeKzBWiL4Xz/si3bC
   HiZvDb5VtVEq6B6Dq7L98ui3AUQqlyQwWX5UFRKEdEIVJNac1B+DrvrW0
   yxr651tgrpgbuSuXAQ8KfeustNEwtk3EnnMleC8gspdrRp4RQdlq9VfMj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369516682"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="369516682"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 11:22:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796407467"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="796407467"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2023 11:22:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qT4rn-0004oF-11;
        Mon, 07 Aug 2023 18:22:07 +0000
Date:   Tue, 08 Aug 2023 02:21:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 f7dc24b3413851109c4047b22997bd0d95ed52a2
Message-ID: <202308080207.HeQl4uz9-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: f7dc24b3413851109c4047b22997bd0d95ed52a2  Add linux-next specific files for 20230807

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
ld.lld: error: undefined symbol: rz_mtu3_16bit_ch_read
ld.lld: error: undefined symbol: rz_mtu3_16bit_ch_write
ld.lld: error: undefined symbol: rz_mtu3_32bit_ch_read
ld.lld: error: undefined symbol: rz_mtu3_32bit_ch_write
ld.lld: error: undefined symbol: rz_mtu3_8bit_ch_read
ld.lld: error: undefined symbol: rz_mtu3_8bit_ch_write
ld.lld: error: undefined symbol: rz_mtu3_disable
ld.lld: error: undefined symbol: rz_mtu3_enable
ld.lld: error: undefined symbol: rz_mtu3_is_enabled
ld.lld: error: undefined symbol: rz_mtu3_shared_reg_read
ld.lld: error: undefined symbol: rz_mtu3_shared_reg_update_bit

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/mtd/nand/raw/qcom_nandc.c:2590 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
drivers/mtd/nand/raw/qcom_nandc.c:3017 qcom_check_op() warn: was && intended here instead of ||?
drivers/rtc/rtc-pcf2127.c:1063 pcf2127_enable_ts() warn: missing error code? 'ret'
mm/khugepaged.c:2138 collapse_file() warn: variable dereferenced before check 'cc' (see line 1787)
sh4-linux-gcc: internal compiler error: Segmentation fault signal terminated program cc1
{standard input}: Warning: end of file not at end of a line; newline inserted
{standard input}:927: Error: pcrel too far

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-randconfig-m031-20230807
|   |-- drivers-mtd-nand-raw-qcom_nandc.c-qcom_check_op()-warn:was-intended-here-instead-of
|   |-- drivers-mtd-nand-raw-qcom_nandc.c-qcom_op_cmd_mapping()-error:uninitialized-symbol-ret-.
|   |-- drivers-rtc-rtc-pcf2127.c-pcf2127_enable_ts()-warn:missing-error-code-ret
|   `-- mm-khugepaged.c-collapse_file()-warn:variable-dereferenced-before-check-cc-(see-line-)
|-- i386-randconfig-m021-20230807
|   `-- drivers-rtc-rtc-pcf2127.c-pcf2127_enable_ts()-warn:missing-error-code-ret
|-- loongarch-allmodconfig
|   `-- lib-gcc-loongarch64-linux-..-plugin-include-config-loongarch-loongarch-opts.h:fatal-error:loongarch-def.h:No-such-file-or-directory
`-- sh-allmodconfig
    |-- sh4-linux-gcc:internal-compiler-error:Segmentation-fault-signal-terminated-program-cc1
    |-- standard-input:Error:pcrel-too-far
    `-- standard-input:Warning:end-of-file-not-at-end-of-a-line-newline-inserted
clang_recent_errors
`-- riscv-randconfig-r015-20230807
    |-- ld.lld:error:undefined-symbol:rz_mtu3_16bit_ch_read
    |-- ld.lld:error:undefined-symbol:rz_mtu3_16bit_ch_write
    |-- ld.lld:error:undefined-symbol:rz_mtu3_32bit_ch_read
    |-- ld.lld:error:undefined-symbol:rz_mtu3_32bit_ch_write
    |-- ld.lld:error:undefined-symbol:rz_mtu3_8bit_ch_read
    |-- ld.lld:error:undefined-symbol:rz_mtu3_8bit_ch_write
    |-- ld.lld:error:undefined-symbol:rz_mtu3_disable
    |-- ld.lld:error:undefined-symbol:rz_mtu3_enable
    |-- ld.lld:error:undefined-symbol:rz_mtu3_is_enabled
    |-- ld.lld:error:undefined-symbol:rz_mtu3_shared_reg_read
    `-- ld.lld:error:undefined-symbol:rz_mtu3_shared_reg_update_bit

elapsed time: 733m

configs tested: 127
configs skipped: 8

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230807   gcc  
alpha                randconfig-r015-20230807   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230807   gcc  
arc                  randconfig-r012-20230807   gcc  
arc                  randconfig-r043-20230807   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230807   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230807   clang
arm64                randconfig-r016-20230807   clang
arm64                randconfig-r035-20230807   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230807   gcc  
csky                 randconfig-r023-20230807   gcc  
csky                 randconfig-r033-20230807   gcc  
csky                 randconfig-r034-20230807   gcc  
csky                 randconfig-r036-20230807   gcc  
hexagon              randconfig-r002-20230807   clang
hexagon              randconfig-r006-20230807   clang
hexagon              randconfig-r041-20230807   clang
hexagon              randconfig-r045-20230807   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230807   gcc  
i386         buildonly-randconfig-r005-20230807   gcc  
i386         buildonly-randconfig-r006-20230807   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230807   gcc  
i386                 randconfig-i002-20230807   gcc  
i386                 randconfig-i003-20230807   gcc  
i386                 randconfig-i004-20230807   gcc  
i386                 randconfig-i005-20230807   gcc  
i386                 randconfig-i006-20230807   gcc  
i386                 randconfig-i011-20230807   clang
i386                 randconfig-i012-20230807   clang
i386                 randconfig-i013-20230807   clang
i386                 randconfig-i014-20230807   clang
i386                 randconfig-i015-20230807   clang
i386                 randconfig-i016-20230807   clang
i386                 randconfig-r005-20230807   gcc  
i386                 randconfig-r025-20230807   clang
i386                 randconfig-r035-20230807   gcc  
i386                 randconfig-r036-20230807   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230807   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230807   gcc  
nios2                randconfig-r012-20230807   gcc  
nios2                randconfig-r026-20230807   gcc  
openrisc             randconfig-r024-20230807   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230807   gcc  
parisc               randconfig-r034-20230807   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r004-20230807   gcc  
powerpc              randconfig-r005-20230807   gcc  
powerpc              randconfig-r023-20230807   clang
powerpc              randconfig-r026-20230807   clang
powerpc              randconfig-r033-20230807   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230807   clang
riscv                randconfig-r032-20230807   gcc  
riscv                randconfig-r042-20230807   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r031-20230807   gcc  
s390                 randconfig-r044-20230807   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r021-20230807   gcc  
sh                   randconfig-r022-20230807   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r032-20230807   gcc  
sparc64              randconfig-r011-20230807   gcc  
sparc64              randconfig-r016-20230807   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r031-20230807   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230807   gcc  
x86_64       buildonly-randconfig-r002-20230807   gcc  
x86_64       buildonly-randconfig-r003-20230807   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r004-20230807   gcc  
x86_64               randconfig-r022-20230807   clang
x86_64               randconfig-x001-20230807   clang
x86_64               randconfig-x002-20230807   clang
x86_64               randconfig-x003-20230807   clang
x86_64               randconfig-x004-20230807   clang
x86_64               randconfig-x005-20230807   clang
x86_64               randconfig-x006-20230807   clang
x86_64               randconfig-x011-20230807   gcc  
x86_64               randconfig-x012-20230807   gcc  
x86_64               randconfig-x013-20230807   gcc  
x86_64               randconfig-x014-20230807   gcc  
x86_64               randconfig-x015-20230807   gcc  
x86_64               randconfig-x016-20230807   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r013-20230807   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
