Return-Path: <linux-rtc+bounces-3410-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84DA50973
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 19:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0AB3A47C5
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 18:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF1D2586C8;
	Wed,  5 Mar 2025 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLi/uosf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D6253329;
	Wed,  5 Mar 2025 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741198602; cv=none; b=Tc6/C4U5R6elFbdYCJvLKFo8uKrHj5bMy2CLi7OV3IsTbcbMAWPnku/iVMsAeAdn7iBlMbAmd2kJFhkjHzM6PMPjUynRdoNnqWb0IFFMIA2TaclGZqSxx1yPHIXnnBXz9ALe1Y6o3zp4RofxE+33xdrFSf/TNC2tk5hnzFad7Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741198602; c=relaxed/simple;
	bh=5LRuZg0UTzGUj7t5oXfbPHk4QtNXMrZZ51pxOPxYi4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASZtGQv4mJTfNAzi76ZeHBcFg/cwBVpSVj+ActgkJc5JWu8hQuJRNwawug8HYXX4B9Ch2cM2ethF2IV+pCY6Rhx4DDtQINpu3kEWptpX2dT6s09832txnWCAZWoyBQmDEmMYue/6ff2/XguQljiLSuP1aNCOcOVArtwlIehxwXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLi/uosf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741198599; x=1772734599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LRuZg0UTzGUj7t5oXfbPHk4QtNXMrZZ51pxOPxYi4k=;
  b=TLi/uosfxY9uPIOmiSnOxEDWKXzzR3/h7+7lNUCLY8Moz2teVo1G0Nqo
   n9cZ3TrEK7o00ZrMt353siFD8qrSuNuhCdZ6fnbr0UFJyMQnNgo4D95h3
   7UQSpbAd9f8JFAWBOQ5Ile3KA32JDd7kR9Ql3PP5qwEQKrSw4thhJ7mkv
   UrGyUj+RScewuHhyELc8bmz6ra5VvJALMNo0EJzhsuBVFOGxQwm1E/xsE
   gbzEc/nubPEVIP0hrqClhWdURLiIwqCLkOFbsmBb8J+A6khuTX/LSrN1G
   oH8M6B10fbLE3oGBsQL2etw7rzM0KVjopNJ1II26oAr0/dBWuwfLC7ctY
   A==;
X-CSE-ConnectionGUID: vZTIuVQ/R/ijC0nIBsVmTg==
X-CSE-MsgGUID: vNso0hr8RaCv1LgzaxhPig==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42309689"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42309689"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 10:16:39 -0800
X-CSE-ConnectionGUID: Ddn4YyTUSb6xo8euSJAHZA==
X-CSE-MsgGUID: LWrbSZbtS8iH5IoWIPdprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="123870141"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2025 10:16:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tptIG-000Lro-24;
	Wed, 05 Mar 2025 18:16:32 +0000
Date: Thu, 6 Mar 2025 02:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v8 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202503060247.j7Mbl9vb-lkp@intel.com>
References: <20250228081812.3115478-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228081812.3115478-3-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core krzk-dt/for-next linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20250228-162229
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250228081812.3115478-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v8 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250306/202503060247.j7Mbl9vb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060247.j7Mbl9vb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060247.j7Mbl9vb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-s32g.c: In function 'rtc_clk_src_setup':
>> drivers/rtc/rtc-s32g.c:204:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     204 |         rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
         |                ^~~~~~~~~~


vim +/FIELD_PREP +204 drivers/rtc/rtc-s32g.c

   196	
   197	static int rtc_clk_src_setup(struct rtc_priv *priv)
   198	{
   199		u32 rtcc;
   200	
   201		if (priv->rtc_data->reserved_clk_mask & (1 << priv->clk_src_idx))
   202			return -EOPNOTSUPP;
   203	
 > 204		rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
   205	
   206		switch (priv->rtc_data->clk_div) {
   207		case DIV512_32:
   208			rtcc |= RTCC_DIV512EN;
   209			rtcc |= RTCC_DIV32EN;
   210			break;
   211		case DIV512:
   212			rtcc |= RTCC_DIV512EN;
   213			break;
   214		case DIV32:
   215			rtcc |= RTCC_DIV32EN;
   216			break;
   217		case DIV1:
   218			break;
   219		default:
   220			return -EINVAL;
   221		}
   222	
   223		rtcc |= RTCC_APIEN | RTCC_APIIE;
   224		/*
   225		 * Make sure the CNTEN is 0 before we configure
   226		 * the clock source and dividers.
   227		 */
   228		s32g_rtc_disable(priv);
   229		writel(rtcc, priv->rtc_base + RTCC_OFFSET);
   230		s32g_rtc_enable(priv);
   231	
   232		return 0;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

