Return-Path: <linux-rtc+bounces-3416-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF98FA54214
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 06:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDF0F3ADEF8
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 05:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2D119AD8C;
	Thu,  6 Mar 2025 05:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfMQ39WD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E98172A;
	Thu,  6 Mar 2025 05:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239043; cv=none; b=XAn9mZvH9QJS2WRUAcfRbEVeXxpol39jNQj3OsnR04XUGfDFkLV29+1MfKIjU7BfFd/Ohu+l/tVR5n8Axue+WEwUorpiCCprheU9oPD7J8n5CtqJhk0KtjKmoUuMNGzU9Z1EIGO+0dnjaaFozxsJfNRS9RISCURU9bbiV7bdKx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239043; c=relaxed/simple;
	bh=21iO/G2bQw9K65JrUOqRRdhPgZGB06xxok6XVDEcObw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nc+df1CshBbfQuVwLWlbkvo1/K7jcaQGW+GxpylX77+ihQZKHM2VespxfHl4w+M9Lj3pFnppWL54RQG4AaF1brwm6CR94Vfimh7em2Ear1b6DDVRdbhIi6Mpxv3NX20W3u41ua9yl+FNOtLIjZperlIA6jd8Tj5RZnrgbx4t3GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfMQ39WD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741239041; x=1772775041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=21iO/G2bQw9K65JrUOqRRdhPgZGB06xxok6XVDEcObw=;
  b=QfMQ39WD5a8McPhxNMScQqh2EjquCC4+mOvHz477tLbSuxJnF9ip8jyu
   wo+PzYmnZuPCC0xY3w9nQhbfl3DdCqTRxyMOJQ5FYDNeWk1rHhQOiEeC7
   Wvk5aZrCEVTlFOEDkRC6juXKxGoG7HXBniALuoQMnTZQZ6plCBMFDh3Vr
   MpbA7cWE1GJxVgZUdoXc40iQYdCvfW1Ew8I5b6S/V+qp07g1iv/NygYNv
   UmPyDXBcN7fy4nvkF539u61+8D5XH7cxFzs9yyy+FvgzX7ENtlRE8z0/q
   vjnV5Qm+gmxxlcg6CqNgrr97rm3nMuxMnkmERGn6o9HDvGSeCUTejftvq
   A==;
X-CSE-ConnectionGUID: Bwx920g8Q76UIYJvJY+8fw==
X-CSE-MsgGUID: OPpfwte5TGGtEVoYW5Dtrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42258846"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="42258846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 21:30:40 -0800
X-CSE-ConnectionGUID: FOt1b/HPS/Kk/o/pTnuQsA==
X-CSE-MsgGUID: F1Uayh3pT8GmKmLuuh1/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119602412"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2025 21:30:37 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq3oX-000MaE-2x;
	Thu, 06 Mar 2025 05:30:33 +0000
Date: Thu, 6 Mar 2025 13:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
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
Message-ID: <202503061309.yjpOnrMo-lkp@intel.com>
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250306/202503061309.yjpOnrMo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061309.yjpOnrMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061309.yjpOnrMo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/cv1800-rtcsys.c:30:30: warning: 'cv1800_rtcsys_rtc_subdev' defined but not used [-Wunused-const-variable=]
      30 | static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/cv1800_rtcsys_rtc_subdev +30 drivers/mfd/cv1800-rtcsys.c

    29	
  > 30	static const struct mfd_cell cv1800_rtcsys_rtc_subdev =
    31		MFD_CELL_NAME("cv1800-rtc");
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

