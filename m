Return-Path: <linux-rtc+bounces-1321-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7651909AAD
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Jun 2024 02:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4C7A1C20E53
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Jun 2024 00:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569711C33;
	Sun, 16 Jun 2024 00:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgBw352i"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D441847;
	Sun, 16 Jun 2024 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718497210; cv=none; b=frphdvIpauAO0x3G47fK94W6mCnqd1IfM8Bo3scWJQdQuk5fbi2O+0Ym+Ha/vGSSP3/g+ZI7XYXfs/PlYc8ATI64uSHpbSjGqqPnEfhysPMcDT5g2oaB7QDfEY7IXLCieYYF78WYx3az4RKHxDMQRaT8nwZkE+oisSo9zJijXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718497210; c=relaxed/simple;
	bh=wwA+OqE2v6eOVsJjxE41uJDGwJ6LUdWs0oez7vI8tJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHCsYaE80ph1JZiJMGvN61BHrGWFYjEtjjlaxKJSMpHWNlwHt6eJWrjWJUFVPPSULSpCGxWx0AqyCYFd0WgTi8I8F7/2fR4AXcPV3vZQv/m7pfwzhgxVSUKbUbqrWJuTzCMy4R78Jgm70nu8xvvsQhB3p4VRg786Wf15iP7Re+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgBw352i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718497208; x=1750033208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wwA+OqE2v6eOVsJjxE41uJDGwJ6LUdWs0oez7vI8tJ0=;
  b=QgBw352iVT0HwrQRoEottbxGdouw5JMoUF8Pk/fp+exg6Q93X3KYR0GX
   rVA4Ad2TUcStQTj0MaNxYa95wEPEY5NcVhpM410t/ywwiYHlJI6/htsnW
   Rq+HQmhEoaseVMKH5MJAXBBISAslLLC3/LtSBiDjksKaN3l4T5gUIhlCR
   w1wQa2NQLdWS3ANFyK9rQD7ugDWpWtpORVz4MbSH2VF8+C/8yvlyT4x/2
   E5UeBadZXLxcwrIlele6XZ0Pj8cNvtJcUxBOlos9E8pni6TIo9lDsuFdI
   Fd5GNVFtLvs8Lv8F8J4WGrIveeZjab+zZaM24uGMQBX9w8V0vykqcD7GU
   w==;
X-CSE-ConnectionGUID: tb3RojjaTM6OZ80nMLDBMg==
X-CSE-MsgGUID: RL2KcAgMQXu0GDuBmibhhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="19145764"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="19145764"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 17:20:08 -0700
X-CSE-ConnectionGUID: Dsk+HKVsTIOhZ4M66bYGxg==
X-CSE-MsgGUID: fZPz2K0uQQih11sk8bAk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41529016"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2024 17:20:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIdcn-0000dm-2e;
	Sun, 16 Jun 2024 00:20:01 +0000
Date: Sun, 16 Jun 2024 08:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, geert+renesas@glider.be,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 04/12] clk: renesas: clk-vbattb: Add VBATTB clock driver
Message-ID: <202406160847.Ns62KOVc-lkp@intel.com>
References: <20240614071932.1014067-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614071932.1014067-5-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-drivers/renesas-clk]
[also build test WARNING on geert-renesas-devel/next linus/master v6.10-rc3 next-20240613]
[cannot apply to abelloni/rtc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/clk-renesas-r9a08g045-Add-clock-reset-and-power-domain-support-for-the-VBATTB-IP/20240614-152418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20240614071932.1014067-5-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH 04/12] clk: renesas: clk-vbattb: Add VBATTB clock driver
config: mips-randconfig-r122-20240616 (https://download.01.org/0day-ci/archive/20240616/202406160847.Ns62KOVc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240616/202406160847.Ns62KOVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160847.Ns62KOVc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/renesas/clk-vbattb.c:132:35: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] size @@     got restricted gfp_t @@
   drivers/clk/renesas/clk-vbattb.c:132:35: sparse:     expected unsigned int [usertype] size
   drivers/clk/renesas/clk-vbattb.c:132:35: sparse:     got restricted gfp_t
>> drivers/clk/renesas/clk-vbattb.c:132:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned int @@
   drivers/clk/renesas/clk-vbattb.c:132:47: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/clk/renesas/clk-vbattb.c:132:47: sparse:     got unsigned int
   drivers/clk/renesas/clk-vbattb.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +132 drivers/clk/renesas/clk-vbattb.c

   119	
   120	static int vbattb_clk_probe(struct platform_device *pdev)
   121	{
   122		struct clk_parent_data parent_data = { .fw_name = "vbattb_xtal" };
   123		struct device_node *np = pdev->dev.of_node;
   124		struct device *dev = &pdev->dev;
   125		struct clk_init_data init = {};
   126		struct vbattb_clk *vbclk;
   127		u32 load_capacitance;
   128		struct clk_hw *hw;
   129		bool bypass;
   130		int ret;
   131	
 > 132		vbclk = devm_kzalloc(dev, GFP_KERNEL, sizeof(*vbclk));
   133		if (!vbclk)
   134			return -ENOMEM;
   135	
   136		vbclk->regmap = syscon_node_to_regmap(np->parent);
   137		if (IS_ERR(vbclk->regmap))
   138			return PTR_ERR(vbclk->regmap);
   139	
   140		bypass = of_property_read_bool(np, "renesas,vbattb-osc-bypass");
   141		ret = of_property_read_u32(np, "renesas,vbattb-load-nanofarads", &load_capacitance);
   142		if (ret)
   143			return ret;
   144	
   145		ret = vbattb_clk_validate_load_capacitance(vbclk, load_capacitance);
   146		if (ret)
   147			return ret;
   148	
   149		ret = devm_pm_runtime_enable(dev);
   150		if (ret)
   151			return ret;
   152	
   153		ret = pm_runtime_resume_and_get(dev);
   154		if (ret)
   155			return ret;
   156	
   157		regmap_update_bits(vbclk->regmap, VBATTB_BKSCCR, VBATTB_BKSCCR_SOSEL,
   158				   bypass ? VBATTB_BKSCCR_SOSEL : 0);
   159	
   160		init.name = "vbattclk";
   161		init.ops = &vbattb_clk_ops;
   162		init.parent_data = &parent_data;
   163		init.num_parents = 1;
   164		init.flags = 0;
   165	
   166		vbclk->hw.init = &init;
   167		hw = &vbclk->hw;
   168	
   169		spin_lock_init(&vbclk->lock);
   170	
   171		ret = devm_clk_hw_register(dev, hw);
   172		if (ret)
   173			goto rpm_put;
   174	
   175		ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, hw);
   176		if (ret)
   177			goto rpm_put;
   178	
   179		return 0;
   180	
   181	rpm_put:
   182		pm_runtime_put(dev);
   183		return ret;
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

