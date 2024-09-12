Return-Path: <linux-rtc+bounces-1951-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23312976019
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 06:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD77B2856E7
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 04:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454DF1885AD;
	Thu, 12 Sep 2024 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyjbzGUw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0CA47;
	Thu, 12 Sep 2024 04:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726116099; cv=none; b=sY5lZqI8LkCxEUuIRil3TGhxXSbxFhAm5COjNnURaNHjXk46GLz7YmodwfzFvkFzBJd+70bRUlJdwLP3X5OafFr1gR5MQmVf65zweYBuEerZQJDe7XdNHol1LYCaxr1fbAmwxjnMkVjscgrJl9Ok0S+Wm8axxzK9WRvEH/HqcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726116099; c=relaxed/simple;
	bh=J+voR34oci4p2IIVjc3qd0YparHlcuZTim//SkaanKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOkjP5rKW3CGq9iEWpUhjU73FfevahILjZE5PkGo4w1MHbX9HBUprzzZWQr836g7A4YJxh/ASz5FrnXVso1T+oJNEqTJqShTdoEbHOmv3IoqaWXbXH7ksaj3nM1+sZdm9bU2a9w09LicGtz449AvUufGebfNkD6tA3v3i1n9yyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyjbzGUw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726116097; x=1757652097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J+voR34oci4p2IIVjc3qd0YparHlcuZTim//SkaanKw=;
  b=eyjbzGUwP1GKQ4eBBwoFd2UzDTWgN9y9cHylvnUaRFDhoggC7u8yj3GU
   VcjG9T0Q0uXyOfeynrEZXqS8QmVFPiwo/fNKqfMhPi1zIXyAf53r8K1X4
   3wvCPRQ+BfiNFGVQPbjteD1H1o/I7BDb5tjtqYLEdkXLeUb3ykbMWdhMh
   4hxvypnE5s4n/CDcssRmSqoZr6vaELGTRV/p1LHy2cDcEJkPyuimVKAPG
   vSvp+3M26ZWEgoe8YA13UGxDKqAZAkfn102Hs5kDNJO/H+CD+7NOGIYp7
   xAeansf3aj18fWGBclmc8O7lj4zYJNunoUS2ixDrK6PEq8jhFNZnSmAHV
   w==;
X-CSE-ConnectionGUID: 2VkQ9vXvSrakro1FHA+pfw==
X-CSE-MsgGUID: X6bj7WsBTJinA+bvPauhkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25051008"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="25051008"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 21:41:36 -0700
X-CSE-ConnectionGUID: CwOQcPi0Rqy9ZzuC58xUVQ==
X-CSE-MsgGUID: bv3X29aXRbWeaiGw38nICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="67822998"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2024 21:41:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sobe6-0004XK-1J;
	Thu, 12 Sep 2024 04:41:30 +0000
Date: Thu, 12 Sep 2024 12:41:16 +0800
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
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202409121103.EX9BTDFT-lkp@intel.com>
References: <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on robh/for-next arm64/for-next/core linus/master v6.11-rc7 next-20240911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20240911-150205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240911070028.127659-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: sh-randconfig-r073-20240912 (https://download.01.org/0day-ci/archive/20240912/202409121103.EX9BTDFT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121103.EX9BTDFT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409121103.EX9BTDFT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-s32g.c:668:34: warning: 'rtc_dt_ids' defined but not used [-Wunused-const-variable=]
     668 | static const struct of_device_id rtc_dt_ids[] = {
         |                                  ^~~~~~~~~~


vim +/rtc_dt_ids +668 drivers/rtc/rtc-s32g.c

   667	
 > 668	static const struct of_device_id rtc_dt_ids[] = {
   669		{.compatible = "nxp,s32g-rtc" },
   670		{ /* sentinel */ },
   671	};
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

