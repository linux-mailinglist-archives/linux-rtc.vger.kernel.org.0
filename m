Return-Path: <linux-rtc+bounces-4829-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28253B4317B
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 07:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C02A5683444
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 05:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29639223DEA;
	Thu,  4 Sep 2025 05:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIPwV8Ay"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0576633E7;
	Thu,  4 Sep 2025 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756962490; cv=none; b=Y589GXmZkuOS6ixIV+ItRAb0je0yCQKjT1KxIvnfjJ38FrS+wYkBM5qxVvT/8bqwayI41P4I3CWM5lkjalZrspeOhoojsZoXm36Wi/05WGpClHInYcAD8t/avZuUv5UqeoKvXPWzE0JjwsN4GmdnPvAsMdpgu2NUKKjm1atUFVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756962490; c=relaxed/simple;
	bh=/E3ODOyt/ul/cNq+1pBNpWoddCBbz0iwGXMszT0SzZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLzMwUMn3+8ZyKND+yO9XMhH6fl7ECiMSF6MxPrATV290c1kJGd1p9fdMpKGcFQFAn5xIG8INV+3Rg2kkX9n/ve3latcUZFlj5SrwLeqMKTyf2xXvML2HFAhyzVFtpG0+kRxSonwKLKfazFbnDHX2HX+AX91x1DOoA4+9wnLAqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIPwV8Ay; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756962488; x=1788498488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/E3ODOyt/ul/cNq+1pBNpWoddCBbz0iwGXMszT0SzZg=;
  b=FIPwV8AyNPh8ck3ybfSbbQzRwciEsA4cGtIS8Zu9sYiSxiJmnzNr8FIR
   3M5ZV6FMA+vfMslAHFMI8vly9q9VQnM5GIByWEeDPnAUJ60GEYq9TnQr8
   nuwNyAdYF8ZyHzYUhYOj3WN/z6AM4Mi7bN7NNu4pd/NgrMyocgefArpVc
   gpR5brYtQaC7n55QFm/PVIYB1kXFFPNJQkow4QGs0NWSyj4Rh5tiZiSeW
   Z2SIarC3s3erjD6kKlBz1MT7MB7Dl31WtdYhDZV9u9b6c1mLYu9weHJoW
   p3hB4mhDTus5Hd6tA61JdBkKLjaOq6b102ZaQGh5oLPIINarwmlRXq8EG
   A==;
X-CSE-ConnectionGUID: CDo763jaS7SyUVM24Ltz5g==
X-CSE-MsgGUID: 8IQSCjFhQp2gGyVFmJHdWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59145103"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="59145103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 22:08:07 -0700
X-CSE-ConnectionGUID: LVefBA/aSZCDbH1uG8xymQ==
X-CSE-MsgGUID: ga65NyoaTtCYo223a/4xZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="175920482"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Sep 2025 22:08:04 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu2CY-0004mZ-0A;
	Thu, 04 Sep 2025 05:08:02 +0000
Date: Thu, 4 Sep 2025 13:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: Re: [PATCH 4/7] rtc: m41t93: Add alarm support
Message-ID: <202509041246.7GqISV63-lkp@intel.com>
References: <4f78f8fa113d4262e162972f5c15155410a64e8b.1756908788.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f78f8fa113d4262e162972f5c15155410a64e8b.1756908788.git.akhilesh@ee.iitb.ac.in>

Hi Akhilesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.17-rc4 next-20250903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhilesh-Patil/rtc-m41t93-add-device-tree-support/20250903-223155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/4f78f8fa113d4262e162972f5c15155410a64e8b.1756908788.git.akhilesh%40ee.iitb.ac.in
patch subject: [PATCH 4/7] rtc: m41t93: Add alarm support
config: loongarch-randconfig-002-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041246.7GqISV63-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041246.7GqISV63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041246.7GqISV63-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-m41t93.c:244:3: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 18446744073709551455 to 4294967135 [-Wconstant-conversion]
     243 |         val = enabled ? M41T93_BIT_A1IE | M41T93_BIT_ABE :
         |             ~
     244 |                 ~(M41T93_BIT_A1IE | M41T93_BIT_ABE);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +244 drivers/rtc/rtc-m41t93.c

   236	
   237	static int m41t93_alarm_irq_enable(struct device *dev, unsigned int enabled)
   238	{
   239		struct m41t93_data *m41t93 = dev_get_drvdata(dev);
   240		unsigned int val;
   241		int ret;
   242	
   243		val = enabled ? M41T93_BIT_A1IE | M41T93_BIT_ABE :
 > 244			~(M41T93_BIT_A1IE | M41T93_BIT_ABE);
   245	
   246		ret = regmap_update_bits(m41t93->regmap, M41T93_REG_AL1_MONTH,
   247					 M41T93_BIT_A1IE | M41T93_BIT_ABE, val);
   248		if (ret)
   249			return ret;
   250	
   251		return 0;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

