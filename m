Return-Path: <linux-rtc+bounces-4786-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12077B3B9A4
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 13:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DC603601D4
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 11:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF6331159A;
	Fri, 29 Aug 2025 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7cmjufO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECA23043CA;
	Fri, 29 Aug 2025 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465476; cv=none; b=Ix5HiAt041dU/WMJkYsUv/sdOGmJGBqaLYHyjXq7TU9aYKV67wfDzOjqU5uC6a209uSdHX9z3gzR5XU76492ci4XlPLN9IJ/36aE8lCaZPg+c68SsKZN0LlrcEYnQtXBoo0RFH+VTtpfGGfEnr6SQqZ8WflgVAjLzQeLZJi87N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465476; c=relaxed/simple;
	bh=MN1Il3XT7U/RcSriz2Tk4rsIzr1Tdk5cc/+Xb6ZDhtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOHsgIxXXa2LUMFipIJGVMJ48pchx7DpnmcZD04/h0/lL0mKqzS2H320I2MPu9XI/HFTqvSs2T0KjCi1mHqdHsXObFTGi/Hh8ZauczSS8Z/jKFckItchVf3oohYLSmTVq1kEsUJXinRoyHBv2J2Ygf9haK4ZEo+UrnhnngvrbwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7cmjufO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756465475; x=1788001475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MN1Il3XT7U/RcSriz2Tk4rsIzr1Tdk5cc/+Xb6ZDhtM=;
  b=f7cmjufOXQvJGQYrWL/REABmLDRk32TlTQOFS2CNKcEG7pSy7ONup59y
   3zMYs8j8FK+QDtXTTcmP1fEEWt69i2GbVd0jJWezukDLiY8vlAePkSrqN
   hR9Vv9lLvr8MNID670TwDqBE2ZfD4rCS4STVTG4THvzlJlgCF2CBf6eON
   hKLPMkGPRLNMR3iLEh41xQr0IcW1v5ppjxcnr9k9DrJwDyqO6NWxwCcZ0
   Xv9T6njYDNAKCq+elvM/zbrWG2tKkWy4O7eOcY13gIKsJaqxqrR4M+tCL
   hwgy+n2/9qQh0faBcpBhvfUVvlzZKZmSgdgG7zkyZAsxd+AltS95ObFgl
   g==;
X-CSE-ConnectionGUID: XjmvnBnuRcufqgqtirHrBw==
X-CSE-MsgGUID: fvk46NOPQqOhfgKEbAduMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="57943831"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="57943831"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 04:04:35 -0700
X-CSE-ConnectionGUID: wsY8eeOsTdabKwII9Rr7MA==
X-CSE-MsgGUID: wmxIinv+ROSgUDAFQPOhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170739659"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Aug 2025 04:04:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urwtz-000Udr-1z;
	Fri, 29 Aug 2025 11:04:26 +0000
Date: Fri, 29 Aug 2025 19:03:15 +0800
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
Subject: Re: [PATCH v13 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <202508291833.SY2MmoZx-lkp@intel.com>
References: <20250825172057.163883-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825172057.163883-3-elder@riscstar.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6c68f4c0a147c025ae0b25fab688c7c47964a02f]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250826-012424
base:   6c68f4c0a147c025ae0b25fab688c7c47964a02f
patch link:    https://lore.kernel.org/r/20250825172057.163883-3-elder%40riscstar.com
patch subject: [PATCH v13 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
config: x86_64-kismet-CONFIG_I2C_K1-CONFIG_MFD_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250829/202508291833.SY2MmoZx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250829/202508291833.SY2MmoZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291833.SY2MmoZx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for I2C_K1 when selected by MFD_SPACEMIT_P1
   WARNING: unmet direct dependencies detected for I2C_K1
     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
     Selected by [y]:
     - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

