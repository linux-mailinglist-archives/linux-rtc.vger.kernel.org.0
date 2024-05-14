Return-Path: <linux-rtc+bounces-1182-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BCF8C4C9C
	for <lists+linux-rtc@lfdr.de>; Tue, 14 May 2024 09:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D415B1F21B06
	for <lists+linux-rtc@lfdr.de>; Tue, 14 May 2024 07:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12387107A8;
	Tue, 14 May 2024 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2FTA2Ds"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1035F9F5;
	Tue, 14 May 2024 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715670629; cv=none; b=TowYw8xPk2HlZAtoKMhHAITiZ4MXXmIsZBnCtcsQDbq/xTNDxTELoBIpQVsDb0oKGDex3qsB2JHFyZYwyNPukNKIc8YsDKOAgbuW1U1jL6Fq3A+NbbSlSdlnB6wkJBuZ1vo27HRMBif8O49TK+b8Pe/I+uuaMVmh0cI5jixyUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715670629; c=relaxed/simple;
	bh=zdNUasxvJx2ymttYyTXszLP8zbd0eSQT87cFGXnRuu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyTZA+EqiJlDppmzAX5FbSEOZ4LRUCeuzXMVss+XwaoV6oG4Bfp40r9Y7uTdbvkQXQuOnDOk3XVnpUVI7EeP/vh0Fl8Z90zKTqa73iZ+ZD6B419ZqQY7PR9+aWFydiTHvX4jj9lamu5952lu3MsofDG8Ctpyrm/DHIM4uOAGPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2FTA2Ds; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715670627; x=1747206627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zdNUasxvJx2ymttYyTXszLP8zbd0eSQT87cFGXnRuu8=;
  b=C2FTA2DsCTC+EfeHkrpwCwWQqC/yLmlUN4Hi3MIG0/tb4pU11A+iW9dZ
   4BttdP28dJlFcHGaLILBnNbBW+m5QgsRMHRknQLfwLcsMm9w4TFzsofY5
   4MareU1u0QvNrw/fdyuQ+qGmvX4Qgf9tH3JFea9h7KmwDALRQPs5SsT0g
   VOerXv86n+sK+zGbNHqDS7jcyNnt6p5h8JC/I+kNTJNihtizhJg8etRf9
   TblV858V3B2O7jQXYAUz3w6gKC83dt26Dw4+ZdQAgdT9rueYs3qIYKFdc
   A7i1C2D64fjpWe2zMV3A17W7OlvtIBkWefk5z02dNwz0A/dpAc0nEKBvw
   A==;
X-CSE-ConnectionGUID: 5tWW/wQgSzaJm0h75tSRbA==
X-CSE-MsgGUID: bShBIFGeSq+NCO2PjIQfCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="23039888"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="23039888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 00:10:26 -0700
X-CSE-ConnectionGUID: yByfDjycSuy9TW0L2BpcbA==
X-CSE-MsgGUID: zGLPV32cQqC5arFh/tkN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30540229"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2024 00:10:24 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6mIn-000BDb-2l;
	Tue, 14 May 2024 07:10:21 +0000
Date: Tue, 14 May 2024 15:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Genoud <richard.genoud@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Esteban Blanc <eblanc@baylibre.com>,
	linux-rtc@vger.kernel.org, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH] rtc: tps6594: Add power management support
Message-ID: <202405141408.o5jSp8nU-lkp@intel.com>
References: <20240513162942.68484-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513162942.68484-1-richard.genoud@bootlin.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on lee-mfd/for-mfd-next lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.9 next-20240513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Genoud/rtc-tps6594-Add-power-management-support/20240514-003053
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240513162942.68484-1-richard.genoud%40bootlin.com
patch subject: [PATCH] rtc: tps6594: Add power management support
config: sparc-randconfig-r081-20240514 (https://download.01.org/0day-ci/archive/20240514/202405141408.o5jSp8nU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141408.o5jSp8nU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405141408.o5jSp8nU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-tps6594.c:471:12: warning: 'tps6594_rtc_suspend' defined but not used [-Wunused-function]
     471 | static int tps6594_rtc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-tps6594.c:439:12: warning: 'tps6594_rtc_resume' defined but not used [-Wunused-function]
     439 | static int tps6594_rtc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/tps6594_rtc_suspend +471 drivers/rtc/rtc-tps6594.c

   438	
 > 439	static int tps6594_rtc_resume(struct device *dev)
   440	{
   441		struct tps6594 *tps = dev_get_drvdata(dev->parent);
   442		struct rtc_device *rtc_dev = dev_get_drvdata(dev);
   443		int ret;
   444	
   445		ret = regmap_test_bits(tps->regmap, TPS6594_REG_INT_STARTUP,
   446				       TPS6594_BIT_RTC_INT);
   447		if (ret < 0) {
   448			dev_err(dev, "failed to read REG_INT_STARTUP: %d\n", ret);
   449			goto out;
   450		}
   451	
   452		if (ret > 0) {
   453			/*
   454			 * If the alarm bit is set, it means that the IRQ has been
   455			 * fired. But, the kernel may not have woke up yet when it
   456			 * happened. So, we have to clear it.
   457			 */
   458			ret = regmap_write(tps->regmap, TPS6594_REG_RTC_STATUS,
   459					   TPS6594_BIT_ALARM);
   460			if (ret < 0)
   461				dev_err(dev, "error clearing alarm bit: %d", ret);
   462	
   463			rtc_update_irq(rtc_dev, 1, RTC_IRQF | RTC_AF);
   464		}
   465	out:
   466		disable_irq_wake(tps->irq_rtc);
   467	
   468		return 0;
   469	}
   470	
 > 471	static int tps6594_rtc_suspend(struct device *dev)
   472	{
   473		struct tps6594 *tps = dev_get_drvdata(dev->parent);
   474	
   475		enable_irq_wake(tps->irq_rtc);
   476	
   477		return 0;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

