Return-Path: <linux-rtc+bounces-1553-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6704B934908
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B0701C22D34
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6586770E5;
	Thu, 18 Jul 2024 07:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClVq7udQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA755886;
	Thu, 18 Jul 2024 07:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288376; cv=none; b=j13W1/5WBk3GTowrw7XY59XerzGHx40+Iun+ehq5qkeZkoUZOiDXpek8gJ4ZjRPlhK7uMDuqfFzC3Rb0uDB/qMC45IgXJYuBPQkx1+QAZo560OxJLr2G6KPcBFxt24LlkHL1xo+b3sDtcNIyGfbRKVdSodCyJ0StGAMCM6pAEbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288376; c=relaxed/simple;
	bh=iqfx6zox9avcJL4qEVcecuVKJ0q9C/Pqzb6XRU+217o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aR91a813sJ1Q5eEppg57QITm5uOK7bzN1NdXPijUu7GZLpsicyVdSUWuunRW/S0Dhecg0Y0i8LxChXz5UAiO2eZfJPYWBNac3j1jjIeIPUZeJ3jtgnmSPf6lHh7q01PrS752CyEOf30I26OiPzSPMhvSRB8aQbhLeUQ/m301yz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClVq7udQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721288375; x=1752824375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iqfx6zox9avcJL4qEVcecuVKJ0q9C/Pqzb6XRU+217o=;
  b=ClVq7udQpbMTFdGtuTbrXvk2ZnWqJ9utWo39e5iCFkMg5Ff/zT9mUzCU
   VnPDhBqOyp9KvMT525T7gGM3b0y5CctTDyIoDNvkTbf4p4nW2nKyQlwbg
   rnG3QG6LkylmAZGCAlQ4uMgVPV15SCQgKWYESAGaipCuMs37vZ9iqWjiH
   jsOxjb0qFFR1ETqAUoiz/e+JBEF9usSaqayp/X+k1m8M0LEmBpxB+1AK6
   aSyDlz/Ma2R0OhSaemo+ra7geYfwwmJaSBxb6iccS79tUGrz0I/3hjBLk
   CTt+p/19PKDj/62E7myqsTbhQzSYwljASkYGjQ2i6XZ22k/VPmhSwxcLR
   w==;
X-CSE-ConnectionGUID: 8I+HqRdUR8K/RGCWc+fRwg==
X-CSE-MsgGUID: QnjoyPRURJKR3mo85nddzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18454001"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="18454001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 00:39:34 -0700
X-CSE-ConnectionGUID: yT08ISXWRJCI4SRoa9C4MQ==
X-CSE-MsgGUID: uIJrFzPSR+CHS3+kTqfs1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="81324210"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jul 2024 00:39:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sULjb-000h3w-1J;
	Thu, 18 Jul 2024 07:39:27 +0000
Date: Thu, 18 Jul 2024 15:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Caron <valentin.caron@foss.st.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v2 3/4] rtc: stm32: add Low Speed Clock Output (LSCO)
 support
Message-ID: <202407181525.BRNKqmNf-lkp@intel.com>
References: <20240717074835.2210411-4-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717074835.2210411-4-valentin.caron@foss.st.com>

Hi Valentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on next-20240718]
[cannot apply to atorgue-stm32/stm32-next robh/for-next linus/master v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Caron/dt-bindings-rtc-stm32-describe-pinmux-nodes/20240717-193541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240717074835.2210411-4-valentin.caron%40foss.st.com
patch subject: [PATCH v2 3/4] rtc: stm32: add Low Speed Clock Output (LSCO) support
config: m68k-kismet-CONFIG_COMMON_CLK-CONFIG_RTC_DRV_STM32-0-0 (https://download.01.org/0day-ci/archive/20240718/202407181525.BRNKqmNf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240718/202407181525.BRNKqmNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181525.BRNKqmNf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for COMMON_CLK when selected by RTC_DRV_STM32
   WARNING: unmet direct dependencies detected for COMMON_CLK
     Depends on [n]: !HAVE_LEGACY_CLK [=y]
     Selected by [y]:
     - RTC_DRV_STM32 [=y] && RTC_CLASS [=y] && (ARCH_STM32 || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - RTC_DRV_STM32 [=y] && RTC_CLASS [=y] && (ARCH_STM32 || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for PINMUX
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - RTC_DRV_STM32 [=y] && RTC_CLASS [=y] && (ARCH_STM32 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

