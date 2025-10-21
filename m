Return-Path: <linux-rtc+bounces-5118-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9FBF586B
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 11:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA5B04F2CC4
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EDC2DEA8F;
	Tue, 21 Oct 2025 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFX/nQQ7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231AD221F0C;
	Tue, 21 Oct 2025 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039254; cv=none; b=fyhg3IymSizjk/wUKL0RnGt6gHmT8xkBHfOeL0PXfOL2KjR2K+KnVL/Ar4NA8sUdAGqZnlMea3A5Yw6HCWLAfCOyg2/x6o7OZaorGlCQqnrI6+xHJjPk3cu/ZUp7yJwqsvDXBiAo9749FVAkUGU0F+LpO5NysJa8FfEDT8nOXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039254; c=relaxed/simple;
	bh=NuNaGs/aTEkE7RGJzLyuoXHuGc7MDkZXmN/08+xvIOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuPq2L4y6mpP/G28iqRtQfiiwp4J0tB6mOAH4ono8mSSQG85P/H3WSAyRFY5n41yFSkiUwyXLxz9MSN3iO+SfB0Sn5vdiZTrXkzN4x8AfJQAP8s0Q/toXnFMZFdUA6Hd8Xqwjt+0sZfHv5dBCGjGIjLv4lED/AD5ck8uVdCYpBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFX/nQQ7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761039252; x=1792575252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NuNaGs/aTEkE7RGJzLyuoXHuGc7MDkZXmN/08+xvIOc=;
  b=lFX/nQQ7uhNa+ONRAR1zv2WAC4W9bYMBRmlHhy8Eon2RO46cDXN4ukPM
   paQW/SHXCBxqFRVES/Q+M3CCy70nq0EiEfLXB0YhjrVb0bKz/N3NA02LS
   jTXjIpWTzsRVxoyRoOS/5+nn4oToXRIFdAsOLOeSMZtL4AWrj+j8twsIu
   j7mXSDWiLI0OkUMF+5fmwytywVzcTNvF4Gwr++0PhKP5MT8KtTbhsTB9b
   qeaDHZxDj1NF5iuwOWLqk/vo3Ueok0GkaxcnvN2L70k9tWxIn8wvgf2/g
   VB3nF77RpkRvmPlwhQW+O4L1WLI0Jr5URf4lX7r7HSdhxg7hFgcOSWQRl
   g==;
X-CSE-ConnectionGUID: F60VwwwuTfOyJhRvdPaxyA==
X-CSE-MsgGUID: ZH1hGBcmR8aB5N9jU0zZTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73833360"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="73833360"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 02:34:11 -0700
X-CSE-ConnectionGUID: vD6z0ZsJRle3uMTT2KkwVg==
X-CSE-MsgGUID: xor/ioRCQdqRm1zZIOR81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183254367"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2025 02:34:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB8ih-000AhN-37;
	Tue, 21 Oct 2025 09:33:39 +0000
Date: Tue, 21 Oct 2025 17:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] rtc: amlogic-a4: fix double free caused by devm
Message-ID: <202510211756.vnQ8ZIWo-lkp@intel.com>
References: <20251020150956.491-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020150956.491-1-vulab@iscas.ac.cn>

Hi Haotian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/rtc-amlogic-a4-fix-double-free-caused-by-devm/20251020-231345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20251020150956.491-1-vulab%40iscas.ac.cn
patch subject: [PATCH] rtc: amlogic-a4: fix double free caused by devm
config: i386-buildonly-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211756.vnQ8ZIWo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211756.vnQ8ZIWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211756.vnQ8ZIWo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-amlogic-a4.c:425:23: warning: unused variable 'rtc' [-Wunused-variable]
     425 |         struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
         |                              ^~~
   1 warning generated.


vim +/rtc +425 drivers/rtc/rtc-amlogic-a4.c

c89ac9182ee297 Yiting Deng  2024-11-12  419  
c89ac9182ee297 Yiting Deng  2024-11-12  420  static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
c89ac9182ee297 Yiting Deng  2024-11-12  421  			 aml_rtc_suspend, aml_rtc_resume);
c89ac9182ee297 Yiting Deng  2024-11-12  422  
c89ac9182ee297 Yiting Deng  2024-11-12  423  static void aml_rtc_remove(struct platform_device *pdev)
c89ac9182ee297 Yiting Deng  2024-11-12  424  {
c89ac9182ee297 Yiting Deng  2024-11-12 @425  	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
c89ac9182ee297 Yiting Deng  2024-11-12  426  
8c28c4993f117e Wolfram Sang 2024-12-17  427  	device_init_wakeup(&pdev->dev, false);
c89ac9182ee297 Yiting Deng  2024-11-12  428  }
c89ac9182ee297 Yiting Deng  2024-11-12  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

