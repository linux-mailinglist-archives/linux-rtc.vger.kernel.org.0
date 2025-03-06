Return-Path: <linux-rtc+bounces-3418-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF35A54E21
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 15:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E958D188E7CA
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 14:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FACF16EB54;
	Thu,  6 Mar 2025 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVqOOTua"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFFB38DE0;
	Thu,  6 Mar 2025 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272487; cv=none; b=qtCHkb94kSrmZgrft6Sgvc68zVlVQQuyHF63wmj1l5DPr0B3UMAgR6hgqmHeccsuxjs2j5f131mP24LUUKxpLmw6GMiTBzZ2bvZBkJQO6KVLG1IUZZ08X+vsqToymvtbmSN63nNDMKjGSoWG1S+faFkZI6at+aKPbtVFGqhvJkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272487; c=relaxed/simple;
	bh=bla4hIb0IkIaS1NTrqHiiXPmlh5fLuqeLRBBeaE0n+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gn33YdsZaI88D1oUJIWb7EiJ00MwYeJRgonilDZhX1F+brqo3hnfnKFUWoHxtin51ypcp4WMoGWWNU2ooV2Z3TX+BobAnDv0rno35ikpyNydZA/Xq2FHwx6ChsWvXOhIRb9k7vA+IZAzXiYgGjl1YV5S0XvA8HabfrDcnMv6+kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVqOOTua; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272484; x=1772808484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bla4hIb0IkIaS1NTrqHiiXPmlh5fLuqeLRBBeaE0n+8=;
  b=BVqOOTuaHTG1pbTEwEKDEotWRQ8ZoSS2AOXIEMbnvW5RUMbYip346gaM
   XM/5xTE7oSAZ73RggYV+0t5SKzQK/THHm7WM/4aOvPCnSDJDUc7w0mfPi
   wOOL+CiKbA4rYOyM63IqrIYvXDfxO7OtzOCHTNzWzo6sBmID8NrMIpEpC
   Q14irORzhoF0vL0H3a9IL5rAS+1SI/4cL3My3HysHg5Ug7s43NTpCveDd
   KWsaF67PP5M9hBB70Qd8OB+lk+Dhxd20vsmUn1WAciaYUroIlh7QfaV7O
   GqN2ttFvuWya9MpOP75gAJqEaeGJ0VGRF+rwBIEV9/s/UGFHOSZ5q/VHU
   A==;
X-CSE-ConnectionGUID: GyHKmLjPRlSEQSbXXJnmMQ==
X-CSE-MsgGUID: pL9/6kfXQOCw9FkYFn9LIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59830996"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="59830996"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:48:04 -0800
X-CSE-ConnectionGUID: o4CM4XnkTwKUZWqrou7E7A==
X-CSE-MsgGUID: gJEqCfufS6On0GZn3XiLUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119052400"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 06:48:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqCVx-000NAs-1f;
	Thu, 06 Mar 2025 14:47:57 +0000
Date: Thu, 6 Mar 2025 22:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v8 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202503062204.QeQoZBYt-lkp@intel.com>
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
[also build test ERROR on arm64/for-next/core krzk-dt/for-next linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20250228-162229
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250228081812.3115478-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v8 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503062204.QeQoZBYt-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503062204.QeQoZBYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503062204.QeQoZBYt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-s32g.c:204:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     204 |         rtcc = FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
         |                ^
   1 error generated.


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

