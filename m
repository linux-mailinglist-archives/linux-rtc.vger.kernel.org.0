Return-Path: <linux-rtc+bounces-4991-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11012B8BD2E
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 04:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0B2A189C78C
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 02:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE0C1F237A;
	Sat, 20 Sep 2025 02:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhXrxvAH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFDB1E9B1C;
	Sat, 20 Sep 2025 02:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758334200; cv=none; b=EBkFDe2VMRrO/Y0S1hBcnRv/h38uE82l0nU2hDJFM3L02IIJ0Y452IWQ7SXdh15Uz1MxIpBsfLxBKj7d23GjGZZFtX7FbWTet/3FrIAIeEZczcE77U+F2wcdV5ukoi99AYMSEye5MRQWaGpKm7ROwOjGosToCJ0Z46+grepDGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758334200; c=relaxed/simple;
	bh=P/Y/oW6/FFUxH7RVYDjud0Hfluc4bls5rAWpnqFcl4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KztCuLrenTaZvE/gsyczPWLVZc0m+5NXaYfp2amQhF1NX6TAJE6D2Er+Mqj73s/nX3Np3BGogjN3o5neYEbWvJ6+eMBTJlnawxAL3BvmEQQt9Q3N4bYW3hiwYoaaFaFoEoXsoUNuqN6qbOVEWJQnELQESSGFQ2CaaOf196MJ7Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhXrxvAH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758334199; x=1789870199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P/Y/oW6/FFUxH7RVYDjud0Hfluc4bls5rAWpnqFcl4M=;
  b=DhXrxvAHph5SBG8JRzlWzoyT62ku2VvJrgqUUy1GZ3Wure33huupGfB3
   iRg+IXX7Gf51SiK0FKUT4SHmPmK509Z0/QL4dTu9ZOFuWGa6cqU9VT6Xh
   ywONKLXUu1bA6htKQ/m701S3qg+ZRLQMSGwqVllXR2Rg/1PYBEXtkvuuI
   VA7uNxNgKESJICaPhWlFLs3wEWooVlRIFe1U4uMMCK0kfBj78x68RCYfe
   v3eY7BxhogoE865FVBeRNtUHwoMj6Aos6llP69ZooEX6L60yIlp2yATmG
   P7gS22S+EFccYblZa+vMb96Is/W9Xr1TMeeQYN8Bwwg4g0M1x9cCwqfs0
   Q==;
X-CSE-ConnectionGUID: HYKFpfa4QueTDjGXskAv1A==
X-CSE-MsgGUID: amtTjqL7Spmtu3AKATjrSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="64501703"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="64501703"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 19:09:58 -0700
X-CSE-ConnectionGUID: tKmWcZo7REuUUBFq1zMauw==
X-CSE-MsgGUID: m2q2elODTl6a8KnPC+GAdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="176795181"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2025 19:09:55 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzn2u-0004xn-2m;
	Sat, 20 Sep 2025 02:09:52 +0000
Date: Sat, 20 Sep 2025 10:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kartik Rajput <kkartik@nvidia.com>, alexandre.belloni@bootlin.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	andriy.shevchenko@linux.intel.com, linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH] rtc: tegra: Add ACPI support
Message-ID: <202509200953.uZOl24Is-lkp@intel.com>
References: <20250919111232.605405-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919111232.605405-1-kkartik@nvidia.com>

Hi Kartik,

kernel test robot noticed the following build errors:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on abelloni/rtc-next linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kartik-Rajput/rtc-tegra-Add-ACPI-support/20250919-191553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250919111232.605405-1-kkartik%40nvidia.com
patch subject: [PATCH] rtc: tegra: Add ACPI support
config: arm-randconfig-001-20250920 (https://download.01.org/0day-ci/archive/20250920/202509200953.uZOl24Is-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200953.uZOl24Is-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200953.uZOl24Is-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-tegra.c: In function 'tegra_rtc_probe':
>> drivers/rtc/rtc-tegra.c:310:13: error: implicit declaration of function 'is_of_node'; did you mean 'dev_of_node'? [-Werror=implicit-function-declaration]
     310 |         if (is_of_node(dev_fwnode(&pdev->dev))) {
         |             ^~~~~~~~~~
         |             dev_of_node
   cc1: some warnings being treated as errors


vim +310 drivers/rtc/rtc-tegra.c

   283	
   284	static int tegra_rtc_probe(struct platform_device *pdev)
   285	{
   286		struct tegra_rtc_info *info;
   287		int ret;
   288	
   289		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
   290		if (!info)
   291			return -ENOMEM;
   292	
   293		info->base = devm_platform_ioremap_resource(pdev, 0);
   294		if (IS_ERR(info->base))
   295			return PTR_ERR(info->base);
   296	
   297		ret = platform_get_irq(pdev, 0);
   298		if (ret <= 0)
   299			return ret;
   300	
   301		info->irq = ret;
   302	
   303		info->rtc = devm_rtc_allocate_device(&pdev->dev);
   304		if (IS_ERR(info->rtc))
   305			return PTR_ERR(info->rtc);
   306	
   307		info->rtc->ops = &tegra_rtc_ops;
   308		info->rtc->range_max = U32_MAX;
   309	
 > 310		if (is_of_node(dev_fwnode(&pdev->dev))) {
   311			info->clk = devm_clk_get(&pdev->dev, NULL);
   312			if (IS_ERR(info->clk))
   313				return PTR_ERR(info->clk);
   314	
   315			ret = clk_prepare_enable(info->clk);
   316			if (ret < 0)
   317				return ret;
   318		}
   319	
   320		/* set context info */
   321		info->pdev = pdev;
   322		spin_lock_init(&info->lock);
   323	
   324		platform_set_drvdata(pdev, info);
   325	
   326		/* clear out the hardware */
   327		writel(0, info->base + TEGRA_RTC_REG_SECONDS_ALARM0);
   328		writel(0xffffffff, info->base + TEGRA_RTC_REG_INTR_STATUS);
   329		writel(0, info->base + TEGRA_RTC_REG_INTR_MASK);
   330	
   331		device_init_wakeup(&pdev->dev, true);
   332	
   333		ret = devm_request_irq(&pdev->dev, info->irq, tegra_rtc_irq_handler,
   334				       IRQF_TRIGGER_HIGH, dev_name(&pdev->dev),
   335				       &pdev->dev);
   336		if (ret) {
   337			dev_err(&pdev->dev, "failed to request interrupt: %d\n", ret);
   338			goto disable_clk;
   339		}
   340	
   341		ret = devm_rtc_register_device(info->rtc);
   342		if (ret)
   343			goto disable_clk;
   344	
   345		dev_notice(&pdev->dev, "Tegra internal Real Time Clock\n");
   346	
   347		return 0;
   348	
   349	disable_clk:
   350		if (is_of_node(dev_fwnode(&pdev->dev)))
   351			clk_disable_unprepare(info->clk);
   352		return ret;
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

