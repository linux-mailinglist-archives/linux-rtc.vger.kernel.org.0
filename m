Return-Path: <linux-rtc+bounces-4656-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D7B1F21B
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Aug 2025 06:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60B79562643
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Aug 2025 04:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28682275AE4;
	Sat,  9 Aug 2025 04:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrJ0oIWr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC41AF0A4;
	Sat,  9 Aug 2025 04:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754714399; cv=none; b=RlST0/TeQObbGx/TXTgCCk4frP+cCisZ3gVBa5UHMDYrToCmdcaySwbGWk6cBjDkWSu3skxUl8aNY7FsjtsjnPdxOqdZkrEN81NcSTHYAeZhyFhlTJagaZlRoYiSQnV1ySeHywnSNMU28uOatRRWiOlUceiY17LkhyO3Y01CiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754714399; c=relaxed/simple;
	bh=aktR+zqoUBKL88FfPK91CV2ljisZF5QnSbMYDGZBrSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYgM0r3cE+nYOV4w6MjVJ71lGOc4cWq5+NY5s8H0UVBGF/6tSwAlSDGYOqgG9B48dBLe3lQ0xLWgMGRKJJhQcMV1+S1eAchJLYEyL3bau5rAUmeIqak8BpwJexEqh31sBgYWss/kgzGmJwPyHcNYdBIVWXnUT7GCP21XOnC1n+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrJ0oIWr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754714397; x=1786250397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aktR+zqoUBKL88FfPK91CV2ljisZF5QnSbMYDGZBrSQ=;
  b=lrJ0oIWrPK+S5L8sDXTjaUZtgrsnBsyTFbYtRoOKmLWopXMH0xuBiF3O
   wUXh6gKkpZBoaWrM7h0EImE7orEchtRvtd8K1qHZOHs+/f/TbaEZ5OMX+
   Mh02Mua3mQW0LbDzPCd4lHrgbXVuOldR/MfZVyCmbRig9UoXV199KmjTX
   Yf+8dn7L176Zwrwzdhc3L8a/TxAOm6Q0XsSdsW82LM+w93eygSgwCso/m
   UrmJAY2poTT7NGc6F1a1rqnb3i0V61ynryrxxE2bj0RX3eQh8x1z40Xke
   tWnMXrjLmaG20xnHS6/0WckOTwrABDbhor1x2gFRViueUpkuW/hESBkTg
   w==;
X-CSE-ConnectionGUID: ZsGA/tmeShqyeHA7nITZpA==
X-CSE-MsgGUID: lSSypvXVRsKbXhHCw/eueA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68424482"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68424482"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 21:39:56 -0700
X-CSE-ConnectionGUID: MW4DmiqqT4aMrhIJXAZMhw==
X-CSE-MsgGUID: +0Xow/ybQv64NhbkOzNNrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="196299599"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2025 21:39:53 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukbN0-0004Vg-2g;
	Sat, 09 Aug 2025 04:39:50 +0000
Date: Sat, 9 Aug 2025 12:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>,
	alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: Re: [PATCH 2/2] rtc: pcf85363: add support for additional features
Message-ID: <202508091247.3Kc8Wms3-lkp@intel.com>
References: <20250808112246.4169280-2-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808112246.4169280-2-lakshay.piplani@nxp.com>

Hi Lakshay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/rtc-pcf85363-add-support-for-additional-features/20250808-192449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20250808112246.4169280-2-lakshay.piplani%40nxp.com
patch subject: [PATCH 2/2] rtc: pcf85363: add support for additional features
config: i386-buildonly-randconfig-005-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091247.3Kc8Wms3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091247.3Kc8Wms3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091247.3Kc8Wms3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-pcf85363.c:634:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     634 |         if (ret)
         |             ^~~
   drivers/rtc/rtc-pcf85363.c:614:9: note: initialize the variable 'ret' to silence this warning
     614 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +634 drivers/rtc/rtc-pcf85363.c

   605	
   606	/*
   607	 * Parses watchdog configuration from device tree and registers the
   608	 * watchdog with the Linux watchdog subsystem.
   609	 */
   610	static int pcf85363_watchdog_init(struct device *dev, struct regmap *regmap)
   611	{
   612		struct pcf85363_watchdog *wd;
   613		u32 timeout = 10, clock = 0;
   614		int ret;
   615	
   616		if (!IS_ENABLED(CONFIG_WATCHDOG) || !device_property_read_bool(dev, "nxp,enable-watchdog"))
   617			return 0;
   618	
   619		wd = devm_kzalloc(dev, sizeof(*wd), GFP_KERNEL);
   620		if (!wd)
   621			return -ENOMEM;
   622	
   623		wd->regmap = regmap;
   624		wd->dev = dev;
   625	
   626		device_property_read_u32(dev, "nxp,watchdog-timeout", &timeout);
   627		wd->timeout_val = clamp(timeout, WD_TIMEOUT_MIN, WD_TIMEOUT_MAX);
   628	
   629		device_property_read_u32(dev, "nxp,watchdog-stepsize", &clock);
   630		wd->clock_sel = clock & WD_CLKSEL_MASK;
   631	
   632		wd->repeat = device_property_read_bool(dev, "nxp,watchdog-repeat");
   633	
 > 634		if (ret)
   635			return ret;
   636	
   637		/* Clear any stale WDF flag */
   638		regmap_update_bits(regmap, CTRL_FLAGS, FLAGS_WDF, 0);
   639	
   640		/* Register the watchdog device */
   641		wd->wdd.info = &pcf85363_wdt_info;
   642		wd->wdd.ops = &pcf85363_wdt_ops;
   643		wd->wdd.min_timeout = WD_TIMEOUT_MIN;
   644		wd->wdd.max_timeout = WD_TIMEOUT_MAX;
   645		wd->wdd.timeout = wd->timeout_val;
   646		wd->wdd.parent = dev;
   647	
   648		/*
   649		 * For testing purposes, it's recommended to enable CONFIG_WATCHDOG_NOWAYOUT
   650		 * in the kernel configuration. If this option is not set, the watchdog may stop
   651		 * immediately after being started, especially if the user-space daemon closes
   652		 * /dev/watchdog without keeping it alive. Enabling NOWAYOUT ensures the watchdog
   653		 * remains active and can properly test system reset behavior.
   654		 */
   655		wd->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
   656	
   657		watchdog_set_drvdata(&wd->wdd, wd);
   658	
   659		dev_info(dev, "pcf85363: watchdog initialized successfully\n");
   660	
   661		return devm_watchdog_register_device(dev, &wd->wdd);
   662	}
   663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

