Return-Path: <linux-rtc+bounces-1690-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5FD95ABD9
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 05:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 970DA1F2341C
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 03:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DD9210E4;
	Thu, 22 Aug 2024 03:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXT8oNhJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34F1BC40;
	Thu, 22 Aug 2024 03:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724297124; cv=none; b=Exj6wN46J8+OLfVOmPqCs7QqmnM5dISaG9e3PGcR9euhQSgU7O/yYzynaMxyinTCZEbuiGCry5YzdWiwnPyqo2GUdA36lxXPD3ByQMsLb6LGQKNVJXpcmdPG9DWhVOOaCiUhg2G7qM1j6SlGviZaMJmT1PxmYdNimhSE6vYTmM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724297124; c=relaxed/simple;
	bh=esZ6NAq/HC6g4M5WKQLz3OUwy8Jh0acbAV9hwUelQws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTWN2bfGie+lCcSl0OcehfCxaW0piaLm98ZqO42N/UPNJmMSp0kFP2kNUQ1D7xSF0a64C/EZkdIxKpbv3RmPVO8i+jgcisciA5FYOn6TDf6ihIWUCJlL6mOywJ1NrfFmdTFK6jFxUTPWCvjidGRQIGkYA/fElzFjcO2OlGBLAgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXT8oNhJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724297122; x=1755833122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=esZ6NAq/HC6g4M5WKQLz3OUwy8Jh0acbAV9hwUelQws=;
  b=XXT8oNhJcmg6aLpX9rTBQHWZdxZJ4aHmPnQDIeJJ190czMdj//SdzAlN
   Prk6TdjoLbXNXbJ+H+rffW7GcYiGeCstzQygYpktUBmAyG0RgmfAuhpNa
   +8fCEq3QD4AddKkl5Jp2HMEPmMuBp2hLBBclfV/POlqCBK7SVkKitjZtr
   DH+4xYbRTnoGJUr+MBM8+b7lrJem9fnNeKhc4VSFB3Q6tiOfs8rNKVJHt
   lgUIhSU79K/V9y+AMYiTi+ZEjSqP7rhAJpsQOb0pdunSbTq92xXC3sPOH
   OJiGYPpFhSsiVCDNh9MPlOIce3qr7OKws9ArfFQ3wVq7VQoCQ2UdeAD6k
   g==;
X-CSE-ConnectionGUID: 0WZZsRDAT1+4B+wgwioQew==
X-CSE-MsgGUID: /htw6Cl2SrOcdgDho9+yxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13145924"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="13145924"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 20:25:19 -0700
X-CSE-ConnectionGUID: 1/9Hkk3pQNG3y6w4Sq70UQ==
X-CSE-MsgGUID: VNDNaTxETiWLngYlPf3Tdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61288489"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Aug 2024 20:25:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgyRm-000CEW-2k;
	Thu, 22 Aug 2024 03:25:14 +0000
Date: Thu, 22 Aug 2024 11:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>, alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Message-ID: <202408221124.2hKATpa8-lkp@intel.com>
References: <20240821092846.20138-2-liaoyuanhong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821092846.20138-2-liaoyuanhong@vivo.com>

Hi Liao,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on tegra/for-next linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liao-Yuanhong/rtc-rtc-at91rm9200-Use-devm_clk_get_enabled-helpers/20240821-190257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240821092846.20138-2-liaoyuanhong%40vivo.com
patch subject: [PATCH 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240822/202408221124.2hKATpa8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221124.2hKATpa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221124.2hKATpa8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-at91rm9200.c: In function 'at91_rtc_probe':
   drivers/rtc/rtc-at91rm9200.c:473:13: warning: unused variable 'ret' [-Wunused-variable]
     473 |         int ret = 0;
         |             ^~~
   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from drivers/rtc/rtc-at91rm9200.c:20:
   drivers/rtc/rtc-at91rm9200.c: At top level:
>> arch/m68k/include/asm/raw_io.h:34:27: error: expected identifier or '(' before 'void'
      34 | #define out_le32(addr,l) (void)((*(__force volatile __le32 *) (unsigned long)(addr)) = cpu_to_le32(l))
         |                           ^~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   arch/m68k/include/asm/io_mm.h:398:33: note: in expansion of macro 'writel'
     398 | #define writel_relaxed(b, addr) writel(b, addr)
         |                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:506:9: note: in expansion of macro 'at91_rtc_write'
     506 |         at91_rtc_write(AT91_RTC_CR, 0);
         |         ^~~~~~~~~~~~~~
>> arch/m68k/include/asm/raw_io.h:34:27: error: expected identifier or '(' before 'void'
      34 | #define out_le32(addr,l) (void)((*(__force volatile __le32 *) (unsigned long)(addr)) = cpu_to_le32(l))
         |                           ^~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   arch/m68k/include/asm/io_mm.h:398:33: note: in expansion of macro 'writel'
     398 | #define writel_relaxed(b, addr) writel(b, addr)
         |                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/m68k/include/uapi/asm/byteorder.h:5,
                    from include/linux/bitfield.h:11,
                    from drivers/rtc/rtc-at91rm9200.c:17:
>> arch/m68k/include/asm/raw_io.h:28:95: error: expected identifier or '(' before ')' token
      28 |     ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
         |                                                                                               ^
   include/uapi/linux/swab.h:118:38: note: in definition of macro '__swab32'
     118 |         (__u32)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   arch/m68k/include/asm/io_mm.h:398:33: note: in expansion of macro 'writel'
     398 | #define writel_relaxed(b, addr) writel(b, addr)
         |                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   arch/m68k/include/asm/io_mm.h:394:33: note: in expansion of macro 'readl'
     394 | #define readl_relaxed(addr)     readl(addr)
         |                                 ^~~~~
   drivers/rtc/rtc-at91rm9200.c:87:9: note: in expansion of macro 'readl_relaxed'
      87 |         readl_relaxed(at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:37: note: in expansion of macro 'at91_rtc_read'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |                                     ^~~~~~~~~~~~~
>> arch/m68k/include/asm/raw_io.h:28:95: error: expected identifier or '(' before ')' token
      28 |     ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
         |                                                                                               ^
   include/uapi/linux/swab.h:19:19: note: in definition of macro '___constant_swab32'
      19 |         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   arch/m68k/include/asm/io_mm.h:398:33: note: in expansion of macro 'writel'
     398 | #define writel_relaxed(b, addr) writel(b, addr)
         |                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   arch/m68k/include/asm/io_mm.h:394:33: note: in expansion of macro 'readl'
     394 | #define readl_relaxed(addr)     readl(addr)
         |                                 ^~~~~
   drivers/rtc/rtc-at91rm9200.c:87:9: note: in expansion of macro 'readl_relaxed'
      87 |         readl_relaxed(at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:37: note: in expansion of macro 'at91_rtc_read'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |                                     ^~~~~~~~~~~~~
>> arch/m68k/include/asm/raw_io.h:28:95: error: expected identifier or '(' before ')' token
      28 |     ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
         |                                                                                               ^
   include/uapi/linux/swab.h:20:19: note: in definition of macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   arch/m68k/include/asm/io_mm.h:398:33: note: in expansion of macro 'writel'
     398 | #define writel_relaxed(b, addr) writel(b, addr)
         |                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   arch/m68k/include/asm/io_mm.h:394:33: note: in expansion of macro 'readl'
     394 | #define readl_relaxed(addr)     readl(addr)
         |                                 ^~~~~
   drivers/rtc/rtc-at91rm9200.c:87:9: note: in expansion of macro 'readl_relaxed'
      87 |         readl_relaxed(at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:37: note: in expansion of macro 'at91_rtc_read'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |                                     ^~~~~~~~~~~~~
>> arch/m68k/include/asm/raw_io.h:28:95: error: expected identifier or '(' before ')' token
      28 |     ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
         |                                                                                               ^
   include/uapi/linux/swab.h:21:19: note: in definition of macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   arch/m68k/include/asm/io_mm.h:398:33: note: in expansion of macro 'writel'
     398 | #define writel_relaxed(b, addr) writel(b, addr)
         |                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   arch/m68k/include/asm/io_mm.h:394:33: note: in expansion of macro 'readl'
     394 | #define readl_relaxed(addr)     readl(addr)
         |                                 ^~~~~
   drivers/rtc/rtc-at91rm9200.c:87:9: note: in expansion of macro 'readl_relaxed'
      87 |         readl_relaxed(at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:37: note: in expansion of macro 'at91_rtc_read'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |                                     ^~~~~~~~~~~~~
>> arch/m68k/include/asm/raw_io.h:28:95: error: expected identifier or '(' before ')' token
      28 |     ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
         |                                                                                               ^
   include/uapi/linux/swab.h:22:19: note: in definition of macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   include/uapi/linux/byteorder/big_endian.h:34:43: note: in expansion of macro '__swab32'
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   arch/m68k/include/asm/io_mm.h:398:33: note: in expansion of macro 'writel'
     398 | #define writel_relaxed(b, addr) writel(b, addr)
         |                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   arch/m68k/include/asm/io_mm.h:394:33: note: in expansion of macro 'readl'
     394 | #define readl_relaxed(addr)     readl(addr)
         |                                 ^~~~~
   drivers/rtc/rtc-at91rm9200.c:87:9: note: in expansion of macro 'readl_relaxed'
      87 |         readl_relaxed(at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:37: note: in expansion of macro 'at91_rtc_read'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |                                     ^~~~~~~~~~~~~
>> arch/m68k/include/asm/raw_io.h:28:95: error: expected identifier or '(' before ')' token
      28 |     ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
         |                                                                                               ^
   include/uapi/linux/swab.h:120:19: note: in definition of macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:373:26: note: in expansion of macro 'out_le32'
     373 | #define writel(val,addr) out_le32((addr),(val))
         |                          ^~~~~~~~
   arch/m68k/include/asm/io_mm.h:398:33: note: in expansion of macro 'writel'
     398 | #define writel_relaxed(b, addr) writel(b, addr)
         |                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:372:26: note: in expansion of macro 'in_le32'
     372 | #define readl(addr)      in_le32(addr)
         |                          ^~~~~~~
   arch/m68k/include/asm/io_mm.h:394:33: note: in expansion of macro 'readl'
     394 | #define readl_relaxed(addr)     readl(addr)
         |                                 ^~~~~
   drivers/rtc/rtc-at91rm9200.c:87:9: note: in expansion of macro 'readl_relaxed'
      87 |         readl_relaxed(at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:37: note: in expansion of macro 'at91_rtc_read'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |                                     ^~~~~~~~~~~~~
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/rtc/rtc-at91rm9200.c:18:
   include/vdso/bits.h:7:33: error: expected declaration specifiers or '...' before '(' token
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/rtc/rtc-at91rm9200.c:66:41: note: in expansion of macro 'BIT'
      66 | #define         AT91_RTC_ACKUPD         BIT(0)          /* Acknowledge for Update */
         |                                         ^~~
   drivers/rtc/rtc-at91rm9200.c:510:28: note: in expansion of macro 'AT91_RTC_ACKUPD'
     510 |         at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
         |                            ^~~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:514:9: warning: data definition has no type or storage class
     514 |         ret = devm_request_irq(&pdev->dev, irq, at91_rtc_interrupt,
         |         ^~~
   drivers/rtc/rtc-at91rm9200.c:514:9: error: type defaults to 'int' in declaration of 'ret' [-Wimplicit-int]
   drivers/rtc/rtc-at91rm9200.c:514:33: error: 'pdev' undeclared here (not in a function); did you mean 'cdev'?
     514 |         ret = devm_request_irq(&pdev->dev, irq, at91_rtc_interrupt,
         |                                 ^~~~
         |                                 cdev
   drivers/rtc/rtc-at91rm9200.c:517:9: error: expected identifier or '(' before 'if'
     517 |         if (ret) {
         |         ^~
   drivers/rtc/rtc-at91rm9200.c:525:9: error: expected identifier or '(' before 'if'
     525 |         if (!device_can_wakeup(&pdev->dev))
         |         ^~
   drivers/rtc/rtc-at91rm9200.c:528:9: error: expected identifier or '(' before 'if'
     528 |         if (at91_rtc_config->has_correction)
         |         ^~
   drivers/rtc/rtc-at91rm9200.c:530:9: error: expected identifier or '(' before 'else'
     530 |         else
         |         ^~~~
   drivers/rtc/rtc-at91rm9200.c:533:12: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
     533 |         rtc->range_min = RTC_TIMESTAMP_BEGIN_1900;
         |            ^~
   drivers/rtc/rtc-at91rm9200.c:534:12: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
     534 |         rtc->range_max = RTC_TIMESTAMP_END_2099;
         |            ^~
   drivers/rtc/rtc-at91rm9200.c:535:9: warning: data definition has no type or storage class
     535 |         ret = devm_rtc_register_device(rtc);
         |         ^~~
   drivers/rtc/rtc-at91rm9200.c:535:9: error: type defaults to 'int' in declaration of 'ret' [-Wimplicit-int]
   drivers/rtc/rtc-at91rm9200.c:535:9: error: redefinition of 'ret'
   drivers/rtc/rtc-at91rm9200.c:514:9: note: previous definition of 'ret' with type 'int'
     514 |         ret = devm_request_irq(&pdev->dev, irq, at91_rtc_interrupt,
         |         ^~~
   In file included from drivers/rtc/rtc-at91rm9200.c:27:
   drivers/rtc/rtc-at91rm9200.c:535:40: error: 'rtc' undeclared here (not in a function)
     535 |         ret = devm_rtc_register_device(rtc);
         |                                        ^~~
   include/linux/rtc.h:246:49: note: in definition of macro 'devm_rtc_register_device'
     246 |         __devm_rtc_register_device(THIS_MODULE, device)
         |                                                 ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:536:9: error: expected identifier or '(' before 'if'
     536 |         if (ret)
         |         ^~
   include/vdso/bits.h:7:33: error: expected declaration specifiers or '...' before '(' token
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/rtc/rtc-at91rm9200.c:68:41: note: in expansion of macro 'BIT'
      68 | #define         AT91_RTC_SECEV          BIT(2)          /* Second Event */
         |                                         ^~~
   drivers/rtc/rtc-at91rm9200.c:542:28: note: in expansion of macro 'AT91_RTC_SECEV'
     542 |         at91_rtc_write_ier(AT91_RTC_SECEV);
         |                            ^~~~~~~~~~~~~~
   In file included from include/linux/device.h:15,


vim +34 arch/m68k/include/asm/raw_io.h

^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  15  
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  16  /* ++roman: The assignments to temp. vars avoid that gcc sometimes generates
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  17   * two accesses to memory, which may be undesirable for some devices.
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  18   */
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  19  #define in_8(addr) \
c7db3832ff19a9 arch/m68k/include/asm/raw_io.h Arnd Bergmann  2023-09-25  20      ({ u8 __v = (*(__force const volatile u8 *) (unsigned long)(addr)); __v; })
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  21  #define in_be16(addr) \
c7db3832ff19a9 arch/m68k/include/asm/raw_io.h Arnd Bergmann  2023-09-25  22      ({ u16 __v = (*(__force const volatile u16 *) (unsigned long)(addr)); __v; })
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  23  #define in_be32(addr) \
c7db3832ff19a9 arch/m68k/include/asm/raw_io.h Arnd Bergmann  2023-09-25  24      ({ u32 __v = (*(__force const volatile u32 *) (unsigned long)(addr)); __v; })
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  25  #define in_le16(addr) \
c7db3832ff19a9 arch/m68k/include/asm/raw_io.h Arnd Bergmann  2023-09-25  26      ({ u16 __v = le16_to_cpu(*(__force const volatile __le16 *) (unsigned long)(addr)); __v; })
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  27  #define in_le32(addr) \
c7db3832ff19a9 arch/m68k/include/asm/raw_io.h Arnd Bergmann  2023-09-25 @28      ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  29  
b1a89856fbf63f arch/m68k/include/asm/raw_io.h Guenter Roeck  2021-09-06  30  #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
b1a89856fbf63f arch/m68k/include/asm/raw_io.h Guenter Roeck  2021-09-06  31  #define out_be16(addr,w) (void)((*(__force volatile u16 *) (unsigned long)(addr)) = (w))
b1a89856fbf63f arch/m68k/include/asm/raw_io.h Guenter Roeck  2021-09-06  32  #define out_be32(addr,l) (void)((*(__force volatile u32 *) (unsigned long)(addr)) = (l))
b1a89856fbf63f arch/m68k/include/asm/raw_io.h Guenter Roeck  2021-09-06  33  #define out_le16(addr,w) (void)((*(__force volatile __le16 *) (unsigned long)(addr)) = cpu_to_le16(w))
b1a89856fbf63f arch/m68k/include/asm/raw_io.h Guenter Roeck  2021-09-06 @34  #define out_le32(addr,l) (void)((*(__force volatile __le32 *) (unsigned long)(addr)) = cpu_to_le32(l))
^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds 2005-04-16  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

