Return-Path: <linux-rtc+bounces-2648-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC29DF2E0
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Nov 2024 21:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A96F8B2101E
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Nov 2024 20:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2E71AA1E0;
	Sat, 30 Nov 2024 20:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqD03A5D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B541417BD3;
	Sat, 30 Nov 2024 20:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732997271; cv=none; b=LyDG0dP1q3ko65Xr1z3hiMvZ5QQ1mM/plsi7x4OqeEdlXdggq/OsGMHUnuwVsozm5rBcIbaCnpQlb5J4juj2Shxm5WVLauGs9uQdx4iU8HeFkEKvGyIC0Am+pXrVgR77MJRnVELxIFnUmoYFtb7PqcjMlvCQBZcUCYHbJDkIFv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732997271; c=relaxed/simple;
	bh=gA6EPb72gVsgpMXnMkReyXmS2VCY76gjR1DkpggEPOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7eJud/i0FKxUTbxExgWlf8VxRtskyRV6dAgLDRC0rTEdWlvVNaso9a1LV9NCVzZ0a9CTvLbnoEM3x8jdtC4jKX2G1gOxj/aK0moUmeNzslzUnhw2D9oGp9jIuzi3bZJPUEd+cPB9lXB03tnhYPEHZMLhwDNjEbQFi/Qql9mMW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqD03A5D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732997270; x=1764533270;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gA6EPb72gVsgpMXnMkReyXmS2VCY76gjR1DkpggEPOY=;
  b=fqD03A5D7FJI5ysR3HF63+EJr0TNblr8Qko78WOAViigHjsfXXPVM7dx
   egnM60fWTKroesYgzXnGHeA/aMwQt0rp+MvbZ0DBeqOphJkEZdsc6/oHS
   71YOkj/OwPZWcclZ7sTbPt0u5mnAn4/MttBSWvvouahnfbXrqKs6stCqj
   u6D1znt3fHPZna8dE+n+8Hzk4MLYDIAz9jx++ykuysQ03/KfXaSrqsPvK
   W/1jAZ9HX2uzLts+0cqZz1rptGI4VYmsHIN7tNkHD9m8xYtctXBRU0fSP
   IuArJeOAFGo848xtE10uJVLWSA4DGUVuAg2rk3By5dsl+ZgeG26r1I9Si
   A==;
X-CSE-ConnectionGUID: OXyE9H0VSACoeI1QrOOyAA==
X-CSE-MsgGUID: XE8nNzoEQuKqjmAWrrP5sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="32549627"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="32549627"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 12:07:49 -0800
X-CSE-ConnectionGUID: cWDN9k1hSDi9IvGF9R1afw==
X-CSE-MsgGUID: r9FfSjUUTEqQ24qj4fNIyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="123688168"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Nov 2024 12:07:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHTkh-0000wn-3D;
	Sat, 30 Nov 2024 20:07:41 +0000
Date: Sun, 1 Dec 2024 04:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202412010328.kJoRexZK-lkp@intel.com>
References: <20241126114414.419469-4-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126114414.419469-4-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on arm64/for-next/core linus/master v6.12]
[cannot apply to abelloni/rtc-next next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/rtc-s32g-add-NXP-S32G2-S32G3-SoC-support/20241128-095523
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241126114414.419469-4-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20241201/202412010328.kJoRexZK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010328.kJoRexZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010328.kJoRexZK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/rtc/rtc-s32g.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

