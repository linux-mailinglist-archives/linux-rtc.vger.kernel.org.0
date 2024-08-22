Return-Path: <linux-rtc+bounces-1689-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C5E95ABD7
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 05:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95D551C2270A
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 03:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8141804F;
	Thu, 22 Aug 2024 03:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp727Q7D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9812033A;
	Thu, 22 Aug 2024 03:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724297122; cv=none; b=izWR0pUKFTHTx73olR/Gsc0x1ZbHkPk6nxpy/WGvSeivNoupJ4fzXqGkQr8Jj/cg6janzCeC6cI3PxZJOKcosKLmpEaBicgjEVwgg01u1uSTUwudOeprvpaMs0/gCgvQCuCCb1Y36DjrgPnDPaY/aJKIgNpi4nE2sKCCxYTuT+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724297122; c=relaxed/simple;
	bh=8uy+Bg2eGFPzkDqiOgyhJynla4bqzmj8hPQSZfG+Los=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TP9lrUzV5ukACgbMSwG/qwRnyE2M4fGuamF4SQWw/TUScMpFBBXSG+QdOn9AyGQ+6RgzN6Ks0DhuOEeJzvSjISWbvE5buGi+IzTzMJ9Mwwf2OhTmqy+/n69neQPpw9tlrNdfa4XFb91j4434uB2rq/+QCaQ/XNkgV1L7rcj5T6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sp727Q7D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724297120; x=1755833120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8uy+Bg2eGFPzkDqiOgyhJynla4bqzmj8hPQSZfG+Los=;
  b=Sp727Q7Dx9pd6fkhikon2vuPKNg7+8JRsVUBFfiYzvJFM86plgBWK8Nb
   Osr3U2rWvBkui6vh1FcJGI126a29fBPgHg37gUApH5aurhzcixcW56MYZ
   IvCOj9JOa3BdG1n4v21QNR6u6HZj4/bw4xprP6vAyOxroupMqfGpjDsYR
   w7rgRQgMmnA98LjpKexYEgP3lEgV6fMAUGJq/yovPErI4s3NwjYq85RAy
   DXdLzSZhW4aNb+CRV/wkt1mMzI45iEre9tICAXN2bVDLGYz1+IuZVx3F/
   iLs7RemUwB80b7tWwJu72wCmcesPH3GOQwwEcfVopZtauKYtb8lyNWZaP
   Q==;
X-CSE-ConnectionGUID: nboOX5o2Qz6PbcUkHr5NOw==
X-CSE-MsgGUID: Xifv9IHcTV+Aq4EFhJBWTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13145921"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="13145921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 20:25:19 -0700
X-CSE-ConnectionGUID: 8oWk0ZT6QXWO0Y4TjO8w3Q==
X-CSE-MsgGUID: Dzv4d56QSxu2MDS2PGmcRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61288488"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Aug 2024 20:25:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgyRm-000CER-2a;
	Thu, 22 Aug 2024 03:25:14 +0000
Date: Thu, 22 Aug 2024 11:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>, alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH 1/7] rtc:rtc-at91rm9200:Use devm_clk_get_enabled() helpers
Message-ID: <202408221130.3Kw5w51m-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240822/202408221130.3Kw5w51m-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221130.3Kw5w51m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221130.3Kw5w51m-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/rtc/rtc-at91rm9200.c:473:6: warning: unused variable 'ret' [-Wunused-variable]
           int ret = 0;
               ^
>> drivers/rtc/rtc-at91rm9200.c:504:2: warning: non-void function does not return a value in all control paths [-Wreturn-type]
           }
           ^
>> drivers/rtc/rtc-at91rm9200.c:506:30: error: expected ')'
           at91_rtc_write(AT91_RTC_CR, 0);
                                       ^
   drivers/rtc/rtc-at91rm9200.c:506:2: note: to match this '('
           at91_rtc_write(AT91_RTC_CR, 0);
           ^
   drivers/rtc/rtc-at91rm9200.c:89:17: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
                          ^
>> drivers/rtc/rtc-at91rm9200.c:506:30: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
           at91_rtc_write(AT91_RTC_CR, 0);
                                       ^
   drivers/rtc/rtc-at91rm9200.c:506:2: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
           at91_rtc_write(AT91_RTC_CR, 0);
           ^
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:56: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                              ^
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:36: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                      ^
>> drivers/rtc/rtc-at91rm9200.c:506:2: error: function cannot return function type 'int (int)'
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:56: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                              ^
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:43: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                             ^
   drivers/rtc/rtc-at91rm9200.c:506:2: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:51: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                         ^
>> drivers/rtc/rtc-at91rm9200.c:506:2: error: function cannot return function type 'int (int ((*)(__le32))(__u32))' (aka 'int (int ((*)(unsigned int))(unsigned int))')
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:42: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                ^
>> drivers/rtc/rtc-at91rm9200.c:506:2: error: unknown type name 'at91_rtc_regs'
   drivers/rtc/rtc-at91rm9200.c:89:24: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
                                 ^
   drivers/rtc/rtc-at91rm9200.c:506:2: error: expected ')'
   drivers/rtc/rtc-at91rm9200.c:89:38: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
                                               ^
   drivers/rtc/rtc-at91rm9200.c:506:2: note: to match this '('
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:41: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                               ^
   drivers/rtc/rtc-at91rm9200.c:506:2: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
           at91_rtc_write(AT91_RTC_CR, 0);
           ^
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:29: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                   ^
   arch/arm/include/asm/io.h:92:22: note: expanded from macro '__raw_writel'
   #define __raw_writel __raw_writel
                        ^
   drivers/rtc/rtc-at91rm9200.c:507:30: error: expected ')'
           at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
                                       ^
   drivers/rtc/rtc-at91rm9200.c:87:2: note: expanded from macro 'at91_rtc_read'
           readl_relaxed(at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:277:27: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
                             ^
   drivers/rtc/rtc-at91rm9200.c:507:30: note: to match this '('
   drivers/rtc/rtc-at91rm9200.c:87:2: note: expanded from macro 'at91_rtc_read'
           readl_relaxed(at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:277:26: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
                            ^
   drivers/rtc/rtc-at91rm9200.c:507:57: error: expected ')'
           at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
                                                                  ^
   drivers/rtc/rtc-at91rm9200.c:507:2: note: to match this '('
           at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
           ^
   drivers/rtc/rtc-at91rm9200.c:89:17: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
                          ^
   drivers/rtc/rtc-at91rm9200.c:507:30: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
           at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
                                       ^
   drivers/rtc/rtc-at91rm9200.c:87:2: note: expanded from macro 'at91_rtc_read'
           readl_relaxed(at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:277:27: note: expanded from macro 'readl_relaxed'
   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
                             ^
   drivers/rtc/rtc-at91rm9200.c:507:2: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
           at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
           ^
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:56: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                              ^
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:36: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                      ^
   drivers/rtc/rtc-at91rm9200.c:507:2: error: function cannot return function type 'int (int)'
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:56: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                              ^
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:43: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                             ^
   drivers/rtc/rtc-at91rm9200.c:507:2: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:51: note: expanded from macro 'writel_relaxed'
   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
                                                         ^
   drivers/rtc/rtc-at91rm9200.c:507:2: error: function cannot return function type 'int (int ((*)(__le32))(__u32))' (aka 'int (int ((*)(unsigned int))(unsigned int))')
   drivers/rtc/rtc-at91rm9200.c:89:2: note: expanded from macro 'at91_rtc_write'
           writel_relaxed((val), at91_rtc_regs + field)
           ^
   arch/arm/include/asm/io.h:282:42: note: expanded from macro 'writel_relaxed'


vim +506 drivers/rtc/rtc-at91rm9200.c

f6a46f8b302d9b drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2020-11-09  465  
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  466  /*
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  467   * Initialize and install RTC driver
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  468   */
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  469  static int __init at91_rtc_probe(struct platform_device *pdev)
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  470  {
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  471  	struct rtc_device *rtc;
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  472  	struct resource *regs;
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14 @473  	int ret = 0;
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  474  
288d9cf1764a25 drivers/rtc/rtc-at91rm9200.c Claudiu Beznea                   2019-09-26  475  	at91_rtc_config = of_device_get_match_data(&pdev->dev);
de645475913f67 drivers/rtc/rtc-at91rm9200.c Johan Hovold                     2013-06-12  476  	if (!at91_rtc_config)
de645475913f67 drivers/rtc/rtc-at91rm9200.c Johan Hovold                     2013-06-12  477  		return -ENODEV;
de645475913f67 drivers/rtc/rtc-at91rm9200.c Johan Hovold                     2013-06-12  478  
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  479  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  480  	if (!regs) {
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  481  		dev_err(&pdev->dev, "no mmio resource defined\n");
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  482  		return -ENXIO;
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  483  	}
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  484  
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  485  	irq = platform_get_irq(pdev, 0);
faac910201e9be drivers/rtc/rtc-at91rm9200.c Stephen Boyd                     2019-07-30  486  	if (irq < 0)
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  487  		return -ENXIO;
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  488  
f3766250b2e9f2 drivers/rtc/rtc-at91rm9200.c Sachin Kamat                     2013-11-12  489  	at91_rtc_regs = devm_ioremap(&pdev->dev, regs->start,
f3766250b2e9f2 drivers/rtc/rtc-at91rm9200.c Sachin Kamat                     2013-11-12  490  				     resource_size(regs));
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  491  	if (!at91_rtc_regs) {
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  492  		dev_err(&pdev->dev, "failed to map registers, aborting.\n");
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  493  		return -ENOMEM;
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  494  	}
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14  495  
735ae2056b3c72 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2017-07-06  496  	rtc = devm_rtc_allocate_device(&pdev->dev);
735ae2056b3c72 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2017-07-06  497  	if (IS_ERR(rtc))
735ae2056b3c72 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2017-07-06  498  		return PTR_ERR(rtc);
735ae2056b3c72 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2017-07-06  499  	platform_set_drvdata(pdev, rtc);
735ae2056b3c72 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2017-07-06  500  
40844cea20a5f8 drivers/rtc/rtc-at91rm9200.c Liao Yuanhong                    2024-08-21  501  	sclk = devm_clk_get_enabled(&pdev->dev, NULL);
11f67a8bbf6587 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2015-07-31  502  	if (IS_ERR(sclk))
11f67a8bbf6587 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2015-07-31  503  		return PTR_ERR(sclk);
11f67a8bbf6587 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2015-07-31 @504  	}
11f67a8bbf6587 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2015-07-31  505  
d28bdfc5c80fb6 drivers/rtc/rtc-at91rm9200.c Jean-Christophe PLAGNIOL-VILLARD 2011-11-14 @506  	at91_rtc_write(AT91_RTC_CR, 0);
f6a46f8b302d9b drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2020-11-09  507  	at91_rtc_write(AT91_RTC_MR, at91_rtc_read(AT91_RTC_MR) & ~AT91_RTC_HRMOD);
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  508  
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  509  	/* Disable all interrupts */
e304fcd075a0e9 drivers/rtc/rtc-at91rm9200.c Johan Hovold                     2013-06-12  510  	at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
e7a8bb12c24af8 drivers/rtc/rtc-at91.c       Andrew Morton                    2006-06-25  511  					AT91_RTC_SECEV | AT91_RTC_TIMEV |
e7a8bb12c24af8 drivers/rtc/rtc-at91.c       Andrew Morton                    2006-06-25  512  					AT91_RTC_CALEV);
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  513  
f3766250b2e9f2 drivers/rtc/rtc-at91rm9200.c Sachin Kamat                     2013-11-12  514  	ret = devm_request_irq(&pdev->dev, irq, at91_rtc_interrupt,
dd1f1f391dd7f3 drivers/rtc/rtc-at91rm9200.c Boris Brezillon                  2015-03-02  515  			       IRQF_SHARED | IRQF_COND_SUSPEND,
d728b1e69fd582 drivers/rtc/rtc-at91.c       David Brownell                   2006-11-25  516  			       "at91_rtc", pdev);
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  517  	if (ret) {
6588208cb2be4a drivers/rtc/rtc-at91rm9200.c Jingoo Han                       2013-02-21  518  		dev_err(&pdev->dev, "IRQ %d already in use.\n", irq);
40844cea20a5f8 drivers/rtc/rtc-at91rm9200.c Liao Yuanhong                    2024-08-21  519  		return ret;
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  520  	}
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  521  
5d4675a811fb71 drivers/rtc/rtc-at91rm9200.c David Brownell                   2007-02-20  522  	/* cpu init code should really have flagged this device as
5d4675a811fb71 drivers/rtc/rtc-at91rm9200.c David Brownell                   2007-02-20  523  	 * being wake-capable; if it didn't, do that here.
5d4675a811fb71 drivers/rtc/rtc-at91rm9200.c David Brownell                   2007-02-20  524  	 */
5d4675a811fb71 drivers/rtc/rtc-at91rm9200.c David Brownell                   2007-02-20  525  	if (!device_can_wakeup(&pdev->dev))
5d4675a811fb71 drivers/rtc/rtc-at91rm9200.c David Brownell                   2007-02-20  526  		device_init_wakeup(&pdev->dev, 1);
5d4675a811fb71 drivers/rtc/rtc-at91rm9200.c David Brownell                   2007-02-20  527  
f6a46f8b302d9b drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2020-11-09  528  	if (at91_rtc_config->has_correction)
f6a46f8b302d9b drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2020-11-09  529  		rtc->ops = &sama5d4_rtc_ops;
f6a46f8b302d9b drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2020-11-09  530  	else
735ae2056b3c72 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2017-07-06  531  		rtc->ops = &at91_rtc_ops;
f6a46f8b302d9b drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2020-11-09  532  
6c78a872a673c4 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2018-05-17  533  	rtc->range_min = RTC_TIMESTAMP_BEGIN_1900;
6c78a872a673c4 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2018-05-17  534  	rtc->range_max = RTC_TIMESTAMP_END_2099;
fdcfd854333be5 drivers/rtc/rtc-at91rm9200.c Bartosz Golaszewski              2020-11-09  535  	ret = devm_rtc_register_device(rtc);
735ae2056b3c72 drivers/rtc/rtc-at91rm9200.c Alexandre Belloni                2017-07-06  536  	if (ret)
40844cea20a5f8 drivers/rtc/rtc-at91rm9200.c Liao Yuanhong                    2024-08-21  537  		return ret;
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  538  
2fe121e1f5aa3b drivers/rtc/rtc-at91rm9200.c Boris Brezillon                  2014-06-06  539  	/* enable SECEV interrupt in order to initialize at91_rtc_upd_rdy
2fe121e1f5aa3b drivers/rtc/rtc-at91rm9200.c Boris Brezillon                  2014-06-06  540  	 * completion.
2fe121e1f5aa3b drivers/rtc/rtc-at91rm9200.c Boris Brezillon                  2014-06-06  541  	 */
2fe121e1f5aa3b drivers/rtc/rtc-at91rm9200.c Boris Brezillon                  2014-06-06  542  	at91_rtc_write_ier(AT91_RTC_SECEV);
2fe121e1f5aa3b drivers/rtc/rtc-at91rm9200.c Boris Brezillon                  2014-06-06  543  
6588208cb2be4a drivers/rtc/rtc-at91rm9200.c Jingoo Han                       2013-02-21  544  	dev_info(&pdev->dev, "AT91 Real Time Clock driver.\n");
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  545  	return 0;
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  546  }
788b1fc619a31e drivers/rtc/rtc-at91.c       Andrew Victor                    2006-06-25  547  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

