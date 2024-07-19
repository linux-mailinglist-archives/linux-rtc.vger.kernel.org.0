Return-Path: <linux-rtc+bounces-1560-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87968937D96
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2024 23:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B7F81F21B5B
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2024 21:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625A6148FF2;
	Fri, 19 Jul 2024 21:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHy2AhIe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D434AEF2;
	Fri, 19 Jul 2024 21:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721426393; cv=none; b=X/yUmWp9huRYzA3KMbW4121nsJElLuej7ckUQFcSwx/8SdLEPbbtvdR9xHdkpMjlyGvj3uuhD3wHXxf1+h9WgohNNPk2T8W9mcCaAo9Wpy3gjtX41dP9EZ6w3aPwiUawF5HtE7HLdq2hP5IHoZ70t0f5DJ+OQdIK0DfR85oKLvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721426393; c=relaxed/simple;
	bh=042WQKRj4OmnLPX3zC90dFEG5O4KeJ7wH4dUKSkiFTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODzYLAEAWyw9Ffq8UEPIbWgGHhlcRoTl4dvRQAZP20adir+zmFPoiTs7fitY2GFxy9UcxdFzvwHVmyafLhxpO7tGUJ/Iq/QtgloqJ88RysJGknE7rsz/6cZT3mnkaBvdJmJ+y5MFV5pkyJvE3hr1dGv86SJ11Nn/xS0dASfNHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHy2AhIe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721426392; x=1752962392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=042WQKRj4OmnLPX3zC90dFEG5O4KeJ7wH4dUKSkiFTk=;
  b=YHy2AhIeFGfNw5+pikdocamdMlOQS1/o4iZhgonVdDIW6O/JcICN8Vx7
   fBXKEdIkS23/wtdTc4U+I98c703KBWO6s7Ql3g71K661Ik6lxp9P4MQGC
   WjzWku0x4EMEvR853cJxowit+4cO9HEC8g+b8cdZLWOqUK0A17GPEjhmk
   h0DLCcs/6HcnB/gFjXS3h840Wjmd2AxKHW4n/nkCOvAqev55JU1JOtjGk
   oC3wbtEE/GtuHoPfw3BobPSfBpCn098Xiasr+Cp8ey7gPNp/r1bewfBcU
   eZTaWbe2QxpClU490fGcepZJvbOWCVX0XU9JRS8Wrq2vUo0kKKU1+gJPr
   A==;
X-CSE-ConnectionGUID: BTlbtSnkSQGZf2wJtK96Cw==
X-CSE-MsgGUID: Fm1bYPjwQymYokPeGZ/sKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19020346"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="19020346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 14:59:51 -0700
X-CSE-ConnectionGUID: F/bzdlzZSkiTe4ND6zZ2ug==
X-CSE-MsgGUID: TQzoEX+vSLusdXlSLjtmOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="56091844"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jul 2024 14:59:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUvdh-000icc-0k;
	Fri, 19 Jul 2024 21:59:45 +0000
Date: Sat, 20 Jul 2024 05:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Caron <valentin.caron@foss.st.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v2 2/4] rtc: stm32: add pinctrl and pinmux interfaces
Message-ID: <202407200400.NnW2fJ0q-lkp@intel.com>
References: <20240717074835.2210411-3-valentin.caron@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717074835.2210411-3-valentin.caron@foss.st.com>

Hi Valentin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on atorgue-stm32/stm32-next robh/for-next linus/master v6.10 next-20240719]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Caron/dt-bindings-rtc-stm32-describe-pinmux-nodes/20240717-193541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240717074835.2210411-3-valentin.caron%40foss.st.com
patch subject: [PATCH v2 2/4] rtc: stm32: add pinctrl and pinmux interfaces
config: alpha-kismet-CONFIG_GENERIC_PINCONF-CONFIG_RTC_DRV_STM32-0-0 (https://download.01.org/0day-ci/archive/20240720/202407200400.NnW2fJ0q-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240720/202407200400.NnW2fJ0q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200400.NnW2fJ0q-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCONF when selected by RTC_DRV_STM32
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - RTC_DRV_STM32 [=y] && RTC_CLASS [=y] && (ARCH_STM32 || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for PINMUX
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - RTC_DRV_STM32 [=y] && RTC_CLASS [=y] && (ARCH_STM32 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

