Return-Path: <linux-rtc+bounces-5759-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29436D21E05
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jan 2026 01:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC2883009D67
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jan 2026 00:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFA01A073F;
	Thu, 15 Jan 2026 00:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAE7WdvS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DA624B28;
	Thu, 15 Jan 2026 00:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768437757; cv=none; b=Sf58izQ2dXVY8KsENloieTHWz32NyC2U1M8AHwOYQvJKCpMEKLKfIj2V/GwxsWcxF2YiuO8YvEeiOynpZTSQ/ojuwVZeYs2cpSlWTfqMDkkaKSQM68uqwv+W/qR1QoBHY2OaSYw8TAJqvEQkZuDwDOuj+SPE7dSchJYmSGzwJJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768437757; c=relaxed/simple;
	bh=46ZrE0WMU4jUx8qBB1E6yFTcAcqcMpFbiNSws0WY6xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXHfA9RdDvl+OTUe5cHCYYCWzSbapvIBQ36G+99nisU3raaHOzsBJUMc35v2VaREJc5xik7WcycGLvdAD9yFy4Hv2ED6BRnyhpJUOBcgdmrc04XK5S75xPv/67Y2AnQ1fguU0fxeAfTSh3VuBlhxuGPK2zthoV+Jv+zmGYCYXrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAE7WdvS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768437757; x=1799973757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46ZrE0WMU4jUx8qBB1E6yFTcAcqcMpFbiNSws0WY6xE=;
  b=RAE7WdvSi2dpIvU9TvzRTdpgMJU30e5U5mNIE885OlSRHVod19BYH2m0
   qy03n7Crpav4AQmaPAckPWJrFhHWsWVVfcQzcIEs6x8LdBT3QabyClsMj
   qX4YWJv9R4n/M+20TtjTtNqQ/YsDhwCPymcPWZXt1lYXtTkMb0b+iX+bd
   nZ8dQvC57fK0FdsLBzc3ONEt4RuDrTvjUrkPE4Cdnq9obPsNQiSrHcjMS
   wsEwt3CsZRuoXoZJApxzXwvMyTzpbgs6kjq4RA5iF1GZ9kcbD4BAGb/jB
   C6hJvk8XgKx1+YcWD566y2cmax2rdgokL7K8nyigXeONdICcdYTdhXmmt
   Q==;
X-CSE-ConnectionGUID: NuL7KKmcSPeyQ8Lk/HoSBw==
X-CSE-MsgGUID: 0Z7JCxrOQXmjWF8uAWFZmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92418345"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="92418345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 16:42:37 -0800
X-CSE-ConnectionGUID: A342G+IkTnKFu9368MOmLg==
X-CSE-MsgGUID: 4sccYvdRSD+XgoGS7afEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="235541231"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jan 2026 16:42:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgBRY-00000000HGq-0FRf;
	Thu, 15 Jan 2026 00:42:32 +0000
Date: Thu, 15 Jan 2026 08:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Melin <tomas.melin@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tomas Melin <tomas.melin@vaisala.com>
Subject: Re: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
Message-ID: <202601150836.Yk8DcSZW-lkp@intel.com>
References: <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>

Hi Tomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on xilinx-xlnx/master linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomas-Melin/rtc-zynqmp-check-calibration-max-value/20260108-223800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20260108-zynqmp-rtc-updates-v2-3-864c161fa83d%40vaisala.com
patch subject: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260115/202601150836.Yk8DcSZW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150836.Yk8DcSZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150836.Yk8DcSZW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/spi/spi-amlogic-spifc-a4.o: in function `aml_sfc_set_bus_width':
   spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0x8c): undefined reference to `__ffsdi2'
   arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xac): undefined reference to `__ffsdi2'
   arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xcc): undefined reference to `__ffsdi2'
   arm-linux-gnueabi-ld: drivers/rtc/rtc-zynqmp.o: in function `xlnx_rtc_read_offset':
>> rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0xd0): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0x15c): undefined reference to `__aeabi_ldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

