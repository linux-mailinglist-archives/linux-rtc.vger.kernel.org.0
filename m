Return-Path: <linux-rtc+bounces-2254-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A9E9A4E88
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 16:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59B6B28768C
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 14:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DE340C03;
	Sat, 19 Oct 2024 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfSkb7o3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EB52207A;
	Sat, 19 Oct 2024 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729347160; cv=none; b=UMm5i+6apdRRPYCFy41vH+E1lmUjRoZkDKmDmQ3dQ0Y4F60Xm4D7lbnkjS6GyyYb0BX+QPQty+exkZog4alIxaIfB2BK6qFupllXJsPb0dQU8Gp3vUFVvQ7XKvvbBnLRxVKkHADH/ZDt5C/pnKtI+85CRq0noFIC/r6tYjfKSdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729347160; c=relaxed/simple;
	bh=ZrHmr5VaECy8UuvZjqQ6voSNPqYS2zNatLG+hRePEVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXhjQ69TtoHOlUttpejv1Q5npRY8gG/+0U7k4DqQMUoHyBsoVgxqMc+tFu+0B0wnBcqdUlSgPMkyFOnhjF3SXWSC1tS7JyRbbl6TNJYQ1ayF07XXxwrYx/d1yKjzCKoi9JbLEyfJ1VQjSNn/zrdo9YNrx/CLBA7W+Nrwpo5ErZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfSkb7o3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729347159; x=1760883159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZrHmr5VaECy8UuvZjqQ6voSNPqYS2zNatLG+hRePEVY=;
  b=MfSkb7o3kJ60c90kz+h8zChXJPDXB8xYe4VNX2Cg/c7uZqO7z/m9qUtr
   FIHFLN0Vw5LluXbujvTot7VM8CCxsQnJufwl/n7VA0NyiOkcThbhVn1jK
   U94ApDP4TPxlf1r3JO21YPcLwWpi36nw50A4niHclnbAuKu2qi3SaaSuA
   7U72LmXM2Om4OkwhkTUVqujYOedeOoth/+Xv+alHvB9Y0hf5Dt17gn6nz
   oWVYfvvvw9b14GTDY2oWjtEHnWOnW/LVox52aQCrh/TaAFj1xok2DZ2S+
   zSf+8FeIuR5MKMHbBu4LV4k9+5MRAwfvFiZVtzyM9Hyb5RpPCCQaw2pMh
   w==;
X-CSE-ConnectionGUID: ordxXbAnSSOZ9FSZJgp7DA==
X-CSE-MsgGUID: P+t0i6GzRKiSERMCl77Tyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="16487351"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="16487351"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 07:12:38 -0700
X-CSE-ConnectionGUID: VHCoxef/St+94kG9sdfBiQ==
X-CSE-MsgGUID: jMPDadBJSN+1E4RqjaIKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="102423448"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Oct 2024 07:12:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2ABz-000P3P-36;
	Sat, 19 Oct 2024 14:12:31 +0000
Date: Sat, 19 Oct 2024 22:12:02 +0800
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
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202410192150.qZi3WkG1-lkp@intel.com>
References: <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next arm64/for-next/core linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20241015-185302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20241015105133.656360-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: powerpc-randconfig-001-20241019 (https://download.01.org/0day-ci/archive/20241019/202410192150.qZi3WkG1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410192150.qZi3WkG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410192150.qZi3WkG1-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/rtc/rtc-s32g.o: in function `s32g_rtc_get_time_or_alrm':
>> drivers/rtc/rtc-s32g.c:105:(.text+0x1a0): undefined reference to `__udivdi3'
   powerpc-linux-ld: drivers/rtc/rtc-s32g.o: in function `get_time_left':
   drivers/rtc/rtc-s32g.c:105:(.text+0x6a8): undefined reference to `__udivdi3'
   powerpc-linux-ld: drivers/rtc/rtc-s32g.o: in function `sec_to_rtcval':
   drivers/rtc/rtc-s32g.c:105:(.text+0xbfc): undefined reference to `__udivdi3'
   powerpc-linux-ld: drivers/rtc/rtc-s32g.o: in function `rtc_clk_src_switch':
   drivers/rtc/rtc-s32g.c:387:(.text+0x1630): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +105 drivers/rtc/rtc-s32g.c

   102	
   103	static u64 cycles_to_sec(u64 hz, u64 cycles)
   104	{
 > 105		return cycles / hz;
   106	}
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

