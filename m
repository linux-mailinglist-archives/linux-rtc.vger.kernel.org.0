Return-Path: <linux-rtc+bounces-1493-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27A93030B
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jul 2024 03:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7E141F22349
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jul 2024 01:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F22101D5;
	Sat, 13 Jul 2024 01:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeDXqxkw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C501FFBF6;
	Sat, 13 Jul 2024 01:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720834742; cv=none; b=HnLw8MxR8G18/vJsfBNyfaVyq6pCmmJwrNkK31XPCNlrU/3reMYWtS3kT5EXLvrXZuklvJa+yVlXwy52cm46IqMFrNeMFbZV1wSnNQPIM+/2Bu7bi2oyjfKVpzFHKobApEJN/YE547yiC2sPNfyHajD8Iy4LPywozGaBtSnjd8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720834742; c=relaxed/simple;
	bh=WFoMEnzTETrjQMD90rMoI4syPE64SpiNnX2O5Zarsdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzpP9aHSKMGLJ9kHu4wh55xzShgDvx7kb8/ficcwNk67cXfSfc3WBsX2xX1MIii0aPHlBOV180uV+tDZDspe2mPhm7k4lV/X9OS+cpcDPUx0EIib+lQ18fVU5B7G5r9LZarPHjEvA3GHNRqkBRbfXzACURCIr4tBobOfjsZSah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeDXqxkw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720834741; x=1752370741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WFoMEnzTETrjQMD90rMoI4syPE64SpiNnX2O5Zarsdo=;
  b=OeDXqxkwlLM18RjQjyY5Qeti/FtH7oVEFXGP3RrYEtcfdrFNzxvLGBSH
   +10P8gGv23Ylz6Rw09AX+URQ96ZBGeCr8bHdhPbSbbDTnlpWdBUagNlcN
   0dQ71NZiYM+pE1a0zmcr9eLM2BZsjx9BLcFrs2iHjh57769YZg0iUqtAc
   Qfh62RAK/NmMKfWpKkPnEtvo9GM1QA4ScegN0Qc8IqvcHFxabzd7MNnEE
   LbivugS6EZviSC5AGqFpIGxE6OdMrW4UlBlD6LENaZCCfHiUeQAwL8FeX
   bZCYqtuRRTkAQ0CwPRyAmyzDpnv6aSpxlU8MB3QqDjKHKfwKHQHyUiUdL
   w==;
X-CSE-ConnectionGUID: +1wKBfwVSE+aL8x+FsS/Qg==
X-CSE-MsgGUID: 6QPnX2DLRRyl8Dsoe5Wj1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18138901"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="18138901"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 18:39:00 -0700
X-CSE-ConnectionGUID: QXUKavKzR9iBG3VWeemIKQ==
X-CSE-MsgGUID: SgItW86wTn6IMnsyYgT4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="49072484"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jul 2024 18:38:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSRix-000bX4-0N;
	Sat, 13 Jul 2024 01:38:55 +0000
Date: Sat, 13 Jul 2024 09:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Caron <valentin.caron@foss.st.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH 2/4] rtc: stm32: add pinctrl and pinmux interfaces
Message-ID: <202407130943.ie6n2Orh-lkp@intel.com>
References: <20240711140843.3201530-3-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711140843.3201530-3-valentin.caron@foss.st.com>

Hi Valentin,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on atorgue-stm32/stm32-next robh/for-next linus/master v6.10-rc7 next-20240712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Caron/dt-bindings-rtc-stm32-describe-pinmux-nodes/20240711-233937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240711140843.3201530-3-valentin.caron%40foss.st.com
patch subject: [PATCH 2/4] rtc: stm32: add pinctrl and pinmux interfaces
config: i386-buildonly-randconfig-002-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130943.ie6n2Orh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130943.ie6n2Orh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130943.ie6n2Orh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_pinctrl_register_and_init
   >>> referenced by rtc-stm32.c
   >>>               drivers/rtc/rtc-stm32.o:(stm32_rtc_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: pinctrl_enable
   >>> referenced by rtc-stm32.c
   >>>               drivers/rtc/rtc-stm32.o:(stm32_rtc_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

