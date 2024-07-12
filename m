Return-Path: <linux-rtc+bounces-1492-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 226CC930234
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jul 2024 00:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0AEB1F22F2C
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jul 2024 22:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C686EB64;
	Fri, 12 Jul 2024 22:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp41rG/b"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16F5BACF;
	Fri, 12 Jul 2024 22:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720824357; cv=none; b=mFrJ1auD5alPCSvZEseAvZm3zv/iGtdnTALbs89Gxs9CVjwhj8ygmO56DyTLOBjaLrBDzyzd5ly2b2kn/8ZcCl8yifNR70oUdLOEo4OZTCLlQUnrNOo80/59UlJwIwFkialwg3AuOElxZuoQ5wPNn5PUhTlBNUuxD1JM/YRJtg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720824357; c=relaxed/simple;
	bh=0Qv0tnuJtuXSWEWqZay3RBPKpl8dK30QovUrNJ0WvZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDy7SrZetG9UHK4kDIdfX5Zl2xHBBBUaicsbAiT/KcE9dTSZmSM5l10Nlrfw1qJbVgeN6aMgs9+8tZz5/w9kdDGKI9T6zX0EEkTi/JIafg3Jtzg9ebRUf6YT2n10gVy2gPHzgSkE2cuGzEGJa/S3QxvEc1RYfigOiImDXIa6Mo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sp41rG/b; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720824356; x=1752360356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Qv0tnuJtuXSWEWqZay3RBPKpl8dK30QovUrNJ0WvZs=;
  b=Sp41rG/bZjn8YkKR4y2lvGHL+jMXBcejii0JJs29JSTbaHDaL3C9jULp
   RzW4W3H5IF6oTAMW97H0VKgjVJssq/MECwQCfJyGsYtLvrQpAqUGKKSrU
   PDRg9lxNRflZ/0cvzXnzTGpQxjy6qXWnt1NGBMHH98/kjEwH+/AIXQ1ST
   OzAKPP8fVpUZmCHgqMqqNMq1jlvc4p8G7hl5DqCCtM+7SmeatqaNZVEc7
   ps/YLP+0jE4TPjKpp5Kbpgx/r9O4116KDfKqoE2UFZHQoGt0a8s938haH
   iOE30SndVVRqNpu+SQVStU33g9DaMVdig2cwYM9BmwfmciVqPhP0by6ug
   Q==;
X-CSE-ConnectionGUID: VXRSi+wsR+iUn0Bw/PabXg==
X-CSE-MsgGUID: k6kQcfJ0Re6voSZi1svE4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22152413"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="22152413"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 15:45:55 -0700
X-CSE-ConnectionGUID: B8eCIzbxR0uO3P7A3qK0sQ==
X-CSE-MsgGUID: Yc3RkAqHQUi71V6hAhxzhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="53875232"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2024 15:45:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSP1Q-000bOc-37;
	Fri, 12 Jul 2024 22:45:48 +0000
Date: Sat, 13 Jul 2024 06:44:57 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Caron <valentin.caron@foss.st.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH 2/4] rtc: stm32: add pinctrl and pinmux interfaces
Message-ID: <202407130612.OEicZbNE-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on atorgue-stm32/stm32-next robh/for-next linus/master v6.10-rc7 next-20240712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Caron/dt-bindings-rtc-stm32-describe-pinmux-nodes/20240711-233937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240711140843.3201530-3-valentin.caron%40foss.st.com
patch subject: [PATCH 2/4] rtc: stm32: add pinctrl and pinmux interfaces
config: hexagon-randconfig-r132-20240712 (https://download.01.org/0day-ci/archive/20240713/202407130612.OEicZbNE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce: (https://download.01.org/0day-ci/archive/20240713/202407130612.OEicZbNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130612.OEicZbNE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-stm32.c:192:31: sparse: sparse: symbol 'stm32_rtc_pinctrl_pins' was not declared. Should it be static?

vim +/stm32_rtc_pinctrl_pins +192 drivers/rtc/rtc-stm32.c

   191	
 > 192	const struct pinctrl_pin_desc stm32_rtc_pinctrl_pins[] = {
   193		PINCTRL_PIN(OUT1, "out1"),
   194		PINCTRL_PIN(OUT2, "out2"),
   195		PINCTRL_PIN(OUT2_RMP, "out2_rmp"),
   196	};
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

