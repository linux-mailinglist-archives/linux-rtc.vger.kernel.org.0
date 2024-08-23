Return-Path: <linux-rtc+bounces-1706-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6FF95C8BF
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 11:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0DF71C2120F
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 09:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85185149C6A;
	Fri, 23 Aug 2024 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBkRvtU/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F951494D6;
	Fri, 23 Aug 2024 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403747; cv=none; b=lVIs4E6XYCTtbuGmSrY6LPMr48jIPWoYGUuqb2L2OjcF4a+kG6tyDU79FtvmKB4sRGzc7YQj86VyUFEnRa9Z8k2BwgoDnvwsiwYMJAXkxBgNVGAtMZ1ZpSkfrMxYddt9Ggyk21xIBa8FCEdylavrohwlPdkrtZHV+IDTJnweFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403747; c=relaxed/simple;
	bh=bNAz38XBI+Ew8emwZS9IZZmsuKD/DTYDcohoAnwBhU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTaP5ggHM358tPaGCI4Y9Q/OHpCOO8lu8p+R91Q3R/MzXPYx8nV312nJ3Pq23wZZGIazK+JreI4tYiDl6XCFOG9c7+bLJkRx0XTSOOFGMkOcKUV9FMXg8xEbu00csAIgUJ9QxdgIa9kHgnoJXkHURCRSHtyZSzwhYR7vqIcmzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBkRvtU/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724403746; x=1755939746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bNAz38XBI+Ew8emwZS9IZZmsuKD/DTYDcohoAnwBhU0=;
  b=fBkRvtU/F3zSwImOlKxyUBGGgFeBLc8utz0cymt9q2zfLR6JaIGN/Tr+
   a4nkdj31UQz9swIEN6Uek/L8wpZpHtVBNyuUKkFzbP47OekYCYnPgFtsH
   VbKi4hEbFNEYDcXANIcp7jyUgbzFKSgcdVhPP8FlmNn+r+lpWQ3lcNseV
   ZqdGZABkvn3yLEAKWgEyB92OlHCmPTRsQcqVu08FdwZJkN92ftPwJabAs
   i7E91w7/xr5IU8nHnHz+K2tYBIi7kldrkudkSQiScmaoS0RStEQtgK9vx
   3HkLIHdCJmFQhfEnX0KC44A7p980289stkjIXsXOT4+Z4iVXvNq1zxdsN
   w==;
X-CSE-ConnectionGUID: Ig4QxkQ6SoKd20XjDz3ISw==
X-CSE-MsgGUID: f+dMSUlAQyud8qen/0KYNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26617982"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="26617982"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 02:02:24 -0700
X-CSE-ConnectionGUID: xamOvUGWRheSqddhL0HklQ==
X-CSE-MsgGUID: EHRKSNtNSFSlB1bo2yDmqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="92529962"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2024 02:02:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shQBX-000DbM-1n;
	Fri, 23 Aug 2024 09:02:19 +0000
Date: Fri, 23 Aug 2024 17:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>, alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Message-ID: <202408231657.ZitX62vV-lkp@intel.com>
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
config: sparc64-randconfig-r064-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231657.ZitX62vV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231657.ZitX62vV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231657.ZitX62vV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-at91rm9200.c: In function 'at91_rtc_probe':
   drivers/rtc/rtc-at91rm9200.c:473:13: warning: unused variable 'ret' [-Wunused-variable]
     473 |         int ret = 0;
         |             ^~~
   drivers/rtc/rtc-at91rm9200.c: At top level:
   drivers/rtc/rtc-at91rm9200.c:89:24: error: expected declaration specifiers or '...' before '(' token
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |                        ^
   drivers/rtc/rtc-at91rm9200.c:506:9: note: in expansion of macro 'at91_rtc_write'
     506 |         at91_rtc_write(AT91_RTC_CR, 0);
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:31: error: expected declaration specifiers or '...' before 'at91_rtc_regs'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |                               ^~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:506:9: note: in expansion of macro 'at91_rtc_write'
     506 |         at91_rtc_write(AT91_RTC_CR, 0);
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:24: error: expected declaration specifiers or '...' before '(' token
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |                        ^
   drivers/rtc/rtc-at91rm9200.c:507:9: note: in expansion of macro 'at91_rtc_write'
     507 |         at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
         |         ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:89:31: error: expected declaration specifiers or '...' before 'at91_rtc_regs'
      89 |         writel_relaxed((val), at91_rtc_regs + field)
         |                               ^~~~~~~~~~~~~
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
   In file included from include/linux/bcd.h:5,
                    from drivers/rtc/rtc-at91rm9200.c:16:
>> include/linux/compiler.h:55:23: error: expected identifier or '(' before 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/rtc/rtc-at91rm9200.c:517:9: note: in expansion of macro 'if'
     517 |         if (ret) {
         |         ^~
>> include/linux/compiler.h:71:2: error: expected identifier or '(' before ')' token
      71 | })
         |  ^
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:517:9: note: in expansion of macro 'if'
     517 |         if (ret) {
         |         ^~
>> include/linux/compiler.h:55:23: error: expected identifier or '(' before 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/rtc/rtc-at91rm9200.c:525:9: note: in expansion of macro 'if'
     525 |         if (!device_can_wakeup(&pdev->dev))
         |         ^~
>> include/linux/compiler.h:71:2: error: expected identifier or '(' before ')' token
      71 | })
         |  ^
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:525:9: note: in expansion of macro 'if'
     525 |         if (!device_can_wakeup(&pdev->dev))
         |         ^~
>> include/linux/compiler.h:55:23: error: expected identifier or '(' before 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/rtc/rtc-at91rm9200.c:528:9: note: in expansion of macro 'if'
     528 |         if (at91_rtc_config->has_correction)
         |         ^~
>> include/linux/compiler.h:71:2: error: expected identifier or '(' before ')' token
      71 | })
         |  ^
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:528:9: note: in expansion of macro 'if'
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
>> include/linux/compiler.h:55:23: error: expected identifier or '(' before 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/rtc/rtc-at91rm9200.c:536:9: note: in expansion of macro 'if'
     536 |         if (ret)
         |         ^~
>> include/linux/compiler.h:71:2: error: expected identifier or '(' before ')' token
      71 | })
         |  ^
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:536:9: note: in expansion of macro 'if'
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
   drivers/rtc/rtc-at91rm9200.c: At top level:
   drivers/rtc/rtc-at91rm9200.c:456:35: warning: 'sama5d4_rtc_ops' defined but not used [-Wunused-const-variable=]
     456 | static const struct rtc_class_ops sama5d4_rtc_ops = {
         |                                   ^~~~~~~~~~~~~~~
   drivers/rtc/rtc-at91rm9200.c:448:35: warning: 'at91_rtc_ops' defined but not used [-Wunused-const-variable=]
     448 | static const struct rtc_class_ops at91_rtc_ops = {
         |                                   ^~~~~~~~~~~~


vim +55 include/linux/compiler.h

2bcd521a684cc9 Steven Rostedt 2008-11-21  49  
2bcd521a684cc9 Steven Rostedt 2008-11-21  50  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc9 Steven Rostedt 2008-11-21  51  /*
2bcd521a684cc9 Steven Rostedt 2008-11-21  52   * "Define 'is'", Bill Clinton
2bcd521a684cc9 Steven Rostedt 2008-11-21  53   * "Define 'if'", Steven Rostedt
2bcd521a684cc9 Steven Rostedt 2008-11-21  54   */
a15fd609ad53a6 Linus Torvalds 2019-03-20 @55  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a6 Linus Torvalds 2019-03-20  56  
a15fd609ad53a6 Linus Torvalds 2019-03-20  57  #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
a15fd609ad53a6 Linus Torvalds 2019-03-20  58  
a15fd609ad53a6 Linus Torvalds 2019-03-20  59  #define __trace_if_value(cond) ({			\
2bcd521a684cc9 Steven Rostedt 2008-11-21  60  	static struct ftrace_branch_data		\
e04462fb82f8dd Miguel Ojeda   2018-09-03  61  		__aligned(4)				\
33def8498fdde1 Joe Perches    2020-10-21  62  		__section("_ftrace_branch")		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  63  		__if_trace = {				\
2bcd521a684cc9 Steven Rostedt 2008-11-21  64  			.func = __func__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  65  			.file = __FILE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  66  			.line = __LINE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  67  		};					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  68  	(cond) ?					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  69  		(__if_trace.miss_hit[1]++,1) :		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  70  		(__if_trace.miss_hit[0]++,0);		\
a15fd609ad53a6 Linus Torvalds 2019-03-20 @71  })
a15fd609ad53a6 Linus Torvalds 2019-03-20  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

