Return-Path: <linux-rtc+bounces-3411-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 523B8A50C98
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 21:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 878CD3AC9C5
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 20:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AB025333B;
	Wed,  5 Mar 2025 20:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igia4iXS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABE01DD543;
	Wed,  5 Mar 2025 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741206846; cv=none; b=cvWqgWnU4V2B4qJNEWw0/g2LoJsy+ajORO8e2W1YtTwE5/MPTt3SbvPFypNRjpl7ck2zhhRv8zsB33ebELbRl+ysHSe7eZup+wrRbyqfYaC452MHK94a2TnzZqobfAFwjCaZ5grKZcTuD5EthLOEoc66eT1Nu4FsD0jlFoEytGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741206846; c=relaxed/simple;
	bh=pnPnl0Y7Hh2+wMBdn/c6Xp+d9j2XPjWTAzEbuMwtIyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtu5Ou6zkfEYYmUbca9eyCli2+fi8gdQos4qwGND62JBAQHxMGS2k8jPVSTJ+mO+xsjflrQV0fhkzigfWsILoEkD/RnA2/mO0pQ6v+h4Obp4+yKxnycK8XusdM8NIoHLIT4edZp90maNh+gU7JBfGFCn6JRrJHwDx+40aUaiCII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igia4iXS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741206845; x=1772742845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pnPnl0Y7Hh2+wMBdn/c6Xp+d9j2XPjWTAzEbuMwtIyQ=;
  b=igia4iXSqZGIbtTSOY0NkIClzEnwgQj7JFwUAFNJLheINK3BoJpsOk3e
   xeUsF1d/UH8I+1fW5GuTZnywDkSkKQj/09Q9Jd57GYSg1CRGzgDkTAiC3
   l7JovSu5jzFTp7O1Vf9Kt9x35Gn7VFB3i1GUxLEiDeJ6rQ+YxdrWhGllU
   IWzK6ROOWCJImTuDwLjOVQd0kF1nVq67ClI+Q7SUNfDMFeBb1ncrP1C/g
   vOdXdOHcpEVkaY4QWWFjdf9Jch6aw7YVOJ73zrdMHaQwceuwrgY7u+Lf0
   1WJpGurzC4j8ZeAuRDOutfjQxhKwQFtAiaqLCxVQvt/zIhzR17444pgdj
   w==;
X-CSE-ConnectionGUID: Dzb+0mNSQHSgipPxEnKt2A==
X-CSE-MsgGUID: PQ/vQzIkQ9i4zpxYDrpRDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42390886"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="42390886"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 12:34:04 -0800
X-CSE-ConnectionGUID: UwSLidiaRdeam5BscguJxg==
X-CSE-MsgGUID: 6jagxbcLR+29I2UWtemHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118723547"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2025 12:33:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpvRE-000MB4-2T;
	Wed, 05 Mar 2025 20:33:56 +0000
Date: Thu, 6 Mar 2025 04:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>, dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev
Subject: Re: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <202503060435.1c1akI1Q-lkp@intel.com>
References: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302195205.3183174-3-alexander.sverdlin@gmail.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on abelloni/rtc-next linus/master lee-mfd/for-mfd-fixes v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Sverdlin/dt-bindings-mfd-sophgo-add-RTC-support-for-Sophgo-CV1800-series-SoC/20250303-035433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250302195205.3183174-3-alexander.sverdlin%40gmail.com
patch subject: [PATCH v12 2/3] mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503060435.1c1akI1Q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060435.1c1akI1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060435.1c1akI1Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/cv1800-rtcsys.c:30:30: warning: unused variable 'cv1800_rtcsys_rtc_subdev' [-Wunused-const-variable]
      30 | static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/cv1800_rtcsys_rtc_subdev +30 drivers/mfd/cv1800-rtcsys.c

    29	
  > 30	static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
    31		MFD_CELL_NAME("cv1800-rtc");
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

