Return-Path: <linux-rtc+bounces-1741-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105A95F23E
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 14:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E43C028102A
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 12:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0A8155A34;
	Mon, 26 Aug 2024 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGphyEwF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806AD1547E9;
	Mon, 26 Aug 2024 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724677091; cv=none; b=E7ClQaADsUtsULE1KXKRPLWlTbKpVw2bLtrWjtXDEGZOcPMz/vNNXngTucroxoGnhu4WPpKdAldDp4rWXM8bH0DkpotgRWOJ1ZCtDeM5FzLdjL2jbqUehJUNgwVbkPJxxOmE6jm1vVIZbeNGMxM13zg28SNweHuOslyXnAtBvvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724677091; c=relaxed/simple;
	bh=+PbHs8l+qbavMVlAXLwDj8SfpLxFMgAxuZhwJr8ymE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egXXTvsHQAKsHa0832+LKor8/5kVqlDhcbnprQe4yiHqA5BXbY0gKshcIhUPzKPA5qsfuOrvQZaCMtoRPO4sxPE0e1hjYGYacGroBOuQZHLy5m8pcMviI05HLJsb157Vbf0R/0vnU9Ft7tSUTEdOjgb6gsAp4JVRMJy1n7P6z2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGphyEwF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724677087; x=1756213087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+PbHs8l+qbavMVlAXLwDj8SfpLxFMgAxuZhwJr8ymE0=;
  b=hGphyEwF7frnJNA2dEPB0F6zzOgHkzyCTtFPq6gQfZFaOeUyuTZOKOKN
   /BX4BGB6tKEIgWoHUqFfmitQtDSQ8w7McSE+j0qErs2Bbzt5AVbhc/5hQ
   7yDd5+ZtgHNQGMG4LKfvZlGfvhPs1a1w/lFPBjlGssKz9ic2/SwUAvyKn
   038fKYk9Rnsgr7iyP9VAejJndz6rbq5zlw+Jj5fTMYH3O9zBAtHOchG2a
   cB+VXnloOHChyTMXXmgUPcJqOGoCKKca7epwiiKokfpj31JSXRFqaG8jP
   f1ObR+j9uJ5eEx/ea65xd6GNatwsm9rbaVdEQ3hdkVZWCsszv2Zc8tecB
   Q==;
X-CSE-ConnectionGUID: fH2n1XfHQjuhNfLEot/hwA==
X-CSE-MsgGUID: vhMXP1C/S6er9YGSdLGD6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="45614097"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="45614097"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:58:06 -0700
X-CSE-ConnectionGUID: v8gTvY0mSQOLgpDYqNeKHw==
X-CSE-MsgGUID: leVOLblET+yax54yva8Ong==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="67200477"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Aug 2024 05:58:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siZIH-000H63-0F;
	Mon, 26 Aug 2024 12:58:01 +0000
Date: Mon, 26 Aug 2024 20:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Message-ID: <202408262035.4BysJ5CK-lkp@intel.com>
References: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823-rtc-v1-2-6f70381da283@amlogic.com>

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dff71e5c6076314f3eefe700abd6af834c57bd64]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-rtc-Add-Amlogic-A311L2-and-A113X2-rtc/20240826-125504
base:   dff71e5c6076314f3eefe700abd6af834c57bd64
patch link:    https://lore.kernel.org/r/20240823-rtc-v1-2-6f70381da283%40amlogic.com
patch subject: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
config: i386-buildonly-randconfig-003-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262035.4BysJ5CK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262035.4BysJ5CK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262035.4BysJ5CK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-amlogic.c:159:6: warning: variable 'alarm_sec' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     159 |         if (alarm->enabled) {
         |             ^~~~~~~~~~~~~~
   drivers/rtc/rtc-amlogic.c:173:19: note: uninitialized use occurs here
     173 |                 alarm->enabled, alarm_sec);
         |                                 ^~~~~~~~~
   include/linux/dev_printk.h:168:46: note: expanded from macro 'dev_dbg'
     168 |         dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/rtc/rtc-amlogic.c:159:2: note: remove the 'if' if its condition is always true
     159 |         if (alarm->enabled) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-amlogic.c:157:20: note: initialize the variable 'alarm_sec' to silence this warning
     157 |         time64_t alarm_sec;
         |                           ^
         |                            = 0
>> drivers/rtc/rtc-amlogic.c:565:34: warning: unused variable 'aml_rtc_device_id' [-Wunused-const-variable]
     565 | static const struct of_device_id aml_rtc_device_id[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +159 drivers/rtc/rtc-amlogic.c

   153	
   154	static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
   155	{
   156		struct aml_rtc_data *rtc = dev_get_drvdata(dev);
   157		time64_t alarm_sec;
   158	
 > 159		if (alarm->enabled) {
   160			regmap_update_bits(rtc->map, RTC_CTRL,
   161					   RTC_ALRM0_EN, RTC_ALRM0_EN);
   162			regmap_update_bits(rtc->map, RTC_INT_MASK,
   163					   RTC_ALRM0_IRQ_MSK, 0);
   164	
   165			alarm_sec = rtc_tm_to_time64(&alarm->time);
   166			if (alarm_sec > U32_MAX) {
   167				dev_err(dev, "alarm value invalid!\n");
   168				return -EINVAL;
   169			}
   170			aml_set_alarm(rtc, alarm_sec);
   171		}
   172		dev_dbg(dev, "%s: alarm->enabled=%d alarm_set=%llds\n", __func__,
   173			alarm->enabled, alarm_sec);
   174	
   175		return 0;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

