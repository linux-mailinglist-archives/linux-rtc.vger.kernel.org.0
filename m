Return-Path: <linux-rtc+bounces-1742-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1E95F2BC
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 15:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6B40285B54
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8755184525;
	Mon, 26 Aug 2024 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiNDr/eC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D707E17ADFF;
	Mon, 26 Aug 2024 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678410; cv=none; b=RMBUnqtIcAgeh8ud6RRupGOGCgra8d8Bpkf3oBOSc4b+veNwyIwEmhHUVS9d1KRHVje6Rquq7GzCYrddWGY/cbJeMhCYILk7SmL2XCm9HAbnJHwMN5eB+3l6XGgPUxkAlplwADpe7xkSkHO+JnrcEMhCZUh366iSQ/OnqV5QoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678410; c=relaxed/simple;
	bh=L7ncuygwK7+Kr9c0J0XU++WFSpxV2mOazxQHlKpiK+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7xZwvlxfUA1ILvwxs4KUzGd/B2TctVPLrV7z+iAD/4X2r4lGlRU/MUIeu0GqL9NRl6vg1SJdkgdKkcKZXEeKYKXak5H1jJ7NJdOeQXbr0+WHzoWihgQz3wX1pY4gy5jt3Dd8oyF5Zi66DcuTvVq5mSmd8FolTThQj8j1R0m4/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiNDr/eC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724678409; x=1756214409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L7ncuygwK7+Kr9c0J0XU++WFSpxV2mOazxQHlKpiK+o=;
  b=eiNDr/eCMuFL2ocUsfmNFGRlw7HhOAAA4DvgPsRQKIQiVNUJIyEeT07E
   cj3MWkPcQOVAPmwUQghl4Ro2/nN/cZv6WG0wDRGYabGAy3S4X5nn2Avb/
   8fizxPtDJOP/ybObBK7T7cjw+Z8abyJrfsTkEwwENxoKsRQDAeEKAvrWD
   JXwC5bNJ0wLODy0/TPSocQdPGfSnI5XteXQuKHpHM7l5PFSgoS4flLyvA
   MVaeRx5rWLVuD6ZTWkpWhGjmj9vyWifLnRm1zNrpzUnLiFd8M+5WdDW89
   jTIiEAaNylTOcQp6+IW7m5Ru431m53rJBNMAjrrNgZCjxD0a5SdRWDrap
   w==;
X-CSE-ConnectionGUID: CtsKjvbESQeFHk5n4o+EEw==
X-CSE-MsgGUID: mlxgfd3KT7OCu1DuKlt36w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23266490"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23266490"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:20:08 -0700
X-CSE-ConnectionGUID: JF/zFlvhQFeztm9udLuJrA==
X-CSE-MsgGUID: THkbdf54S3G4yPuV3/ZMgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93233607"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 06:20:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siZdb-000H75-0W;
	Mon, 26 Aug 2024 13:20:03 +0000
Date: Mon, 26 Aug 2024 21:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Message-ID: <202408262106.tU1zTUfx-lkp@intel.com>
References: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823-rtc-v1-2-6f70381da283@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dff71e5c6076314f3eefe700abd6af834c57bd64]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-rtc-Add-Amlogic-A311L2-and-A113X2-rtc/20240826-125504
base:   dff71e5c6076314f3eefe700abd6af834c57bd64
patch link:    https://lore.kernel.org/r/20240823-rtc-v1-2-6f70381da283%40amlogic.com
patch subject: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
config: arc-randconfig-002-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262106.tU1zTUfx-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262106.tU1zTUfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262106.tU1zTUfx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-amlogic.c:545:12: warning: 'aml_rtc_resume' defined but not used [-Wunused-function]
     545 | static int aml_rtc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/rtc/rtc-amlogic.c:535:12: warning: 'aml_rtc_suspend' defined but not used [-Wunused-function]
     535 | static int aml_rtc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/aml_rtc_resume +545 drivers/rtc/rtc-amlogic.c

   534	
 > 535	static int aml_rtc_suspend(struct device *dev)
   536	{
   537		struct aml_rtc_data *rtc = dev_get_drvdata(dev);
   538	
   539		if (device_may_wakeup(dev))
   540			enable_irq_wake(rtc->irq);
   541	
   542		return 0;
   543	}
   544	
 > 545	static int aml_rtc_resume(struct device *dev)
   546	{
   547		struct aml_rtc_data *rtc = dev_get_drvdata(dev);
   548	
   549		if (device_may_wakeup(dev))
   550			disable_irq_wake(rtc->irq);
   551	
   552		return 0;
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

