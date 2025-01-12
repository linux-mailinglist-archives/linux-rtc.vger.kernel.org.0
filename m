Return-Path: <linux-rtc+bounces-2883-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF679A0A73D
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 05:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6453A77BD
	for <lists+linux-rtc@lfdr.de>; Sun, 12 Jan 2025 04:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4128C54652;
	Sun, 12 Jan 2025 04:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHuGyLwW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6066E14F90;
	Sun, 12 Jan 2025 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736657573; cv=none; b=qukc6brXWnQsM94ahL54JhrOeJ3OBBRDhBFCVPd2LuS2/YTySP1dHjKae7nClFCUgxb/eTD9JFjfPaUemYHBqjM531J+SorEkQoGP1JRHFrvhVRhrk0MEYz8RAljPrhKsDvSMej48fhLPmfezPTfvhD4Z1bHCwyWpttWE9BZwBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736657573; c=relaxed/simple;
	bh=S6Vbj3DnhAGTqEs4fvOLiBBt0ILIKGbKIuliWiD1C8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYGSZHOeKq6SUevXB1Yc9mL3OsZ7MISsH9Ul+VtAi1UZod4PBGUO2PW+gMImwhi0ZeY7ONgEcKo8GCWqTSz1gohDfbwAiJfB/iPqbbtDAPMrG78tb280xlWl1CuNAnRmEl6RIra+0zDjgQOHakrzf39abTELHuIEYKqhrTwqy0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHuGyLwW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736657572; x=1768193572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S6Vbj3DnhAGTqEs4fvOLiBBt0ILIKGbKIuliWiD1C8U=;
  b=UHuGyLwW8MNaLk1FncMISP0J3GmZl/P46gjpb38D8h+//N4+Z4263iuf
   KdXL5k+Ayoe3QsP1bRmo+lirXXvMcmhl0OfZiph1QUrhWL33zh0zstzTa
   gssXZ/mfQaNe95mxwM/B0XGiXtzY3lPoE70+C1cyvBmoMfItpDBIY+jsL
   WiaENIM8rtdt/D3B0f+6yFIbmxVAk1lNtsBLcFg0HXoJVV/YvA1CDDPcf
   DFPspgf3dbmudh7UZJqCEuDqkhKlUHW0rnuChJ2NbfeLf5IAzrTvuQcz0
   CM1FrxZvo2N9PZgYsNH/xGLFfT7eswQGfhT0JjQ8b54nx/IsFJA5yPdr0
   Q==;
X-CSE-ConnectionGUID: tlZcMIWFSGyCk/huH+Pndg==
X-CSE-MsgGUID: +mqgwE+lSkyPovp6NQ3wYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37069765"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="37069765"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 20:52:51 -0800
X-CSE-ConnectionGUID: Dl/XJOA0TV6JyRP/TiuxRw==
X-CSE-MsgGUID: 4MNUk4+CQbeSz57zZtVYBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104974837"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jan 2025 20:52:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWpxt-000LaQ-0r;
	Sun, 12 Jan 2025 04:52:45 +0000
Date: Sun, 12 Jan 2025 12:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Burri <markus.burri@mt.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v1 3/7] rtc-rv8803: add register definitions for rv8901
 tamper detection
Message-ID: <202501121203.Kw9SnPYP-lkp@intel.com>
References: <20250110061401.358371-4-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110061401.358371-4-markus.burri@mt.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on robh/for-next linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Burri/dt-bindings-rtc-add-new-type-for-epson-rx8901/20250110-141934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20250110061401.358371-4-markus.burri%40mt.com
patch subject: [PATCH v1 3/7] rtc-rv8803: add register definitions for rv8901 tamper detection
config: m68k-randconfig-r122-20250111 (https://download.01.org/0day-ci/archive/20250112/202501121203.Kw9SnPYP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121203.Kw9SnPYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121203.Kw9SnPYP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-rv8803.c:141:26: sparse: sparse: symbol 'pull_resistor_txt' was not declared. Should it be static?
>> drivers/rtc/rtc-rv8803.c:153:26: sparse: sparse: symbol 'trigger_txt' was not declared. Should it be static?
>> drivers/rtc/rtc-rv8803.c:161:26: sparse: sparse: symbol 'buffer_mode_txt' was not declared. Should it be static?
>> drivers/rtc/rtc-rv8803.c:167:26: sparse: sparse: symbol 'trg_status_txt' was not declared. Should it be static?

vim +/pull_resistor_txt +141 drivers/rtc/rtc-rv8803.c

   140	
 > 141	const struct cfg_val_txt pull_resistor_txt[] = {
   142		{ "no", no },
   143		{ "PU/500k", pull_up_500k },
   144		{ "PU/1M", pull_up_1M },
   145		{ "PU/10M", pull_up_10M },
   146		{ "PD/500k", pull_down_500k },
   147		{ "no", 0b101, 1 },
   148		{ "no", 0b110, 1 },
   149		{ "no", 0b111, 1 },
   150		{ NULL }
   151	};
   152	
 > 153	const struct cfg_val_txt trigger_txt[] = {
   154		{ "falling", falling_edge },
   155		{ "rising", rising_edge },
   156		{ "both", both_edges },
   157		{ "both", 0b11, 1 },
   158		{ NULL }
   159	};
   160	
 > 161	const struct cfg_val_txt buffer_mode_txt[] = {
   162		{ "inhibit", inhibit },
   163		{ "overwrite", overwrite },
   164		{ NULL }
   165	};
   166	
 > 167	const struct cfg_val_txt trg_status_txt[] = {
   168		{ "EVIN1", BIT(5) },
   169		{ "EVIN2", BIT(6) },
   170		{ "EVIN3", BIT(7) },
   171		{ "CMD", BIT(4) },
   172		{ "VBATL", BIT(3) },
   173		{ "VTMPL", BIT(2) },
   174		{ "VDDL", BIT(1) },
   175		{ "OSCSTP", BIT(0) },
   176		{ NULL }
   177	};
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

