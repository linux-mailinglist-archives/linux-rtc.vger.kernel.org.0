Return-Path: <linux-rtc+bounces-3351-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6625DA4AD29
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Mar 2025 18:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E3143AE850
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Mar 2025 17:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55E21E51F2;
	Sat,  1 Mar 2025 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aItFFWsC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC851DF985;
	Sat,  1 Mar 2025 17:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740851311; cv=none; b=XFtl2nsOE/k/9NIGmBpWlFkwccWE7EnLhGQgoTf2p9t8NcBNm2laOIM1u/fn1dLgP5XPj0o3SNLvD4/9ic6Sp/WH8YANsYPcVHk9RJoGQ6tYmC2atVdjHkUirGMZmvCblP0pFR2ePDHj99h4VTC1mYf30eKALDkKq08rWj7KXX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740851311; c=relaxed/simple;
	bh=IMSIu8jvdDwIJAM4fLeDemvtPcKTwRRhp37hHpIn+X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pd3XZ/2m1KYzhuZxkU0jXEZls1WizwJ0bWpUVDufP5LteO7KFRTV/mj9+TYQmW/0AE5AVhPa7sKVdgEtPODe/Zr+3IYO9CBbqAJlcNj2i/olVlMkzBOwTJsB3DY6yIBIqXrpwy1iUpZQk8WkNwTQUlsOP5kVuQBv6NjGh6IXGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aItFFWsC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740851310; x=1772387310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IMSIu8jvdDwIJAM4fLeDemvtPcKTwRRhp37hHpIn+X4=;
  b=aItFFWsC2x64dQLdnGQi2xEwaRiaZbAbhVMhhINZb6mEZyZuzBhp17Pm
   bQP+zTbSZUMPBC+D8zVRTeO3nsQ5yUnBsPdlJ3RswEW73uKxN7fAVQHJR
   D5zLd6ywrPTn8Sp2kTEBF+iUIVnzRkQiqZFSgi3POyevW/txiTPPJ7h8Y
   mrHQTsrPQYUlxnMRtgeB9H9cyKxF926Q2yObkJVS1MzchUeNRI5z5B/YC
   h5UQDz8bP9Lmy8wuRrUi7BkohCYYjo2sYbMnNBbneKhbcZzQFAqyAQn4n
   I1zrJseuAtF5Gv7RQZi8S4JBbf7CA+2kdvcJyxZ22qNjUltyezyWRuRnJ
   w==;
X-CSE-ConnectionGUID: nZihORliT5GCaurnzZqiAw==
X-CSE-MsgGUID: ThTpe3eNS+6T0Lx8WS7iUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41650278"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="41650278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 09:48:29 -0800
X-CSE-ConnectionGUID: vgYcIYDcRt+mQdx99iLk9w==
X-CSE-MsgGUID: L50jgmYYT9+XgO2hztfjcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="140844857"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 09:48:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toQwo-000GWE-0u;
	Sat, 01 Mar 2025 17:48:22 +0000
Date: Sun, 2 Mar 2025 01:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	=?iso-8859-1?Q?T=F3th_J=E1nos?= <gomba007@gmail.com>,
	Dianlong Li <long17.cool@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH 02/18] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
Message-ID: <202503020150.LkqTktVQ-lkp@intel.com>
References: <20250228-rtc-cleanups-v1-2-b44cec078481@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228-rtc-cleanups-v1-2-b44cec078481@linaro.org>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0226d0ce98a477937ed295fb7df4cc30b46fc304]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Draszik/rtc-max77686-drop-needless-struct-max77686_rtc_info-rtc-member/20250228-221320
base:   0226d0ce98a477937ed295fb7df4cc30b46fc304
patch link:    https://lore.kernel.org/r/20250228-rtc-cleanups-v1-2-b44cec078481%40linaro.org
patch subject: [PATCH 02/18] rtc: s5m: drop needless struct s5m_rtc_info::i2c member
config: arm-randconfig-004-20250301 (https://download.01.org/0day-ci/archive/20250302/202503020150.LkqTktVQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020150.LkqTktVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020150.LkqTktVQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-s5m.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/rtc/rtc-s5m.c:678:46: warning: variable 'i2c' is uninitialized when used here [-Wuninitialized]
     678 |         i2c = devm_i2c_new_dummy_device(&pdev->dev, i2c->adapter,
         |                                                     ^~~
   drivers/rtc/rtc-s5m.c:642:24: note: initialize the variable 'i2c' to silence this warning
     642 |         struct i2c_client *i2c;
         |                               ^
         |                                = NULL
   2 warnings generated.


vim +/i2c +678 drivers/rtc/rtc-s5m.c

   637	
   638	static int s5m_rtc_probe(struct platform_device *pdev)
   639	{
   640		struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
   641		struct s5m_rtc_info *info;
   642		struct i2c_client *i2c;
   643		const struct regmap_config *regmap_cfg;
   644		int ret, alarm_irq;
   645	
   646		info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
   647		if (!info)
   648			return -ENOMEM;
   649	
   650		switch (platform_get_device_id(pdev)->driver_data) {
   651		case S2MPS15X:
   652			regmap_cfg = &s2mps14_rtc_regmap_config;
   653			info->regs = &s2mps15_rtc_regs;
   654			alarm_irq = S2MPS14_IRQ_RTCA0;
   655			break;
   656		case S2MPS14X:
   657			regmap_cfg = &s2mps14_rtc_regmap_config;
   658			info->regs = &s2mps14_rtc_regs;
   659			alarm_irq = S2MPS14_IRQ_RTCA0;
   660			break;
   661		case S2MPS13X:
   662			regmap_cfg = &s2mps14_rtc_regmap_config;
   663			info->regs = &s2mps13_rtc_regs;
   664			alarm_irq = S2MPS14_IRQ_RTCA0;
   665			break;
   666		case S5M8767X:
   667			regmap_cfg = &s5m_rtc_regmap_config;
   668			info->regs = &s5m_rtc_regs;
   669			alarm_irq = S5M8767_IRQ_RTCA1;
   670			break;
   671		default:
   672			dev_err(&pdev->dev,
   673					"Device type %lu is not supported by RTC driver\n",
   674					platform_get_device_id(pdev)->driver_data);
   675			return -ENODEV;
   676		}
   677	
 > 678		i2c = devm_i2c_new_dummy_device(&pdev->dev, i2c->adapter,
   679						RTC_I2C_ADDR);
   680		if (IS_ERR(i2c)) {
   681			dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
   682			return PTR_ERR(i2c);
   683		}
   684	
   685		info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
   686		if (IS_ERR(info->regmap)) {
   687			ret = PTR_ERR(info->regmap);
   688			dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",
   689					ret);
   690			return ret;
   691		}
   692	
   693		info->dev = &pdev->dev;
   694		info->s5m87xx = s5m87xx;
   695		info->device_type = platform_get_device_id(pdev)->driver_data;
   696	
   697		if (s5m87xx->irq_data) {
   698			info->irq = regmap_irq_get_virq(s5m87xx->irq_data, alarm_irq);
   699			if (info->irq <= 0) {
   700				dev_err(&pdev->dev, "Failed to get virtual IRQ %d\n",
   701					alarm_irq);
   702				return -EINVAL;
   703			}
   704		}
   705	
   706		platform_set_drvdata(pdev, info);
   707	
   708		ret = s5m8767_rtc_init_reg(info);
   709		if (ret)
   710			return ret;
   711	
   712		info->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
   713		if (IS_ERR(info->rtc_dev))
   714			return PTR_ERR(info->rtc_dev);
   715	
   716		info->rtc_dev->ops = &s5m_rtc_ops;
   717	
   718		info->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
   719		info->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
   720	
   721		if (!info->irq) {
   722			clear_bit(RTC_FEATURE_ALARM, info->rtc_dev->features);
   723		} else {
   724			ret = devm_request_threaded_irq(&pdev->dev, info->irq, NULL,
   725							s5m_rtc_alarm_irq, 0, "rtc-alarm0",
   726							info);
   727			if (ret < 0) {
   728				dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
   729					info->irq, ret);
   730				return ret;
   731			}
   732			device_init_wakeup(&pdev->dev, true);
   733		}
   734	
   735		return devm_rtc_register_device(info->rtc_dev);
   736	}
   737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

