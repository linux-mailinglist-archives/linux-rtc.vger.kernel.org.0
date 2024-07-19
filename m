Return-Path: <linux-rtc+bounces-1557-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3AA9372C5
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2024 05:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEC48B215FC
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2024 03:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437601863E;
	Fri, 19 Jul 2024 03:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLn/mw/O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D028F5;
	Fri, 19 Jul 2024 03:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721359752; cv=none; b=bJbxrWm8nKb6h6M78EqL7jmmOapmiKGx0xAqWTC6ARK5R4sf02jTGI8wuzrggbUSB53XZOo7d5HZOkWxf++7i6MNkBIFb8fiShyZm90FjvOoITk/XIr+vQOf8wmMKGmKOY6zqP++MgCs83zycVr/t0psBFsCzYjCnhR0WS2/d1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721359752; c=relaxed/simple;
	bh=p0UYlXZ5KxjXXwnf7VwGSnBq8RKpWMeA4U4IRIUfl8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adILw+I2Fc2hsW68MyCO+JYyFGytecwaTCRlKYiPJOXcAUo5NXaM8trDySziRldBn/WaY1k80xsZg8XmmDhjK9yhnOsdnCJ8dtmsHnZ4PIGossaaygri5Ri7TeBbgKDp/S38KSxpgbeAh0vjUuwQHPPJt4a/L9OsQN1r08qJ2Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLn/mw/O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721359749; x=1752895749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p0UYlXZ5KxjXXwnf7VwGSnBq8RKpWMeA4U4IRIUfl8A=;
  b=VLn/mw/OotfI+SF5THxi6/ts0WAONo98aiA1JxhX0WUy5JF3KXuA3Tg7
   i1PSLP+j9R2m2dqcTfoUfA+RMlsFcLEwHP7+jLtmFu16tzd354mtEeOlV
   elKLQkLmzSkFgxFKdAJ/CXL2xzTgFGD81xDsAqtwpL7tlJhlJ5kCPRllT
   Qu1+Gzxi9E4w/nH5eDyPLFUcHc+TSlDpTiBUUZEkm8q+fAn9sx58adg3J
   CbslrlIY1NxBhlIzc8nQEGDWqXs32XftvLIvb82dLbZjJa1n2NXrAMPIP
   KYn8F3uHVowKUSdJwReeZHM5K10O0ltpGWSzL4+FMrRNGwATEGQElE0hB
   A==;
X-CSE-ConnectionGUID: AlutsdKHSdGzGoAWPSf8Nw==
X-CSE-MsgGUID: cjzGdPYQQwqvanBW5drWXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22768883"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="22768883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 20:29:09 -0700
X-CSE-ConnectionGUID: WVUNQpIJQkmMjfqeAak7Hw==
X-CSE-MsgGUID: PgF5ppTRQQ6noa1BWQoxlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="55832565"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Jul 2024 20:29:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUeIn-000hoA-0R;
	Fri, 19 Jul 2024 03:29:01 +0000
Date: Fri, 19 Jul 2024 11:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.belloni@bootlin.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 05/11] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
Message-ID: <202407191156.wJPjHtKG-lkp@intel.com>
References: <20240716103025.1198495-6-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716103025.1198495-6-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240716]
[also build test ERROR on v6.10]
[cannot apply to geert-renesas-devel/next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes abelloni/rtc-next linus/master v6.10 v6.10-rc7 v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/dt-bindings-mfd-renesas-r9a08g045-vbattb-Document-VBATTB/20240716-190833
base:   next-20240716
patch link:    https://lore.kernel.org/r/20240716103025.1198495-6-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH v2 05/11] rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240719/202407191156.wJPjHtKG-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407191156.wJPjHtKG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407191156.wJPjHtKG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-renesas-rtca3.c:433:3: error: cannot jump from this goto statement to its label
     433 |                 goto setup_failed;
         |                 ^
   drivers/rtc/rtc-renesas-rtca3.c:436:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     436 |         guard(spinlock_irqsave)(&priv->lock);
         |         ^
   include/linux/cleanup.h:167:15: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:67:1: note: expanded from here
      67 | __UNIQUE_ID_guard738
         | ^
   drivers/rtc/rtc-renesas-rtca3.c:426:3: error: cannot jump from this goto statement to its label
     426 |                 goto setup_failed;
         |                 ^
   drivers/rtc/rtc-renesas-rtca3.c:436:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     436 |         guard(spinlock_irqsave)(&priv->lock);
         |         ^
   include/linux/cleanup.h:167:15: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:67:1: note: expanded from here
      67 | __UNIQUE_ID_guard738
         | ^
   2 errors generated.


vim +433 drivers/rtc/rtc-renesas-rtca3.c

   376	
   377	static int rtca3_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
   378	{
   379		struct rtca3_priv *priv = dev_get_drvdata(dev);
   380		struct rtc_time *tm = &wkalrm->time;
   381		u8 rcr1, tmp;
   382		int ret;
   383	
   384		scoped_guard(spinlock_irqsave, &priv->lock) {
   385			tmp = readb(priv->base + RTCA3_RCR2);
   386			if (!(tmp & RTCA3_RCR2_START))
   387				return -EPERM;
   388	
   389			/* Disable AIE to prevent false interrupts. */
   390			rcr1 = readb(priv->base + RTCA3_RCR1);
   391			rcr1 &= ~RTCA3_RCR1_AIE;
   392			writeb(rcr1, priv->base + RTCA3_RCR1);
   393			ret = readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp,
   394							!(tmp & RTCA3_RCR1_AIE),
   395							10, RTCA3_DEFAULT_TIMEOUT_US);
   396			if (ret)
   397				return ret;
   398	
   399			/* Set the time and enable the alarm. */
   400			writeb(RTCA3_AR_ENB | bin2bcd(tm->tm_sec), priv->base + RTCA3_RSECAR);
   401			writeb(RTCA3_AR_ENB | bin2bcd(tm->tm_min), priv->base + RTCA3_RMINAR);
   402			writeb(RTCA3_AR_ENB | bin2bcd(tm->tm_hour), priv->base + RTCA3_RHRAR);
   403			writeb(RTCA3_AR_ENB | bin2bcd(tm->tm_wday), priv->base + RTCA3_RWKAR);
   404			writeb(RTCA3_AR_ENB | bin2bcd(tm->tm_mday), priv->base + RTCA3_RDAYAR);
   405			writeb(RTCA3_AR_ENB | bin2bcd(tm->tm_mon + 1), priv->base + RTCA3_RMONAR);
   406	
   407			writew(bin2bcd(tm->tm_year % 100), priv->base + RTCA3_RYRAR);
   408			writeb(RTCA3_AR_ENB, priv->base + RTCA3_RYRAREN);
   409	
   410			/* Make sure we can read back the counters. */
   411			rtca3_prepare_cntalrm_regs_for_read(priv, false);
   412	
   413			/* Need to wait for 2 * 1/64 periodic interrupts to be generated. */
   414			atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_INIT);
   415			reinit_completion(&priv->set_alarm_completion);
   416	
   417			/* Enable periodic interrupt. */
   418			rcr1 |= RTCA3_RCR1_PIE;
   419			writeb(rcr1, priv->base + RTCA3_RCR1);
   420			ret = readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp,
   421							(tmp & RTCA3_RCR1_PIE),
   422							10, RTCA3_IRQSET_TIMEOUT_US);
   423		}
   424	
   425		if (ret)
   426			goto setup_failed;
   427	
   428		/* Wait for the 2 * 1/64 periodic interrupts. */
   429		ret = wait_for_completion_interruptible_timeout(&priv->set_alarm_completion,
   430								msecs_to_jiffies(500));
   431		if (ret <= 0) {
   432			ret = -ETIMEDOUT;
 > 433			goto setup_failed;
   434		}
   435	
   436		guard(spinlock_irqsave)(&priv->lock);
   437	
   438		ret = rtca3_alarm_irq_enable_helper(priv, wkalrm->enabled);
   439		atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
   440	
   441		return ret;
   442	
   443	setup_failed:
   444		scoped_guard(spinlock_irqsave, &priv->lock) {
   445			/*
   446			 * Disable PIE to avoid interrupt storm in case HW needed more than
   447			 * specified timeout for setup.
   448			 */
   449			writeb(rcr1 & ~RTCA3_RCR1_PIE, priv->base + RTCA3_RCR1);
   450			readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & ~RTCA3_RCR1_PIE),
   451						  10, RTCA3_DEFAULT_TIMEOUT_US);
   452			atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
   453		}
   454	
   455		return ret;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

