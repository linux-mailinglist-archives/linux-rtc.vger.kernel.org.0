Return-Path: <linux-rtc+bounces-2760-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B18619FB3FC
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 19:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39F3D166752
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 18:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781921C1F03;
	Mon, 23 Dec 2024 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nv/NBLFp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92461BEF75;
	Mon, 23 Dec 2024 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734978292; cv=none; b=aU/ecSJtW+b0SuoHWyD0QH4Hspwe5aGaVQou2aP8ujhp54ovTU1KYTVPHeeDmXze5M0yl+ksL8/eQV8CYw7p0kh7YcqtOSOyZSGRB7erDI2GEeIvmGDqaTqQ56osjET+Xc43SbVRFK+46tqr6wlgtwwBh5GaBbXs3zNvOq0q7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734978292; c=relaxed/simple;
	bh=bLhfnBqRKCahRvZLYmtLFDUp/3rGnHOEIDYF4k97zu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlvzLxoQuAJ9cSOQdOFYFdw78cYl989Us14qYDOuIvRKwE+djgUYWipyLTAa+MLzPM6DYk6FcY92rv/z0qMTIBC1pzA9+sWpks8Thr7uYxLAQRPtHwzEgyqCX5qeLI3adk6diXx/kVNA1dcFpbEl4EWGo20qjmFH9ObqvBc40jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nv/NBLFp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734978291; x=1766514291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bLhfnBqRKCahRvZLYmtLFDUp/3rGnHOEIDYF4k97zu0=;
  b=Nv/NBLFpU8LOMRa9kPwcq+BFAd6hoe14yr9eIRWZbMs7kw3PBhx8lwSw
   Rp5TTgrlMOzo8NKwdsR75ZgplXrXydQj9aJn4AV0i8GwhVquwannZ1sHw
   64kZrka0atCNzhJQaMRCl6Wd4HskvAKauJdunJ5bSs5MtFNsODcCMceUB
   b4z/UHuR2EiI5mlVmxrBs1ZYQp9YKvXfohSRfSQ7Fhco+0fRIs3ha6eZq
   h71vHsOBLK9dYdM6xYW3zUaqa5QhuIFtrhLFhIj0ZYu7On/IWR9BGX4IM
   lc/SSXMiISFz9RxDfv33ey1zXIJ8dgnDxxCsJNt97WMNebI185yW1BJ6b
   A==;
X-CSE-ConnectionGUID: VMYTxMcrRWKtVu4nyi8MDg==
X-CSE-MsgGUID: dciByJoOQBiaUOITvz+iqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35478389"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="35478389"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 10:24:50 -0800
X-CSE-ConnectionGUID: 1VeqdBfrQVSHB70oIy27wg==
X-CSE-MsgGUID: K+KcaVt+RM6vv2LBPM7hvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="99794769"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Dec 2024 10:24:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPn6i-0000YB-08;
	Mon, 23 Dec 2024 18:24:44 +0000
Date: Tue, 24 Dec 2024 02:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	PavithraUdayakumar-adi <pavithra.u@analog.com>
Subject: Re: [PATCH 2/2] rtc:max31335: Add driver support for max31331
Message-ID: <202412240128.bB1G2chN-lkp@intel.com>
References: <20241223-max31331-driver-support-v1-2-f9499bd598f5@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-max31331-driver-support-v1-2-f9499bd598f5@analog.com>

Hi PavithraUdayakumar-adi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4bbf9020becbfd8fc2c3da790855b7042fad455b]

url:    https://github.com/intel-lab-lkp/linux/commits/PavithraUdayakumar-adi-via-B4-Relay/dtbindings-rtc-max31335-Add-max31331-support/20241223-142214
base:   4bbf9020becbfd8fc2c3da790855b7042fad455b
patch link:    https://lore.kernel.org/r/20241223-max31331-driver-support-v1-2-f9499bd598f5%40analog.com
patch subject: [PATCH 2/2] rtc:max31335: Add driver support for max31331
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241224/202412240128.bB1G2chN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240128.bB1G2chN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240128.bB1G2chN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-max31335.c:11:10: fatal error: 'asm-generic/unaligned.h' file not found
      11 | #include <asm-generic/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +11 drivers/rtc/rtc-max31335.c

  > 11	#include <asm-generic/unaligned.h>
    12	#include <linux/bcd.h>
    13	#include <linux/bitfield.h>
    14	#include <linux/bitops.h>
    15	#include <linux/clk.h>
    16	#include <linux/clk-provider.h>
    17	#include <linux/hwmon.h>
    18	#include <linux/i2c.h>
    19	#include <linux/interrupt.h>
    20	#include <linux/kernel.h>
    21	#include <linux/module.h>
    22	#include <linux/of_device.h>
    23	#include <linux/regmap.h>
    24	#include <linux/rtc.h>
    25	#include <linux/util_macros.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

