Return-Path: <linux-rtc+bounces-4599-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E72DFB135C8
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Jul 2025 09:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963A71897856
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Jul 2025 07:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEAA21D3F3;
	Mon, 28 Jul 2025 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YidYqouM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D31F1517;
	Mon, 28 Jul 2025 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753688319; cv=none; b=TwzUVWAfuZdYpZ3omdX+FTNRyf1LilqJjnPaNyxk7L5jQe2pNwY0HXjpdCRZGgJI6EnoP2um4+sxZKT+TcEdOCIKxbpo6Bhm/D6o+eI5G9xte0LMKoAbtz4Lm8iFe2CpfPVWFfdgZMHqNOjpq3JVH478ZXVg2gcNvt1fG7BKggU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753688319; c=relaxed/simple;
	bh=Atv+h1zy3lGlRpGsaTZb5bGl9bBfscVo1QdxCp3Ycio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fA8uv6xxh+08m67f5elt4+cok7W13wI/1LI+2xIQqp8o6b9VUPE4JVFuvL7Od8Ovw5ZiFXO2fF9rnsFMq6gFR2XmTuutWq8yLBPv/fJP9qQlRKnpu4KcAlV0kEu65DT/nr5aAM0t29LFE58/UaQnXKWaDpR/UyQFOj93ueB9SoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YidYqouM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753688317; x=1785224317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Atv+h1zy3lGlRpGsaTZb5bGl9bBfscVo1QdxCp3Ycio=;
  b=YidYqouMh45FHZEsU2SdUX/UgX7ieWDU9cwq4XKaeAaaG/+BRChlMHa/
   mvpM7+AXTwOyB38keC9LAm1y2tidnsIxp55GJPS0xLlfQJKF+JiDlaPaJ
   TYW34SkxFqp498/oZc9eXSVP942EORVCKGX5zfToey8buv7rlXW5m/ZaV
   yhpJExW7hU9erDp2ZA1PYI+jwRJU99ie2vlQvRatk/YwhiY12HOtpGSsR
   bjQN31X1PpiKAWq45Osl+oew+UjBQ3CazIlWqS7/8eRMxI2ZXxaz/auAo
   jWcZo97YRSvkGu++zBFRawdkLCq1niSlSXqm0VlfbXEV71gmNpli1LAeg
   g==;
X-CSE-ConnectionGUID: chR9AGr2SZ66Slj1kWmEmA==
X-CSE-MsgGUID: bIBsr66cSAOfRUeRjLrn7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="67007810"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67007810"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 00:38:36 -0700
X-CSE-ConnectionGUID: 7fHWNrH9SCKEyS77FrHOWg==
X-CSE-MsgGUID: FLqVuymaRu2UlNmoWUzs0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166517711"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2025 00:38:32 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugIRJ-0000Il-1J;
	Mon, 28 Jul 2025 07:38:29 +0000
Date: Mon, 28 Jul 2025 15:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, alexandre.belloni@bootlin.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1
 regulators
Message-ID: <202507281558.lZ0NYtth-lkp@intel.com>
References: <20250726131003.3137282-5-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250726131003.3137282-5-elder@riscstar.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250726-211530
base:   d7af19298454ed155f5cf67201a70f5cf836c842
patch link:    https://lore.kernel.org/r/20250726131003.3137282-5-elder%40riscstar.com
patch subject: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1 regulators
config: alpha-kismet-CONFIG_MFD_SPACEMIT_P1-CONFIG_REGULATOR_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507281558.lZ0NYtth-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1 when selected by REGULATOR_SPACEMIT_P1
   WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1
     Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
     Selected by [y]:
     - REGULATOR_SPACEMIT_P1 [=y] && REGULATOR [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

