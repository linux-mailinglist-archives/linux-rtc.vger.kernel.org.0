Return-Path: <linux-rtc+bounces-2875-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F8A09E8F
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 00:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0D316B0FB
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 23:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2C321E0A6;
	Fri, 10 Jan 2025 23:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHcqU3cE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C26217F26;
	Fri, 10 Jan 2025 23:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736550169; cv=none; b=exiS/xqlo2kgSvW3e5Y0ksKSoA3+htuiHaa6veLhbzpF4KChfB5PnQ0nsoF1Dvt4L0OZkPzkyGx+3VSDHmuCI7Fu5Al+YmYk8fr2hFVm9c8x8P5AAu+48A+oY6UXqWec8RXeyXpxu1m+lqyUSxBw312HAILp3tSRR/iOGIl22oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736550169; c=relaxed/simple;
	bh=exxTIcYRlq9+WHqGmLR8OLFPnvXaLdfRAiJ6ueEPz6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2vByMC+bQdEzD7jdp3lBPKqTsQSHmB6Gu/KNWnSN38fRGo21H5PM5zlOmRcgnAaHIRKcbsaq4klaA4/shEAoOjN604dvG5/+3iFSq6kVIQbk+OBg/zsrZfztKc9tFQX8Kkw9NjH07jeyPXRWDEUSNgnGUA8dztRv5CzzVzbcr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHcqU3cE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736550168; x=1768086168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=exxTIcYRlq9+WHqGmLR8OLFPnvXaLdfRAiJ6ueEPz6Q=;
  b=ZHcqU3cES1l5ajOh0bLaWsGWxUrv5pcqx0tFmlrFQOmDlelW5oqFSA9k
   aZNozCi4HKvJciFGySJwg74lsZ4nG6qSDQhKMyu3l3smKvR1X9mVLQoAD
   YDVxIva6yTTjDRqM/cPh2bdJidpaEL02bv2A2EwIh5HIakNWKWxUwIYBd
   kvLC/1NOW92zFcCwi5rfKUYwurCwp3JOQCv12HbclDv8H25U8fFRPOCrd
   FwVqBSnGi55F2JkNbzKryrzIPo+U8JcdYHJIoYWBiO8eDeLVGrmIL+exs
   PJxbwD6J8gf1zh5b5g3ETjpwtIfkxm+95+LbbbBby364mk+qJ8oK0aRVu
   g==;
X-CSE-ConnectionGUID: oHGdPidZT5GlqJzOjTbX6Q==
X-CSE-MsgGUID: CkC4XmztTVye2yy/49t6fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="39670277"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="39670277"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 15:02:46 -0800
X-CSE-ConnectionGUID: KmcgdrTYRmS8e439gN6Fdg==
X-CSE-MsgGUID: o57VHs84QXS850DDLK5T5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="103802755"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 15:02:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWO1a-000Jrj-0g;
	Fri, 10 Jan 2025 23:02:42 +0000
Date: Sat, 11 Jan 2025 07:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: alexandre.belloni@bootlin.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf2127: add BSM support
Message-ID: <202501110609.EswlBu9L-lkp@intel.com>
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
config: i386-buildonly-randconfig-006-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110609.EswlBu9L-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110609.EswlBu9L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110609.EswlBu9L-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-pcf2127.c:20:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/rtc/rtc-pcf2127.c:347:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     347 |                 value = FIELD_GET(PCF2127_CTRL3_PM, value);
         |                         ^
   drivers/rtc/rtc-pcf2127.c:378:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     378 |                 value = FIELD_GET(PCF2127_CTRL3_PM, value);
         |                         ^
>> drivers/rtc/rtc-pcf2127.c:402:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     402 |                                           FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
         |                                           ^
   1 warning and 3 errors generated.


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

