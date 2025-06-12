Return-Path: <linux-rtc+bounces-4293-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB7AD7E6E
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Jun 2025 00:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 792743A4491
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Jun 2025 22:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2742DECBD;
	Thu, 12 Jun 2025 22:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chZHuC9c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F95230D1E;
	Thu, 12 Jun 2025 22:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767650; cv=none; b=aBaNIaEbbbBKJrsNRfDliSqhHOR8kRj/Mw3rdnGEDUHAz5TgR7FdKJRak5Oj8sZhGywW6TROIdj1YhjZ84HFh3umgoEWiAO2l5zznCkH4vAMVoPyyD3MA5a7e52DqG6BtYXJLowz88oJ68FXrTbN5G9UkWAfJVXu4afRphm9XXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767650; c=relaxed/simple;
	bh=NKWTLr65Hcmg0MMBeQ2Z/lSxWCh4uYG9hCxq/seIme8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3KKZk+TC4tp9l/9ZjGl2enSNqlhD0/dt0J/OKbpZtBQLpoxTd2qjgjRgSfxRIhL/G4vz5ga5zNrmvC8ROYeSrBdsnGCKH+lGDLA7wbRq0Ib9gqSrQYD1nUFftW7apmFIzVsDUp9S5WbzseDX7H6v0dirsh5IAzc4A0RIqLGBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chZHuC9c; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749767648; x=1781303648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NKWTLr65Hcmg0MMBeQ2Z/lSxWCh4uYG9hCxq/seIme8=;
  b=chZHuC9ci33WHPbsRz8MFaf0u51tfoerzpMLyTBaHTIgm4PcXCoRetm3
   NWZfGK/pmT4Ga1XhRxmKJhx6w17mfkOm4NNS5tMN9DhL92BDTIb+heS10
   UupcTgYRYUgdzYGdMszYhxsaO8/VMFKmZg7j3QA/imhLVT4MydtPt5gUj
   SYyZngNIw2Lmn9/dJtm0eeBHK+20jlcBmzDfl+W0rvs1ZkJeze7Hoe7p/
   OaSx2MFdg+8YjgnG53riF4Ucm9SLUkAS71hd6fW3q794z5ydJIBUVtxSA
   xuImIrKm2JNZQrEtJOlfHvo6wjaDNVAkzWwaB9Gfv888ANgXENdgVXTNA
   w==;
X-CSE-ConnectionGUID: kvidIT0vQoeCDsmC+f8eVQ==
X-CSE-MsgGUID: CilzCWI1SauycZt7+LLmQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="55771878"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="55771878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 15:34:08 -0700
X-CSE-ConnectionGUID: IgjqehKISRuLCpQGukBFWw==
X-CSE-MsgGUID: /5HrnusNQSmAq6DS1AB4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="184892812"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2025 15:34:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPqUl-000C0I-30;
	Thu, 12 Jun 2025 22:34:03 +0000
Date: Fri, 13 Jun 2025 06:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Wang <wangming01@loongson.cn>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>,
	lixuefeng@loongson.cn, chenhuacai@loongson.cn, gaojuxin@loongson.cn
Subject: Re: [PATCH] rtc: efi: Defer driver initialization to prioritize more
 capable RTCs
Message-ID: <202506130610.5rhXSP5U-lkp@intel.com>
References: <20250611062025.3243732-1-wangming01@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611062025.3243732-1-wangming01@loongson.cn>

Hi Ming,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.16-rc1 next-20250612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Wang/rtc-efi-Defer-driver-initialization-to-prioritize-more-capable-RTCs/20250611-142308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20250611062025.3243732-1-wangming01%40loongson.cn
patch subject: [PATCH] rtc: efi: Defer driver initialization to prioritize more capable RTCs
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20250613/202506130610.5rhXSP5U-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130610.5rhXSP5U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130610.5rhXSP5U-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/rtc/rtc-efi: section mismatch in reference: efi_rtc_driver+0x0 (section: .data) -> efi_rtc_probe (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

