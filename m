Return-Path: <linux-rtc+bounces-2874-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3793A09C93
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 21:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07AC3AABBB
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 20:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15852215F6C;
	Fri, 10 Jan 2025 20:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dt4AdDML"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF12063FB;
	Fri, 10 Jan 2025 20:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736541788; cv=none; b=rHytoeZUokuxMop0WRZwidrtFtAe5GzqblRYWJLmW4CKip59BXPZ1FaNQPu0ALQFsL8Xbeh38eFJelyBsA43+UG3fRhnzjahmIPyOX3HhAOVuIJl/cXBbXtGkA1YD2T6rpQhI6ilZC2kVP1G1Hjc4Jia0W1dQyv0BkkIl1PgghQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736541788; c=relaxed/simple;
	bh=eoMb759lMsHU4qiDIwAXnTe/hPKHvmThchZu3cqiNpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuOr+iFdbaTVlpOr6GH7sHw2YWVrLd3V0nSrEUNeyzByFAmLJMjPY6gPrEA5+C8NsCFK4h6Z+LPoq97+rxR/xnv8Dh5N0vY7LhknYW4Wus55VjCeKVfR67gcAt5y9/FmJII2RfOpHmFYAgP+/mbGYUxBIThaPnc58yftizG6T/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dt4AdDML; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736541785; x=1768077785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eoMb759lMsHU4qiDIwAXnTe/hPKHvmThchZu3cqiNpE=;
  b=Dt4AdDMLQ08dzDT3UQl7VPxEM+JPuEysJmjD9vNCjN1CfX3aJjfHhs8p
   erMoPOYlXjESLoe9dNOjvKSbP8beWvzh9eTyrmi9J15vruvITDEVHd7wG
   D394tstby/d6V+sRjK0mcAruhDqoqJb7JIjSxghi4iKv5SX/i9kivd0Ok
   Y+OJfJizTfPcIh4/FuOG2UBefFVXqPOwux7QLu5R8dIarVeDWGBq7LIKw
   VUG14ZbSwzoEiiL8oWRDEArX7iosWR1lATPOF5yqBHoP+aYgmn9nJ1yWc
   +qY6DS4G7kAx9L/Ree71tUIBLFIcv4WNhnzhvdNyutvYqf2aqBDgEKept
   w==;
X-CSE-ConnectionGUID: fAXbjCLGQ2C8XRJXEdB1hA==
X-CSE-MsgGUID: XwnycI83SQewZytff15kGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="24456075"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="24456075"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 12:43:04 -0800
X-CSE-ConnectionGUID: y2dTQQ/2Q0+Y27szFEISwQ==
X-CSE-MsgGUID: IYQBZWR4ShOgRZhDHUOkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="103617509"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2025 12:43:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWLqO-000JjF-1F;
	Fri, 10 Jan 2025 20:43:00 +0000
Date: Sat, 11 Jan 2025 04:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: alexandre.belloni@bootlin.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: add BSM support
Message-ID: <202501110440.4RhjFZZA-lkp@intel.com>
References: <20250109134253.827796-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109134253.827796-1-alexandre.belloni@bootlin.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alexandre-belloni-bootlin-com/rtc-pcf2127-add-BSM-support/20250109-214654
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20250109134253.827796-1-alexandre.belloni%40bootlin.com
patch subject: [PATCH] rtc: pcf2127: add BSM support
config: hexagon-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110440.4RhjFZZA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110440.4RhjFZZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110440.4RhjFZZA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-pcf2127.c:20:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/rtc/rtc-pcf2127.c:20:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/rtc/rtc-pcf2127.c:20:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/rtc/rtc-pcf2127.c:347:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   value = FIELD_GET(PCF2127_CTRL3_PM, value);
                           ^
   drivers/rtc/rtc-pcf2127.c:378:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   value = FIELD_GET(PCF2127_CTRL3_PM, value);
                           ^
>> drivers/rtc/rtc-pcf2127.c:402:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                                             FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
                                             ^
   6 warnings and 3 errors generated.


vim +/FIELD_GET +347 drivers/rtc/rtc-pcf2127.c

   334	
   335	static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
   336	{
   337		struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
   338		u32 value;
   339		int ret;
   340	
   341		switch (param->param) {
   342		case RTC_PARAM_BACKUP_SWITCH_MODE:
   343			ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
   344			if (ret < 0)
   345				return ret;
   346	
 > 347			value = FIELD_GET(PCF2127_CTRL3_PM, value);
   348	
   349			if (value < 0x3)
   350				param->uvalue = RTC_BSM_LEVEL;
   351			else if (value < 0x6)
   352				param->uvalue = RTC_BSM_DIRECT;
   353			else
   354				param->uvalue = RTC_BSM_DISABLED;
   355	
   356			break;
   357	
   358		default:
   359			return -EINVAL;
   360		}
   361	
   362		return 0;
   363	}
   364	
   365	static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
   366	{
   367		struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
   368		u8 mode = 0;
   369		u32 value;
   370		int ret;
   371	
   372		switch (param->param) {
   373		case RTC_PARAM_BACKUP_SWITCH_MODE:
   374			ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
   375			if (ret < 0)
   376				return ret;
   377	
   378			value = FIELD_GET(PCF2127_CTRL3_PM, value);
   379	
   380			if (value > 5)
   381				value -= 5;
   382			else if (value > 2)
   383				value -= 3;
   384	
   385			switch (param->uvalue) {
   386			case RTC_BSM_LEVEL:
   387				break;
   388			case RTC_BSM_DIRECT:
   389				mode = 3;
   390				break;
   391			case RTC_BSM_DISABLED:
   392				if (value == 0)
   393					value = 1;
   394				mode = 5;
   395				break;
   396			default:
   397				return -EINVAL;
   398			}
   399	
   400			return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
   401						  PCF2127_CTRL3_PM,
 > 402						  FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
   403	
   404			break;
   405	
   406		default:
   407			return -EINVAL;
   408		}
   409	
   410		return 0;
   411	}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

