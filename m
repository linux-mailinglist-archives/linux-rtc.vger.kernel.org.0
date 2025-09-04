Return-Path: <linux-rtc+bounces-4837-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76467B44A65
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 01:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CEA21CC3557
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Sep 2025 23:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB202F656E;
	Thu,  4 Sep 2025 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8rAoqbg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6072EDD6C;
	Thu,  4 Sep 2025 23:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757028277; cv=none; b=Mx60frNCa86S6t730XeF+MJWqxfCEkHHZzsZBvPH5GSunQBLEJBcrdc8O9Cj/uxuFgd1S0VP+tsBMB6wNeeTwH2OlWAUzynFtEEEnLFShqgaVRIxFtbh5pXI/BUOwyhNUhuej/TCFZUghhbbC1xBy0AYRags0TCEP7RIYa1SGwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757028277; c=relaxed/simple;
	bh=OgkI8noiXQ5CWIZ0ZMUtx+0t4I0H3Sb21zhjyKKhbWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVgpCKw6HbEW+S4aYd5MAc7//b65OWEPwdjHuIRBd1jdUY+OynNpM/53op4tVdHa3a/vV8fKzERGj7nSA3wjCoYXZA5ePx74Vqn2wrz7I7V90ze7lZJHOpm9sVn+q+Cp+47S3em7jLH9A4MX9jMCnajw39VRMJNiKovh/AipMXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8rAoqbg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757028276; x=1788564276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OgkI8noiXQ5CWIZ0ZMUtx+0t4I0H3Sb21zhjyKKhbWc=;
  b=H8rAoqbg97kJdRaIjmVWKDi7wkZVwK0qKaLtpsC6qz1HewB2I3lmEfc0
   +2yumgzjvBpLkSEq3TqpI/PNCBJtGMRE8caiQANZiV2PEbpxgQzesW/rF
   LXvhsM2uAGhzjVNourmVNZrIUElfkiaCmpvY51vO4BC4aRRgzkL+5lOTS
   NPtgd8nun+9lWFNv4aMCoMytR+B0UT2/G98EH1yck0ziy2HlhrMe3h8v8
   qMyQN/jrevRXj6ofavluXdTATfnXKdUQ8D5RXJ7o7AhFpNUzw00L6/Hwc
   ycNP7hhDXS751/msRfnnGcxonV9WQ1Ka5olUsvIhlO7MXg6q5p3R4x0EB
   w==;
X-CSE-ConnectionGUID: 7XToG7ynQxCQF9e6ssehZQ==
X-CSE-MsgGUID: NPP5JEavSNamjvfHqvnrsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="84813432"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="84813432"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 16:24:35 -0700
X-CSE-ConnectionGUID: SOkaAXxtTq+dBZbVLsM6Ow==
X-CSE-MsgGUID: M9KY89M4T3q/gJJ19iMC8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="177239359"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Sep 2025 16:24:33 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuJJ5-00061T-2J;
	Thu, 04 Sep 2025 23:24:01 +0000
Date: Fri, 5 Sep 2025 07:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: Re: [PATCH 7/7] rtc: m41t93: Add watchdog support
Message-ID: <202509050759.dwYECwEA-lkp@intel.com>
References: <694706ad8577a36ef8948e0d9ca7ea561900fbc2.1756908788.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <694706ad8577a36ef8948e0d9ca7ea561900fbc2.1756908788.git.akhilesh@ee.iitb.ac.in>

Hi Akhilesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhilesh-Patil/rtc-m41t93-add-device-tree-support/20250903-223155
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/694706ad8577a36ef8948e0d9ca7ea561900fbc2.1756908788.git.akhilesh%40ee.iitb.ac.in
patch subject: [PATCH 7/7] rtc: m41t93: Add watchdog support
config: x86_64-randconfig-007-20250904 (https://download.01.org/0day-ci/archive/20250905/202509050759.dwYECwEA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050759.dwYECwEA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050759.dwYECwEA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_watchdog_register_device
   >>> referenced by rtc-m41t93.c:490 (drivers/rtc/rtc-m41t93.c:490)
   >>>               drivers/rtc/rtc-m41t93.o:(m41t93_watchdog_register) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

