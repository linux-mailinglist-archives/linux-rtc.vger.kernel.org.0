Return-Path: <linux-rtc+bounces-4336-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43118AE3B83
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 12:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419E0175F59
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 10:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5809244663;
	Mon, 23 Jun 2025 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHgUnFIt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6447243964;
	Mon, 23 Jun 2025 10:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672841; cv=none; b=Rh0fpIB3eeB9RF8EdC3wgSXha1ggsjEK2TTgjjVuQ6tikWeAqYDdi8NZq+PYmL9ViZgBleadx9P1u+m2eLgmxVP55Rg6hc82lCBjfC3P8PALbYZrrwplWHFO3VXBXeQkfDAYslfDZd+PzHblFvuwBMZL9q/cR5FkXNAB8wpLQwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672841; c=relaxed/simple;
	bh=CTMtIUJNedb6/eZMALNf3FN6/mwEz+7TXNNH0cp9sN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQoldZS332iGm4VW2h7pKF5VKCWef3BX2P/7Ay2d77De7CyGK2deAUNEdQdSuxb3S3Km9+zn4sIqnkouG/gD/Bd/N3dRC70C6sj4pMlC0K3TuC3c2yQ4xpU7htODCv2ixR/nsxWeZhMkHl5yVCqSkM0C+tC00Hxe0G8yCjAiQbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHgUnFIt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672840; x=1782208840;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTMtIUJNedb6/eZMALNf3FN6/mwEz+7TXNNH0cp9sN8=;
  b=GHgUnFItK4JSnjdFPw/RrNr5/KlEb6kgj5E98JsAStcXsfvmD3bSlVh3
   DMvgTCGDddbphpvTuq2qNZ2qxrAq6f4cdbsTSGSambdwfIpLSVWB8h9z1
   fCbCg9s31ZiopZS14KOSJoOpQCJgGeQd5Fs+0f/LrAfzU5NNizslLac7z
   MbEjsY1sxptBRh/zNH79wHtOsc2bDlmi4n1aZjzegPXazOSbdlJTXoApz
   TkMpsHtMEqkZQnduzud2of49zOSDXIXQcBlGIGdh80kJpmymVRsOurE9e
   mZFQ5TGyG7QKWI0AMal7q9uRIEE4yBzb0nOvWxhX9KjmMtCib6yUVoUol
   w==;
X-CSE-ConnectionGUID: SGmXhaj5S/+GDwEavVpzzg==
X-CSE-MsgGUID: lK5bhIEJTGS/HqaahzoO+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64227969"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64227969"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:00:38 -0700
X-CSE-ConnectionGUID: ZaMOk5/DSy+2aurOnchdFw==
X-CSE-MsgGUID: SMkkK3dfSBGn+/0o7nHOhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151023777"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 03:00:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTdyX-000NvW-0q;
	Mon, 23 Jun 2025 10:00:29 +0000
Date: Mon, 23 Jun 2025 18:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>, lee@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, dlan@gentoo.org,
	wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <202506231727.FiPSVMzv-lkp@intel.com>
References: <20250622032941.3768912-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622032941.3768912-3-elder@riscstar.com>

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d4809e25903ab8e74034c1f23c787fd26d52934]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250622-113200
base:   5d4809e25903ab8e74034c1f23c787fd26d52934
patch link:    https://lore.kernel.org/r/20250622032941.3768912-3-elder%40riscstar.com
patch subject: [PATCH v3 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
config: i386-kismet-CONFIG_MFD_SIMPLE_MFD_I2C-CONFIG_MFD_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250623/202506231727.FiPSVMzv-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250623/202506231727.FiPSVMzv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231727.FiPSVMzv-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_SIMPLE_MFD_I2C when selected by MFD_SPACEMIT_P1
   WARNING: unmet direct dependencies detected for MFD_SIMPLE_MFD_I2C
     Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
     Selected by [y]:
     - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

