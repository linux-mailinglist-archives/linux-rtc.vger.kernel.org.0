Return-Path: <linux-rtc+bounces-1692-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFD995ACBE
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 07:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE6EB1C22250
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2024 05:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB354963A;
	Thu, 22 Aug 2024 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXdLtclW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEA7433CB;
	Thu, 22 Aug 2024 05:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724303313; cv=none; b=FUh11Kf1I5YORfcKeRXgTwV0W0nu3qjmqC7Y6/DCKGEAR6APvAPecDj5m2qmVdTLPep6KzguEPU5B/jSy1xBHBaJOvmgEPiVyy3HPJfCW9Z6vQB3XDeLgwnHLv4OLYaxVdzMiSLwLWqyTzfynHdMqKS8mFUnvhqcs98eAgX+nuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724303313; c=relaxed/simple;
	bh=DuP6gWL2QzEDfOfhHXfJnyaOtP1/xRSOjL/ac5t2XtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXkIzius9qNugKyNX+HW3UYn1KJzyNEkFHdQVpKiErXXrzAbEo3IVHhAC+lMdt0bhsmWPjiBxjy67lJuGdzEDZGg3mvkhgopdtX6T2ByNeGtmwNabBWjLRLWvJx2Yz3U0D96GyKXmpdFNEHU4Ye8OsEIymAmYX0d7x24ykZT424=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXdLtclW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724303311; x=1755839311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DuP6gWL2QzEDfOfhHXfJnyaOtP1/xRSOjL/ac5t2XtM=;
  b=eXdLtclWDNdkpew6bSQyW2NGwmyb1J8Jq2SRJ++EOuBU91hC92/9V1dH
   3hoguHdcDGD34k26+IBYS0QVeY0DHtJcD5mQ5lL+uM7yxSUPYDw8EBP3S
   m4lCst3GASQ4sfo3Ond/8cfEqVQwJQcCT766wzacg41CC0xEWn792LLsh
   +jc4DoHMasE9WWWi+F9Xtqlwym8znQxxL1pA3DXtCmN5kRL7oUIx4oI/y
   ealrDbbOG9zn03PwBFwdePdiZJbdXQ5n7z/AeX9RolMPKt0STPmQ6ETav
   h+MHdGjO2xeZFBG/vtlj8jTNZdvK2A4ghNeyWs1PwWnWIbUwBO0tamXus
   A==;
X-CSE-ConnectionGUID: 4cZPdnxXRHCwSL5GnpL2Gw==
X-CSE-MsgGUID: yP8FfY6MRzSSILipcghGHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22220593"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22220593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 22:08:30 -0700
X-CSE-ConnectionGUID: 42vMd2vTT3a18T7oVQpO1w==
X-CSE-MsgGUID: gn6y762xQ7+jR7G4GkpQDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66135184"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2024 22:08:29 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh03e-000CP2-0d;
	Thu, 22 Aug 2024 05:08:26 +0000
Date: Thu, 22 Aug 2024 13:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>, alexandre.belloni@bootlin.com,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH 4/7] rtc:rtc-s3c:Use devm_clk_get_enabled() helpers
Message-ID: <202408221253.CO0v47kj-lkp@intel.com>
References: <20240821092846.20138-5-liaoyuanhong@vivo.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821092846.20138-5-liaoyuanhong@vivo.com>

Hi Liao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on tegra/for-next linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liao-Yuanhong/rtc-rtc-at91rm9200-Use-devm_clk_get_enabled-helpers/20240821-190257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240821092846.20138-5-liaoyuanhong%40vivo.com
patch subject: [PATCH 4/7] rtc:rtc-s3c:Use devm_clk_get_enabled() helpers
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240822/202408221253.CO0v47kj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221253.CO0v47kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221253.CO0v47kj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-s3c.c:483:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
   }
   ^
   1 warning generated.


vim +483 drivers/rtc/rtc-s3c.c

1add6781c85d7e Ben Dooks           2006-07-01  397  
5a167f4543e45d Greg Kroah-Hartman  2012-12-21  398  static int s3c_rtc_probe(struct platform_device *pdev)
1add6781c85d7e Ben Dooks           2006-07-01  399  {
19be09f51d3610 Chanwoo Choi        2014-10-13  400  	struct s3c_rtc *info = NULL;
1add6781c85d7e Ben Dooks           2006-07-01  401  	int ret;
1add6781c85d7e Ben Dooks           2006-07-01  402  
19be09f51d3610 Chanwoo Choi        2014-10-13  403  	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
19be09f51d3610 Chanwoo Choi        2014-10-13  404  	if (!info)
19be09f51d3610 Chanwoo Choi        2014-10-13  405  		return -ENOMEM;
1add6781c85d7e Ben Dooks           2006-07-01  406  
19be09f51d3610 Chanwoo Choi        2014-10-13  407  	info->dev = &pdev->dev;
64704c92fd19c5 Marek Szyprowski    2019-01-18  408  	info->data = of_device_get_match_data(&pdev->dev);
ae05c95074e0ea Chanwoo Choi        2014-10-13  409  	if (!info->data) {
ae05c95074e0ea Chanwoo Choi        2014-10-13  410  		dev_err(&pdev->dev, "failed getting s3c_rtc_data\n");
ae05c95074e0ea Chanwoo Choi        2014-10-13  411  		return -EINVAL;
ae05c95074e0ea Chanwoo Choi        2014-10-13  412  	}
5a5b614ba61cc2 Marek Szyprowski    2019-01-21  413  	spin_lock_init(&info->alarm_lock);
19be09f51d3610 Chanwoo Choi        2014-10-13  414  
19be09f51d3610 Chanwoo Choi        2014-10-13  415  	platform_set_drvdata(pdev, info);
19be09f51d3610 Chanwoo Choi        2014-10-13  416  
19be09f51d3610 Chanwoo Choi        2014-10-13  417  	info->irq_alarm = platform_get_irq(pdev, 0);
faac910201e9be Stephen Boyd        2019-07-30  418  	if (info->irq_alarm < 0)
19be09f51d3610 Chanwoo Choi        2014-10-13  419  		return info->irq_alarm;
1add6781c85d7e Ben Dooks           2006-07-01  420  
ce9af89392024f Marek Szyprowski    2020-12-02  421  	dev_dbg(&pdev->dev, "s3c2410_rtc: alarm irq %d\n", info->irq_alarm);
1add6781c85d7e Ben Dooks           2006-07-01  422  
1add6781c85d7e Ben Dooks           2006-07-01  423  	/* get the memory region */
09ef18bcd5ac6c YueHaibing          2019-10-06  424  	info->base = devm_platform_ioremap_resource(pdev, 0);
19be09f51d3610 Chanwoo Choi        2014-10-13  425  	if (IS_ERR(info->base))
19be09f51d3610 Chanwoo Choi        2014-10-13  426  		return PTR_ERR(info->base);
1add6781c85d7e Ben Dooks           2006-07-01  427  
ab10bbbb4bf910 Liao Yuanhong       2024-08-21  428  	info->rtc_clk = devm_clk_get_enabled(&pdev->dev, "rtc");
eb633de6abcb30 Yang Yingliang      2022-09-19  429  	if (IS_ERR(info->rtc_clk))
eb633de6abcb30 Yang Yingliang      2022-09-19  430  		return dev_err_probe(&pdev->dev, PTR_ERR(info->rtc_clk),
eb633de6abcb30 Yang Yingliang      2022-09-19  431  				     "failed to find rtc clock\n");
e48add8c1c462f Atul Dahiya         2010-07-20  432  
eaf3a659086e1d Marek Szyprowski    2014-10-29  433  	if (info->data->needs_src_clk) {
ab10bbbb4bf910 Liao Yuanhong       2024-08-21  434  		info->rtc_src_clk = devm_clk_get_enabled(&pdev->dev, "rtc_src");
df9e26d093d33a Chanwoo Choi        2014-10-13  435  		if (IS_ERR(info->rtc_src_clk)) {
c52d270c68a02f Krzysztof Kozlowski 2020-08-30  436  			ret = dev_err_probe(&pdev->dev, PTR_ERR(info->rtc_src_clk),
eaf3a659086e1d Marek Szyprowski    2014-10-29  437  					    "failed to find rtc source clock\n");
ab10bbbb4bf910 Liao Yuanhong       2024-08-21  438  			return ret;
df9e26d093d33a Chanwoo Choi        2014-10-13  439  		}
eaf3a659086e1d Marek Szyprowski    2014-10-29  440  	}
df9e26d093d33a Chanwoo Choi        2014-10-13  441  
31b16d978f902b Marek Szyprowski    2020-12-02  442  	/* disable RTC enable bits potentially set by the bootloader */
31b16d978f902b Marek Szyprowski    2020-12-02  443  	if (info->data->disable)
31b16d978f902b Marek Szyprowski    2020-12-02  444  		info->data->disable(info);
31b16d978f902b Marek Szyprowski    2020-12-02  445  
1add6781c85d7e Ben Dooks           2006-07-01  446  	/* check to see if everything is setup correctly */
ae05c95074e0ea Chanwoo Choi        2014-10-13  447  	if (info->data->enable)
ae05c95074e0ea Chanwoo Choi        2014-10-13  448  		info->data->enable(info);
1add6781c85d7e Ben Dooks           2006-07-01  449  
d4a48c2ad75b06 Jingoo Han          2013-02-21  450  	dev_dbg(&pdev->dev, "s3c2410_rtc: RTCCON=%02x\n",
19be09f51d3610 Chanwoo Choi        2014-10-13  451  		readw(info->base + S3C2410_RTCCON));
1add6781c85d7e Ben Dooks           2006-07-01  452  
51b7616e36fbad Yauhen Kharuzhy     2008-10-29  453  	device_init_wakeup(&pdev->dev, 1);
51b7616e36fbad Yauhen Kharuzhy     2008-10-29  454  
dba28c37f23a09 Sam Protsenko       2021-10-21  455  	info->rtc = devm_rtc_allocate_device(&pdev->dev);
19be09f51d3610 Chanwoo Choi        2014-10-13  456  	if (IS_ERR(info->rtc)) {
19be09f51d3610 Chanwoo Choi        2014-10-13  457  		ret = PTR_ERR(info->rtc);
1add6781c85d7e Ben Dooks           2006-07-01  458  		goto err_nortc;
1add6781c85d7e Ben Dooks           2006-07-01  459  	}
1add6781c85d7e Ben Dooks           2006-07-01  460  
dba28c37f23a09 Sam Protsenko       2021-10-21  461  	info->rtc->ops = &s3c_rtcops;
a5feda3b361e11 Sam Protsenko       2021-10-21  462  	info->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
a5feda3b361e11 Sam Protsenko       2021-10-21  463  	info->rtc->range_max = RTC_TIMESTAMP_END_2099;
dba28c37f23a09 Sam Protsenko       2021-10-21  464  
dba28c37f23a09 Sam Protsenko       2021-10-21  465  	ret = devm_rtc_register_device(info->rtc);
dba28c37f23a09 Sam Protsenko       2021-10-21  466  	if (ret)
dba28c37f23a09 Sam Protsenko       2021-10-21  467  		goto err_nortc;
dba28c37f23a09 Sam Protsenko       2021-10-21  468  
19be09f51d3610 Chanwoo Choi        2014-10-13  469  	ret = devm_request_irq(&pdev->dev, info->irq_alarm, s3c_rtc_alarmirq,
19be09f51d3610 Chanwoo Choi        2014-10-13  470  			       0, "s3c2410-rtc alarm", info);
19be09f51d3610 Chanwoo Choi        2014-10-13  471  	if (ret) {
19be09f51d3610 Chanwoo Choi        2014-10-13  472  		dev_err(&pdev->dev, "IRQ%d error %d\n", info->irq_alarm, ret);
19be09f51d3610 Chanwoo Choi        2014-10-13  473  		goto err_nortc;
19be09f51d3610 Chanwoo Choi        2014-10-13  474  	}
eaa6e4dd4bf243 Maurus Cuelenaere   2010-06-04  475  
5a5b614ba61cc2 Marek Szyprowski    2019-01-21  476  	s3c_rtc_disable_clk(info);
5a5b614ba61cc2 Marek Szyprowski    2019-01-21  477  
1add6781c85d7e Ben Dooks           2006-07-01  478  	return 0;
1add6781c85d7e Ben Dooks           2006-07-01  479  
1add6781c85d7e Ben Dooks           2006-07-01  480  err_nortc:
ae05c95074e0ea Chanwoo Choi        2014-10-13  481  	if (info->data->disable)
ae05c95074e0ea Chanwoo Choi        2014-10-13  482  		info->data->disable(info);
1add6781c85d7e Ben Dooks           2006-07-01 @483  }
1add6781c85d7e Ben Dooks           2006-07-01  484  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

