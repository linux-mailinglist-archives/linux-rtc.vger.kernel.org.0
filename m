Return-Path: <linux-rtc+bounces-4828-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A75B43144
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 06:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD0E1C2383B
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 04:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED47230D0F;
	Thu,  4 Sep 2025 04:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lq3FNrgG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A928D45C0B;
	Thu,  4 Sep 2025 04:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756960993; cv=none; b=DzBMn/chwR/T0AD4q7ZsykPb5kr/wVa/WuYwi41UxIHPBulVjygVCjz6vnyaMTGpm9mqwsZaTZglESxn+I83gJW54idyuQXcXdX72DoTK7Arm15TwJhzBw4CrAhZ1bgw0qTPeKeR7O6tgtal791f9HcS9ZnD7NRHcVkwayXRrnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756960993; c=relaxed/simple;
	bh=EZFV2l+6WCpsVXc8n38Qwngh98PTJl9C2BGkwWAYuzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5o1HurFl2dnxz+b+actIJ7snDZoJet7GiLJL3zSeGQktCv25jqUzpiVb6FcF2ZKbuhhTR4HPsEkaFJyV2z8YRI4wzZC8SeCyC9m4aGCuR197SL96BMTt4FRgJQAogp+4hem7z81ZMH5kjPm1UMXNxi90FQlBtOhzevkT9+kJWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lq3FNrgG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756960992; x=1788496992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EZFV2l+6WCpsVXc8n38Qwngh98PTJl9C2BGkwWAYuzc=;
  b=Lq3FNrgG29ctz0eDfLHTIlxPg00Pq18vTPoqnWeKfARtXX/SxKBqosYc
   0mFMHSFJhr4arjyFtO8KwusI/+X6OfcmU0G3esPx/LOwle2Mh+p29G26I
   NW428YPgtg6HUbDoQHXvAINrwDJ0f67jtoSDXwPCWcckUU2WfDxLfHkVD
   YOkWMjoEIsg8J6Rgu278xb4UuJbYWHexBJZiXWSbz1Jk1/j287F28JkeI
   uPrw7dELmdSyoj9Gf1w04GdK4TEgVsX1GHSH9L4T7dBIbt0A9NjZLgbVG
   RNn8LMQfsiEB56qPgHE9xxvl0OdOSkUyfwRHhYO3bi3M3unAbjdQtiYbn
   g==;
X-CSE-ConnectionGUID: LiU+AyBNQ2mG/AGuK/DuHQ==
X-CSE-MsgGUID: HbiyGVzZToKKeFuYhc2lfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="63113289"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="63113289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 21:43:11 -0700
X-CSE-ConnectionGUID: egndLxXZSOyRUKyMeU/jBA==
X-CSE-MsgGUID: TuwL2iDkS+iHBqCo1UkZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="171072545"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Sep 2025 21:43:08 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu1oP-0004l1-19;
	Thu, 04 Sep 2025 04:43:05 +0000
Date: Thu, 4 Sep 2025 12:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com
Subject: Re: [PATCH 6/7] rtc: m41t93: Add square wave clock provider support
Message-ID: <202509041224.AOsBArcW-lkp@intel.com>
References: <c53cdf7c2af95160e05cb4db343bb172a88ae7c9.1756908788.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c53cdf7c2af95160e05cb4db343bb172a88ae7c9.1756908788.git.akhilesh@ee.iitb.ac.in>

Hi Akhilesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.17-rc4 next-20250903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhilesh-Patil/rtc-m41t93-add-device-tree-support/20250903-223155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/c53cdf7c2af95160e05cb4db343bb172a88ae7c9.1756908788.git.akhilesh%40ee.iitb.ac.in
patch subject: [PATCH 6/7] rtc: m41t93: Add square wave clock provider support
config: x86_64-buildonly-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041224.AOsBArcW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041224.AOsBArcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041224.AOsBArcW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-m41t93.c: In function 'm41t93_clk_sqw_unprepare':
>> drivers/rtc/rtc-m41t93.c:364:45: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551551' to '4294967231' [-Woverflow]
     364 |                            M41T93_BIT_SQWE, ~M41T93_BIT_SQWE);


vim +364 drivers/rtc/rtc-m41t93.c

   358	
   359	static void m41t93_clk_sqw_unprepare(struct clk_hw *hw)
   360	{
   361		struct m41t93_data *m41t93 = clk_sqw_to_m41t93_data(hw);
   362	
   363		regmap_update_bits(m41t93->regmap, M41T93_REG_AL1_MONTH,
 > 364				   M41T93_BIT_SQWE, ~M41T93_BIT_SQWE);
   365	}
   366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

