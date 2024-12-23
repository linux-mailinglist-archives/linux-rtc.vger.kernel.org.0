Return-Path: <linux-rtc+bounces-2757-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D479FABA8
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 09:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36A1916557B
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 08:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46B219048A;
	Mon, 23 Dec 2024 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVakzAoy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E433A13C9A3;
	Mon, 23 Dec 2024 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943882; cv=none; b=WMIBb2Kr8ovbR5/S4U4jk1Y/z10y/ucMZvGES0S+UtsElsdxCvYXoBeJB1fFSxIeJIJtxaRYeHB6qitPq03kWMZe4TMniw9hnlvmhLAi5CyIwQsfBYZ+fM9YG1NQsu/rvgoVTJq5cpMXeBRqC7lUNNkXhu3dcIf/KfXmDNU7dDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943882; c=relaxed/simple;
	bh=DcT/xkQ3IoJNvF11Fezz34EsjMI79O5iPKyEyT3NujA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vp4Dnzm7tOD6hbTcU/YOAa7S7RRD78rLRVs49rUL5J0XPIp2wdbUS/vgDu1d2iM9qKBCWX2usapVJ+5LQgbwVfULIpqpAAkJSDn8s0XwGK5TgGxmSx0Fo553mrIwf1IFJOM1xayMZSRLF1SpMH9qmpLRiXpVwLwqeSoEd5v3wZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVakzAoy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734943881; x=1766479881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DcT/xkQ3IoJNvF11Fezz34EsjMI79O5iPKyEyT3NujA=;
  b=KVakzAoykSMysnmk8Ib6RAoUIErp6GWtwYwXgdJYgAPSYIzuCq409Knt
   +qTO+UwzjFWGNq4+Xg/YlxlFdGl/SF6qFJuquxUvzl2gALqKhazrxIwHU
   n0AMtHgWKmucmOG4ZzPKLVjI9C2dTuK3LyX+vjxetRFy+2Zpb+WhK3cEk
   NTS3J6/Y72q69rAUY7wZ4S9KT51Un+UwrZiKxcp0fAd9V7yXYXRCbGHAW
   iJGLTReJsTVkX9rQx/rswdLveyEkeWlFkyohWt+R37/BsxmGapTo+XT36
   DHajUwgFgWmG1oSJCvqdGkr97RgalEFC22FX3P5WLeqOOEfxMJOiZvUFR
   Q==;
X-CSE-ConnectionGUID: GvxPQSKMRn2E7Ofly+Q6lA==
X-CSE-MsgGUID: ARRUvifIQrGL/O5Z97VvgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="52930391"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="52930391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 00:51:20 -0800
X-CSE-ConnectionGUID: xjMRZDu7T7qfWLO9TBpfsA==
X-CSE-MsgGUID: d81oGSVRRnWt40DbGLYnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136466477"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Dec 2024 00:51:17 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPe9i-0003V1-2c;
	Mon, 23 Dec 2024 08:51:14 +0000
Date: Mon, 23 Dec 2024 16:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	PavithraUdayakumar-adi <pavithra.u@analog.com>
Subject: Re: [PATCH 2/2] rtc:max31335: Add driver support for max31331
Message-ID: <202412231656.5cWrGcHu-lkp@intel.com>
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
config: arc-randconfig-002-20241223 (https://download.01.org/0day-ci/archive/20241223/202412231656.5cWrGcHu-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412231656.5cWrGcHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412231656.5cWrGcHu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-max31335.c:11:10: fatal error: asm-generic/unaligned.h: No such file or directory
      11 | #include <asm-generic/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


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

