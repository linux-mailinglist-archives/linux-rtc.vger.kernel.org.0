Return-Path: <linux-rtc+bounces-1707-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B67695C8EE
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 11:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D83F02811E3
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 09:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B999114A08F;
	Fri, 23 Aug 2024 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOqxw9zE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA2149002;
	Fri, 23 Aug 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404347; cv=none; b=FuVsFRm8Fn/g+MdukkYDaecG8kiMdtzSqkcE14RtlpCTs6qhWZqQaPQ1/ja1tzu1Yc0M+WcNN9GokX99+Ap7gSTi28JkHLmr3pAP0C2fktGJ4Cqe+HUgydIPnaeHcpIEPv7gJKnLl5+U5ctjGHYa5F/IjBOYDQk43j81A5nJB8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404347; c=relaxed/simple;
	bh=eHJm1q1OOWYK8xxi+RglQ6jSRl5S5FTqCzDh314fzKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaFYORk/CjU4PgVmndKIA2PaNjZKLjRjyTgwqJBQuVzdYF7+NfLHXbr++QsZVRsBhmRLZ58mqEPuvVQS4IxHkbVEDJK1MwmHP/lqCvRyF/VfLfziShNVHNYS35h6RTWQF0BLp01Y0iDtiFpQnssKXOYxUUTU9ftxeuRw/4b6S2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOqxw9zE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724404345; x=1755940345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eHJm1q1OOWYK8xxi+RglQ6jSRl5S5FTqCzDh314fzKI=;
  b=GOqxw9zE0w9OH9u9OenuskQfO+/ilrqgBhQUh9U/ID0SVNPxPb9q9lCw
   jHb2WNAWsm0Z79hY/YZ2ZsFfiyYD9lTu2Fumjwoty7B0FlZrraLrFasAV
   u4nuRUgSDOFcXk4+wSurncFKz+qITa15OPA2A3JHwDx4yCXNvADp9Ln+E
   YL61wDS41w5+ri0FfQD8FogOWh37kVhx0NOAyPhLaERld4w0v26VFp7pu
   r8APYhdo8BDa6lBiJH5Tw+usZqdhsfZNUAdyFuzrhAiTV0kpAzUXxkuhU
   f3IsKzvV4SO1XMq4v4WV5cy3Z1cEeVde/JwpkAu8t2yXzjfk0+jXbRGI4
   A==;
X-CSE-ConnectionGUID: In5zubQwSF65Xkjv3WfH9g==
X-CSE-MsgGUID: Nbzzku6uQoGNHEB+JMCloA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22384862"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="22384862"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 02:12:24 -0700
X-CSE-ConnectionGUID: vxD6szCLRNa+rUFcKl3fQg==
X-CSE-MsgGUID: 8JLwp4AkTVWqEYRrnZgS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="92463441"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Aug 2024 02:12:23 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shQLD-000Dbg-2e;
	Fri, 23 Aug 2024 09:12:19 +0000
Date: Fri, 23 Aug 2024 17:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>, alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Message-ID: <202408231607.RHujmOKI-lkp@intel.com>
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
[also build test ERROR on tegra/for-next linus/master v6.11-rc4 next-20240823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liao-Yuanhong/rtc-rtc-at91rm9200-Use-devm_clk_get_enabled-helpers/20240822-150754
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240821092846.20138-2-liaoyuanhong%40vivo.com
patch subject: [PATCH 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240823/202408231607.RHujmOKI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231607.RHujmOKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231607.RHujmOKI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-at91rm9200.c: In function 'at91_rtc_probe':
   drivers/rtc/rtc-at91rm9200.c:473:13: warning: unused variable 'ret' [-Wunused-variable]
     473 |         int ret = 0;
         |             ^~~
   In file included from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sh/include/asm/hardirq.h:9,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from drivers/rtc/rtc-at91rm9200.c:20:
   drivers/rtc/rtc-at91rm9200.c: At top level:
>> arch/sh/include/asm/io.h:46:35: error: expected identifier or '(' before 'void'
      46 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)ioswabl(v),c))
         |                                   ^~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:506:9: note: in expansion of macro 'at91_rtc_write'
     506 |         at91_rtc_write(AT91_RTC_CR, 0);
         |         ^~~~~~~~~~~~~~
>> arch/sh/include/asm/io.h:31:33: error: expected ')' before '(' token
      31 | #define __raw_writel(v,a)       (__chk_io_ptr(a), *(volatile u32 __force *)(a) = (v))
         |                                 ^
   arch/sh/include/asm/io.h:46:40: note: in expansion of macro '__raw_writel'
      46 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)ioswabl(v),c))
         |                                        ^~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:506:9: note: in expansion of macro 'at91_rtc_write'
     506 |         at91_rtc_write(AT91_RTC_CR, 0);
         |         ^~~~~~~~~~~~~~
>> arch/sh/include/asm/io.h:46:35: error: expected identifier or '(' before 'void'
      46 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)ioswabl(v),c))
         |                                   ^~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
>> arch/sh/include/asm/io.h:31:33: error: expected ')' before '(' token
      31 | #define __raw_writel(v,a)       (__chk_io_ptr(a), *(volatile u32 __force *)(a) = (v))
         |                                 ^
   arch/sh/include/asm/io.h:46:40: note: in expansion of macro '__raw_writel'
      46 | #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)ioswabl(v),c))
         |                                        ^~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:9: note: in expansion of macro 'writel_relaxed'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
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
                    from include/linux/platform_device.h:13,
                    from drivers/rtc/rtc-at91rm9200.c:26:
   include/linux/dev_printk.h:108:10: error: expected identifier or '(' before '{' token
     108 |         ({                                                              \
         |          ^
   include/linux/dev_printk.h:160:9: note: in expansion of macro 'dev_printk_index_wrap'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:544:9: note: in expansion of macro 'dev_info'
     544 |         dev_info(&pdev->dev, "AT91 Real Time Clock driver.\n");
         |         ^~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:545:9: error: expected identifier or '(' before 'return'
     545 |         return 0;
         |         ^~~~~~
   drivers/rtc/rtc-at91rm9200.c:546:1: error: expected identifier or '(' before '}' token
     546 | }
         | ^
   drivers/rtc/rtc-at91rm9200.c: In function 'at91_rtc_probe':
   drivers/rtc/rtc-at91rm9200.c:504:9: warning: control reaches end of non-void function [-Wreturn-type]
     504 |         }
         |         ^


vim +46 arch/sh/include/asm/io.h

b66c1a3919abb4 include/asm-sh/io.h      Paul Mundt 2006-01-16  28  
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  29  #define __raw_writeb(v,a)	(__chk_io_ptr(a), *(volatile u8  __force *)(a) = (v))
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  30  #define __raw_writew(v,a)	(__chk_io_ptr(a), *(volatile u16 __force *)(a) = (v))
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04 @31  #define __raw_writel(v,a)	(__chk_io_ptr(a), *(volatile u32 __force *)(a) = (v))
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  32  #define __raw_writeq(v,a)	(__chk_io_ptr(a), *(volatile u64 __force *)(a) = (v))
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  33  
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  34  #define __raw_readb(a)		(__chk_io_ptr(a), *(volatile u8  __force *)(a))
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  35  #define __raw_readw(a)		(__chk_io_ptr(a), *(volatile u16 __force *)(a))
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  36  #define __raw_readl(a)		(__chk_io_ptr(a), *(volatile u32 __force *)(a))
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  37  #define __raw_readq(a)		(__chk_io_ptr(a), *(volatile u64 __force *)(a))
14866543ad2201 arch/sh/include/asm/io.h Paul Mundt 2008-10-04  38  
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29  39  #define readb_relaxed(c)	({ u8  __v = ioswabb(__raw_readb(c)); __v; })
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29  40  #define readw_relaxed(c)	({ u16 __v = ioswabw(__raw_readw(c)); __v; })
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29  41  #define readl_relaxed(c)	({ u32 __v = ioswabl(__raw_readl(c)); __v; })
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29  42  #define readq_relaxed(c)	({ u64 __v = ioswabq(__raw_readq(c)); __v; })
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29  43  
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29  44  #define writeb_relaxed(v,c)	((void)__raw_writeb((__force  u8)ioswabb(v),c))
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29  45  #define writew_relaxed(v,c)	((void)__raw_writew((__force u16)ioswabw(v),c))
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29 @46  #define writel_relaxed(v,c)	((void)__raw_writel((__force u32)ioswabl(v),c))
b7e68d6876dfba arch/sh/include/asm/io.h Paul Mundt 2012-03-29  47  #define writeq_relaxed(v,c)	((void)__raw_writeq((__force u64)ioswabq(v),c))
37b7a97884ba64 arch/sh/include/asm/io.h Paul Mundt 2010-11-01  48  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

