Return-Path: <linux-rtc+bounces-3603-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3C7A6D3AA
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Mar 2025 06:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 006A51890F33
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Mar 2025 05:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD20E1624DD;
	Mon, 24 Mar 2025 05:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LamXcB8Y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3332E337F;
	Mon, 24 Mar 2025 05:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742793089; cv=none; b=usmjCr/5xmoMevfvCt7zcqNj8GHHjctiR+CSIWLxip76Hqk2QC7WDFMdCsSznMRwoTzlMMtG7FiLjno2IC5B92iISLZ/WnWpfBmwzPe5/RwGZV5AAWEG6IuAwdK1NkqN2Pba9gPNzG+QYCoze7kMYzswFxu5EjciAcZgqz/OhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742793089; c=relaxed/simple;
	bh=OGe21FZmth7HYF72oeDzQkXP1oyokZOoHTNNZQgVbus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyXOsvxQRvmogc4xsD9KLMQiTlEhXAZT5uHoWcuTXYO/zEbf994qY/yixi8/qoS/zsRXkiiV3O96hXJaVpWvq0Ck43Nbpd7Vf53LtNe4LK9nmLrxE9EoCHR61awkVjlMdUXRnL84Oeb5y6387yRzDmqWmxm3U3+jmvo8CK2pnC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LamXcB8Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742793087; x=1774329087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OGe21FZmth7HYF72oeDzQkXP1oyokZOoHTNNZQgVbus=;
  b=LamXcB8YW6rmozyzLQPnYXDbBxZpLPX+YWZ0MW392UKD0TXE1shUdUZ1
   Y8jvlyevU5NZ4k2AtTbu44M9jdSFSR1gdkbuQ2FrzUuadPV2UTtLkkVJI
   P5mDUH3QbLkIOpv0kdnNZqnal4Z+eH2Y0PVVQMi+k70x5Ct6s+WWQ/6zn
   EWvw3BXZ6UefhWoRcW696BLSy7P7fCglOoI1q+2oJubKj8Rd4r0E2G8Eg
   YD0woSycbCG93XxHZhiDtXvunQl8KkQuR0SjzWRcqBSmZamtrSbP07dxA
   ywoAVElNYPSN6EE+mQE+z5cDZtoCtTyy8fM1XMbPxlizi/76gPqjgX/jz
   g==;
X-CSE-ConnectionGUID: T5eLVAc8Tj6mEQoo6mZHtA==
X-CSE-MsgGUID: aertAvjWRYShfZiuWAOCYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43707322"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="43707322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 22:11:27 -0700
X-CSE-ConnectionGUID: lvb+ApYzQ2CS7iUwR+4IJg==
X-CSE-MsgGUID: 6mngPGWLRXuxrTOUlhKXlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="124388459"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2025 22:11:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twa5W-0003Hk-22;
	Mon, 24 Mar 2025 05:11:03 +0000
Date: Mon, 24 Mar 2025 13:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH 20/34] mfd: sec: rework platform data and regmap
 instantiating
Message-ID: <202503241201.amdeUwuc-lkp@intel.com>
References: <20250323-s2mpg10-v1-20-d08943702707@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-s2mpg10-v1-20-d08943702707@linaro.org>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c4d4884b67802c41fd67399747165d65c770621a]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Draszik/dt-bindings-mfd-samsung-s2mps11-add-s2mpg10/20250324-064418
base:   c4d4884b67802c41fd67399747165d65c770621a
patch link:    https://lore.kernel.org/r/20250323-s2mpg10-v1-20-d08943702707%40linaro.org
patch subject: [PATCH 20/34] mfd: sec: rework platform data and regmap instantiating
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250324/202503241201.amdeUwuc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503241201.amdeUwuc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503241201.amdeUwuc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/sec-i2c.c:206:48: warning: 's2mps14_data' defined but not used [-Wunused-const-variable=]
     206 | static const struct sec_pmic_i2c_platform_data s2mps14_data = {
         |                                                ^~~~~~~~~~~~


vim +/s2mps14_data +206 drivers/mfd/sec-i2c.c

   205	
 > 206	static const struct sec_pmic_i2c_platform_data s2mps14_data = {
   207		.regmap_cfg = &s2mps14_regmap_config,
   208		.device_type = S2MPS14X,
   209	};
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

