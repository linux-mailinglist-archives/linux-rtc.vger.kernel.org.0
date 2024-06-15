Return-Path: <linux-rtc+bounces-1320-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7A909A3D
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Jun 2024 00:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7131F21B21
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 22:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C4561FE7;
	Sat, 15 Jun 2024 22:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwbYSZgg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E34437;
	Sat, 15 Jun 2024 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718490349; cv=none; b=ZUfZDvWnnxnHvbxPgvu6bfFpUcrDfnSSZTTwsZvjPGjHDRx61at3zFQ6lgAibZzQjbvCrjWd/SxFixohN+YlH0b9YLScKEeyb529lcuNeOAINl8uKUP1Dpf4V+nnXr2oVBIr12q36wpIEm8sJJExZy2Y9id8Z1GH5NxDoDVMRR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718490349; c=relaxed/simple;
	bh=A2hstDhQZ5S0gwxbLbj2Jb2iBUIkoWski4QLeEnDEe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY9a8qr6R+dnxN3lhvhUW4xdFJuEYqVcjRn8mMsFakVX+dy2Qwzu4WX7FtaLO10TWqm8AaeOPqaXWwCnRv02ylW/rBBjepswVjeM0gCRTexdzVJb6AnEFGGoA6Oqd03D5BiZgpANLab4mf4jsJ//GuZ/n0N9eaNOc+bC4u7+Xss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwbYSZgg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718490347; x=1750026347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A2hstDhQZ5S0gwxbLbj2Jb2iBUIkoWski4QLeEnDEe8=;
  b=HwbYSZgg3jiODoQa0v9UgSkKEf6+Yw6bPHDYbU9xhq0tevCQaPhTUgaR
   MddlsGGVRRYZDlQVlUzYLCO8N4+/HlLwyoV8sgZ4hZY//QbQsulNE5QBs
   M0fGQScYfzU8rkK2i6umyXdmM8g4fEWwZdrfgUVI6CvCNjDw1DvmDeVeh
   xMcfYrfPE2sTDsccls1WxHDdidCQzm5omqlnS+tGYinxEKfHrulVWPU0W
   qyKW3Frl/H323udOGiSlbyJ498vZgqeXor/DE5aM4VNtN2qcktxx7E/ID
   IJwyZ43yB9UpjRTihCRBQEjB/c/DI89ENeDq7ondCO7vwIH7N+D2P8MRB
   Q==;
X-CSE-ConnectionGUID: ZQO2Afs8RYK0jNEmDxGceA==
X-CSE-MsgGUID: b+rGzzsDTVCLjZWH7z5kwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="26753948"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="26753948"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 15:25:46 -0700
X-CSE-ConnectionGUID: jlBJ7J+9TPamy2WuDkvQaw==
X-CSE-MsgGUID: aa5eA/D6RIW0bhjpE6l7zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45767365"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jun 2024 15:25:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIbq7-0000Yt-2r;
	Sat, 15 Jun 2024 22:25:39 +0000
Date: Sun, 16 Jun 2024 06:25:15 +0800
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
Message-ID: <202406160533.s4RRLDes-lkp@intel.com>
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
config: arm64-randconfig-r131-20240615 (https://download.01.org/0day-ci/archive/20240616/202406160533.s4RRLDes-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240616/202406160533.s4RRLDes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160533.s4RRLDes-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/renesas/clk-vbattb.c:132:35: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long [usertype] size @@     got restricted gfp_t @@
   drivers/clk/renesas/clk-vbattb.c:132:35: sparse:     expected unsigned long [usertype] size
   drivers/clk/renesas/clk-vbattb.c:132:35: sparse:     got restricted gfp_t
>> drivers/clk/renesas/clk-vbattb.c:132:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] gfp @@     got unsigned long @@
   drivers/clk/renesas/clk-vbattb.c:132:47: sparse:     expected restricted gfp_t [usertype] gfp
   drivers/clk/renesas/clk-vbattb.c:132:47: sparse:     got unsigned long
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

