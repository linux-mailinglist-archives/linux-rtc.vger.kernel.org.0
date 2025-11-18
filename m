Return-Path: <linux-rtc+bounces-5408-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5DC6BACC
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 21:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A8124E2D7A
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 20:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E2430C370;
	Tue, 18 Nov 2025 20:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVvBsG4D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936FB30BBA6;
	Tue, 18 Nov 2025 20:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499560; cv=none; b=NHUYyMlM29c1APUt3rA35wCN11TVt2lLK6Ldm0NHcWhtFyHAt6T4FckNkRqTblIV3QE5rjl58akl9Sx2PNnENbVikseHYmzIj2SbGZjRYqnuu8bC76Xcb37oi4SVb44ZJc/cpMUHftTBWVjKf18MY0NakVAjTb29fForXnkNWKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499560; c=relaxed/simple;
	bh=3zQCW8ZIU1UAuqJ1Go8GzUkKCYL0NDu6tWeWbYWHoNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCgMAb6rnPuGHiGyQxG7MD+Hnf05hAkraLl99oJVt4yXM3xfCgLHgfbnxvjmm4g+s+zT2lWYMwi1YEtNnTXE3r5rmkmMHICJnoWk1R0dt9WvUXwtogNCDFhlz9TO+nw/LpBSAG/ND9xVOhZlD2fObNJxK3ZA++68zfqRoQ5B10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVvBsG4D; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763499558; x=1795035558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zQCW8ZIU1UAuqJ1Go8GzUkKCYL0NDu6tWeWbYWHoNU=;
  b=TVvBsG4DXFHCL/+e6HOvu8vIW57rKZxYlisUNyPracRoEDkUBHagu5yL
   GQDQ0gukZhoiST6pAo+fp1EFN03CuXd+PGLBVDfmgK1WXs0xMEm7me49o
   y69QznzmAAhcuZFiCgHi8iE5TPOqv9kLncNnT6j0DlxWQXv8N/gkReK3K
   CITTqrzQIP4tJMngPDeYIOvSnR9VA+gyKJdgcNvDsmlMapPA0vcWZGIxm
   2tQp5jOEkTaIByxeRdX7wxj5+Eo06KvP8OMwUGTvHJP+4hEocpZyUEyi7
   muDjjuC5Wy73JHhGpCvIjNEM1OpGBYHqzUmav7en35+DVx3V4qQBFJO+e
   A==;
X-CSE-ConnectionGUID: n5cs+z7wQ2iqL0xcKDs0Qw==
X-CSE-MsgGUID: Xk2mI572T7GtimH6qqyZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65694824"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65694824"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 12:59:18 -0800
X-CSE-ConnectionGUID: 1xFcZ9plQM+8vetMsIzOZQ==
X-CSE-MsgGUID: FRBlNxw5TDOthqk+eozlrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191106083"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2025 12:59:14 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLSnA-00029z-1m;
	Tue, 18 Nov 2025 20:59:12 +0000
Date: Wed, 19 Nov 2025 04:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>,
	alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pankit.garg@nxp.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	Daniel Aguirre <daniel.aguirre@nxp.com>
Subject: Re: [PATCH v6 2/2] rtc: Add NXP PCF85053 driver support
Message-ID: <202511190432.xfs91BVq-lkp@intel.com>
References: <20251113054243.4045820-2-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113054243.4045820-2-lakshay.piplani@nxp.com>

Hi Lakshay,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on linus/master v6.18-rc6 next-20251118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/rtc-Add-NXP-PCF85053-driver-support/20251113-134432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20251113054243.4045820-2-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 2/2] rtc: Add NXP PCF85053 driver support
config: sparc64-randconfig-001-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190432.xfs91BVq-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190432.xfs91BVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190432.xfs91BVq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/rtc/rtc-pcf85053.c: In function 'pcf85053_probe':
>> drivers/rtc/rtc-pcf85053.c:616:14: error: implicit declaration of function 'i2c_check_functionality' [-Wimplicit-function-declaration]
     616 |         if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-pcf85053.c: At top level:
>> drivers/rtc/rtc-pcf85053.c:729:1: warning: data definition has no type or storage class
     729 | module_i2c_driver(pcf85053_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-pcf85053.c:729:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Wimplicit-int]
>> drivers/rtc/rtc-pcf85053.c:729:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> drivers/rtc/rtc-pcf85053.c:720:26: warning: 'pcf85053_driver' defined but not used [-Wunused-variable]
     720 | static struct i2c_driver pcf85053_driver = {
         |                          ^~~~~~~~~~~~~~~


vim +/i2c_check_functionality +616 drivers/rtc/rtc-pcf85053.c

   608	
   609	static int pcf85053_probe(struct i2c_client *client)
   610	{
   611		struct pcf85053 *pcf85053;
   612		const struct pcf85053_config *config;
   613		const char *iface = NULL;
   614		int err;
   615	
 > 616		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
   617					     I2C_FUNC_SMBUS_BYTE |
   618					     I2C_FUNC_SMBUS_BLOCK_DATA))
   619			return -ENODEV;
   620	
   621		pcf85053 = devm_kzalloc(&client->dev, sizeof(struct pcf85053),
   622					GFP_KERNEL);
   623		if (!pcf85053)
   624			return -ENOMEM;
   625	
   626		config = i2c_get_match_data(client);
   627		if (!config)
   628			return -ENODEV;
   629	
   630		pcf85053->regmap = devm_regmap_init_i2c(client, &config->regmap);
   631		if (IS_ERR(pcf85053->regmap))
   632			return PTR_ERR(pcf85053->regmap);
   633	
   634		i2c_set_clientdata(client, pcf85053);
   635	
   636		pcf85053->client = client;
   637		device_set_wakeup_capable(&client->dev, 1);
   638	
   639		pcf85053->is_primary = true;
   640	
   641		if (of_property_read_string(client->dev.of_node, "nxp,interface", &iface))
   642			return dev_err_probe(&client->dev, -EINVAL,
   643					     "Missing mandatory property: nxp,interface\n");
   644		if (!strcmp(iface, "primary"))
   645			pcf85053->is_primary = true;
   646		else if (!strcmp(iface, "secondary"))
   647			pcf85053->is_primary = false;
   648		else
   649			return dev_err_probe(&client->dev, -EINVAL,
   650					     "Invalid value for nxp,interface: %s\n", iface);
   651	
   652		if (pcf85053->is_primary) {
   653			unsigned int ctrl;
   654			int err;
   655	
   656			err = regmap_read(pcf85053->regmap, PCF85053_REG_CTRL, &ctrl);
   657			if (err)
   658				return err;
   659	
   660			if (of_property_read_bool(client->dev.of_node, "nxp,write-access")) {
   661				if (!(ctrl & PCF85053_BIT_TWO)) {
   662					err = regmap_update_bits(pcf85053->regmap, PCF85053_REG_CTRL,
   663								 PCF85053_BIT_TWO, PCF85053_BIT_TWO);
   664					if (err)
   665						return err;
   666				}
   667				dev_dbg(&client->dev, "Ownership set: TWO=1 (primary writes)\n");
   668			} else {
   669				/* TWO (Time Write Ownership) bit defaults to 0 (Secondary) */
   670				dev_dbg(&client->dev, "Default ownership set: TWO=0 (secondary writes)\n");
   671			}
   672		}
   673	
   674		pcf85053->rtc = devm_rtc_allocate_device(&client->dev);
   675		if (IS_ERR(pcf85053->rtc))
   676			return PTR_ERR(pcf85053->rtc);
   677	
   678		pcf85053->rtc->ops = &pcf85053_rtc_ops;
   679		pcf85053->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
   680		pcf85053->rtc->range_max = RTC_TIMESTAMP_END_2099;
   681		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, pcf85053->rtc->features);
   682		clear_bit(RTC_FEATURE_ALARM, pcf85053->rtc->features);
   683	
   684		if (config->has_alarms && client->irq > 0) {
   685			err = devm_request_threaded_irq(&client->dev, client->irq,
   686							NULL, pcf85053_irq,
   687							IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
   688							"pcf85053", client);
   689			if (err) {
   690				dev_err(&client->dev, "unable to request IRQ %d\n", client->irq);
   691			} else {
   692				set_bit(RTC_FEATURE_ALARM, pcf85053->rtc->features);
   693				device_init_wakeup(&client->dev, true);
   694				err = dev_pm_set_wake_irq(&client->dev, client->irq);
   695				if (err)
   696					dev_err(&client->dev, "failed to enable irq wake\n");
   697			}
   698		}
   699	
   700	#ifdef CONFIG_COMMON_CLK
   701		/* register clk in common clk framework */
   702		pcf85053_clkout_register_clk(pcf85053);
   703	#endif
   704	
   705		return devm_rtc_register_device(pcf85053->rtc);
   706	}
   707	
   708	static const struct i2c_device_id pcf85053_id[] = {
   709		{ "pcf85053", .driver_data = (kernel_ulong_t)&config_pcf85053 },
   710		{ }
   711	};
   712	MODULE_DEVICE_TABLE(i2c, pcf85053_id);
   713	
   714	static const struct of_device_id pcf85053_of_match[] = {
   715		{ .compatible = "nxp,pcf85053", .data = &config_pcf85053 },
   716		{}
   717	};
   718	MODULE_DEVICE_TABLE(of, pcf85053_of_match);
   719	
 > 720	static struct i2c_driver pcf85053_driver = {
   721		.driver		= {
   722			.name	= "rtc-pcf85053",
   723			.of_match_table = of_match_ptr(pcf85053_of_match),
   724		},
   725		.probe		= pcf85053_probe,
   726		.id_table	= pcf85053_id,
   727	};
   728	
 > 729	module_i2c_driver(pcf85053_driver);
   730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

