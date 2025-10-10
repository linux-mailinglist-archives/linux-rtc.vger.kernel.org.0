Return-Path: <linux-rtc+bounces-5084-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82937BCE7D3
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Oct 2025 22:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F5464F90B2
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Oct 2025 20:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1FE30216C;
	Fri, 10 Oct 2025 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5m/ACAI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47E530215B;
	Fri, 10 Oct 2025 20:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760127988; cv=none; b=LGHRbmRF8Tt25c7s25Gt8n0w6UwU7ZkGAYZccwRT5bKTLdeAVbgiWPvoig7WeMSmLWnrpNitxcwaYcjhbCLrlraWqz/1KTzkD98EpipzaVDFL6FAhMUWb5ZhksYUKzMNc5j3Y9b5og2j6I0Rb104m7DjJr8oVBFRsMimbvFG0x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760127988; c=relaxed/simple;
	bh=AscKgj05BtJh9IDBr3hGSKSH55FRqss4Bu8m5A4Qt98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6hWGqiYgBk5McO0NGOv/s2U9KO5hyjw2lXz00++A03y6ZQFWXdK7gf0CaaKYmTJKSsjGfm44KWe8aJg34IFKeR5PcMQGA8o41RV5WBE08kJFmuF3RMUu+CIBXpqht6u1Em4yaGoMzjJZCZyb0snIAisWef1fZHkb8G/7qV9uSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5m/ACAI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760127987; x=1791663987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AscKgj05BtJh9IDBr3hGSKSH55FRqss4Bu8m5A4Qt98=;
  b=W5m/ACAIQ4ncsE5THaX4vwN3w8NwhqKl8cTxoV6K/WU1wDUWF07p1bgS
   HEZSvylzwp9Balhl6U3kgjlHFeJOH3wZ5sdl0SzJq3K3eFYfp3V5DdGJ8
   WcXgjdjx1Fy9FsvpKT3fKS0I74q5KtuPGV8px7BNYDnIvXkFvroH7A1Qd
   GGAD2ovM6q25EJfB8uZWwPfwXPnXqAd0V4jwkxnFOqkuIGtr9+LNpos9s
   ase7EYOBXUoxaaLkVQ3Ij/6g6wYNzDd/c6BSd6RQUzcs3GcQydpainuR2
   ylxYTzqvmYrRhYWUqbTriQHBnvCNgcq8iv0aDmCd4SZPByTFeH2WYBlfG
   Q==;
X-CSE-ConnectionGUID: nxUdditGT4SdL4DPjIVB2Q==
X-CSE-MsgGUID: UC+4J0GCQLSu0qoeU3WB5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64974407"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="64974407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 13:26:26 -0700
X-CSE-ConnectionGUID: Fhe87ZQLTb6TwXu4exd1Hg==
X-CSE-MsgGUID: kEAcKQVcRpKmqg4V6RHnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181010994"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 13:26:21 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Jgx-000391-0y;
	Fri, 10 Oct 2025 20:26:19 +0000
Date: Sat, 11 Oct 2025 04:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 06/13] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <202510110421.ZnJdu1ds-lkp@intel.com>
References: <20251007-macsmc-subdevs-v3-6-d7d3bfd7ae02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-macsmc-subdevs-v3-6-d7d3bfd7ae02@gmail.com>

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on c746c3b5169831d7fb032a1051d8b45592ae8d78]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Calligeros/dt-bindings-rtc-Add-Apple-SMC-RTC/20251010-092141
base:   c746c3b5169831d7fb032a1051d8b45592ae8d78
patch link:    https://lore.kernel.org/r/20251007-macsmc-subdevs-v3-6-d7d3bfd7ae02%40gmail.com
patch subject: [PATCH v3 06/13] hwmon: Add Apple Silicon SMC hwmon driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20251011/202510110421.ZnJdu1ds-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110421.ZnJdu1ds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110421.ZnJdu1ds-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/macsmc-hwmon.c: In function 'macsmc_hwmon_write_f32':
>> drivers/hwmon/macsmc-hwmon.c:246:24: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     246 |                 fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
         |                        ^~~~~~~~~~


vim +/FIELD_PREP +246 drivers/hwmon/macsmc-hwmon.c

   225	
   226	static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
   227	{
   228		u64 val;
   229		u32 fval = 0;
   230		int exp = 0, neg;
   231	
   232		val = abs(value);
   233		neg = val != value;
   234	
   235		if (val) {
   236			int msb = __fls(val) - exp;
   237	
   238			if (msb > 23) {
   239				val >>= msb - FLT_MANT_BIAS;
   240				exp -= msb - FLT_MANT_BIAS;
   241			} else if (msb < 23) {
   242				val <<= FLT_MANT_BIAS - msb;
   243				exp += msb;
   244			}
   245	
 > 246			fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
   247			       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
   248			       FIELD_PREP(FLT_MANT_MASK, val);
   249		}
   250	
   251		return apple_smc_write_u32(smc, key, fval);
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

