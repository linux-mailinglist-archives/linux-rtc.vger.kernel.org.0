Return-Path: <linux-rtc+bounces-219-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE77E3C4A
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Nov 2023 13:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4247C280FFF
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Nov 2023 12:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4262F50A;
	Tue,  7 Nov 2023 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0uQ/MOq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDED2E65B;
	Tue,  7 Nov 2023 12:14:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC405B8B;
	Tue,  7 Nov 2023 04:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699359230; x=1730895230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BR1cjSBdfMopOWm50Dq+jOEum45GoCeXwev/zLPfHW0=;
  b=D0uQ/MOqBPxfUfeCOwrOi9M1M7AsIJBQRhgCLLq1yZmNb85s88P1GvLF
   Iq+/cyChOlwXlKV554bBl0eZW22PyShlqv+nfkuefitAz2G3s0f6MFofU
   8xSIrDyyw08giS5wgIaSLVojChNdm3U/Q86Q3umOaCmUbjDVZQtv83phN
   WpBO/IN0FsVGp4e3VTyh0cczl9skAlRicpLJ6O9pGkyxUEMNYOg00aEqV
   hVgTq5xNPjGZHFWeyq6upHnN33HYa7AxAXHrFjX2o0vsN/YHj7VixJZzr
   P3mAotbhwBoZDb84edX3G66QDMIVNafkQw8GmYK3TggmtV6Zu5eNWVAbU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="475736857"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="475736857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 04:13:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="936136351"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="936136351"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Nov 2023 04:13:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Kxb-00075A-1e;
	Tue, 07 Nov 2023 12:13:35 +0000
Date: Tue, 7 Nov 2023 20:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/2] rtc: max31335: add driver support
Message-ID: <202311071920.P1lDlqTA-lkp@intel.com>
References: <20231104112752.3217-2-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231104112752.3217-2-antoniu.miclaus@analog.com>

Hi Antoniu,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on linus/master v6.6 next-20231107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/rtc-max31335-add-driver-support/20231104-202238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20231104112752.3217-2-antoniu.miclaus%40analog.com
patch subject: [PATCH v6 2/2] rtc: max31335: add driver support
config: x86_64-randconfig-121-20231107 (https://download.01.org/0day-ci/archive/20231107/202311071920.P1lDlqTA-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071920.P1lDlqTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311071920.P1lDlqTA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `max31335_clkout_register':
>> drivers/rtc/rtc-max31335.c:595: undefined reference to `devm_clk_hw_register'
>> ld: drivers/rtc/rtc-max31335.c:599: undefined reference to `of_clk_hw_simple_get'
>> ld: drivers/rtc/rtc-max31335.c:599: undefined reference to `devm_of_clk_add_hw_provider'


vim +595 drivers/rtc/rtc-max31335.c

   583	
   584	static int max31335_clkout_register(struct device *dev)
   585	{
   586		struct max31335_data *max31335 = dev_get_drvdata(dev);
   587		int ret;
   588	
   589		if (!device_property_present(dev, "#clock-cells"))
   590			return regmap_clear_bits(max31335->regmap, MAX31335_RTC_CONFIG2,
   591						 MAX31335_RTC_CONFIG2_ENCLKO);
   592	
   593		max31335->clkout.init = &max31335_clk_init;
   594	
 > 595		ret = devm_clk_hw_register(dev, &max31335->clkout);
   596		if (ret)
   597			return dev_err_probe(dev, ret, "cannot register clock\n");
   598	
 > 599		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
   600						  &max31335->clkout);
   601		if (ret)
   602			return dev_err_probe(dev, ret, "cannot add hw provider\n");
   603	
   604		max31335->clkout.clk = devm_clk_get_enabled(dev, NULL);
   605		if (IS_ERR(max31335->clkout.clk))
   606			return dev_err_probe(dev, PTR_ERR(max31335->clkout.clk),
   607					     "cannot enable clkout\n");
   608	
   609		return 0;
   610	}
   611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

