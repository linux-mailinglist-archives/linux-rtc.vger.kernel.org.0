Return-Path: <linux-rtc+bounces-5831-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCayDy+KcWkLJAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5831-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 03:23:43 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D280760D9F
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 03:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF10844B32B
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 02:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B321F38B7BD;
	Thu, 22 Jan 2026 02:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAQOhYlK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2102F389DFF;
	Thu, 22 Jan 2026 02:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048385; cv=none; b=HwsZIIh8mevU/Im79sggojg2VQN2a7Eo1Af823/lQNmPEOXMTz3UELBtbl6Zk4jEFMVsw4wcawFdcyVvYkOEmOYaPSTP+TKDCUA/wbei0bf41FmPLpWtI5Uvp0RQ7rP4E0JwixyVOpDYulO7zdkVvpxPXWsJ/MaGR/dxDkcamoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048385; c=relaxed/simple;
	bh=rHzcPvmySlKO1/aV7nCsey/ZNAJl6fZBHA35LFz8B7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLZ+ILVIXApUBJ8i1zwGY+dgFjSH6mKhvXVNsbyJJX4k8eZBpqZ/5MyitvDT5ph6FuAPKY24oU3EoJuKwN9vQAdyfB+F2Gb3X68AC2y3a+Iv1zt7T5JPd8PKvK7CUYkM4Q/VbihP4oGg0jb5MtcG+qPrp8rBG/ObePZRfe7Dj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAQOhYlK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769048375; x=1800584375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rHzcPvmySlKO1/aV7nCsey/ZNAJl6fZBHA35LFz8B7s=;
  b=MAQOhYlKf9UnqhSzogJLMz3fbJYEmuxa/pa+PX0M+6CH+s/eu0GNgFIo
   1+MX9Ll2bSNOdxhP6/2xFWYkm+F/5Hh1pbz+OF0VNBsIW80eR3jSdV5B4
   t9PQj0+GBVFhUtE8gc0koVyltilkG4/Zv48HGrYnBew1fKAicg3jpDeQU
   LfxZxr0MY3rRvMHnCmgLqSFUMzjo075+Ymq+hGQJ6ne8qj+MjnLtjhyrg
   h3jF5VVe82KD8SYiV2KR5KSSHEg6JtGWkt0TbvFlobNn08uo7bh5w9fBT
   0Il8cK8ZinKQRolCKQoLSCkY16Bfv8u89rG3TH5vBl1mDcXKxjuUImgXH
   Q==;
X-CSE-ConnectionGUID: Df8xWMHWQuOZ7AgTA4aS2A==
X-CSE-MsgGUID: ZC6QsJ2xR7q4cTLbitESIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70186890"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70186890"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:19:32 -0800
X-CSE-ConnectionGUID: wQFexIwiQb+rIe1GA15UrQ==
X-CSE-MsgGUID: 8Mcwe0dZR3CXqblnX3x9Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206932726"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jan 2026 18:19:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vikI9-00000000SJh-3NRV;
	Thu, 22 Jan 2026 02:19:25 +0000
Date: Thu, 22 Jan 2026 10:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH 2/7] rtc: sun6i: Bind internal CCU via auxiliary bus
Message-ID: <202601221045.dCEzMG8r-lkp@intel.com>
References: <20260121-a733-rtc-v1-2-d359437f23a7@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZqP4PjA61tW2Zu8s"
Content-Disposition: inline
In-Reply-To: <20260121-a733-rtc-v1-2-d359437f23a7@pigmoral.tech>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5831-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pigmoral.tech,baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: D280760D9F
X-Rspamd-Action: no action


--ZqP4PjA61tW2Zu8s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-rtc-sun6i-Add-Allwinner-A733-support/20260121-192151
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260121-a733-rtc-v1-2-d359437f23a7%40pigmoral.tech
patch subject: [PATCH 2/7] rtc: sun6i: Bind internal CCU via auxiliary bus
config: arm-randconfig-r122-20260122
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build):

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221045.dCEzMG8r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rtc/rtc-sun6i.c:789:32: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void *platform_data @@     got void [noderef] __iomem *base @@
   drivers/rtc/rtc-sun6i.c:789:32: sparse:     expected void *platform_data
   drivers/rtc/rtc-sun6i.c:789:32: sparse:     got void [noderef] __iomem *base

vim +789 drivers/rtc/rtc-sun6i.c

   750	
   751	static int sun6i_rtc_probe(struct platform_device *pdev)
   752	{
   753		const struct sun6i_rtc_match_data *data;
   754		struct sun6i_rtc_dev *chip = sun6i_rtc;
   755		struct device *dev = &pdev->dev;
   756		struct auxiliary_device *adev;
   757		struct clk *bus_clk;
   758		int ret;
   759	
   760		bus_clk = devm_clk_get_optional(dev, "bus");
   761		if (IS_ERR(bus_clk))
   762			return PTR_ERR(bus_clk);
   763	
   764		if (bus_clk) {
   765			ret = clk_prepare_enable(bus_clk);
   766			if (ret)
   767				return ret;
   768	
   769			ret = devm_add_action_or_reset(dev, sun6i_rtc_bus_clk_cleanup,
   770						       bus_clk);
   771			if (ret)
   772				return ret;
   773		}
   774	
   775		data = of_device_get_match_data(&pdev->dev);
   776	
   777		if (!chip) {
   778			chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
   779			if (!chip)
   780				return -ENOMEM;
   781	
   782			spin_lock_init(&chip->lock);
   783	
   784			chip->base = devm_platform_ioremap_resource(pdev, 0);
   785			if (IS_ERR(chip->base))
   786				return PTR_ERR(chip->base);
   787	
   788			if (data && data->adev_name) {
 > 789				adev = devm_auxiliary_device_create(dev, data->adev_name, chip->base);
   790				if (!adev)
   791					return -ENODEV;
   792			}
   793		}
   794	
   795		platform_set_drvdata(pdev, chip);
   796	
   797		if (data)
   798			chip->flags = data->flags;
   799	
   800		chip->irq = platform_get_irq(pdev, 0);
   801		if (chip->irq < 0)
   802			return chip->irq;
   803	
   804		ret = devm_request_irq(&pdev->dev, chip->irq, sun6i_rtc_alarmirq,
   805				       0, dev_name(&pdev->dev), chip);
   806		if (ret) {
   807			dev_err(&pdev->dev, "Could not request IRQ\n");
   808			return ret;
   809		}
   810	
   811		/* clear the alarm counter value */
   812		writel(0, chip->base + SUN6I_ALRM_COUNTER);
   813	
   814		/* disable counter alarm */
   815		writel(0, chip->base + SUN6I_ALRM_EN);
   816	
   817		/* disable counter alarm interrupt */
   818		writel(0, chip->base + SUN6I_ALRM_IRQ_EN);
   819	
   820		/* disable week alarm */
   821		writel(0, chip->base + SUN6I_ALRM1_EN);
   822	
   823		/* disable week alarm interrupt */
   824		writel(0, chip->base + SUN6I_ALRM1_IRQ_EN);
   825	
   826		/* clear counter alarm pending interrupts */
   827		writel(SUN6I_ALRM_IRQ_STA_CNT_IRQ_PEND,
   828		       chip->base + SUN6I_ALRM_IRQ_STA);
   829	
   830		/* clear week alarm pending interrupts */
   831		writel(SUN6I_ALRM1_IRQ_STA_WEEK_IRQ_PEND,
   832		       chip->base + SUN6I_ALRM1_IRQ_STA);
   833	
   834		/* disable alarm wakeup */
   835		writel(0, chip->base + SUN6I_ALARM_CONFIG);
   836	
   837		clk_prepare_enable(chip->losc);
   838	
   839		device_init_wakeup(&pdev->dev, true);
   840	
   841		chip->rtc = devm_rtc_allocate_device(&pdev->dev);
   842		if (IS_ERR(chip->rtc))
   843			return PTR_ERR(chip->rtc);
   844	
   845		chip->rtc->ops = &sun6i_rtc_ops;
   846		if (chip->flags & RTC_LINEAR_DAY)
   847			chip->rtc->range_max = (65536 * SECS_PER_DAY) - 1;
   848		else
   849			chip->rtc->range_max = 2019686399LL; /* 2033-12-31 23:59:59 */
   850	
   851		ret = devm_rtc_register_device(chip->rtc);
   852		if (ret)
   853			return ret;
   854	
   855		sun6i_rtc_nvmem_cfg.priv = chip;
   856		ret = devm_rtc_nvmem_register(chip->rtc, &sun6i_rtc_nvmem_cfg);
   857		if (ret)
   858			return ret;
   859	
   860		return 0;
   861	}
   862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--ZqP4PjA61tW2Zu8s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce (this is a W=1 build):
        git checkout 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
        b4 shazam https://lore.kernel.org/r/20260121-a733-rtc-v1-2-d359437f23a7@pigmoral.tech

        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # clang-22 might not be officially released. Try a lower version if installation fails.
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # apt-get install sparse
        # sparse version: v0.6.4-73-gfbdde312

        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/ethernet/arc/ drivers/rtc/

--ZqP4PjA61tW2Zu8s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/arm 6.19.0-rc6 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 22.0.0git (git://gitmirror/llvm_project 9b8addffa70cee5b2acc5454712d9cf78ce45710)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=220000
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=220000
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=220000
CONFIG_RUSTC_VERSION=108800
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_RUSTC_LLVM_VERSION=200105
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_ASSUME=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_CC_HAS_COUNTED_BY=y
CONFIG_CC_HAS_MULTIDIMENSIONAL_NONSTRING=y
CONFIG_LD_CAN_USE_KEEP_IN_OVERLAY=y
CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED=y
CONFIG_RUSTC_HAS_COERCE_POINTEE=y
CONFIG_RUSTC_HAS_SPAN_FILE=y
CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES=y
CONFIG_PAHOLE_VERSION=131
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_KERNEL_LZ4=y
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_WATCH_QUEUE=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_GENERIC_IRQ_MULTI_HANDLER=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_CONTEXT_TRACKING=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
# CONFIG_POSIX_AUX_CLOCKS is not set
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_NEED_TASKS_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=17
# CONFIG_PRINTK_INDEX is not set
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC10_NO_ARRAY_BOUNDS=y
CONFIG_GCC_NO_STRINGOP_OVERFLOW=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
# CONFIG_BLK_CGROUP is not set
CONFIG_CGROUP_SCHED=y
CONFIG_GROUP_SCHED_WEIGHT=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_DMEM=y
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
CONFIG_RELAY=y
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_BOOT_CONFIG is not set
CONFIG_CMDLINE_LOG_WRAP_IDEAL_LEN=1021
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
CONFIG_LD_ORPHAN_WARN=y
CONFIG_LD_ORPHAN_WARN_LEVEL="warn"
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_AIO=y
CONFIG_IO_URING=y
# CONFIG_GCOV_PROFILE_URING is not set
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
CONFIG_CACHESTAT_SYSCALL=y
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y

#
# Kexec and crash features
#
# end of Kexec and crash features

#
# Live Update and Kexec HandOver
#
# end of Live Update and Kexec HandOver
# end of General setup

CONFIG_ARM=y
CONFIG_SYS_SUPPORTS_APM_EMULATION=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_PHYS_OFFSET=0x00800000
CONFIG_GENERIC_BUG=y
CONFIG_PGTABLE_LEVELS=2

#
# System Type
#
# CONFIG_MMU is not set
CONFIG_ARM_SINGLE_ARMV7M=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_BITS_MAX=16
# CONFIG_ARCH_AT91 is not set
CONFIG_ARCH_MXC=y

#
# Cortex-A/Cortex-M asymmetric multiprocessing platforms
#
# CONFIG_SOC_IMX7D is not set
# CONFIG_SOC_IMX7ULP is not set
CONFIG_SOC_IMXRT=y
CONFIG_SOC_VF610=y
CONFIG_VF_USE_PIT_TIMER=y
CONFIG_ARCH_STM32=y
CONFIG_MACH_STM32F429=y
# CONFIG_MACH_STM32F469 is not set
CONFIG_MACH_STM32F746=y
CONFIG_MACH_STM32F769=y
CONFIG_MACH_STM32H743=y
CONFIG_ARCH_LPC18XX=y
# CONFIG_ARCH_MPS2 is not set

#
# Processor Type
#
CONFIG_CPU_V7M=y
CONFIG_CPU_THUMBONLY=y
CONFIG_CPU_THUMB_CAPABLE=y
CONFIG_CPU_32v7M=y
CONFIG_CPU_ABRT_NOMMU=y
CONFIG_CPU_PABRT_LEGACY=y
CONFIG_CPU_CACHE_NOP=y
CONFIG_CPU_CACHE_V7M=y
CONFIG_CPU_V7M_NUM_IRQ=90

#
# Processor Features
#
CONFIG_ARM_THUMB=y
CONFIG_CPU_LITTLE_ENDIAN=y
CONFIG_CPU_ICACHE_DISABLE=y
# CONFIG_CPU_DCACHE_DISABLE is not set
# CONFIG_CPU_BPREDICT_DISABLE is not set
CONFIG_ARM_L1_CACHE_SHIFT=5
CONFIG_ARM_DMA_MEM_BUFFERABLE=y
# CONFIG_SET_MEM_PARAM is not set
CONFIG_DRAM_BASE=0x00800000
CONFIG_DRAM_SIZE=0x00800000
# CONFIG_REMAP_VECTORS_TO_RAM is not set
CONFIG_ARM_MPU=y
# end of System Type

#
# Bus support
#
# end of Bus support

#
# Kernel Features
#
CONFIG_IRQSTACKS=y
CONFIG_PAGE_OFFSET=0x00800000
CONFIG_HZ_FIXED=0
# CONFIG_HZ_100 is not set
# CONFIG_HZ_200 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_500=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=500
CONFIG_THUMB2_KERNEL=y
CONFIG_AEABI=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
# CONFIG_ARM_MODULE_PLTS is not set
CONFIG_ARCH_FORCE_MAX_ORDER=10
# CONFIG_PARAVIRT is not set
# CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
# end of Kernel Features

#
# Boot options
#
CONFIG_USE_OF=y
CONFIG_ARCH_WANT_FLAT_DTB_INSTALL=y
CONFIG_ATAGS=y
CONFIG_DEPRECATED_PARAM_STRUCT=y
CONFIG_ZBOOT_ROM_TEXT=0x0
CONFIG_ZBOOT_ROM_BSS=0x0
# CONFIG_ARM_APPENDED_DTB is not set
CONFIG_CMDLINE=""
# CONFIG_XIP_KERNEL is not set
CONFIG_ARCH_SUPPORTS_CRASH_DUMP=y
CONFIG_ARCH_DEFAULT_CRASH_DUMP=y
CONFIG_AUTO_ZRELADDR=y
# end of Boot options

#
# CPU Power Management
#

#
# CPU Frequency scaling
#
# CONFIG_CPU_FREQ is not set
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y
CONFIG_CPU_IDLE_GOV_TEO=y

#
# ARM CPU Idle Drivers
#
# CONFIG_ARM_CPUIDLE is not set
# CONFIG_ARM_CLPS711X_CPUIDLE is not set
# CONFIG_ARM_KIRKWOOD_CPUIDLE is not set
CONFIG_ARM_ZYNQ_CPUIDLE=y
# CONFIG_ARM_AT91_CPUIDLE is not set
CONFIG_ARM_EXYNOS_CPUIDLE=y
CONFIG_ARM_MVEBU_V7_CPUIDLE=y
# end of ARM CPU Idle Drivers
# end of CPU Idle
# end of CPU Power Management

#
# Floating point emulation
#

#
# At least one emulation must be selected
#
# end of Floating point emulation

#
# Power management options
#
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_PM_SLEEP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
# CONFIG_PM_QOS_CPU_SYSTEM_WAKEUP is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_PM_TEST_SUSPEND=y
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_APM_EMULATION is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
CONFIG_CPU_PM=y
CONFIG_ENERGY_MODEL=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARM_CPU_SUSPEND=y
# end of Power management options

CONFIG_CPU_MITIGATIONS=y
CONFIG_ARCH_HAS_DMA_OPS=y

#
# General architecture-dependent options
#
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_GENERIC_IDLE_POLL_SETUP=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_KEEPINITRD=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_MMU_LAZY_TLB_REFCOUNT=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_HAVE_ARCH_KSTACK_ERASE=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
# CONFIG_STACKPROTECTOR_STRONG is not set
CONFIG_LTO_NONE=y
CONFIG_ARCH_SUPPORTS_CFI=y
CONFIG_CFI=y
CONFIG_CFI_ICALL_NORMALIZE_INTEGERS=y
CONFIG_HAVE_CFI_ICALL_NORMALIZE_INTEGERS=y
# CONFIG_CFI_PERMISSIVE is not set
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_HAVE_PAGE_SIZE_4KB=y
CONFIG_PAGE_SIZE_4KB=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_PAGE_SHIFT=12
CONFIG_CLONE_BACKWARDS=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_HAVE_ARCH_PFN_VALID=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_FUNCTION_ALIGNMENT=0
CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_DEBUGFS=y
CONFIG_MODULE_DEBUG=y
CONFIG_MODULE_STATS=y
CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS=y
CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS_TRACE=y
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_FORCE=y
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA256 is not set
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
# CONFIG_MODULE_SIG_SHA3_256 is not set
CONFIG_MODULE_SIG_SHA3_384=y
# CONFIG_MODULE_SIG_SHA3_512 is not set
CONFIG_MODULE_SIG_HASH="sha3-384"
# CONFIG_MODULE_COMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_CGROUP_PUNT_BIO=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_ICQ=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_WRITE_MOUNTED=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_DEBUG_FS is not set
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
# CONFIG_ACORN_PARTITION_CUMANA is not set
# CONFIG_ACORN_PARTITION_EESOX is not set
CONFIG_ACORN_PARTITION_ICS=y
# CONFIG_ACORN_PARTITION_ADFS is not set
# CONFIG_ACORN_PARTITION_POWERTEC is not set
CONFIG_ACORN_PARTITION_RISCIX=y
CONFIG_AIX_PARTITION=y
CONFIG_OSF_PARTITION=y
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_LDM_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
# CONFIG_KARMA_PARTITION is not set
# CONFIG_EFI_PARTITION is not set
# CONFIG_SYSV68_PARTITION is not set
CONFIG_CMDLINE_PARTITION=y
# CONFIG_OF_PARTITION is not set
# end of Partition Types

CONFIG_BLK_PM=y
CONFIG_BLOCK_HOLDER_DEPRECATED=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=m
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_FREEZER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF_FDPIC is not set
CONFIG_BINFMT_SCRIPT=m
CONFIG_ARCH_HAS_BINFMT_FLAT=y
# CONFIG_BINFMT_FLAT is not set
CONFIG_BINFMT_FLAT_ARGVP_ENVP_ON_STACK=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# Slab allocator options
#
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLAB_BUCKETS is not set
CONFIG_SLUB_STATS=y
CONFIG_RANDOM_KMALLOC_CACHES=y
# end of Slab allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_STATIC=y
CONFIG_ARCH_KEEP_MEMBLOCK=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_MEMORY_BALLOON=y
CONFIG_PAGE_REPORTING=y
CONFIG_PCP_BATCH_SCALE_MAX=5
CONFIG_NOMMU_INITIAL_TRIM_EXCESS=1
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_PAGE_MAPCOUNT=y
CONFIG_NEED_PER_CPU_KM=y
CONFIG_PAGE_BLOCK_MAX_ORDER=10
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_ARCH_HAS_CPU_CACHE_ALIASING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
CONFIG_GUP_TEST=y
CONFIG_DMAPOOL_TEST=m
CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=y
CONFIG_LOCK_MM_AND_FIND_VMA=y
CONFIG_EXECMEM=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
# CONFIG_DAMON_SYSFS is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_XGRESS=y
CONFIG_SKB_EXTENSIONS=y
CONFIG_NET_DEVMEM=y

#
# Networking options
#
CONFIG_PACKET=m
# CONFIG_PACKET_DIAG is not set
# CONFIG_UNIX is not set
# CONFIG_DIBS is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
# CONFIG_INET is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_GCOV_PROFILE_RDS=y
# CONFIG_ATM is not set
CONFIG_STP=y
CONFIG_GARP=y
CONFIG_BRIDGE=m
# CONFIG_BRIDGE_VLAN_FILTERING is not set
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
CONFIG_VLAN_8021Q=y
CONFIG_VLAN_8021Q_GVRP=y
# CONFIG_VLAN_8021Q_MVRP is not set
CONFIG_LLC=y
# CONFIG_LLC2 is not set
CONFIG_ATALK=y
# CONFIG_X25 is not set
CONFIG_LAPB=m
# CONFIG_PHONET is not set
CONFIG_IEEE802154=y
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_MAC802154=y
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
# CONFIG_NET_SCH_PRIO is not set
# CONFIG_NET_SCH_MULTIQ is not set
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=y
# CONFIG_NET_SCH_SFQ is not set
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=y
CONFIG_NET_SCH_CBS=y
CONFIG_NET_SCH_ETF=m
CONFIG_NET_SCH_MQPRIO_LIB=y
CONFIG_NET_SCH_TAPRIO=y
CONFIG_NET_SCH_GRED=y
# CONFIG_NET_SCH_NETEM is not set
CONFIG_NET_SCH_DRR=m
# CONFIG_NET_SCH_MQPRIO is not set
CONFIG_NET_SCH_SKBPRIO=y
CONFIG_NET_SCH_CHOKE=y
# CONFIG_NET_SCH_QFQ is not set
# CONFIG_NET_SCH_CODEL is not set
CONFIG_NET_SCH_FQ_CODEL=m
CONFIG_NET_SCH_CAKE=m
CONFIG_NET_SCH_FQ=m
# CONFIG_NET_SCH_HHF is not set
# CONFIG_NET_SCH_PIE is not set
# CONFIG_NET_SCH_INGRESS is not set
# CONFIG_NET_SCH_PLUG is not set
CONFIG_NET_SCH_ETS=m
CONFIG_NET_SCH_DUALPI2=y
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
# CONFIG_NET_CLS_FW is not set
# CONFIG_NET_CLS_U32 is not set
CONFIG_NET_CLS_FLOW=y
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
# CONFIG_NET_CLS_MATCHALL is not set
# CONFIG_NET_EMATCH is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
# CONFIG_GACT_PROB is not set
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
# CONFIG_NET_ACT_NAT is not set
CONFIG_NET_ACT_PEDIT=y
CONFIG_NET_ACT_SIMP=y
# CONFIG_NET_ACT_SKBEDIT is not set
CONFIG_NET_ACT_MPLS=m
# CONFIG_NET_ACT_VLAN is not set
CONFIG_NET_ACT_BPF=y
# CONFIG_NET_ACT_SKBMOD is not set
# CONFIG_NET_ACT_IFE is not set
# CONFIG_NET_ACT_TUNNEL_KEY is not set
# CONFIG_NET_ACT_GATE is not set
CONFIG_NET_TC_SKB_EXT=y
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
CONFIG_BATMAN_ADV=m
# CONFIG_BATMAN_ADV_BATMAN_V is not set
# CONFIG_BATMAN_ADV_DEBUG is not set
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
# CONFIG_NETLINK_DIAG is not set
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
# CONFIG_MPLS_ROUTING is not set
CONFIG_NET_NSH=m
CONFIG_HSR=y
# CONFIG_QRTR is not set
CONFIG_MAX_SKB_FRAGS=17
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
# CONFIG_BQL is not set

#
# Network testing
#
# end of Network testing
# end of Networking options

CONFIG_HAMRADIO=y

#
# Packet Radio protocols
#
# CONFIG_AX25 is not set
CONFIG_CAN=y
CONFIG_CAN_RAW=m
# CONFIG_CAN_BCM is not set
CONFIG_CAN_GW=m
# CONFIG_CAN_J1939 is not set
CONFIG_CAN_ISOTP=y
CONFIG_BT=m
# CONFIG_BT_BREDR is not set
CONFIG_BT_LE=y
CONFIG_BT_LE_L2CAP_ECRED=y
CONFIG_BT_LEDS=y
CONFIG_BT_MSFTEXT=y
CONFIG_BT_AOSPEXT=y
# CONFIG_BT_DEBUGFS is not set
CONFIG_BT_SELFTEST=y
# CONFIG_BT_SELFTEST_ECDH is not set
# CONFIG_BT_SELFTEST_SMP is not set
CONFIG_BT_FEATURE_DEBUG=y

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_RTL=m
CONFIG_BT_QCA=m
CONFIG_BT_MTK=m
CONFIG_BT_HCIBTUSB=m
# CONFIG_BT_HCIBTUSB_AUTOSUSPEND is not set
CONFIG_BT_HCIBTUSB_POLL_SYNC=y
CONFIG_BT_HCIBTUSB_BCM=y
# CONFIG_BT_HCIBTUSB_MTK is not set
CONFIG_BT_HCIBTUSB_RTL=y
CONFIG_BT_HCIBTSDIO=m
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_SERDEV=y
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_NOKIA=m
CONFIG_BT_HCIUART_BCSP=y
# CONFIG_BT_HCIUART_ATH3K is not set
CONFIG_BT_HCIUART_LL=y
CONFIG_BT_HCIUART_3WIRE=y
CONFIG_BT_HCIUART_INTEL=y
CONFIG_BT_HCIUART_BCM=y
CONFIG_BT_HCIUART_QCA=y
CONFIG_BT_HCIUART_AG6XX=y
CONFIG_BT_HCIUART_MRVL=y
CONFIG_BT_HCIUART_AML=y
CONFIG_BT_HCIBCM203X=m
CONFIG_BT_HCIBPA10X=m
CONFIG_BT_HCIBFUSB=m
# CONFIG_BT_HCIDTL1 is not set
CONFIG_BT_HCIBT3C=m
# CONFIG_BT_HCIBLUECARD is not set
# CONFIG_BT_HCIVHCI is not set
CONFIG_BT_MRVL=m
# CONFIG_BT_MRVL_SDIO is not set
# CONFIG_BT_ATH3K is not set
CONFIG_BT_MTKSDIO=m
# CONFIG_BT_MTKUART is not set
# CONFIG_BT_QCOMSMD is not set
CONFIG_BT_VIRTIO=m
CONFIG_BT_NXPUART=m
# end of Bluetooth device drivers

# CONFIG_MCTP is not set
CONFIG_WIRELESS=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=m
CONFIG_NL80211_TESTMODE=y
CONFIG_CFG80211_DEVELOPER_WARNINGS=y
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
# CONFIG_CFG80211_DEFAULT_PS is not set
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
# CONFIG_MAC80211 is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=y
CONFIG_NET_9P_VIRTIO=m
# CONFIG_NET_9P_DEBUG is not set
CONFIG_CAIF=y
CONFIG_CAIF_DEBUG=y
# CONFIG_CAIF_NETDEV is not set
# CONFIG_CAIF_USB is not set
CONFIG_NFC=m
CONFIG_NFC_DIGITAL=m
CONFIG_NFC_NCI=m
CONFIG_NFC_NCI_UART=m
CONFIG_NFC_HCI=m
# CONFIG_NFC_SHDLC is not set

#
# Near Field Communication (NFC) devices
#
# CONFIG_NFC_SIM is not set
CONFIG_NFC_PORT100=m
# CONFIG_NFC_VIRTUAL_NCI is not set
CONFIG_NFC_FDP=m
CONFIG_NFC_FDP_I2C=m
CONFIG_NFC_PN533=m
CONFIG_NFC_PN533_USB=m
# CONFIG_NFC_PN533_I2C is not set
CONFIG_NFC_PN532_UART=m
CONFIG_NFC_MRVL=m
# CONFIG_NFC_MRVL_USB is not set
CONFIG_NFC_MRVL_UART=m
CONFIG_NFC_MRVL_I2C=m
CONFIG_NFC_ST_NCI=m
CONFIG_NFC_ST_NCI_I2C=m
# CONFIG_NFC_NXP_NCI is not set
CONFIG_NFC_S3FWRN5=m
CONFIG_NFC_S3FWRN5_I2C=m
# CONFIG_NFC_S3FWRN82_UART is not set
# end of Near Field Communication (NFC) devices

CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
# CONFIG_LWTUNNEL is not set
CONFIG_GRO_CELLS=y
# CONFIG_NET_SELFTESTS is not set
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=y
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_ARM_AMBA=y
CONFIG_TEGRA_AHB=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
# CONFIG_PCMCIA_LOAD_CIS is not set

#
# PC-card bridges
#
# CONFIG_OMAP_CF is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_CACHE is not set
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=m
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_I3C=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
CONFIG_HISILICON_LPC=y
# CONFIG_IMX_AIPSTZ is not set
CONFIG_IMX_WEIM=y
CONFIG_INTEL_IXP4XX_EB=y
# CONFIG_QCOM_EBI2 is not set
CONFIG_STM32_FIREWALL=y
CONFIG_VEXPRESS_CONFIG=m
# CONFIG_FSL_MC_BUS is not set
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

CONFIG_CONNECTOR=m

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=m
CONFIG_ARM_SCMI_NEED_DEBUGFS=y
CONFIG_ARM_SCMI_RAW_MODE_SUPPORT=y
# CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX is not set
# CONFIG_ARM_SCMI_DEBUG_COUNTERS is not set
# CONFIG_ARM_SCMI_QUIRKS is not set

#
# SCMI Transport Drivers
#
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_MSG=y
# CONFIG_ARM_SCMI_TRANSPORT_MAILBOX is not set
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO=m
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_VERSION1_COMPLIANCE is not set
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_ATOMIC_ENABLE is not set
# end of SCMI Transport Drivers

#
# ARM SCMI NXP i.MX Vendor Protocols
#
# CONFIG_IMX_SCMI_BBM_EXT is not set
CONFIG_IMX_SCMI_CPU_EXT=m
# CONFIG_IMX_SCMI_MISC_EXT is not set
# end of ARM SCMI NXP i.MX Vendor Protocols

CONFIG_ARM_SCMI_POWER_CONTROL=y
# end of ARM System Control and Management Interface Protocol

# CONFIG_ARM_SCPI_PROTOCOL is not set
# CONFIG_TH1520_AON_PROTOCOL is not set
CONFIG_TI_SCI_PROTOCOL=m
CONFIG_TURRIS_MOX_RWTM=m
# CONFIG_TURRIS_MOX_RWTM_KEYCTL is not set
# CONFIG_BCM47XX_NVRAM is not set
CONFIG_TEE_BNXT_FW=m
CONFIG_FW_CS_DSP=y
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE is not set
# CONFIG_IMX_DSP is not set
CONFIG_IMX_SCU=y
CONFIG_IMX_SCMI_CPU_DRV=y
# CONFIG_IMX_SCMI_LMM_DRV is not set
CONFIG_IMX_SCMI_MISC_DRV=y

#
# Qualcomm firmware drivers
#
CONFIG_QCOM_SCM=y
CONFIG_QCOM_TZMEM=y
CONFIG_QCOM_TZMEM_MODE_GENERIC=y
# CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE is not set
CONFIG_QCOM_QSEECOM=y
# end of Qualcomm firmware drivers

CONFIG_EXYNOS_ACPM_PROTOCOL=m

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_FWCTL=y
# CONFIG_GNSS is not set
CONFIG_MTD=y
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
CONFIG_MTD_BCM63XX_PARTS=y
# CONFIG_MTD_BRCM_U_BOOT is not set
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_OF_PARTS=y
# CONFIG_MTD_OF_PARTS_BCM4908 is not set
# CONFIG_MTD_OF_PARTS_LINKSYS_NS is not set
CONFIG_MTD_PARSER_IMAGETAG=y
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_PARSER_TPLINK_SAFELOADER=y
CONFIG_MTD_PARSER_TRX=m
CONFIG_MTD_SHARPSL_PARTS=m
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=m
CONFIG_NFTL=m
CONFIG_NFTL_RW=y
CONFIG_INFTL=m
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
CONFIG_MTD_OOPS=y
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_GEOMETRY is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_OTP=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
CONFIG_MTD_PHYSMAP=m
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_PHYSMAP_OF=y
CONFIG_MTD_PHYSMAP_BT1_ROM=y
# CONFIG_MTD_PHYSMAP_VERSATILE is not set
CONFIG_MTD_PHYSMAP_GEMINI=y
CONFIG_MTD_PHYSMAP_IXP4XX=y
# CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
CONFIG_MTD_SC520CDP=y
CONFIG_MTD_NETSC520=m
# CONFIG_MTD_TS5500 is not set
CONFIG_MTD_IMPA7=m
# CONFIG_MTD_PCMCIA is not set
# CONFIG_MTD_UCLINUX is not set
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_SPEAR_SMI=y
CONFIG_MTD_SLRAM=m
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set
# CONFIG_MTD_INTEL_DG is not set

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
# CONFIG_MTD_ONENAND is not set
CONFIG_MTD_RAW_NAND=m

#
# Raw/parallel NAND flash controllers
#
CONFIG_MTD_NAND_DENALI=m
CONFIG_MTD_NAND_DENALI_DT=m
CONFIG_MTD_NAND_AMS_DELTA=m
# CONFIG_MTD_NAND_OMAP2 is not set
CONFIG_MTD_NAND_SHARPSL=m
# CONFIG_MTD_NAND_ATMEL is not set
# CONFIG_MTD_NAND_MARVELL is not set
CONFIG_MTD_NAND_SLC_LPC32XX=m
CONFIG_MTD_NAND_MLC_LPC32XX=m
CONFIG_MTD_NAND_BRCMNAND=m
# CONFIG_MTD_NAND_BRCMNAND_BCM63XX is not set
CONFIG_MTD_NAND_BRCMNAND_BCMBCA=m
CONFIG_MTD_NAND_BRCMNAND_BRCMSTB=m
CONFIG_MTD_NAND_BRCMNAND_IPROC=m
CONFIG_MTD_NAND_GPMI_NAND=m
CONFIG_MTD_NAND_FSL_IFC=m
# CONFIG_MTD_NAND_VF610_NFC is not set
CONFIG_MTD_NAND_MXC=m
CONFIG_MTD_NAND_SH_FLCTL=m
CONFIG_MTD_NAND_DAVINCI=m
CONFIG_MTD_NAND_TXX9NDFMC=m
CONFIG_MTD_NAND_JZ4780=m
CONFIG_MTD_NAND_INGENIC_ECC=y
# CONFIG_MTD_NAND_JZ4740_ECC is not set
CONFIG_MTD_NAND_JZ4725B_BCH=m
CONFIG_MTD_NAND_JZ4780_BCH=m
CONFIG_MTD_NAND_FSMC=m
# CONFIG_MTD_NAND_SUNXI is not set
CONFIG_MTD_NAND_HISI504=m
CONFIG_MTD_NAND_QCOM=m
# CONFIG_MTD_NAND_MTK is not set
# CONFIG_MTD_NAND_MXIC is not set
CONFIG_MTD_NAND_TEGRA=m
CONFIG_MTD_NAND_STM32_FMC2=m
CONFIG_MTD_NAND_MESON=m
CONFIG_MTD_NAND_GPIO=m
# CONFIG_MTD_NAND_PLATFORM is not set
# CONFIG_MTD_NAND_CADENCE is not set
CONFIG_MTD_NAND_ARASAN=m
# CONFIG_MTD_NAND_INTEL_LGM is not set
# CONFIG_MTD_NAND_PL35X is not set
# CONFIG_MTD_NAND_RENESAS is not set
CONFIG_MTD_NAND_NUVOTON_MA35=m
CONFIG_MTD_NAND_LOONGSON=m

#
# Misc
#
CONFIG_MTD_NAND_NANDSIM=m
# CONFIG_MTD_NAND_DISKONCHIP is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
CONFIG_MTD_NAND_ECC_SW_BCH=y
CONFIG_MTD_NAND_ECC_MXIC=y
CONFIG_MTD_NAND_ECC_MEDIATEK=m
CONFIG_MTD_NAND_ECC_REALTEK=y
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
CONFIG_MTD_LPDDR2_NVM=m
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_MTD_UBI_GLUEBI is not set
# CONFIG_MTD_UBI_BLOCK is not set
# CONFIG_MTD_UBI_NVMEM is not set
CONFIG_MTD_HYPERBUS=y
CONFIG_HBMC_AM654=y
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
# CONFIG_PARPORT_PC_FIFO is not set
CONFIG_PARPORT_PC_SUPERIO=y
CONFIG_PARPORT_PC_PCMCIA=m
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
# CONFIG_NVME_MULTIPATH is not set
CONFIG_NVME_VERBOSE_ERRORS=y
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_FC is not set
# CONFIG_NVME_HOST_AUTH is not set
CONFIG_NVME_TARGET=m
CONFIG_NVME_TARGET_DEBUGFS=y
CONFIG_NVME_TARGET_PASSTHRU=y
CONFIG_NVME_TARGET_LOOP=m
# CONFIG_NVME_TARGET_FC is not set
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
CONFIG_DUMMY_IRQ=y
CONFIG_RPMB=y
CONFIG_TI_FPC202=m
CONFIG_ICS932S401=y
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
CONFIG_SMPRO_ERRMON=y
CONFIG_SMPRO_MISC=m
CONFIG_HI6421V600_IRQ=m
CONFIG_QCOM_COINCELL=m
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=y
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=m
CONFIG_DS1682=m
CONFIG_SRAM=y
CONFIG_SRAM_EXEC=y
CONFIG_XILINX_SDFEC=m
CONFIG_MISC_RTSX=m
# CONFIG_HISI_HIKEY_USB is not set
CONFIG_OPEN_DICE=m
CONFIG_NTSYNC=m
# CONFIG_VCPU_STALL_DETECTOR is not set
CONFIG_TPS6594_ESM=m
CONFIG_TPS6594_PFSM=m
CONFIG_NSM=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
CONFIG_EEPROM_M24LR=y
# end of EEPROM support

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_MISC_RTSX_USB=m
CONFIG_UACCE=m
# CONFIG_PVPANIC is not set
CONFIG_AMD_SBRMI_I2C=y
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
# CONFIG_BLK_DEV_SD is not set
# CONFIG_CHR_DEV_ST is not set
CONFIG_CHR_DEV_SG=y
# CONFIG_BLK_DEV_BSG is not set
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_BOOT_SYSFS is not set
CONFIG_SCSI_HISI_SAS=m
CONFIG_SCSI_HISI_SAS_DEBUGFS_DEFAULT_ENABLE=y
CONFIG_SCSI_PPA=m
CONFIG_SCSI_IMM=m
CONFIG_SCSI_IZIP_SLOW_CTR=y
# CONFIG_SCSI_DEBUG is not set
CONFIG_SCSI_VIRTIO=m
CONFIG_SCSI_LOWLEVEL_PCMCIA=y
CONFIG_PCMCIA_AHA152X=m
# CONFIG_PCMCIA_FDOMAIN is not set
# CONFIG_PCMCIA_NINJA_SCSI is not set
# CONFIG_PCMCIA_QLOGIC is not set
CONFIG_PCMCIA_SYM53C500=m
# CONFIG_SCSI_DH is not set
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
# CONFIG_ATA_VERBOSE_ERROR is not set
CONFIG_ATA_FORCE=y
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI_PLATFORM=y
CONFIG_AHCI_BRCM=y
CONFIG_AHCI_DA850=m
CONFIG_AHCI_DM816=m
CONFIG_AHCI_DWC=y
# CONFIG_AHCI_ST is not set
CONFIG_AHCI_IMX=m
# CONFIG_AHCI_CEVA is not set
CONFIG_AHCI_MTK=y
CONFIG_AHCI_MVEBU=m
CONFIG_AHCI_SUNXI=y
CONFIG_AHCI_TEGRA=m
CONFIG_AHCI_XGENE=y
CONFIG_AHCI_QORIQ=m
CONFIG_SATA_FSL=y
CONFIG_SATA_GEMINI=m
# CONFIG_SATA_AHCI_SEATTLE is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
# CONFIG_SATA_DWC is not set
CONFIG_SATA_HIGHBANK=y
# CONFIG_SATA_MV is not set
CONFIG_SATA_RCAR=m

#
# PATA SFF controllers with BMDMA
#
CONFIG_PATA_ARASAN_CF=y
CONFIG_PATA_FTIDE010=m
CONFIG_PATA_IMX=y
CONFIG_PATA_PXA=m

#
# PIO-only SFF controllers
#
CONFIG_PATA_IXP4XX_CF=y
CONFIG_PATA_PCMCIA=m
CONFIG_PATA_PLATFORM=m
CONFIG_PATA_OF_PLATFORM=m
CONFIG_PATA_PARPORT=m

#
# Parallel IDE protocol modules
#
# CONFIG_PATA_PARPORT_ATEN is not set
CONFIG_PATA_PARPORT_BPCK=m
CONFIG_PATA_PARPORT_BPCK6=m
CONFIG_PATA_PARPORT_COMM=m
CONFIG_PATA_PARPORT_DSTR=m
CONFIG_PATA_PARPORT_FIT2=m
CONFIG_PATA_PARPORT_FIT3=m
CONFIG_PATA_PARPORT_EPAT=m
CONFIG_PATA_PARPORT_EPATC8=y
CONFIG_PATA_PARPORT_EPIA=m
# CONFIG_PATA_PARPORT_FRIQ is not set
# CONFIG_PATA_PARPORT_FRPW is not set
CONFIG_PATA_PARPORT_KBIC=m
CONFIG_PATA_PARPORT_KTTI=m
# CONFIG_PATA_PARPORT_ON20 is not set
# CONFIG_PATA_PARPORT_ON26 is not set

#
# Generic fallback / legacy drivers
#
CONFIG_MD=y
CONFIG_BLK_DEV_MD=m
# CONFIG_MD_BITMAP is not set
# CONFIG_MD_LLBITMAP is not set
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_BCACHE=m
CONFIG_BCACHE_DEBUG=y
# CONFIG_BCACHE_ASYNC_REGISTRATION is not set
# CONFIG_BLK_DEV_DM is not set
CONFIG_TARGET_CORE=y
CONFIG_TCM_IBLOCK=y
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=y
# CONFIG_LOOPBACK_TARGET is not set
# CONFIG_SBP_TARGET is not set
CONFIG_REMOTE_TARGET=m

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_SBP2=m
# end of IEEE 1394 (FireWire) support

CONFIG_NETDEVICES=y
CONFIG_MII=y
# CONFIG_NET_CORE is not set
# CONFIG_ARCNET is not set
# CONFIG_CAIF_DRIVERS is not set
CONFIG_ETHERNET=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ACTIONS is not set
# CONFIG_NET_VENDOR_AIROHA is not set
# CONFIG_NET_VENDOR_ALACRITECH is not set
CONFIG_ALTERA_TSE=m
# CONFIG_NET_VENDOR_AMAZON is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_XGENE=y
# CONFIG_NET_XGENE_V2 is not set
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_NET_VENDOR_ARC=y
CONFIG_ARC_EMAC_CORE=y
CONFIG_EMAC_ROCKCHIP=y
# CONFIG_NET_VENDOR_ASIX is not set
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_AG71XX is not set
# CONFIG_NET_VENDOR_BROADCOM is not set
# CONFIG_NET_VENDOR_CADENCE is not set
CONFIG_NET_CALXEDA_XGMAC=m
# CONFIG_NET_VENDOR_CAVIUM is not set
CONFIG_NET_VENDOR_CIRRUS=y
# CONFIG_CS89x0_PLATFORM is not set
# CONFIG_EP93XX_ETH is not set
# CONFIG_NET_VENDOR_CORTINA is not set
# CONFIG_NET_VENDOR_DAVICOM is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
CONFIG_TSNEP=m
# CONFIG_TSNEP_SELFTESTS is not set
# CONFIG_NET_VENDOR_EZCHIP is not set
CONFIG_NET_VENDOR_FARADAY=y
CONFIG_FTMAC100=y
CONFIG_FTGMAC100=y
CONFIG_NET_VENDOR_FREESCALE=y
CONFIG_FEC=m
CONFIG_FSL_FMAN=y
CONFIG_FSL_PQ_MDIO=m
CONFIG_FSL_XGMAC_MDIO=y
CONFIG_GIANFAR=m
CONFIG_FSL_ENETC_IERB=y
# CONFIG_NXP_NETC_BLK_CTRL is not set
# CONFIG_NET_VENDOR_FUJITSU is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_NET_VENDOR_GOOGLE is not set
# CONFIG_NET_VENDOR_HISILICON is not set
CONFIG_NET_VENDOR_HUAWEI=y
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
CONFIG_LIBETH=y
CONFIG_LIBETH_XDP=y
CONFIG_KORINA=y
CONFIG_NET_VENDOR_LITEX=y
CONFIG_LITEX_LITEETH=m
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=m
# CONFIG_MVNETA is not set
CONFIG_MVPP2=m
CONFIG_PXA168_ETH=y
# CONFIG_NET_VENDOR_MEDIATEK is not set
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLXSW_CORE=y
CONFIG_MLXSW_CORE_THERMAL=y
CONFIG_MLXSW_I2C=y
CONFIG_MLXSW_MINIMAL=y
CONFIG_MLXFW=y
# CONFIG_MLXBF_GIGE is not set
# CONFIG_NET_VENDOR_META is not set
CONFIG_NET_VENDOR_MICREL=y
CONFIG_KS8842=m
# CONFIG_KS8851_MLL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
# CONFIG_NET_VENDOR_MICROSOFT is not set
# CONFIG_NET_VENDOR_MUCSE is not set
# CONFIG_NET_VENDOR_NI is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_LPC_ENET=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PENSANDO=y
CONFIG_NET_VENDOR_QUALCOMM=y
CONFIG_QCA7000=y
CONFIG_QCA7000_UART=y
CONFIG_QCOM_EMAC=y
# CONFIG_QCOM_PPE is not set
CONFIG_RMNET=m
# CONFIG_NET_VENDOR_RENESAS is not set
# CONFIG_NET_VENDOR_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
# CONFIG_NET_VENDOR_SEEQ is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_SMC91X is not set
CONFIG_PCMCIA_SMC91C92=m
CONFIG_SMSC911X=y
# CONFIG_NET_VENDOR_SOCIONEXT is not set
CONFIG_NET_VENDOR_SPACEMIT=y
# CONFIG_SPACEMIT_K1_EMAC is not set
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUNPLUS=y
# CONFIG_SP7021_EMAC is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
CONFIG_DWC_XLGMAC=y
# CONFIG_NET_VENDOR_VERTEXCOM is not set
# CONFIG_NET_VENDOR_VIA is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_NET_VENDOR_WIZNET is not set
# CONFIG_NET_VENDOR_XILINX is not set
# CONFIG_NET_VENDOR_XIRCOM is not set
CONFIG_MDIO_BUS=y
CONFIG_PHYLINK=y
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_PHY_PACKAGE=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_OPEN_ALLIANCE_HELPERS=y
CONFIG_PHYLIB_LEDS=y
CONFIG_FIXED_PHY=y
# CONFIG_SFP is not set

#
# MII PHY device drivers
#
# CONFIG_AS21XXX_PHY is not set
CONFIG_AIR_EN8811H_PHY=m
# CONFIG_AMD_PHY is not set
# CONFIG_MESON_GXL_PHY is not set
CONFIG_ADIN_PHY=y
CONFIG_ADIN1100_PHY=m
CONFIG_AQUANTIA_PHY=m
# CONFIG_AX88796B_PHY is not set
CONFIG_BROADCOM_PHY=m
CONFIG_BCM54140_PHY=m
# CONFIG_BCM63XX_PHY is not set
CONFIG_BCM7XXX_PHY=m
CONFIG_BCM84881_PHY=y
CONFIG_BCM87XX_PHY=m
CONFIG_BCM_CYGNUS_PHY=m
CONFIG_BCM_NET_PHYLIB=m
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
CONFIG_ICPLUS_PHY=y
CONFIG_LXT_PHY=y
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
CONFIG_MARVELL_10G_PHY=y
CONFIG_MARVELL_88Q2XXX_PHY=m
CONFIG_MARVELL_88X2222_PHY=y
# CONFIG_MAXLINEAR_GPHY is not set
CONFIG_MAXLINEAR_86110_PHY=y
CONFIG_MEDIATEK_2P5GE_PHY=y
# CONFIG_MEDIATEK_GE_PHY is not set
CONFIG_MEDIATEK_GE_SOC_PHY=y
CONFIG_MTK_NET_PHYLIB=y
CONFIG_MICREL_PHY=y
CONFIG_MICROCHIP_T1S_PHY=y
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
CONFIG_MOTORCOMM_PHY=y
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_CBTX_PHY is not set
CONFIG_NXP_C45_TJA11XX_PHY=m
CONFIG_NXP_TJA11XX_PHY=m
# CONFIG_NCN26000_PHY is not set
CONFIG_QCOM_NET_PHYLIB=y
CONFIG_AT803X_PHY=m
# CONFIG_QCA83XX_PHY is not set
CONFIG_QCA808X_PHY=y
CONFIG_QCA807X_PHY=y
# CONFIG_QSEMI_PHY is not set
# CONFIG_REALTEK_PHY is not set
CONFIG_RENESAS_PHY=m
CONFIG_ROCKCHIP_PHY=m
CONFIG_SMSC_PHY=y
CONFIG_STE10XP=m
CONFIG_TERANETICS_PHY=m
CONFIG_DP83822_PHY=y
CONFIG_DP83TC811_PHY=m
# CONFIG_DP83848_PHY is not set
CONFIG_DP83867_PHY=y
CONFIG_DP83869_PHY=m
# CONFIG_DP83TD510_PHY is not set
CONFIG_DP83TG720_PHY=y
# CONFIG_VITESSE_PHY is not set
CONFIG_XILINX_GMII2RGMII=m
# CONFIG_PSE_CONTROLLER is not set
CONFIG_CAN_DEV=y
# CONFIG_CAN_VCAN is not set
CONFIG_CAN_VXCAN=y
CONFIG_CAN_NETLINK=y
# CONFIG_CAN_CALC_BITTIMING is not set
CONFIG_CAN_RX_OFFLOAD=y
# CONFIG_CAN_AT91 is not set
CONFIG_CAN_BXCAN=y
CONFIG_CAN_CAN327=m
# CONFIG_CAN_DUMMY is not set
# CONFIG_CAN_FLEXCAN is not set
CONFIG_CAN_GRCAN=y
# CONFIG_CAN_SLCAN is not set
# CONFIG_CAN_SUN4I is not set
# CONFIG_CAN_TI_HECC is not set
CONFIG_CAN_XILINXCAN=m
# CONFIG_CAN_C_CAN is not set
CONFIG_CAN_CC770=m
CONFIG_CAN_CC770_ISA=m
CONFIG_CAN_CC770_PLATFORM=m
CONFIG_CAN_CTUCANFD=y
CONFIG_CAN_CTUCANFD_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_RCAR is not set
# CONFIG_CAN_RCAR_CANFD is not set
CONFIG_CAN_ROCKCHIP_CANFD=m
# CONFIG_CAN_SJA1000 is not set
CONFIG_CAN_SOFTING=m
CONFIG_CAN_SOFTING_CS=m

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB is not set
# CONFIG_CAN_ETAS_ES58X is not set
CONFIG_CAN_F81604=m
CONFIG_CAN_GS_USB=m
CONFIG_CAN_KVASER_USB=m
CONFIG_CAN_MCBA_USB=m
CONFIG_CAN_NCT6694=m
# CONFIG_CAN_PEAK_USB is not set
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
CONFIG_FWNODE_MDIO=y
CONFIG_OF_MDIO=y
# CONFIG_MDIO_AIROHA is not set
CONFIG_MDIO_SUN4I=m
CONFIG_MDIO_XGENE=y
CONFIG_MDIO_ASPEED=m
# CONFIG_MDIO_BITBANG is not set
CONFIG_MDIO_BCM_IPROC=y
CONFIG_MDIO_BCM_UNIMAC=m
CONFIG_MDIO_CAVIUM=y
CONFIG_MDIO_HISI_FEMAC=m
CONFIG_MDIO_MVUSB=y
CONFIG_MDIO_MSCC_MIIM=m
CONFIG_MDIO_MOXART=y
CONFIG_MDIO_OCTEON=y
CONFIG_MDIO_IPQ4019=m
CONFIG_MDIO_IPQ8064=m
CONFIG_MDIO_REALTEK_RTL9300=y
CONFIG_MDIO_REGMAP=m

#
# MDIO Multiplexers
#
CONFIG_MDIO_BUS_MUX=y
CONFIG_MDIO_BUS_MUX_MESON_G12A=y
# CONFIG_MDIO_BUS_MUX_MESON_GXL is not set
CONFIG_MDIO_BUS_MUX_BCM6368=y
CONFIG_MDIO_BUS_MUX_BCM_IPROC=y
CONFIG_MDIO_BUS_MUX_GPIO=y
CONFIG_MDIO_BUS_MUX_MULTIPLEXER=y
CONFIG_MDIO_BUS_MUX_MMIOREG=y

#
# PCS device drivers
#
CONFIG_PCS_XPCS=m
CONFIG_PCS_LYNX=y
CONFIG_PCS_RZN1_MIIC=m
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
CONFIG_SLIP=y
# CONFIG_SLIP_COMPRESSED is not set
CONFIG_SLIP_SMART=y
CONFIG_SLIP_MODE_SLIP6=y
CONFIG_USB_NET_DRIVERS=y
CONFIG_USB_CATC=m
# CONFIG_USB_KAWETH is not set
CONFIG_USB_PEGASUS=y
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_LAN78XX is not set
# CONFIG_USB_USBNET is not set
CONFIG_USB_IPHETH=m
# CONFIG_WLAN is not set
CONFIG_WAN=y
# CONFIG_HDLC is not set
# CONFIG_FRAMER is not set
CONFIG_IEEE802154_DRIVERS=y
CONFIG_IEEE802154_FAKELB=y
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
CONFIG_WWAN=m
CONFIG_WWAN_DEBUGFS=y
CONFIG_WWAN_HWSIM=m
CONFIG_QCOM_BAM_DMUX=m
CONFIG_RPMSG_WWAN_CTRL=m
# end of Wireless WAN

# CONFIG_NET_FAILOVER is not set
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
CONFIG_MISDN=y
CONFIG_MISDN_DSP=m
# CONFIG_MISDN_L1OIP is not set

#
# mISDN hardware drivers
#
CONFIG_MISDN_HFCUSB=m

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=m
CONFIG_KEYBOARD_ADP5585=y
# CONFIG_KEYBOARD_ADP5588 is not set
CONFIG_KEYBOARD_ATKBD=m
CONFIG_KEYBOARD_QT1050=y
CONFIG_KEYBOARD_QT1070=y
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_CLPS711X=m
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=y
# CONFIG_KEYBOARD_EP93XX is not set
CONFIG_KEYBOARD_GPIO=m
CONFIG_KEYBOARD_GPIO_POLLED=y
CONFIG_KEYBOARD_TCA8418=m
CONFIG_KEYBOARD_MATRIX=y
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_LPC32XX is not set
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MAX7360=y
# CONFIG_KEYBOARD_MPR121 is not set
CONFIG_KEYBOARD_SNVS_PWRKEY=m
CONFIG_KEYBOARD_IMX=m
CONFIG_KEYBOARD_IMX_BBM_SCMI=y
CONFIG_KEYBOARD_IMX_SC_KEY=y
CONFIG_KEYBOARD_NEWTON=m
# CONFIG_KEYBOARD_TEGRA is not set
CONFIG_KEYBOARD_OPENCORES=y
CONFIG_KEYBOARD_PINEPHONE=m
# CONFIG_KEYBOARD_PXA27x is not set
CONFIG_KEYBOARD_PMIC8XXX=m
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
CONFIG_KEYBOARD_STOWAWAY=y
CONFIG_KEYBOARD_ST_KEYSCAN=y
# CONFIG_KEYBOARD_SUNKBD is not set
CONFIG_KEYBOARD_SH_KEYSC=m
CONFIG_KEYBOARD_OMAP4=m
# CONFIG_KEYBOARD_SPEAR is not set
CONFIG_KEYBOARD_TC3589X=y
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
CONFIG_KEYBOARD_TWL4030=m
CONFIG_KEYBOARD_XTKBD=m
CONFIG_KEYBOARD_CAP11XX=y
# CONFIG_KEYBOARD_BCM is not set
CONFIG_KEYBOARD_MT6779=y
# CONFIG_KEYBOARD_MTK_PMIC is not set
CONFIG_KEYBOARD_CYPRESS_SF=m
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
CONFIG_JOYSTICK_ANALOG=m
# CONFIG_JOYSTICK_A3D is not set
# CONFIG_JOYSTICK_ADC is not set
CONFIG_JOYSTICK_ADI=y
CONFIG_JOYSTICK_COBRA=y
CONFIG_JOYSTICK_GF2K=y
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=m
CONFIG_JOYSTICK_GUILLEMOT=y
CONFIG_JOYSTICK_INTERACT=y
CONFIG_JOYSTICK_SIDEWINDER=m
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=m
CONFIG_JOYSTICK_IFORCE_USB=m
CONFIG_JOYSTICK_IFORCE_232=m
CONFIG_JOYSTICK_WARRIOR=y
# CONFIG_JOYSTICK_MAGELLAN is not set
CONFIG_JOYSTICK_SPACEORB=m
CONFIG_JOYSTICK_SPACEBALL=m
# CONFIG_JOYSTICK_STINGER is not set
CONFIG_JOYSTICK_TWIDJOY=m
CONFIG_JOYSTICK_ZHENHUA=m
CONFIG_JOYSTICK_DB9=m
CONFIG_JOYSTICK_GAMECON=m
# CONFIG_JOYSTICK_TURBOGRAFX is not set
CONFIG_JOYSTICK_AS5011=y
CONFIG_JOYSTICK_JOYDUMP=y
CONFIG_JOYSTICK_XPAD=m
# CONFIG_JOYSTICK_XPAD_FF is not set
# CONFIG_JOYSTICK_XPAD_LEDS is not set
CONFIG_JOYSTICK_PXRC=y
CONFIG_JOYSTICK_QWIIC=m
CONFIG_JOYSTICK_FSIA6B=m
# CONFIG_JOYSTICK_SENSEHAT is not set
CONFIG_JOYSTICK_SEESAW=y
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_AD7879=y
CONFIG_TOUCHSCREEN_AD7879_I2C=y
CONFIG_TOUCHSCREEN_ADC=m
CONFIG_TOUCHSCREEN_AR1021_I2C=m
CONFIG_TOUCHSCREEN_ATMEL_MXT=m
CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
CONFIG_TOUCHSCREEN_BU21013=m
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
CONFIG_TOUCHSCREEN_CY8CTMA140=y
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
CONFIG_TOUCHSCREEN_CYTTSP_I2C=m
CONFIG_TOUCHSCREEN_CYTTSP5=m
CONFIG_TOUCHSCREEN_DYNAPRO=y
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
CONFIG_TOUCHSCREEN_EETI=m
CONFIG_TOUCHSCREEN_EGALAX=y
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=y
# CONFIG_TOUCHSCREEN_EXC3000 is not set
# CONFIG_TOUCHSCREEN_FUJITSU is not set
# CONFIG_TOUCHSCREEN_GOODIX is not set
# CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C is not set
CONFIG_TOUCHSCREEN_HIDEEP=m
CONFIG_TOUCHSCREEN_HIMAX_HX852X=y
CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX=y
CONFIG_TOUCHSCREEN_HYNITRON_CST816X=y
CONFIG_TOUCHSCREEN_ILI210X=m
CONFIG_TOUCHSCREEN_ILITEK=y
CONFIG_TOUCHSCREEN_IPROC=m
CONFIG_TOUCHSCREEN_S6SY761=y
# CONFIG_TOUCHSCREEN_GUNZE is not set
CONFIG_TOUCHSCREEN_EKTF2127=m
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=m
CONFIG_TOUCHSCREEN_WACOM_W8001=m
CONFIG_TOUCHSCREEN_WACOM_I2C=y
# CONFIG_TOUCHSCREEN_MAX11801 is not set
CONFIG_TOUCHSCREEN_MMS114=m
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
CONFIG_TOUCHSCREEN_MSG2638=y
# CONFIG_TOUCHSCREEN_MTOUCH is not set
CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS=y
CONFIG_TOUCHSCREEN_IMAGIS=y
# CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
CONFIG_TOUCHSCREEN_INEXIO=m
CONFIG_TOUCHSCREEN_PENMOUNT=y
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
# CONFIG_TOUCHSCREEN_RASPBERRYPI_FW is not set
CONFIG_TOUCHSCREEN_MIGOR=y
CONFIG_TOUCHSCREEN_TOUCHRIGHT=m
CONFIG_TOUCHSCREEN_TOUCHWIN=m
CONFIG_TOUCHSCREEN_PIXCIR=y
CONFIG_TOUCHSCREEN_WDT87XX_I2C=y
# CONFIG_TOUCHSCREEN_WM97XX is not set
CONFIG_TOUCHSCREEN_USB_COMPOSITE=y
CONFIG_TOUCHSCREEN_MXS_LRADC=m
# CONFIG_TOUCHSCREEN_MX25 is not set
CONFIG_TOUCHSCREEN_MC13783=y
CONFIG_TOUCHSCREEN_USB_EGALAX=y
CONFIG_TOUCHSCREEN_USB_PANJIT=y
CONFIG_TOUCHSCREEN_USB_3M=y
CONFIG_TOUCHSCREEN_USB_ITM=y
CONFIG_TOUCHSCREEN_USB_ETURBO=y
CONFIG_TOUCHSCREEN_USB_GUNZE=y
CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
CONFIG_TOUCHSCREEN_USB_GOTOP=y
CONFIG_TOUCHSCREEN_USB_JASTEC=y
CONFIG_TOUCHSCREEN_USB_ELO=y
CONFIG_TOUCHSCREEN_USB_E2I=y
CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
CONFIG_TOUCHSCREEN_USB_NEXIO=y
CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
# CONFIG_TOUCHSCREEN_TS4800 is not set
CONFIG_TOUCHSCREEN_TSC_SERIO=y
CONFIG_TOUCHSCREEN_TSC200X_CORE=m
CONFIG_TOUCHSCREEN_TSC2004=m
CONFIG_TOUCHSCREEN_TSC2007=y
CONFIG_TOUCHSCREEN_TSC2007_IIO=y
CONFIG_TOUCHSCREEN_RM_TS=m
CONFIG_TOUCHSCREEN_SILEAD=y
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
CONFIG_TOUCHSCREEN_ST1232=m
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUN4I is not set
# CONFIG_TOUCHSCREEN_SX8654 is not set
CONFIG_TOUCHSCREEN_TPS6507X=m
CONFIG_TOUCHSCREEN_ZET6223=m
CONFIG_TOUCHSCREEN_ZFORCE=m
# CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
CONFIG_TOUCHSCREEN_ROHM_BU21023=m
CONFIG_TOUCHSCREEN_IQS5XX=m
# CONFIG_TOUCHSCREEN_IQS7211 is not set
CONFIG_TOUCHSCREEN_ZINITIX=y
CONFIG_TOUCHSCREEN_HIMAX_HX83112B=m
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_I2C is not set
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
# CONFIG_RMI4_F1A is not set
# CONFIG_RMI4_F21 is not set
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_PARKBD=m
CONFIG_SERIO_AMBAKMI=y
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_APBPS2 is not set
CONFIG_SERIO_OLPC_APSP=y
# CONFIG_SERIO_SUN4I_PS2 is not set
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=m
CONFIG_GAMEPORT=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
# CONFIG_LEGACY_TIOCSTI is not set
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=m
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_CS=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_BCM2835AUX is not set
CONFIG_SERIAL_8250_FSL=m
# CONFIG_SERIAL_8250_DFL is not set
CONFIG_SERIAL_8250_DW=m
# CONFIG_SERIAL_8250_EM is not set
CONFIG_SERIAL_8250_IOC3=m
# CONFIG_SERIAL_8250_RT288X is not set
# CONFIG_SERIAL_8250_OMAP is not set
CONFIG_SERIAL_8250_LOONGSON=m
# CONFIG_SERIAL_8250_LPC18XX is not set
CONFIG_SERIAL_8250_MT6577=m
CONFIG_SERIAL_8250_UNIPHIER=m
# CONFIG_SERIAL_8250_INGENIC is not set
CONFIG_SERIAL_8250_PXA=m
CONFIG_SERIAL_8250_TEGRA=m
# CONFIG_SERIAL_8250_BCM7271 is not set
CONFIG_SERIAL_8250_NI=m
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_AMBA_PL010=y
CONFIG_SERIAL_AMBA_PL010_CONSOLE=y
CONFIG_SERIAL_AMBA_PL011=y
CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
# CONFIG_SERIAL_EARLYCON_SEMIHOST is not set
CONFIG_SERIAL_ATMEL=y
CONFIG_SERIAL_ATMEL_CONSOLE=y
# CONFIG_SERIAL_ATMEL_PDC is not set
# CONFIG_SERIAL_ATMEL_TTYAT is not set
CONFIG_SERIAL_MESON=m
CONFIG_SERIAL_MESON_CONSOLE=y
CONFIG_SERIAL_CLPS711X=m
CONFIG_SERIAL_SAMSUNG=m
CONFIG_SERIAL_SAMSUNG_UARTS=4
CONFIG_SERIAL_SAMSUNG_CONSOLE=y
CONFIG_SERIAL_TEGRA=y
CONFIG_SERIAL_TEGRA_TCU=y
CONFIG_SERIAL_TEGRA_TCU_CONSOLE=y
# CONFIG_SERIAL_TEGRA_UTC is not set
# CONFIG_SERIAL_IMX is not set
# CONFIG_SERIAL_IMX_EARLYCON is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_SH_SCI=m
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_RSCI=m
CONFIG_SERIAL_HS_LPC32XX=y
CONFIG_SERIAL_HS_LPC32XX_CONSOLE=y
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_MSM=y
# CONFIG_SERIAL_MSM_CONSOLE is not set
CONFIG_SERIAL_VT8500=y
# CONFIG_SERIAL_VT8500_CONSOLE is not set
CONFIG_SERIAL_OMAP=y
# CONFIG_SERIAL_OMAP_CONSOLE is not set
CONFIG_SERIAL_SIFIVE=m
CONFIG_SERIAL_LANTIQ=y
CONFIG_SERIAL_LANTIQ_CONSOLE=y
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_TIMBERDALE is not set
CONFIG_SERIAL_BCM63XX=m
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_MPS2_UART is not set
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_FSL_LPUART=m
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
CONFIG_SERIAL_ST_ASC=y
CONFIG_SERIAL_ST_ASC_CONSOLE=y
CONFIG_SERIAL_SPRD=m
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
# CONFIG_SERIAL_MVEBU_UART is not set
CONFIG_SERIAL_OWL=y
CONFIG_SERIAL_OWL_CONSOLE=y
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_MILBEAUT_USIO is not set
# CONFIG_SERIAL_LITEUART is not set
CONFIG_SERIAL_SUNPLUS=m
# CONFIG_SERIAL_SUNPLUS_CONSOLE is not set
CONFIG_SERIAL_NUVOTON_MA35D1=m
# CONFIG_SERIAL_ESP32 is not set
CONFIG_SERIAL_ESP32_ACM=y
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_GOLDFISH_TTY is not set
# CONFIG_IPWIRELESS is not set
CONFIG_N_GSM=y
CONFIG_NULL_TTY=y
CONFIG_HVC_DRIVER=y
CONFIG_HVC_DCC=y
# CONFIG_RPMSG_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=m
# CONFIG_IPMI_SSIF is not set
CONFIG_IPMI_IPMB=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_SSIF_IPMI_BMC=m
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
# CONFIG_HW_RANDOM_TIMERIOMEM is not set
# CONFIG_HW_RANDOM_AIROHA is not set
CONFIG_HW_RANDOM_ATMEL=m
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_BCM2835=m
CONFIG_HW_RANDOM_BCM74110=y
CONFIG_HW_RANDOM_IPROC_RNG200=m
# CONFIG_HW_RANDOM_IXP4XX is not set
CONFIG_HW_RANDOM_OMAP=m
CONFIG_HW_RANDOM_OMAP3_ROM=y
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_MXC_RNGA=y
# CONFIG_HW_RANDOM_IMX_RNGC is not set
CONFIG_HW_RANDOM_INGENIC_RNG=y
CONFIG_HW_RANDOM_INGENIC_TRNG=m
CONFIG_HW_RANDOM_NOMADIK=m
CONFIG_HW_RANDOM_HISI=m
# CONFIG_HW_RANDOM_HISTB is not set
# CONFIG_HW_RANDOM_ST is not set
# CONFIG_HW_RANDOM_XGENE is not set
# CONFIG_HW_RANDOM_STM32 is not set
# CONFIG_HW_RANDOM_PIC32 is not set
CONFIG_HW_RANDOM_MESON=m
CONFIG_HW_RANDOM_MTK=m
CONFIG_HW_RANDOM_EXYNOS=m
CONFIG_HW_RANDOM_NPCM=m
CONFIG_HW_RANDOM_KEYSTONE=m
CONFIG_HW_RANDOM_CCTRNG=y
CONFIG_HW_RANDOM_XIPHERA=y
# CONFIG_HW_RANDOM_JH7110 is not set
CONFIG_HW_RANDOM_ROCKCHIP=m
# CONFIG_DEVMEM is not set
CONFIG_DEVPORT=y
# CONFIG_TCG_TPM is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_OF=y
# CONFIG_XILLYUSB is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
CONFIG_I2C_MUX_GPIO=m
# CONFIG_I2C_MUX_GPMUX is not set
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_PINCTRL=m
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_DEMUX_PINCTRL is not set
CONFIG_I2C_MUX_MLXCPLD=m
CONFIG_I2C_MUX_MULE=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_ATR=y
# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
# CONFIG_I2C_ALGOPCF is not set
CONFIG_I2C_ALGOPCA=y
# end of I2C Algorithms

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AT91 is not set
# CONFIG_I2C_AXXIA is not set
CONFIG_I2C_BCM2835=m
CONFIG_I2C_BCM_IPROC=y
CONFIG_I2C_BCM_KONA=y
CONFIG_I2C_BRCMSTB=y
# CONFIG_I2C_CADENCE is not set
CONFIG_I2C_CBUS_GPIO=y
CONFIG_I2C_DAVINCI=m
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_DESIGNWARE_PLATFORM is not set
CONFIG_I2C_DESIGNWARE_AMDISP=m
CONFIG_I2C_DIGICOLOR=y
CONFIG_I2C_EMEV2=m
CONFIG_I2C_EXYNOS5=m
CONFIG_I2C_GPIO=m
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
CONFIG_I2C_GXP=m
CONFIG_I2C_HIGHLANDER=m
# CONFIG_I2C_HISI is not set
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX is not set
CONFIG_I2C_IMX_LPI2C=y
# CONFIG_I2C_IOP3XX is not set
CONFIG_I2C_JZ4780=m
# CONFIG_I2C_K1 is not set
CONFIG_I2C_KEBA=y
CONFIG_I2C_KEMPLD=m
CONFIG_I2C_LPC2K=m
# CONFIG_I2C_LS2X is not set
# CONFIG_I2C_MESON is not set
CONFIG_I2C_MICROCHIP_CORE=y
# CONFIG_I2C_MT65XX is not set
CONFIG_I2C_MT7621=m
# CONFIG_I2C_MV64XXX is not set
CONFIG_I2C_MXS=y
# CONFIG_I2C_NOMADIK is not set
# CONFIG_I2C_NPCM is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=y
# CONFIG_I2C_PNX is not set
CONFIG_I2C_PXA=y
# CONFIG_I2C_PXA_SLAVE is not set
# CONFIG_I2C_QCOM_CCI is not set
CONFIG_I2C_QUP=m
CONFIG_I2C_RIIC=m
CONFIG_I2C_RK3X=y
CONFIG_I2C_RTL9300=m
# CONFIG_I2C_RZV2M is not set
CONFIG_I2C_S3C2410=m
CONFIG_I2C_SH_MOBILE=y
CONFIG_I2C_SIMTEC=y
CONFIG_I2C_SPRD=y
# CONFIG_I2C_ST is not set
CONFIG_I2C_STM32F4=m
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_TEGRA is not set
CONFIG_I2C_TEGRA_BPMP=y
CONFIG_I2C_UNIPHIER=m
# CONFIG_I2C_UNIPHIER_F is not set
CONFIG_I2C_VERSATILE=y
CONFIG_I2C_WMT=m
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
CONFIG_I2C_RCAR=y

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_DLN2 is not set
CONFIG_I2C_NCT6694=y
CONFIG_I2C_CP2615=m
# CONFIG_I2C_PARPORT is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y
CONFIG_I2C_VIPERBOARD=m

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
# CONFIG_I2C_FSI is not set
CONFIG_I2C_VIRTIO=m
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
CONFIG_I2C_SLAVE_TESTUNIT=y
CONFIG_I2C_DEBUG_CORE=y
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=y
CONFIG_ADI_I3C_MASTER=m
CONFIG_CDNS_I3C_MASTER=m
CONFIG_DW_I3C_MASTER=m
# CONFIG_AST2600_I3C_MASTER is not set
# CONFIG_SVC_I3C_MASTER is not set
CONFIG_MIPI_I3C_HCI=y
# CONFIG_RENESAS_I3C is not set
# CONFIG_SPI is not set
CONFIG_SPMI=m
CONFIG_SPMI_APPLE=m
CONFIG_SPMI_HISI3670=m
# CONFIG_SPMI_MSM_PMIC_ARB is not set
# CONFIG_SPMI_MTK_PMIF is not set
# CONFIG_HSI is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

#
# DPLL device support
#
CONFIG_DPLL=y
CONFIG_ZL3073X=m
# CONFIG_ZL3073X_I2C is not set
# end of DPLL device support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_AMDISP=y
CONFIG_PINCTRL_AS3722=y
# CONFIG_PINCTRL_AT91 is not set
CONFIG_PINCTRL_AT91PIO4=y
CONFIG_PINCTRL_AXP209=m
CONFIG_PINCTRL_AW9523=y
# CONFIG_PINCTRL_BM1880 is not set
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA850_PUPD=m
CONFIG_PINCTRL_DA9062=y
CONFIG_PINCTRL_EIC7700=m
CONFIG_PINCTRL_EQUILIBRIUM=y
CONFIG_PINCTRL_EYEQ5=y
# CONFIG_PINCTRL_INGENIC is not set
# CONFIG_PINCTRL_K210 is not set
CONFIG_PINCTRL_K230=y
# CONFIG_PINCTRL_LOONGSON2 is not set
# CONFIG_PINCTRL_LPC18XX is not set
CONFIG_PINCTRL_MAX7360=y
# CONFIG_PINCTRL_MAX77620 is not set
CONFIG_PINCTRL_MCP23S08_I2C=m
CONFIG_PINCTRL_MCP23S08=m
CONFIG_PINCTRL_MICROCHIP_SGPIO=y
# CONFIG_PINCTRL_OCELOT is not set
CONFIG_PINCTRL_PALMAS=m
# CONFIG_PINCTRL_PIC64GX is not set
CONFIG_PINCTRL_PISTACHIO=y
CONFIG_PINCTRL_POLARFIRE_SOC=y
CONFIG_PINCTRL_RK805=m
# CONFIG_PINCTRL_ROCKCHIP is not set
# CONFIG_PINCTRL_SCMI is not set
CONFIG_PINCTRL_SINGLE=m
# CONFIG_PINCTRL_STMFX is not set
CONFIG_PINCTRL_SX150X=m
# CONFIG_PINCTRL_TB10X is not set
CONFIG_PINCTRL_TPS6594=m
# CONFIG_PINCTRL_TH1520 is not set
# CONFIG_PINCTRL_ZYNQ is not set
# CONFIG_PINCTRL_MLXBF3 is not set
CONFIG_PINCTRL_OWL=y
# CONFIG_PINCTRL_S500 is not set
# CONFIG_PINCTRL_S700 is not set
# CONFIG_PINCTRL_S900 is not set
CONFIG_PINCTRL_ASPEED=y
CONFIG_PINCTRL_ASPEED_G4=y
CONFIG_PINCTRL_ASPEED_G5=y
CONFIG_PINCTRL_ASPEED_G6=y
CONFIG_PINCTRL_BCM281XX=y
CONFIG_PINCTRL_BCM2835=m
# CONFIG_PINCTRL_BCM4908 is not set
CONFIG_PINCTRL_BCM63XX=y
# CONFIG_PINCTRL_BCM6318 is not set
# CONFIG_PINCTRL_BCM6328 is not set
# CONFIG_PINCTRL_BCM6358 is not set
# CONFIG_PINCTRL_BCM6362 is not set
CONFIG_PINCTRL_BCM6368=y
CONFIG_PINCTRL_BCM63268=y
# CONFIG_PINCTRL_BRCMSTB is not set
CONFIG_PINCTRL_IPROC_GPIO=y
CONFIG_PINCTRL_CYGNUS_MUX=y
CONFIG_PINCTRL_NS=y
# CONFIG_PINCTRL_NSP_GPIO is not set
# CONFIG_PINCTRL_NS2_MUX is not set
# CONFIG_PINCTRL_NSP_MUX is not set
CONFIG_PINCTRL_BERLIN=y
CONFIG_PINCTRL_AS370=y
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
CONFIG_PINCTRL_CS42L43=m
CONFIG_PINCTRL_LOCHNAGAR=y
CONFIG_PINCTRL_MADERA=m
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_SKY1_BASE=y
CONFIG_PINCTRL_SKY1=y
CONFIG_PINCTRL_IMX=y
# CONFIG_PINCTRL_IMX_SCMI is not set
CONFIG_PINCTRL_IMX_SCU=y
CONFIG_PINCTRL_IMX1_CORE=y
# CONFIG_PINCTRL_IMX1 is not set
CONFIG_PINCTRL_IMX27=y
# CONFIG_PINCTRL_IMX25 is not set
# CONFIG_PINCTRL_IMX35 is not set
# CONFIG_PINCTRL_IMX50 is not set
CONFIG_PINCTRL_IMX51=y
CONFIG_PINCTRL_IMX53=y
CONFIG_PINCTRL_IMX6Q=y
CONFIG_PINCTRL_IMX6SL=y
# CONFIG_PINCTRL_IMX6SLL is not set
# CONFIG_PINCTRL_IMX6SX is not set
# CONFIG_PINCTRL_IMX6UL is not set
# CONFIG_PINCTRL_IMX7D is not set
# CONFIG_PINCTRL_IMX7ULP is not set
CONFIG_PINCTRL_IMX8MM=m
# CONFIG_PINCTRL_IMX8MN is not set
CONFIG_PINCTRL_IMX8MP=y
CONFIG_PINCTRL_IMX8MQ=m
CONFIG_PINCTRL_IMX8QM=m
# CONFIG_PINCTRL_IMX8QXP is not set
CONFIG_PINCTRL_IMX8DXL=m
CONFIG_PINCTRL_IMX8ULP=y
# CONFIG_PINCTRL_IMXRT1050 is not set
CONFIG_PINCTRL_IMX91=m
CONFIG_PINCTRL_IMX93=m
CONFIG_PINCTRL_VF610=y
CONFIG_PINCTRL_IMXRT1170=y

#
# Intel pinctrl drivers
#
# CONFIG_PINCTRL_BAYTRAIL is not set
CONFIG_PINCTRL_CHERRYVIEW=m
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_INTEL_PLATFORM=y
CONFIG_PINCTRL_ALDERLAKE=y
# CONFIG_PINCTRL_BROXTON is not set
CONFIG_PINCTRL_CANNONLAKE=y
CONFIG_PINCTRL_CEDARFORK=m
# CONFIG_PINCTRL_DENVERTON is not set
CONFIG_PINCTRL_ELKHARTLAKE=y
# CONFIG_PINCTRL_EMMITSBURG is not set
CONFIG_PINCTRL_GEMINILAKE=y
CONFIG_PINCTRL_ICELAKE=m
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
CONFIG_PINCTRL_LEWISBURG=y
CONFIG_PINCTRL_METEORLAKE=m
CONFIG_PINCTRL_METEORPOINT=y
CONFIG_PINCTRL_SUNRISEPOINT=m
CONFIG_PINCTRL_TIGERLAKE=y
CONFIG_PINCTRL_TANGIER=m
CONFIG_PINCTRL_MERRIFIELD=m
# CONFIG_PINCTRL_MOOREFIELD is not set
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
CONFIG_PINCTRL_MT2701=y
CONFIG_PINCTRL_MT7623=y
CONFIG_PINCTRL_MT7629=y
# CONFIG_PINCTRL_MT8135 is not set
CONFIG_PINCTRL_MT8127=y
CONFIG_PINCTRL_AIROHA=m
CONFIG_PINCTRL_MT2712=y
# CONFIG_PINCTRL_MT6765 is not set
CONFIG_PINCTRL_MT6779=m
# CONFIG_PINCTRL_MT6795 is not set
# CONFIG_PINCTRL_MT6797 is not set
CONFIG_PINCTRL_MT6878=y
CONFIG_PINCTRL_MT6893=y
CONFIG_PINCTRL_MT7622=y
# CONFIG_PINCTRL_MT7981 is not set
# CONFIG_PINCTRL_MT7986 is not set
# CONFIG_PINCTRL_MT7988 is not set
# CONFIG_PINCTRL_MT8167 is not set
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
CONFIG_PINCTRL_MT8186=y
CONFIG_PINCTRL_MT8188=y
# CONFIG_PINCTRL_MT8189 is not set
# CONFIG_PINCTRL_MT8192 is not set
# CONFIG_PINCTRL_MT8195 is not set
CONFIG_PINCTRL_MT8196=y
# CONFIG_PINCTRL_MT8365 is not set
# CONFIG_PINCTRL_MT8516 is not set
CONFIG_PINCTRL_MT6397=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=y
# CONFIG_PINCTRL_MESON8 is not set
# CONFIG_PINCTRL_MESON8B is not set
# CONFIG_PINCTRL_NOMADIK is not set
CONFIG_PINCTRL_WPCM450=y
CONFIG_PINCTRL_NPCM7XX=y
CONFIG_PINCTRL_NPCM8XX=m
CONFIG_PINCTRL_MA35=y
CONFIG_PINCTRL_MA35D1=y
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
# CONFIG_PINCTRL_PXA27X is not set
CONFIG_PINCTRL_MSM=y
CONFIG_PINCTRL_APQ8064=y
# CONFIG_PINCTRL_APQ8084 is not set
CONFIG_PINCTRL_GLYMUR=y
CONFIG_PINCTRL_IPQ4019=y
CONFIG_PINCTRL_IPQ5018=m
CONFIG_PINCTRL_IPQ8064=m
CONFIG_PINCTRL_IPQ5332=y
CONFIG_PINCTRL_IPQ5424=y
CONFIG_PINCTRL_IPQ8074=y
CONFIG_PINCTRL_IPQ6018=m
CONFIG_PINCTRL_IPQ9574=y
# CONFIG_PINCTRL_KAANAPALI is not set
CONFIG_PINCTRL_MSM8226=y
CONFIG_PINCTRL_MSM8660=y
CONFIG_PINCTRL_MSM8960=m
CONFIG_PINCTRL_MDM9607=m
# CONFIG_PINCTRL_MDM9615 is not set
# CONFIG_PINCTRL_MSM8X74 is not set
CONFIG_PINCTRL_MSM8909=m
# CONFIG_PINCTRL_MSM8916 is not set
CONFIG_PINCTRL_MSM8917=m
CONFIG_PINCTRL_MSM8953=y
# CONFIG_PINCTRL_MSM8976 is not set
CONFIG_PINCTRL_MSM8994=m
# CONFIG_PINCTRL_MSM8996 is not set
CONFIG_PINCTRL_MSM8998=m
CONFIG_PINCTRL_QCM2290=m
CONFIG_PINCTRL_QCS404=y
# CONFIG_PINCTRL_QCS615 is not set
# CONFIG_PINCTRL_QCS8300 is not set
CONFIG_PINCTRL_QDU1000=m
CONFIG_PINCTRL_SA8775P=y
# CONFIG_PINCTRL_SAR2130P is not set
# CONFIG_PINCTRL_SC7180 is not set
CONFIG_PINCTRL_SC7280=m
# CONFIG_PINCTRL_SC8180X is not set
CONFIG_PINCTRL_SC8280XP=m
CONFIG_PINCTRL_SDM660=m
CONFIG_PINCTRL_SDM670=y
CONFIG_PINCTRL_SDM845=y
CONFIG_PINCTRL_SDX55=y
CONFIG_PINCTRL_SDX65=y
# CONFIG_PINCTRL_SDX75 is not set
CONFIG_PINCTRL_SM4450=y
# CONFIG_PINCTRL_SM6115 is not set
CONFIG_PINCTRL_SM6125=y
CONFIG_PINCTRL_SM6350=m
# CONFIG_PINCTRL_SM6375 is not set
CONFIG_PINCTRL_SM7150=y
CONFIG_PINCTRL_MILOS=y
CONFIG_PINCTRL_SM8150=y
# CONFIG_PINCTRL_SM8250 is not set
CONFIG_PINCTRL_SM8350=y
CONFIG_PINCTRL_SM8450=m
# CONFIG_PINCTRL_SM8550 is not set
CONFIG_PINCTRL_SM8650=m
# CONFIG_PINCTRL_SM8750 is not set
CONFIG_PINCTRL_X1E80100=y
CONFIG_PINCTRL_QCOM_SPMI_PMIC=m
CONFIG_PINCTRL_QCOM_SSBI_PMIC=m
CONFIG_PINCTRL_LPASS_LPI=m
CONFIG_PINCTRL_SC7280_LPASS_LPI=m
# CONFIG_PINCTRL_SDM660_LPASS_LPI is not set
# CONFIG_PINCTRL_SM4250_LPASS_LPI is not set
CONFIG_PINCTRL_SM6115_LPASS_LPI=m
# CONFIG_PINCTRL_SM8250_LPASS_LPI is not set
# CONFIG_PINCTRL_SM8350_LPASS_LPI is not set
CONFIG_PINCTRL_SM8450_LPASS_LPI=m
# CONFIG_PINCTRL_SC8280XP_LPASS_LPI is not set
CONFIG_PINCTRL_SM8550_LPASS_LPI=m
CONFIG_PINCTRL_SM8650_LPASS_LPI=m

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
CONFIG_PINCTRL_PFC_EMEV2=y
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
CONFIG_PINCTRL_PFC_R8A7740=y
CONFIG_PINCTRL_PFC_R8A7742=y
CONFIG_PINCTRL_PFC_R8A7743=y
# CONFIG_PINCTRL_PFC_R8A7744 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
CONFIG_PINCTRL_PFC_R8A77470=y
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
CONFIG_PINCTRL_PFC_R8A7778=y
CONFIG_PINCTRL_PFC_R8A7779=y
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
# CONFIG_PINCTRL_PFC_R8A7793 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
CONFIG_PINCTRL_PFC_R8A77951=y
# CONFIG_PINCTRL_PFC_R8A77960 is not set
# CONFIG_PINCTRL_PFC_R8A77961 is not set
CONFIG_PINCTRL_PFC_R8A77965=y
CONFIG_PINCTRL_PFC_R8A77970=y
CONFIG_PINCTRL_PFC_R8A77980=y
CONFIG_PINCTRL_PFC_R8A77990=y
# CONFIG_PINCTRL_PFC_R8A77995 is not set
CONFIG_PINCTRL_PFC_R8A779A0=y
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
CONFIG_PINCTRL_PFC_R8A779G0=y
# CONFIG_PINCTRL_PFC_R8A779H0 is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
CONFIG_PINCTRL_PFC_SH7264=y
# CONFIG_PINCTRL_PFC_SH7269 is not set
# CONFIG_PINCTRL_PFC_SH73A0 is not set
CONFIG_PINCTRL_PFC_SH7720=y
# CONFIG_PINCTRL_PFC_SH7722 is not set
# CONFIG_PINCTRL_PFC_SH7723 is not set
CONFIG_PINCTRL_PFC_SH7724=y
# CONFIG_PINCTRL_PFC_SH7734 is not set
CONFIG_PINCTRL_PFC_SH7757=y
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
# CONFIG_PINCTRL_PFC_SHX3 is not set
# CONFIG_PINCTRL_RZA1 is not set
CONFIG_PINCTRL_RZA2=y
# CONFIG_PINCTRL_RZG2L is not set
CONFIG_PINCTRL_RZN1=y
# CONFIG_PINCTRL_RZV2M is not set
# end of Renesas pinctrl drivers

# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C64XX is not set
CONFIG_PINCTRL_SOPHGO_COMMON=y
CONFIG_PINCTRL_SOPHGO_CV18XX_OPS=y
CONFIG_PINCTRL_SOPHGO_CV1800B=y
CONFIG_PINCTRL_SOPHGO_CV1812H=y
CONFIG_PINCTRL_SOPHGO_SG2000=y
CONFIG_PINCTRL_SOPHGO_SG2002=y
CONFIG_PINCTRL_SOPHGO_SG2042_OPS=y
# CONFIG_PINCTRL_SOPHGO_SG2042 is not set
CONFIG_PINCTRL_SOPHGO_SG2044=m
# CONFIG_PINCTRL_SPACEMIT_K1 is not set
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
# CONFIG_PINCTRL_STARFIVE_JH7100 is not set
CONFIG_PINCTRL_STARFIVE_JH7110=y
CONFIG_PINCTRL_STARFIVE_JH7110_SYS=m
CONFIG_PINCTRL_STARFIVE_JH7110_AON=y
CONFIG_PINCTRL_STM32=y
CONFIG_PINCTRL_STM32F429=y
# CONFIG_PINCTRL_STM32F469 is not set
CONFIG_PINCTRL_STM32F746=y
CONFIG_PINCTRL_STM32F769=y
CONFIG_PINCTRL_STM32H743=y
# CONFIG_PINCTRL_STM32MP135 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
CONFIG_PINCTRL_STM32MP257=y
# CONFIG_PINCTRL_STM32_HDP is not set
CONFIG_PINCTRL_TI_IODELAY=m
CONFIG_PINCTRL_UNIPHIER=y
CONFIG_PINCTRL_UNIPHIER_LD4=y
CONFIG_PINCTRL_UNIPHIER_PRO4=y
CONFIG_PINCTRL_UNIPHIER_SLD8=y
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
CONFIG_PINCTRL_UNIPHIER_LD6B=y
CONFIG_PINCTRL_UNIPHIER_LD11=y
CONFIG_PINCTRL_UNIPHIER_LD20=y
CONFIG_PINCTRL_UNIPHIER_PXS3=y
CONFIG_PINCTRL_UNIPHIER_NX1=y
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB_LEGACY=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_GPIO_SHARED=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_74XX_MMIO is not set
CONFIG_GPIO_ALTERA=y
CONFIG_GPIO_ASPEED=m
# CONFIG_GPIO_ASPEED_SGPIO is not set
# CONFIG_GPIO_ATH79 is not set
CONFIG_GPIO_RASPBERRYPI_EXP=m
# CONFIG_GPIO_BCM_KONA is not set
CONFIG_GPIO_BCM_XGS_IPROC=m
CONFIG_GPIO_BLZP1600=y
CONFIG_GPIO_BRCMSTB=y
CONFIG_GPIO_CADENCE=m
CONFIG_GPIO_CLPS711X=y
CONFIG_GPIO_DAVINCI=m
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EIC_SPRD is not set
# CONFIG_GPIO_EM is not set
CONFIG_GPIO_EP93XX=y
# CONFIG_GPIO_GE_FPGA is not set
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=m
CONFIG_GPIO_GRANITERAPIDS=m
CONFIG_GPIO_GRGPIO=m
# CONFIG_GPIO_HISI is not set
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_ICH is not set
CONFIG_GPIO_IMX_SCU=y
CONFIG_GPIO_IXP4XX=y
CONFIG_GPIO_LOGICVC=y
CONFIG_GPIO_LOONGSON_64BIT=y
# CONFIG_GPIO_LPC18XX is not set
CONFIG_GPIO_LPC32XX=y
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MPC8XXX is not set
CONFIG_GPIO_MT7621=y
# CONFIG_GPIO_MVEBU is not set
CONFIG_GPIO_MXC=y
# CONFIG_GPIO_MXS is not set
CONFIG_GPIO_NOMADIK=y
# CONFIG_GPIO_NPCM_SGPIO is not set
# CONFIG_GPIO_OMAP is not set
# CONFIG_GPIO_PL061 is not set
CONFIG_GPIO_POLARFIRE_SOC=y
CONFIG_GPIO_PXA=y
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_RDA is not set
CONFIG_GPIO_ROCKCHIP=y
# CONFIG_GPIO_RTD is not set
# CONFIG_GPIO_SAMA5D2_PIOBU is not set
CONFIG_GPIO_SIFIVE=m
CONFIG_GPIO_SIOX=m
CONFIG_GPIO_SNPS_CREG=y
# CONFIG_GPIO_SPACEMIT_K1 is not set
CONFIG_GPIO_SPRD=m
# CONFIG_GPIO_STP_XWAY is not set
# CONFIG_GPIO_SYSCON is not set
# CONFIG_GPIO_TB10X is not set
CONFIG_GPIO_TEGRA=y
# CONFIG_GPIO_TEGRA186 is not set
CONFIG_GPIO_TS4800=m
CONFIG_GPIO_UNIPHIER=y
CONFIG_GPIO_VF610=y
CONFIG_GPIO_VISCONTI=m
# CONFIG_GPIO_XGENE_SB is not set
# CONFIG_GPIO_XILINX is not set
CONFIG_GPIO_XLP=y
# CONFIG_GPIO_ZEVIO is not set
CONFIG_GPIO_ZYNQ=m
CONFIG_GPIO_ZYNQMP_MODEPIN=m
CONFIG_GPIO_LOONGSON1=m
CONFIG_GPIO_AMD_FCH=m
# CONFIG_GPIO_MSC313 is not set
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_FXL6408=y
# CONFIG_GPIO_DS4520 is not set
CONFIG_GPIO_GW_PLD=y
CONFIG_GPIO_MAX7300=m
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
CONFIG_GPIO_PCA9570=y
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_ADP5585 is not set
CONFIG_GPIO_ARIZONA=m
CONFIG_GPIO_CRYSTAL_COVE=m
CONFIG_GPIO_DLN2=m
CONFIG_HTC_EGPIO=y
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP873X=m
CONFIG_GPIO_LP87565=y
# CONFIG_GPIO_MADERA is not set
# CONFIG_GPIO_MAX7360 is not set
# CONFIG_GPIO_MAX77620 is not set
CONFIG_GPIO_MAX77650=m
CONFIG_GPIO_MAX77759=m
CONFIG_GPIO_NCT6694=y
CONFIG_GPIO_PALMAS=m
CONFIG_GPIO_PMIC_EIC_SPRD=y
CONFIG_GPIO_QIXIS_FPGA=m
CONFIG_GPIO_RC5T583=y
CONFIG_GPIO_SL28CPLD=y
CONFIG_GPIO_TC3589X=y
CONFIG_GPIO_TN48M_CPLD=y
CONFIG_GPIO_TPS65086=m
CONFIG_GPIO_TPS65219=m
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TWL4030 is not set
CONFIG_GPIO_TWL6040=y
CONFIG_GPIO_WM8350=y
CONFIG_GPIO_WM8994=m
# end of MFD GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=m
# CONFIG_GPIO_MPSSE is not set
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
# CONFIG_GPIO_LATCH is not set
# CONFIG_GPIO_MOCKUP is not set
CONFIG_GPIO_VIRTIO=m
# CONFIG_GPIO_SIM is not set
CONFIG_GPIO_SHARED_PROXY=y
# end of Virtual GPIO drivers

#
# GPIO Debugging utilities
#
CONFIG_GPIO_VIRTUSER=m
# end of GPIO Debugging utilities

CONFIG_DEV_SYNC_PROBE=y
CONFIG_W1=y
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_AMD_AXI=m
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=m
CONFIG_W1_MASTER_MXC=y
CONFIG_W1_MASTER_GPIO=y
# CONFIG_HDQ_MASTER_OMAP is not set
CONFIG_W1_MASTER_SGI=y
CONFIG_W1_MASTER_UART=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=m
# CONFIG_W1_SLAVE_DS2406 is not set
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=y
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=m
# CONFIG_W1_SLAVE_DS2781 is not set
# CONFIG_W1_SLAVE_DS28E04 is not set
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_AS3722 is not set
# CONFIG_POWER_RESET_ATC260X is not set
CONFIG_POWER_RESET_BRCMKONA=y
CONFIG_POWER_RESET_BRCMSTB=y
CONFIG_POWER_RESET_EP93XX=y
CONFIG_POWER_RESET_GEMINI_POWEROFF=y
CONFIG_POWER_RESET_GPIO=y
# CONFIG_POWER_RESET_GPIO_RESTART is not set
CONFIG_POWER_RESET_LINKSTATION=m
# CONFIG_POWER_RESET_OCELOT_RESET is not set
CONFIG_POWER_RESET_ODROID_GO_ULTRA_POWEROFF=y
# CONFIG_POWER_RESET_LTC2952 is not set
# CONFIG_POWER_RESET_REGULATOR is not set
CONFIG_POWER_RESET_RESTART=y
CONFIG_POWER_RESET_TORADEX_EC=y
# CONFIG_POWER_RESET_TPS65086 is not set
CONFIG_POWER_RESET_VERSATILE=y
CONFIG_POWER_RESET_KEYSTONE=y
# CONFIG_POWER_RESET_SPACEMIT_P1 is not set
CONFIG_POWER_RESET_SYSCON=y
# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
# CONFIG_POWER_RESET_RMOBILE is not set
CONFIG_REBOOT_MODE=m
CONFIG_SYSCON_REBOOT_MODE=m
# CONFIG_POWER_RESET_SC27XX is not set
CONFIG_NVMEM_REBOOT_MODE=m
CONFIG_POWER_SEQUENCING=y
CONFIG_POWER_SEQUENCING_QCOM_WCN=y
CONFIG_POWER_SEQUENCING_TH1520_GPU=m
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
CONFIG_GENERIC_ADC_BATTERY=y
CONFIG_IP5XXX_POWER=y
CONFIG_MAX8925_POWER=y
CONFIG_WM8350_POWER=m
CONFIG_TEST_POWER=m
CONFIG_CHARGER_ADP5061=m
# CONFIG_BATTERY_ACT8945A is not set
CONFIG_BATTERY_CHAGALL=m
CONFIG_BATTERY_CW2015=y
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=m
# CONFIG_BATTERY_DS2781 is not set
CONFIG_BATTERY_DS2782=m
CONFIG_BATTERY_LEGO_EV3=m
CONFIG_BATTERY_LENOVO_YOGA_C630=m
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=y
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=m
# CONFIG_BATTERY_BQ27XXX_I2C is not set
CONFIG_BATTERY_BQ27XXX_HDQ=m
CONFIG_CHARGER_AXP20X=m
CONFIG_BATTERY_AXP20X=m
CONFIG_AXP20X_POWER=m
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1720X is not set
# CONFIG_BATTERY_MAX1721X is not set
# CONFIG_BATTERY_TWL4030_MADC is not set
CONFIG_CHARGER_PF1550=m
CONFIG_BATTERY_RX51=m
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_TWL4030=m
CONFIG_CHARGER_TWL6030=m
CONFIG_CHARGER_LP8727=m
# CONFIG_CHARGER_GPIO is not set
CONFIG_CHARGER_MANAGER=m
CONFIG_CHARGER_LT3651=y
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=m
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
CONFIG_CHARGER_MAX77650=m
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_MAX77976=m
CONFIG_CHARGER_MAX8971=m
CONFIG_CHARGER_MP2629=m
# CONFIG_CHARGER_MT6360 is not set
CONFIG_CHARGER_QCOM_SMBB=y
# CONFIG_BATTERY_PM8916_BMS_VM is not set
CONFIG_CHARGER_PM8916_LBC=y
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=y
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
CONFIG_CHARGER_BQ2515X=y
# CONFIG_CHARGER_BQ257XX is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_BQ25980=y
CONFIG_CHARGER_BQ256XX=y
# CONFIG_CHARGER_RK817 is not set
CONFIG_CHARGER_SMB347=m
CONFIG_CHARGER_TPS65090=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=m
# CONFIG_BATTERY_RT5033 is not set
CONFIG_CHARGER_RT9455=y
# CONFIG_CHARGER_RT9467 is not set
# CONFIG_CHARGER_RT9471 is not set
CONFIG_CHARGER_RT9756=y
CONFIG_CHARGER_SC2731=y
CONFIG_FUEL_GAUGE_SC27XX=m
# CONFIG_FUEL_GAUGE_STC3117 is not set
CONFIG_CHARGER_UCS1002=m
CONFIG_CHARGER_BD99954=m
# CONFIG_RN5T618_POWER is not set
CONFIG_BATTERY_ACER_A500=m
# CONFIG_BATTERY_UG3105 is not set
# CONFIG_CHARGER_QCOM_SMB2 is not set
CONFIG_FUEL_GAUGE_MM8013=y
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
# CONFIG_SENSORS_ABITUGURU is not set
CONFIG_SENSORS_ABITUGURU3=m
CONFIG_SENSORS_SMPRO=m
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
# CONFIG_SENSORS_ADM1029 is not set
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_AHT10=m
CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=m
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_ASUS_ROG_RYUJIN=m
CONFIG_SENSORS_AXI_FAN_CONTROL=m
CONFIG_SENSORS_ARM_SCMI=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
# CONFIG_SENSORS_ASPEED_G6 is not set
# CONFIG_SENSORS_ATXP1 is not set
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_CHIPCAP2 is not set
CONFIG_SENSORS_CORSAIR_CPRO=m
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DRIVETEMP=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_SPARX5=m
CONFIG_SENSORS_F71805F=m
# CONFIG_SENSORS_F71882FG is not set
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_GSC=m
CONFIG_SENSORS_MC13783_ADC=m
CONFIG_SENSORS_FSCHMD=m
CONFIG_SENSORS_FTSTEUTATES=m
CONFIG_SENSORS_GIGABYTE_WATERFORCE=m
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
CONFIG_SENSORS_GPIO_FAN=m
CONFIG_SENSORS_GXP_FAN_CTRL=m
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_HS3001=m
# CONFIG_SENSORS_HTU31 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_IIO_HWMON is not set
CONFIG_SENSORS_ISL28022=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWERZ is not set
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LAN966X=m
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LOCHNAGAR is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
CONFIG_SENSORS_LTC2990=m
CONFIG_SENSORS_LTC2991=m
CONFIG_SENSORS_LTC2992=m
# CONFIG_SENSORS_LTC4151 is not set
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
# CONFIG_SENSORS_LTC4245 is not set
# CONFIG_SENSORS_LTC4260 is not set
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_LTC4282=m
CONFIG_SENSORS_MAX127=m
CONFIG_SENSORS_MAX16065=m
# CONFIG_SENSORS_MAX1619 is not set
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31730=m
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_MAX31827 is not set
CONFIG_SENSORS_MAX6620=m
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6650=m
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MC34VR500=m
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_TC654 is not set
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MR75203=m
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=m
# CONFIG_SENSORS_LM77 is not set
# CONFIG_SENSORS_LM78 is not set
CONFIG_SENSORS_LM80=m
# CONFIG_SENSORS_LM83 is not set
# CONFIG_SENSORS_LM85 is not set
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
# CONFIG_SENSORS_LM95241 is not set
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6694=m
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775_I2C=m
# CONFIG_SENSORS_NCT7363 is not set
# CONFIG_SENSORS_NCT7802 is not set
CONFIG_SENSORS_NCT7904=m
CONFIG_SENSORS_NPCM7XX=m
CONFIG_SENSORS_NSA320=m
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
CONFIG_SENSORS_NZXT_KRAKEN3=m
CONFIG_SENSORS_NZXT_SMART2=m
CONFIG_SENSORS_OCC_P8_I2C=m
CONFIG_SENSORS_OCC=m
CONFIG_SENSORS_PCF8591=m
# CONFIG_PMBUS is not set
# CONFIG_SENSORS_PT5161L is not set
# CONFIG_SENSORS_PWM_FAN is not set
CONFIG_SENSORS_RASPBERRYPI_HWMON=m
CONFIG_SENSORS_SA67MCU=m
CONFIG_SENSORS_SL28CPLD=m
CONFIG_SENSORS_SBTSI=m
# CONFIG_SENSORS_SHT15 is not set
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
CONFIG_SENSORS_SHT4x=m
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC2305=m
CONFIG_SENSORS_EMC6W201=m
# CONFIG_SENSORS_SMSC47M1 is not set
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SFCTEMP=m
CONFIG_SENSORS_SG2042_MCU=m
CONFIG_SENSORS_ADC128D818=m
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
CONFIG_SENSORS_INA238=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_SPD5118 is not set
CONFIG_SENSORS_TC74=m
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
CONFIG_SENSORS_TMP401=m
# CONFIG_SENSORS_TMP421 is not set
CONFIG_SENSORS_TMP464=m
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_TSC1641=m
# CONFIG_SENSORS_VEXPRESS is not set
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
# CONFIG_SENSORS_W83L785TS is not set
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
CONFIG_SENSORS_WM8350=m
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_DEBUGFS=y
# CONFIG_THERMAL_CORE_TESTING is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_OF is not set
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
CONFIG_THERMAL_GOV_FAIR_SHARE=y
# CONFIG_THERMAL_GOV_STEP_WISE is not set
# CONFIG_THERMAL_GOV_BANG_BANG is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
CONFIG_DEVFREQ_THERMAL=y
# CONFIG_THERMAL_EMULATION is not set
CONFIG_THERMAL_MMIO=y
CONFIG_HISI_THERMAL=y
CONFIG_IMX_THERMAL=m
CONFIG_IMX_SC_THERMAL=y
CONFIG_IMX8MM_THERMAL=m
CONFIG_IMX91_THERMAL=y
# CONFIG_K3_THERMAL is not set
# CONFIG_MAX77620_THERMAL is not set
CONFIG_AIROHA_THERMAL=y
CONFIG_SPEAR_THERMAL=m
# CONFIG_SUN8I_THERMAL is not set
CONFIG_ROCKCHIP_THERMAL=y
CONFIG_KIRKWOOD_THERMAL=m
CONFIG_DOVE_THERMAL=y
CONFIG_ARMADA_THERMAL=m
CONFIG_DA9062_THERMAL=y

#
# Mediatek thermal drivers
#
# end of Mediatek thermal drivers

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
# CONFIG_BRCMSTB_THERMAL is not set
CONFIG_BCM_NS_THERMAL=m
CONFIG_BCM_SR_THERMAL=y
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=m
CONFIG_TI_THERMAL=y
# CONFIG_OMAP3_THERMAL is not set
# CONFIG_OMAP4_THERMAL is not set
# CONFIG_OMAP5_THERMAL is not set
CONFIG_DRA752_THERMAL=y
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# end of Samsung thermal drivers

CONFIG_RCAR_THERMAL=y
# CONFIG_RCAR_GEN3_THERMAL is not set
# CONFIG_RZG2L_THERMAL is not set
CONFIG_RZG3E_THERMAL=y
CONFIG_RZG3S_THERMAL=m

#
# NVIDIA Tegra thermal drivers
#
# CONFIG_TEGRA_SOCTHERM is not set
# CONFIG_TEGRA_BPMP_THERMAL is not set
CONFIG_TEGRA30_TSENSOR=m
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m

#
# Qualcomm thermal drivers
#
CONFIG_QCOM_SPMI_ADC_TM5=m
CONFIG_QCOM_SPMI_TEMP_ALARM=m
CONFIG_QCOM_LMH=m
# end of Qualcomm thermal drivers

# CONFIG_SPRD_THERMAL is not set
CONFIG_KHADAS_MCU_FAN_THERMAL=m
CONFIG_LOONGSON2_THERMAL=y
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_BD957XMUF_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=y
CONFIG_DA9063_WATCHDOG=y
CONFIG_DA9062_WATCHDOG=y
CONFIG_GPIO_WATCHDOG=m
# CONFIG_LENOVO_SE10_WDT is not set
CONFIG_LENOVO_SE30_WDT=m
# CONFIG_MENF21BMC_WATCHDOG is not set
CONFIG_WM8350_WATCHDOG=m
# CONFIG_XILINX_WATCHDOG is not set
CONFIG_XILINX_WINDOW_WATCHDOG=m
CONFIG_ZIIRAVE_WATCHDOG=m
CONFIG_MLX_WDT=y
# CONFIG_SL28CPLD_WATCHDOG is not set
# CONFIG_AIROHA_WATCHDOG is not set
# CONFIG_ARM_SP805_WATCHDOG is not set
CONFIG_ARMADA_37XX_WATCHDOG=y
CONFIG_ASM9260_WATCHDOG=m
# CONFIG_AT91RM9200_WATCHDOG is not set
CONFIG_AT91SAM9X_WATCHDOG=y
CONFIG_SAMA5D4_WATCHDOG=y
CONFIG_CADENCE_WATCHDOG=m
CONFIG_977_WATCHDOG=y
CONFIG_FTWDT010_WATCHDOG=m
# CONFIG_IXP4XX_WATCHDOG is not set
CONFIG_S3C2410_WATCHDOG=m
# CONFIG_SA1100_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
CONFIG_EP93XX_WATCHDOG=y
# CONFIG_OMAP_WATCHDOG is not set
CONFIG_PNX4008_WATCHDOG=y
CONFIG_DAVINCI_WATCHDOG=y
CONFIG_K3_RTI_WATCHDOG=m
CONFIG_ORION_WATCHDOG=m
# CONFIG_RN5T618_WATCHDOG is not set
CONFIG_SUNXI_WATCHDOG=y
CONFIG_NPCM7XX_WATCHDOG=m
CONFIG_TWL4030_WATCHDOG=m
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
# CONFIG_TS4800_WATCHDOG is not set
# CONFIG_TS72XX_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=m
CONFIG_MAX77620_WATCHDOG=y
CONFIG_NCT6694_WATCHDOG=m
CONFIG_IMX2_WDT=m
# CONFIG_IMX7ULP_WDT is not set
CONFIG_S32G_WDT=m
CONFIG_RETU_WATCHDOG=m
# CONFIG_MOXART_WDT is not set
CONFIG_ST_LPC_WATCHDOG=y
CONFIG_TEGRA_WATCHDOG=m
# CONFIG_QCOM_WDT is not set
CONFIG_MESON_GXBB_WATCHDOG=y
CONFIG_MESON_WATCHDOG=y
# CONFIG_MEDIATEK_WATCHDOG is not set
CONFIG_DIGICOLOR_WATCHDOG=m
CONFIG_LPC18XX_WATCHDOG=y
CONFIG_RENESAS_WDT=m
# CONFIG_RENESAS_WWDT is not set
CONFIG_RENESAS_RZAWDT=y
# CONFIG_RENESAS_RZN1WDT is not set
# CONFIG_RENESAS_RZG2LWDT is not set
CONFIG_RENESAS_RZV2HWDT=m
CONFIG_ASPEED_WATCHDOG=m
CONFIG_STM32_WATCHDOG=m
# CONFIG_UNIPHIER_WATCHDOG is not set
# CONFIG_RTD119X_WATCHDOG is not set
CONFIG_REALTEK_OTTO_WDT=y
CONFIG_SPRD_WATCHDOG=y
# CONFIG_PM8916_WATCHDOG is not set
CONFIG_VISCONTI_WATCHDOG=y
CONFIG_MSC313E_WATCHDOG=y
# CONFIG_APPLE_WATCHDOG is not set
CONFIG_SUNPLUS_WATCHDOG=m
CONFIG_ADVANTECH_WDT=y
# CONFIG_ADVANTECH_EC_WDT is not set
# CONFIG_EBC_C384_WDT is not set
CONFIG_EXAR_WDT=y
CONFIG_F71808E_WDT=y
# CONFIG_SC520_WDT is not set
CONFIG_SBC_FITPC2_WATCHDOG=y
CONFIG_EUROTECH_WDT=m
CONFIG_IB700_WDT=y
# CONFIG_IBMASR is not set
CONFIG_WAFER_WDT=y
CONFIG_IT8712F_WDT=m
# CONFIG_IT87_WDT is not set
CONFIG_KEMPLD_WDT=m
CONFIG_SC1200_WDT=y
CONFIG_PC87413_WDT=m
# CONFIG_60XX_WDT is not set
CONFIG_SMSC_SCH311X_WDT=y
# CONFIG_SMSC37B787_WDT is not set
CONFIG_TQMX86_WDT=m
# CONFIG_W83627HF_WDT is not set
# CONFIG_W83877F_WDT is not set
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
CONFIG_SBC_EPX_C3_WATCHDOG=m
CONFIG_NIC7018_WDT=y
# CONFIG_ATH79_WDT is not set
CONFIG_BCM47XX_WDT=m
CONFIG_JZ4740_WDT=m
CONFIG_BCM2835_WDT=y
CONFIG_BCM_KONA_WDT=m
CONFIG_BCM_KONA_WDT_DEBUG=y
# CONFIG_BCM7038_WDT is not set
CONFIG_IMGPDC_WDT=y
# CONFIG_LOONGSON1_WDT is not set
# CONFIG_GXP_WATCHDOG is not set
# CONFIG_MT7621_WDT is not set
# CONFIG_MPC5200_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_STARFIVE_WATCHDOG=m
# CONFIG_UML_WATCHDOG is not set

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=y
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ADP5585=y
# CONFIG_MFD_ALTERA_SYSMGR is not set
CONFIG_MFD_ACT8945A=m
CONFIG_MFD_SUN4I_GPADC=y
# CONFIG_MFD_AS3711 is not set
CONFIG_MFD_SMPRO=y
CONFIG_MFD_AS3722=y
# CONFIG_PMIC_ADP5520 is not set
CONFIG_MFD_AAT2870_CORE=y
CONFIG_MFD_AT91_USART=y
# CONFIG_MFD_ATMEL_FLEXCOM is not set
CONFIG_MFD_ATMEL_HLCDC=y
CONFIG_MFD_ATMEL_SMC=y
CONFIG_MFD_BCM590XX=m
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_CS40L50_CORE=y
CONFIG_MFD_CS40L50_I2C=y
CONFIG_MFD_CS42L43=m
CONFIG_MFD_CS42L43_I2C=m
CONFIG_MFD_LOCHNAGAR=y
CONFIG_MFD_MADERA=m
CONFIG_MFD_MADERA_I2C=m
# CONFIG_MFD_CS47L15 is not set
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
# CONFIG_MFD_CS47L92 is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=m
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
CONFIG_MFD_ENE_KB3930=y
CONFIG_MFD_EXYNOS_LPASS=m
CONFIG_MFD_GATEWORKS_GSC=m
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=m
CONFIG_MFD_MXS_LRADC=y
CONFIG_MFD_MX25_TSADC=y
CONFIG_MFD_PF1550=m
# CONFIG_MFD_HI6421_PMIC is not set
CONFIG_MFD_HI6421_SPMI=m
# CONFIG_MFD_HI655X_PMIC is not set
CONFIG_INTEL_SOC_PMIC=y
# CONFIG_MFD_IQS62X is not set
CONFIG_MFD_KEMPLD=m
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=m
# CONFIG_MFD_88PM860X is not set
CONFIG_MFD_88PM886_PMIC=y
CONFIG_MFD_MAX5970=m
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77541 is not set
CONFIG_MFD_MAX77620=m
CONFIG_MFD_MAX77650=y
# CONFIG_MFD_MAX77686 is not set
CONFIG_MFD_MAX77693=y
# CONFIG_MFD_MAX77705 is not set
# CONFIG_MFD_MAX77714 is not set
CONFIG_MFD_MAX77759=m
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=m
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=m
# CONFIG_MFD_MT6370 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_NCT6694=y
CONFIG_MFD_VIPERBOARD=m
# CONFIG_MFD_NTXEC is not set
CONFIG_MFD_RETU=y
CONFIG_MFD_PM8XXX=m
CONFIG_MFD_SPACEMIT_P1=m
CONFIG_MFD_SPMI_PMIC=m
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RT4831=m
# CONFIG_MFD_RT5033 is not set
CONFIG_MFD_RT5120=m
CONFIG_MFD_RC5T583=y
CONFIG_MFD_RK8XX=m
CONFIG_MFD_RK8XX_I2C=m
CONFIG_MFD_RN5T618=y
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SEC_ACPM=m
CONFIG_MFD_SEC_I2C=y
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=m
CONFIG_MFD_SL28CPLD=m
CONFIG_MFD_SM501=m
# CONFIG_MFD_SM501_GPIO is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_RZ_MTU3 is not set
CONFIG_ABX500_CORE=y
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_BQ257XX=y
CONFIG_MFD_OMAP_USB_HOST=y
CONFIG_MFD_PALMAS=m
CONFIG_TPS6105X=y
CONFIG_TPS65010=m
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
# CONFIG_MFD_TPS65217 is not set
CONFIG_MFD_TI_LP873X=m
CONFIG_MFD_TI_LP87565=y
# CONFIG_MFD_TPS65218 is not set
CONFIG_MFD_TPS65219=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_TPS6594=y
CONFIG_MFD_TPS6594_I2C=y
CONFIG_TWL4030_CORE=y
# CONFIG_TWL4030_POWER is not set
CONFIG_MFD_TWL4030_AUDIO=y
CONFIG_TWL6040_CORE=y
CONFIG_MFD_LM3533=m
CONFIG_MFD_TC3589X=y
CONFIG_MFD_TQMX86=m
CONFIG_MFD_ARIZONA=m
CONFIG_MFD_ARIZONA_I2C=m
# CONFIG_MFD_CS47L24 is not set
# CONFIG_MFD_WM5102 is not set
CONFIG_MFD_WM5110=y
CONFIG_MFD_WM8997=y
# CONFIG_MFD_WM8998 is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=m
CONFIG_MFD_STW481X=m
CONFIG_MFD_ROHM_BD718XX=m
# CONFIG_MFD_ROHM_BD71828 is not set
CONFIG_MFD_ROHM_BD957XMUF=y
# CONFIG_MFD_ROHM_BD96801 is not set
CONFIG_MFD_STM32_LPTIMER=m
# CONFIG_MFD_STM32_TIMERS is not set
# CONFIG_MFD_STPMIC1 is not set
CONFIG_MFD_STMFX=y
# CONFIG_MFD_WCD934X is not set
CONFIG_MFD_ATC260X=m
CONFIG_MFD_ATC260X_I2C=m
CONFIG_MFD_KHADAS_MCU=m
CONFIG_MFD_ACER_A500_EC=m
CONFIG_MFD_QCOM_PM8008=m
# CONFIG_MFD_VEXPRESS_SYSREG is not set
# CONFIG_RAVE_SP_CORE is not set
# CONFIG_MFD_INTEL_M10_BMC_PMCI is not set
# CONFIG_MFD_QNAP_MCU is not set
# CONFIG_MFD_RSMU_I2C is not set
CONFIG_MFD_MAX7360=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_NETLINK_EVENTS=y
CONFIG_REGULATOR_88PG86X=y
CONFIG_REGULATOR_88PM886=y
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_ACT8945A=m
CONFIG_REGULATOR_AD5398=y
CONFIG_REGULATOR_ADP5055=y
CONFIG_REGULATOR_ANATOP=m
CONFIG_REGULATOR_AAT2870=m
CONFIG_REGULATOR_ARIZONA_LDO1=m
CONFIG_REGULATOR_ARIZONA_MICSUPP=m
CONFIG_REGULATOR_ARM_SCMI=m
CONFIG_REGULATOR_AS3722=y
# CONFIG_REGULATOR_ATC260X is not set
# CONFIG_REGULATOR_AW37503 is not set
CONFIG_REGULATOR_AXP20X=m
# CONFIG_REGULATOR_BCM590XX is not set
CONFIG_REGULATOR_BD718XX=m
CONFIG_REGULATOR_BD957XMUF=y
# CONFIG_REGULATOR_BQ257XX is not set
# CONFIG_REGULATOR_DA9062 is not set
# CONFIG_REGULATOR_DA9063 is not set
CONFIG_REGULATOR_DA9121=y
CONFIG_REGULATOR_DA9210=m
# CONFIG_REGULATOR_DA9211 is not set
# CONFIG_REGULATOR_FAN53555 is not set
CONFIG_REGULATOR_FAN53880=m
CONFIG_REGULATOR_GPIO=m
CONFIG_REGULATOR_HI6421V600=m
CONFIG_REGULATOR_ISL9305=y
CONFIG_REGULATOR_ISL6271A=m
# CONFIG_REGULATOR_FP9931 is not set
# CONFIG_REGULATOR_LM363X is not set
# CONFIG_REGULATOR_LOCHNAGAR is not set
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP873X=m
CONFIG_REGULATOR_LP8755=y
# CONFIG_REGULATOR_LP87565 is not set
CONFIG_REGULATOR_LTC3589=m
CONFIG_REGULATOR_LTC3676=y
CONFIG_REGULATOR_MAX14577=m
# CONFIG_REGULATOR_MAX1586 is not set
# CONFIG_REGULATOR_MAX5970 is not set
CONFIG_REGULATOR_MAX77503=m
CONFIG_REGULATOR_MAX77620=y
CONFIG_REGULATOR_MAX77650=y
CONFIG_REGULATOR_MAX77857=y
# CONFIG_REGULATOR_MAX8649 is not set
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=y
# CONFIG_REGULATOR_MAX8907 is not set
CONFIG_REGULATOR_MAX8925=y
CONFIG_REGULATOR_MAX8952=m
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX20411=m
CONFIG_REGULATOR_MAX77686=m
# CONFIG_REGULATOR_MAX77693 is not set
# CONFIG_REGULATOR_MAX77802 is not set
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MAX77838=m
CONFIG_REGULATOR_MC13XXX_CORE=m
# CONFIG_REGULATOR_MC13783 is not set
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MCP16502 is not set
CONFIG_REGULATOR_MP5416=m
# CONFIG_REGULATOR_MP8859 is not set
CONFIG_REGULATOR_MP886X=y
# CONFIG_REGULATOR_MPQ7920 is not set
CONFIG_REGULATOR_MT6311=m
CONFIG_REGULATOR_MT6315=m
# CONFIG_REGULATOR_MT6316 is not set
CONFIG_REGULATOR_MT6360=m
CONFIG_REGULATOR_MT6363=m
# CONFIG_REGULATOR_MT6380 is not set
# CONFIG_REGULATOR_PALMAS is not set
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCA9450=m
CONFIG_REGULATOR_PF9453=m
CONFIG_REGULATOR_PF0900=m
CONFIG_REGULATOR_PF530X=y
CONFIG_REGULATOR_PF8X00=y
CONFIG_REGULATOR_PFUZE100=y
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_PF1550 is not set
CONFIG_REGULATOR_PWM=m
CONFIG_REGULATOR_QCOM_PM8008=m
# CONFIG_REGULATOR_QCOM_REFGEN is not set
CONFIG_REGULATOR_QCOM_RPMH=m
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
# CONFIG_REGULATOR_RAA215300 is not set
# CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY is not set
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2=y
CONFIG_REGULATOR_RC5T583=y
CONFIG_REGULATOR_RK808=m
CONFIG_REGULATOR_RN5T618=m
CONFIG_REGULATOR_ROHM=m
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4803=y
# CONFIG_REGULATOR_RT4831 is not set
CONFIG_REGULATOR_RT5120=m
CONFIG_REGULATOR_RT5133=y
CONFIG_REGULATOR_RT5190A=m
CONFIG_REGULATOR_RT5739=m
# CONFIG_REGULATOR_RT5759 is not set
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6190=y
# CONFIG_REGULATOR_RT6245 is not set
# CONFIG_REGULATOR_RTQ2134 is not set
CONFIG_REGULATOR_RTMV20=y
# CONFIG_REGULATOR_RTQ6752 is not set
CONFIG_REGULATOR_RTQ2208=y
CONFIG_REGULATOR_S2DOS05=y
# CONFIG_REGULATOR_S2MPA01 is not set
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=m
CONFIG_REGULATOR_SC2731=y
CONFIG_REGULATOR_SLG51000=y
# CONFIG_REGULATOR_SPACEMIT_P1 is not set
# CONFIG_REGULATOR_STM32_BOOSTER is not set
CONFIG_REGULATOR_STM32_VREFBUF=y
CONFIG_REGULATOR_STM32_PWR=y
CONFIG_REGULATOR_TI_ABB=m
# CONFIG_REGULATOR_STW481X_VMMC is not set
# CONFIG_REGULATOR_SUN20I is not set
CONFIG_REGULATOR_SY8106A=y
# CONFIG_REGULATOR_SY8824X is not set
CONFIG_REGULATOR_SY8827N=y
CONFIG_REGULATOR_TPS51632=y
CONFIG_REGULATOR_TPS6105X=y
# CONFIG_REGULATOR_TPS62360 is not set
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS6287X=y
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=m
# CONFIG_REGULATOR_TPS65086 is not set
CONFIG_REGULATOR_TPS65090=y
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65219=y
CONFIG_REGULATOR_TPS6594=y
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TPS68470=m
CONFIG_REGULATOR_TWL4030=m
CONFIG_REGULATOR_UNIPHIER=m
# CONFIG_REGULATOR_RZG2L_VBCTRL is not set
# CONFIG_REGULATOR_VCTRL is not set
CONFIG_REGULATOR_VEXPRESS=m
CONFIG_REGULATOR_WM8350=m
CONFIG_REGULATOR_WM8994=m
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
CONFIG_BPF_LIRC_MODE2=y
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
# CONFIG_IR_IMON_DECODER is not set
# CONFIG_IR_JVC_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_NEC_DECODER is not set
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_RCMM_DECODER=m
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=y
# CONFIG_IR_GPIO_CIR is not set
CONFIG_IR_GPIO_TX=m
CONFIG_IR_HIX5HD2=m
CONFIG_IR_IGORPLUGUSB=y
CONFIG_IR_IGUANA=y
# CONFIG_IR_IMON is not set
CONFIG_IR_IMON_RAW=m
CONFIG_IR_ITE_CIR=y
CONFIG_IR_MCEUSB=m
# CONFIG_IR_MESON is not set
# CONFIG_IR_MESON_TX is not set
CONFIG_IR_MTK=m
CONFIG_IR_NUVOTON=y
# CONFIG_IR_REDRAT3 is not set
# CONFIG_IR_SERIAL is not set
CONFIG_IR_STREAMZAP=y
# CONFIG_IR_SUNXI is not set
CONFIG_IR_TOY=y
# CONFIG_IR_TTUSBIR is not set
CONFIG_IR_WINBOND_CIR=y
CONFIG_RC_ATI_REMOTE=y
# CONFIG_RC_LOOPBACK is not set
CONFIG_RC_ST=m
CONFIG_RC_XBOX_DVD=m
CONFIG_IR_IMG=y
# CONFIG_IR_IMG_RAW is not set
CONFIG_IR_IMG_HW=y
CONFIG_IR_IMG_NEC=y
CONFIG_IR_IMG_JVC=y
CONFIG_IR_IMG_SONY=y
# CONFIG_IR_IMG_SHARP is not set
# CONFIG_IR_IMG_SANYO is not set
# CONFIG_IR_IMG_RC5 is not set
CONFIG_IR_IMG_RC6=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO=y
CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_HD44780_COMMON=y
CONFIG_HD44780=y
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=m
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
CONFIG_PANEL_CHANGE_MESSAGE=y
CONFIG_PANEL_BOOT_MESSAGE=""
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
# CONFIG_KS0108 is not set
CONFIG_LINEDISP=y
CONFIG_IMG_ASCII_LCD=m
CONFIG_HT16K33=m
CONFIG_MAX6959=m
CONFIG_SEG_LED_GPIO=y
CONFIG_PANEL=m
CONFIG_TEGRA_HOST1X_CONTEXT_BUS=y
CONFIG_TEGRA_HOST1X=m
CONFIG_TEGRA_HOST1X_FIREWALL=y
CONFIG_IMX_IPUV3_CORE=y
# CONFIG_DRM is not set

#
# Frame buffer Devices
#
CONFIG_FB=m
# CONFIG_FB_ARC is not set
# CONFIG_FB_UVESA is not set
# CONFIG_FB_PVR2 is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
CONFIG_FB_ATMEL=m
CONFIG_FB_PXA168=m
CONFIG_FB_SH_MOBILE_LCDC=m
# CONFIG_FB_S3C is not set
CONFIG_FB_SM501=m
CONFIG_FB_SMSCUFX=m
CONFIG_FB_UDL=m
CONFIG_FB_IBM_GXT4500=m
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_VIRTUAL=m
CONFIG_FB_METRONOME=m
CONFIG_FB_BROADSHEET=m
CONFIG_FB_SIMPLE=m
CONFIG_FB_SSD1307=m
# CONFIG_FB_OMAP is not set
CONFIG_FB_OMAP2=m
CONFIG_FB_OMAP2_DEBUG_SUPPORT=y
CONFIG_FB_OMAP2_NUM_FBS=3
CONFIG_FB_OMAP2_DSS_INIT=y
CONFIG_FB_OMAP2_DSS=m
CONFIG_FB_OMAP2_DSS_DEBUG=y
CONFIG_FB_OMAP2_DSS_DEBUGFS=y
# CONFIG_FB_OMAP2_DSS_COLLECT_IRQ_STATS is not set
CONFIG_FB_OMAP2_DSS_DPI=y
# CONFIG_FB_OMAP2_DSS_VENC is not set
CONFIG_FB_OMAP2_DSS_HDMI_COMMON=y
CONFIG_FB_OMAP4_DSS_HDMI=y
# CONFIG_FB_OMAP5_DSS_HDMI is not set
CONFIG_FB_OMAP2_DSS_SDI=y
CONFIG_FB_OMAP2_DSS_DSI=y
CONFIG_FB_OMAP2_DSS_MIN_FCK_PER_PCK=0
CONFIG_FB_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=y

#
# OMAPFB Panel and Encoder Drivers
#
# CONFIG_FB_OMAP2_ENCODER_OPA362 is not set
CONFIG_FB_OMAP2_ENCODER_TFP410=m
# CONFIG_FB_OMAP2_ENCODER_TPD12S015 is not set
CONFIG_FB_OMAP2_CONNECTOR_DVI=m
# CONFIG_FB_OMAP2_CONNECTOR_HDMI is not set
# CONFIG_FB_OMAP2_CONNECTOR_ANALOG_TV is not set
# CONFIG_FB_OMAP2_PANEL_DPI is not set
CONFIG_FB_OMAP2_PANEL_DSI_CM=m
CONFIG_FB_OMAP2_PANEL_SHARP_LS037V7DW01=m
# end of OMAPFB Panel and Encoder Drivers

# CONFIG_MMP_DISP is not set
CONFIG_FB_CORE=m
CONFIG_FB_NOTIFY=y
CONFIG_FB_DEVICE=y
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
# CONFIG_FB_BIG_ENDIAN is not set
CONFIG_FB_LITTLE_ENDIAN=y
CONFIG_FB_SYSMEM_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_DMAMEM_HELPERS=y
CONFIG_FB_IOMEM_FOPS=m
CONFIG_FB_IOMEM_HELPERS=y
CONFIG_FB_SYSMEM_HELPERS=y
CONFIG_FB_SYSMEM_HELPERS_DEFERRED=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=m
CONFIG_BACKLIGHT_ATMEL_LCDC=y
CONFIG_BACKLIGHT_AW99706=m
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_KTD2801 is not set
# CONFIG_BACKLIGHT_KTZ8866 is not set
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_OMAP1=m
CONFIG_BACKLIGHT_PWM=m
# CONFIG_BACKLIGHT_MAX8925 is not set
CONFIG_BACKLIGHT_APPLE_DWI=m
CONFIG_BACKLIGHT_QCOM_WLED=m
CONFIG_BACKLIGHT_RT4831=m
# CONFIG_BACKLIGHT_ADP8860 is not set
CONFIG_BACKLIGHT_ADP8870=m
# CONFIG_BACKLIGHT_AAT2870 is not set
# CONFIG_BACKLIGHT_LM3509 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_MP3309C is not set
# CONFIG_BACKLIGHT_PANDORA is not set
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=m
CONFIG_BACKLIGHT_ARCXCNN=m
CONFIG_BACKLIGHT_LED=m
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=30
# CONFIG_FRAMEBUFFER_CONSOLE is not set
# end of Console display driver support

# CONFIG_LOGO is not set
# CONFIG_TRACE_GPU_MEM is not set
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=m
CONFIG_SND_HWDEP=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
# CONFIG_SND_VERBOSE_PROCFS is not set
CONFIG_SND_CTL_FAST_LOOKUP=y
CONFIG_SND_DEBUG=y
CONFIG_SND_DEBUG_VERBOSE=y
CONFIG_SND_CTL_INPUT_VALIDATION=y
CONFIG_SND_CTL_DEBUG=y
CONFIG_SND_JACK_INJECTION_DEBUG=y
CONFIG_SND_UTIMER=y
CONFIG_SND_VMASTER=y
CONFIG_SND_CTL_LED=m
# CONFIG_SND_SEQUENCER is not set
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
# CONFIG_SND_DRIVERS is not set

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_HWDEP=y
# CONFIG_SND_HDA_RECONFIG is not set
# CONFIG_SND_HDA_INPUT_BEEP is not set
# CONFIG_SND_HDA_PATCH_LOADER is not set
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
CONFIG_SND_HDA_PREALLOC_SIZE=64
# CONFIG_SND_HDA_CIX_IPBLOQ is not set
CONFIG_SND_HDA_GENERIC_LEDS=y
CONFIG_SND_HDA_CODEC_ANALOG=m
# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
CONFIG_SND_HDA_CODEC_VIA=m
CONFIG_SND_HDA_CODEC_CONEXANT=m
CONFIG_SND_HDA_CODEC_SENARYTECH=m
# CONFIG_SND_HDA_CODEC_CA0110 is not set
CONFIG_SND_HDA_CODEC_CA0132=m
# CONFIG_SND_HDA_CODEC_CA0132_DSP is not set
# CONFIG_SND_HDA_CODEC_CMEDIA is not set
CONFIG_SND_HDA_CODEC_CM9825=m
# CONFIG_SND_HDA_CODEC_SI3054 is not set
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
CONFIG_SND_HDA_CODEC_ALC260=m
CONFIG_SND_HDA_CODEC_ALC262=m
CONFIG_SND_HDA_CODEC_ALC268=m
CONFIG_SND_HDA_CODEC_ALC269=m
CONFIG_SND_HDA_CODEC_ALC662=m
CONFIG_SND_HDA_CODEC_ALC680=m
CONFIG_SND_HDA_CODEC_ALC861=m
CONFIG_SND_HDA_CODEC_ALC861VD=m
CONFIG_SND_HDA_CODEC_ALC880=m
CONFIG_SND_HDA_CODEC_ALC882=m
CONFIG_SND_HDA_CODEC_CIRRUS=m
CONFIG_SND_HDA_CODEC_CS420X=m
CONFIG_SND_HDA_CODEC_CS421X=m
CONFIG_SND_HDA_CODEC_CS8409=m
# CONFIG_SND_HDA_CODEC_HDMI is not set
CONFIG_SND_HDA_SCODEC_COMPONENT=m
CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_EXT_CORE=m
# end of HD-Audio

# CONFIG_SND_ARM is not set
# CONFIG_SND_USB is not set
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=m
CONFIG_SND_DICE=m
CONFIG_SND_OXFW=m
CONFIG_SND_ISIGHT=m
# CONFIG_SND_FIREWORKS is not set
CONFIG_SND_BEBOB=m
CONFIG_SND_FIREWIRE_DIGI00X=m
CONFIG_SND_FIREWIRE_TASCAM=m
CONFIG_SND_FIREWIRE_MOTU=m
CONFIG_SND_FIREFACE=m
CONFIG_SND_PCMCIA=y
CONFIG_SND_VXPOCKET=m
# CONFIG_SND_PDAUDIOCF is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y

#
# Analog Devices
#
CONFIG_SND_SOC_ADI_AXI_I2S=m
# CONFIG_SND_SOC_ADI_AXI_SPDIF is not set
# end of Analog Devices

#
# AMD
#
CONFIG_SND_SOC_AMD_ACP=m
CONFIG_SND_SOC_AMD_CZ_RT5645_MACH=m
CONFIG_SND_AMD_ACP_CONFIG=m
# CONFIG_SND_SOC_AMD_ACP63_TOPLEVEL is not set
# end of AMD

#
# Apple
#
CONFIG_SND_SOC_APPLE_MCA=m
# end of Apple

#
# Atmel
#
CONFIG_SND_ATMEL_SOC_CLASSD=m
# CONFIG_SND_ATMEL_SOC_PDMIC is not set
CONFIG_SND_ATMEL_SOC_I2S=m
# CONFIG_SND_SOC_MIKROE_PROTO is not set
CONFIG_SND_MCHP_SOC_I2S_MCC=m
# CONFIG_SND_MCHP_SOC_SPDIFTX is not set
# CONFIG_SND_MCHP_SOC_SPDIFRX is not set
CONFIG_SND_MCHP_SOC_PDMC=m
# end of Atmel

#
# Au1x
#
# end of Au1x

#
# Broadcom
#
CONFIG_SND_BCM2835_SOC_I2S=m
CONFIG_SND_SOC_CYGNUS=m
# CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
# end of Broadcom

#
# Cirrus Logic
#
CONFIG_SND_EP93XX_SOC=m
# CONFIG_SND_EP93XX_SOC_I2S is not set
# end of Cirrus Logic

#
# DesignWare
#
CONFIG_SND_DESIGNWARE_I2S=m
# CONFIG_SND_DESIGNWARE_PCM is not set
# end of DesignWare

#
# Freescale
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
CONFIG_SND_SOC_FSL_SAI=m
# CONFIG_SND_SOC_FSL_MQS is not set
CONFIG_SND_SOC_FSL_AUDMIX=m
# CONFIG_SND_SOC_FSL_SSI is not set
CONFIG_SND_SOC_FSL_SPDIF=m
CONFIG_SND_SOC_FSL_ESAI=m
CONFIG_SND_SOC_FSL_MICFIL=m
# CONFIG_SND_SOC_FSL_XCVR is not set
CONFIG_SND_SOC_FSL_AUD2HTX=m
CONFIG_SND_SOC_FSL_UTILS=m
CONFIG_SND_SOC_FSL_RPMSG=m
# CONFIG_SND_SOC_FSL_LPC3XXX is not set
CONFIG_SND_SOC_IMX_AUDMUX=m
# CONFIG_SND_IMX_SOC is not set
# end of Freescale

#
# Google
#
CONFIG_SND_SOC_CHV3_I2S=m
# end of Google

#
# Hisilicon
#
# CONFIG_SND_I2S_HI6210_I2S is not set
# end of Hisilicon

#
# JZ4740
#
CONFIG_SND_JZ4740_SOC_I2S=m
# end of JZ4740

#
# Kirkwood
#
CONFIG_SND_KIRKWOOD_SOC=m
CONFIG_SND_KIRKWOOD_SOC_ARMADA370_DB=m
# end of Kirkwood

#
# Loongson
#
CONFIG_SND_SOC_LOONGSON_CARD=m
CONFIG_SND_SOC_LOONGSON_I2S_PLATFORM=m
# end of Loongson

#
# Imagination Technologies
#
# CONFIG_SND_SOC_IMG_I2S_IN is not set
# CONFIG_SND_SOC_IMG_I2S_OUT is not set
CONFIG_SND_SOC_IMG_PARALLEL_OUT=m
CONFIG_SND_SOC_IMG_SPDIF_IN=m
# CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=m
# end of Imagination Technologies

#
# Intel
#
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SOC_INTEL_KEEMBAY=m
CONFIG_SND_SOC_INTEL_MACH=y
# CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES is not set
# end of Intel

#
# Mediatek
#
CONFIG_SND_SOC_MEDIATEK=m
CONFIG_SND_SOC_MT8186=m
CONFIG_SND_SOC_MT8186_MT6366=m
CONFIG_SND_SOC_MTK_BTCVSD=m
# CONFIG_SND_SOC_MT8188 is not set
CONFIG_SND_SOC_MT8195=m
CONFIG_SND_SOC_MT8195_MT6359=m
# CONFIG_SND_SOC_MT8365 is not set
# end of Mediatek

#
# Amlogic
#
CONFIG_SND_MESON_AIU=m
CONFIG_SND_MESON_AXG_FIFO=m
CONFIG_SND_MESON_AXG_FRDDR=m
CONFIG_SND_MESON_AXG_TODDR=m
CONFIG_SND_MESON_AXG_TDM_FORMATTER=m
CONFIG_SND_MESON_AXG_TDM_INTERFACE=m
CONFIG_SND_MESON_AXG_TDMIN=m
CONFIG_SND_MESON_AXG_TDMOUT=m
CONFIG_SND_MESON_AXG_SOUND_CARD=m
CONFIG_SND_MESON_AXG_SPDIFOUT=m
CONFIG_SND_MESON_AXG_SPDIFIN=m
# CONFIG_SND_MESON_AXG_PDM is not set
CONFIG_SND_MESON_CARD_UTILS=m
CONFIG_SND_MESON_CODEC_GLUE=m
CONFIG_SND_MESON_GX_SOUND_CARD=m
CONFIG_SND_MESON_G12A_TOACODEC=m
# CONFIG_SND_MESON_G12A_TOHDMITX is not set
CONFIG_SND_SOC_MESON_T9015=m
# end of Amlogic

# CONFIG_SND_MXS_SOC is not set

#
# PXA
#
# CONFIG_SND_PXA2XX_SOC is not set
# end of PXA

CONFIG_SND_SOC_QCOM=m
CONFIG_SND_SOC_LPASS_CPU=m
CONFIG_SND_SOC_LPASS_PLATFORM=m
CONFIG_SND_SOC_LPASS_IPQ806X=m
CONFIG_SND_SOC_LPASS_APQ8016=m
CONFIG_SND_SOC_STORM=m
CONFIG_SND_SOC_APQ8016_SBC=m
CONFIG_SND_SOC_QCOM_COMMON=m
# CONFIG_SND_SOC_QDSP6 is not set
# CONFIG_SND_SOC_MSM8996 is not set
# CONFIG_SND_SOC_SC7180 is not set

#
# Renesas
#
CONFIG_SND_SOC_SH4_FSI=m
# CONFIG_SND_SOC_RCAR is not set
CONFIG_SND_SOC_MSIOF=m
CONFIG_SND_SOC_RZ=m
# end of Renesas

#
# Rockchip
#
CONFIG_SND_SOC_ROCKCHIP_I2S=m
CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
# CONFIG_SND_SOC_ROCKCHIP_PDM is not set
# CONFIG_SND_SOC_ROCKCHIP_SAI is not set
# CONFIG_SND_SOC_ROCKCHIP_SPDIF is not set
# CONFIG_SND_SOC_ROCKCHIP_MAX98090 is not set
# CONFIG_SND_SOC_ROCKCHIP_RT5645 is not set
CONFIG_SND_SOC_RK3288_HDMI_ANALOG=m
# end of Rockchip

CONFIG_SND_SOC_SAMSUNG=m
CONFIG_SND_SAMSUNG_PCM=m
CONFIG_SND_SAMSUNG_SPDIF=m
CONFIG_SND_SAMSUNG_I2S=m
CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994=m
CONFIG_SND_SOC_SAMSUNG_SMDK_SPDIF=m
# CONFIG_SND_SOC_SMDK_WM8994_PCM is not set
# CONFIG_SND_SOC_TOBERMORY is not set
CONFIG_SND_SOC_LOWLAND=m
CONFIG_SND_SOC_LITTLEMILL=m
# CONFIG_SND_SOC_SNOW is not set
CONFIG_SND_SOC_ODROID=m
# CONFIG_SND_SOC_ARNDALE is not set
CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994=m
CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811=m

#
# SoundWire (SDCA)
#
CONFIG_SND_SOC_SDCA_OPTIONAL=m
# end of SoundWire (SDCA)

#
# SpacemiT
#
# end of SpacemiT

#
# ST SPEAr
#
# end of ST SPEAr

#
# Spreadtrum
#
# CONFIG_SND_SOC_SPRD is not set
# end of Spreadtrum

#
# StarFive
#
CONFIG_SND_SOC_JH7110_PWMDAC=m
# CONFIG_SND_SOC_JH7110_TDM is not set
# end of StarFive

# CONFIG_SND_SOC_STI is not set

#
# STMicroelectronics STM32
#
CONFIG_SND_SOC_STM32_SAI=m
CONFIG_SND_SOC_STM32_I2S=m
# CONFIG_SND_SOC_STM32_SPDIFRX is not set
# end of STMicroelectronics STM32

#
# Allwinner
#
CONFIG_SND_SUN4I_CODEC=m
CONFIG_SND_SUN8I_CODEC=m
CONFIG_SND_SUN8I_CODEC_ANALOG=m
CONFIG_SND_SUN50I_CODEC_ANALOG=m
# CONFIG_SND_SUN4I_I2S is not set
# CONFIG_SND_SUN4I_SPDIF is not set
CONFIG_SND_SUN50I_DMIC=m
CONFIG_SND_SUN8I_ADDA_PR_REGMAP=m
# end of Allwinner

#
# Tegra
#
# CONFIG_SND_SOC_TEGRA is not set
# end of Tegra

#
# Texas Instruments
#
CONFIG_SND_SOC_TI_EDMA_PCM=m
CONFIG_SND_SOC_TI_SDMA_PCM=m
CONFIG_SND_SOC_TI_UDMA_PCM=m

#
# Texas Instruments DAI support for:
#
CONFIG_SND_SOC_DAVINCI_ASP=m
CONFIG_SND_SOC_DAVINCI_MCASP=m
CONFIG_SND_SOC_OMAP_DMIC=m
CONFIG_SND_SOC_OMAP_MCBSP=m
CONFIG_SND_SOC_OMAP_MCPDM=m

#
# Audio support for boards with Texas Instruments SoCs
#
CONFIG_SND_SOC_OMAP3_TWL4030=m
CONFIG_SND_SOC_OMAP_ABE_TWL6040=m
CONFIG_SND_SOC_OMAP_AMS_DELTA=m
# CONFIG_SND_SOC_OMAP_HDMI is not set
# CONFIG_SND_SOC_J721E_EVM is not set
# end of Texas Instruments

#
# UniPhier
#
CONFIG_SND_SOC_UNIPHIER_AIO=m
CONFIG_SND_SOC_UNIPHIER_LD11=m
CONFIG_SND_SOC_UNIPHIER_PXS2=m
# CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC is not set
# end of UniPhier

#
# Xilinx
#
CONFIG_SND_SOC_XILINX_I2S=m
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
CONFIG_SND_SOC_XILINX_SPDIF=m
# end of Xilinx

#
# Xtensa
#
CONFIG_SND_SOC_XTFPGA_I2S=m
# end of Xtensa

CONFIG_SND_SOC_SOF_TOPLEVEL=y
CONFIG_SND_SOC_SOF_ACPI=m
CONFIG_SND_SOC_SOF_OF=m
CONFIG_SND_SOC_SOF_AMD_TOPLEVEL=m
# CONFIG_SND_SOC_SOF_IMX_TOPLEVEL is not set
# CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL is not set
# CONFIG_SND_SOC_SOF_MTK_TOPLEVEL is not set
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
# CONFIG_SND_SOC_ALL_CODECS is not set
CONFIG_SND_SOC_WM_HUBS=m
CONFIG_SND_SOC_WM_ADSP=m
CONFIG_SND_SOC_AC97_CODEC=m
CONFIG_SND_SOC_ADAU_UTILS=m
CONFIG_SND_SOC_ADAU1372=m
CONFIG_SND_SOC_ADAU1372_I2C=m
CONFIG_SND_SOC_ADAU1373=m
# CONFIG_SND_SOC_ADAU1701 is not set
CONFIG_SND_SOC_ADAU17X1=m
CONFIG_SND_SOC_ADAU1761=m
CONFIG_SND_SOC_ADAU1761_I2C=m
# CONFIG_SND_SOC_ADAU7002 is not set
CONFIG_SND_SOC_ADAU7118=m
CONFIG_SND_SOC_ADAU7118_HW=m
# CONFIG_SND_SOC_ADAU7118_I2C is not set
# CONFIG_SND_SOC_AK4118 is not set
CONFIG_SND_SOC_AK4375=m
# CONFIG_SND_SOC_AK4458 is not set
CONFIG_SND_SOC_AK4554=m
CONFIG_SND_SOC_AK4613=m
CONFIG_SND_SOC_AK4619=m
CONFIG_SND_SOC_AK4642=m
# CONFIG_SND_SOC_AK5386 is not set
# CONFIG_SND_SOC_AK5558 is not set
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_AUDIO_IIO_AUX is not set
CONFIG_SND_SOC_AW8738=m
CONFIG_SND_SOC_AW88395_LIB=m
CONFIG_SND_SOC_AW88395=m
# CONFIG_SND_SOC_AW88166 is not set
CONFIG_SND_SOC_AW88261=m
CONFIG_SND_SOC_AW88081=m
CONFIG_SND_SOC_AW87390=m
CONFIG_SND_SOC_AW88399=m
# CONFIG_SND_SOC_BD28623 is not set
CONFIG_SND_SOC_BT_SCO=m
CONFIG_SND_SOC_CHV3_CODEC=m
CONFIG_SND_SOC_CPCAP=m
CONFIG_SND_SOC_CS_AMP_LIB=m
# CONFIG_SND_SOC_CS35L32 is not set
# CONFIG_SND_SOC_CS35L33 is not set
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
# CONFIG_SND_SOC_CS35L36 is not set
# CONFIG_SND_SOC_CS35L41_I2C is not set
CONFIG_SND_SOC_CS35L45=m
CONFIG_SND_SOC_CS35L45_I2C=m
CONFIG_SND_SOC_CS35L56=m
CONFIG_SND_SOC_CS35L56_SHARED=m
CONFIG_SND_SOC_CS35L56_I2C=m

#
# CS35L56 driver options
#
# CONFIG_SND_SOC_CS35L56_CAL_DEBUGFS is not set
# CONFIG_SND_SOC_CS35L56_CAL_SET_CTRL is not set
# end of CS35L56 driver options

CONFIG_SND_SOC_CS40L50=m
# CONFIG_SND_SOC_CS42L42 is not set
CONFIG_SND_SOC_CS42L43=m
CONFIG_SND_SOC_CS42L51=m
CONFIG_SND_SOC_CS42L51_I2C=m
CONFIG_SND_SOC_CS42L52=m
CONFIG_SND_SOC_CS42L56=m
CONFIG_SND_SOC_CS42L73=m
# CONFIG_SND_SOC_CS42L83 is not set
# CONFIG_SND_SOC_CS42L84 is not set
CONFIG_SND_SOC_CS4234=m
CONFIG_SND_SOC_CS4265=m
CONFIG_SND_SOC_CS4270=m
CONFIG_SND_SOC_CS4271=m
CONFIG_SND_SOC_CS4271_I2C=m
CONFIG_SND_SOC_CS42XX8=m
CONFIG_SND_SOC_CS42XX8_I2C=m
CONFIG_SND_SOC_CS43130=m
# CONFIG_SND_SOC_CS4341 is not set
CONFIG_SND_SOC_CS4349=m
# CONFIG_SND_SOC_CS53L30 is not set
# CONFIG_SND_SOC_CS530X_I2C is not set
CONFIG_SND_SOC_CX20442=m
CONFIG_SND_SOC_CX2072X=m
CONFIG_SND_SOC_JZ4740_CODEC=m
CONFIG_SND_SOC_JZ4725B_CODEC=m
CONFIG_SND_SOC_JZ4760_CODEC=m
CONFIG_SND_SOC_JZ4770_CODEC=m
CONFIG_SND_SOC_DA7213=m
CONFIG_SND_SOC_DA7219=m
CONFIG_SND_SOC_DMIC=m
CONFIG_SND_SOC_HDMI_CODEC=m
CONFIG_SND_SOC_ES7134=m
CONFIG_SND_SOC_ES7241=m
CONFIG_SND_SOC_ES8311=m
CONFIG_SND_SOC_ES8316=m
CONFIG_SND_SOC_ES8323=m
CONFIG_SND_SOC_ES8326=m
CONFIG_SND_SOC_ES8328=m
CONFIG_SND_SOC_ES8328_I2C=m
# CONFIG_SND_SOC_ES8375 is not set
CONFIG_SND_SOC_ES8389=m
CONFIG_SND_SOC_FS_AMP_LIB=m
CONFIG_SND_SOC_FS210X=m
# CONFIG_SND_SOC_GTM601 is not set
CONFIG_SND_SOC_HDA=m
CONFIG_SND_SOC_ICS43432=m
CONFIG_SND_SOC_INNO_RK3036=m
CONFIG_SND_SOC_LOCHNAGAR_SC=m
# CONFIG_SND_SOC_MAX98088 is not set
CONFIG_SND_SOC_MAX98090=m
CONFIG_SND_SOC_MAX98357A=m
# CONFIG_SND_SOC_MAX98504 is not set
CONFIG_SND_SOC_MAX9867=m
CONFIG_SND_SOC_MAX98927=m
CONFIG_SND_SOC_MAX98520=m
CONFIG_SND_SOC_MAX98373=m
CONFIG_SND_SOC_MAX98373_I2C=m
CONFIG_SND_SOC_MAX98388=m
CONFIG_SND_SOC_MAX98390=m
# CONFIG_SND_SOC_MAX98396 is not set
CONFIG_SND_SOC_MAX9860=m
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
CONFIG_SND_SOC_PCM1681=m
CONFIG_SND_SOC_PCM1754=m
CONFIG_SND_SOC_PCM1789=m
CONFIG_SND_SOC_PCM1789_I2C=m
CONFIG_SND_SOC_PCM179X=m
CONFIG_SND_SOC_PCM179X_I2C=m
# CONFIG_SND_SOC_PCM186X_I2C is not set
CONFIG_SND_SOC_PCM3060=m
CONFIG_SND_SOC_PCM3060_I2C=m
# CONFIG_SND_SOC_PCM3168A_I2C is not set
# CONFIG_SND_SOC_PCM5102A is not set
CONFIG_SND_SOC_PCM512x=m
CONFIG_SND_SOC_PCM512x_I2C=m
CONFIG_SND_SOC_PCM6240=m
CONFIG_SND_SOC_RK3308=m
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RK817=m
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RT1011=m
CONFIG_SND_SOC_RT1015P=m
CONFIG_SND_SOC_RT5616=m
CONFIG_SND_SOC_RT5631=m
# CONFIG_SND_SOC_RT5640 is not set
CONFIG_SND_SOC_RT5645=m
# CONFIG_SND_SOC_RT5659 is not set
CONFIG_SND_SOC_RT5682=m
CONFIG_SND_SOC_RT5682_I2C=m
CONFIG_SND_SOC_RT5682S=m
CONFIG_SND_SOC_RT9120=m
CONFIG_SND_SOC_RT9123=m
# CONFIG_SND_SOC_RT9123P is not set
CONFIG_SND_SOC_RTQ9124=m
CONFIG_SND_SOC_RTQ9128=m
CONFIG_SND_SOC_SGTL5000=m
CONFIG_SND_SOC_SIGMADSP=m
CONFIG_SND_SOC_SIGMADSP_REGMAP=m
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
# CONFIG_SND_SOC_SIMPLE_MUX is not set
CONFIG_SND_SOC_SMA1303=m
CONFIG_SND_SOC_SMA1307=m
CONFIG_SND_SOC_SPDIF=m
CONFIG_SND_SOC_SRC4XXX_I2C=m
CONFIG_SND_SOC_SRC4XXX=m
# CONFIG_SND_SOC_SSM2305 is not set
CONFIG_SND_SOC_SSM2518=m
# CONFIG_SND_SOC_SSM2602_I2C is not set
CONFIG_SND_SOC_SSM3515=m
CONFIG_SND_SOC_SSM4567=m
CONFIG_SND_SOC_STA32X=m
CONFIG_SND_SOC_STA350=m
# CONFIG_SND_SOC_STI_SAS is not set
CONFIG_SND_SOC_TAS2552=m
# CONFIG_SND_SOC_TAS2562 is not set
CONFIG_SND_SOC_TAS2764=m
CONFIG_SND_SOC_TAS2770=m
CONFIG_SND_SOC_TAS2780=m
CONFIG_SND_SOC_TAS2781_COMLIB=m
CONFIG_SND_SOC_TAS2781_COMLIB_I2C=m
CONFIG_SND_SOC_TAS2781_FMWLIB=m
CONFIG_SND_SOC_TAS2781_I2C=m
CONFIG_SND_SOC_TAS5086=m
CONFIG_SND_SOC_TAS571X=m
# CONFIG_SND_SOC_TAS5720 is not set
CONFIG_SND_SOC_TAS5805M=m
# CONFIG_SND_SOC_TAS6424 is not set
# CONFIG_SND_SOC_TDA7419 is not set
# CONFIG_SND_SOC_TFA9879 is not set
# CONFIG_SND_SOC_TFA989X is not set
# CONFIG_SND_SOC_TLV320ADC3XXX is not set
CONFIG_SND_SOC_TLV320AIC23=m
CONFIG_SND_SOC_TLV320AIC23_I2C=m
# CONFIG_SND_SOC_TLV320AIC31XX is not set
CONFIG_SND_SOC_TLV320AIC32X4=m
CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
# CONFIG_SND_SOC_TLV320AIC3X_I2C is not set
CONFIG_SND_SOC_TLV320ADCX140=m
CONFIG_SND_SOC_TS3A227E=m
CONFIG_SND_SOC_TSCS42XX=m
# CONFIG_SND_SOC_TSCS454 is not set
CONFIG_SND_SOC_TWL4030=m
CONFIG_SND_SOC_TWL6040=m
# CONFIG_SND_SOC_UDA1334 is not set
CONFIG_SND_SOC_UDA1342=m
CONFIG_SND_SOC_WCD_CLASSH=m
CONFIG_SND_SOC_WCD_COMMON=m
# CONFIG_SND_SOC_WCD9335 is not set
CONFIG_SND_SOC_WCD_MBHC=m
CONFIG_SND_SOC_WCD934X=m
CONFIG_SND_SOC_WM5100=m
# CONFIG_SND_SOC_WM8510 is not set
# CONFIG_SND_SOC_WM8523 is not set
CONFIG_SND_SOC_WM8524=m
CONFIG_SND_SOC_WM8580=m
# CONFIG_SND_SOC_WM8711 is not set
CONFIG_SND_SOC_WM8728=m
CONFIG_SND_SOC_WM8731=m
CONFIG_SND_SOC_WM8731_I2C=m
# CONFIG_SND_SOC_WM8737 is not set
# CONFIG_SND_SOC_WM8741 is not set
CONFIG_SND_SOC_WM8750=m
# CONFIG_SND_SOC_WM8753 is not set
CONFIG_SND_SOC_WM8776=m
# CONFIG_SND_SOC_WM8782 is not set
CONFIG_SND_SOC_WM8804=m
CONFIG_SND_SOC_WM8804_I2C=m
# CONFIG_SND_SOC_WM8903 is not set
# CONFIG_SND_SOC_WM8904 is not set
CONFIG_SND_SOC_WM8940=m
CONFIG_SND_SOC_WM8960=m
CONFIG_SND_SOC_WM8961=m
CONFIG_SND_SOC_WM8962=m
# CONFIG_SND_SOC_WM8974 is not set
# CONFIG_SND_SOC_WM8978 is not set
CONFIG_SND_SOC_WM8985=m
CONFIG_SND_SOC_WM8994=m
CONFIG_SND_SOC_WM9081=m
# CONFIG_SND_SOC_MAX9759 is not set
CONFIG_SND_SOC_MT6351=m
CONFIG_SND_SOC_MT6357=m
CONFIG_SND_SOC_MT6358=m
CONFIG_SND_SOC_MT6359=m
CONFIG_SND_SOC_MT6359_ACCDET=m
CONFIG_SND_SOC_MT6660=m
CONFIG_SND_SOC_NAU8315=m
CONFIG_SND_SOC_NAU8325=m
CONFIG_SND_SOC_NAU8540=m
CONFIG_SND_SOC_NAU8810=m
CONFIG_SND_SOC_NAU8821=m
CONFIG_SND_SOC_NAU8822=m
CONFIG_SND_SOC_NAU8824=m
CONFIG_SND_SOC_NTPFW=m
CONFIG_SND_SOC_NTP8918=m
CONFIG_SND_SOC_NTP8835=m
CONFIG_SND_SOC_TPA6130A2=m
CONFIG_SND_SOC_LPASS_MACRO_COMMON=m
# CONFIG_SND_SOC_LPASS_WSA_MACRO is not set
# CONFIG_SND_SOC_LPASS_VA_MACRO is not set
CONFIG_SND_SOC_LPASS_RX_MACRO=m
CONFIG_SND_SOC_LPASS_TX_MACRO=m
# end of CODEC drivers

#
# Generic drivers
#
CONFIG_SND_SIMPLE_CARD_UTILS=m
CONFIG_SND_SIMPLE_CARD=m
CONFIG_SND_AUDIO_GRAPH_CARD=m
# CONFIG_SND_AUDIO_GRAPH_CARD2 is not set
CONFIG_SND_TEST_COMPONENT=m
# end of Generic drivers

CONFIG_SND_VIRTIO=m
CONFIG_AC97_BUS=m
CONFIG_HID_SUPPORT=y
CONFIG_HID=m
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=m
CONFIG_HID_HAPTIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=m
CONFIG_HID_ACCUTOUCH=m
CONFIG_HID_ACRUX=m
CONFIG_HID_ACRUX_FF=y
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_APPLETB_BL=m
CONFIG_HID_APPLETB_KBD=m
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
CONFIG_HID_BIGBEN_FF=m
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=m
CONFIG_HID_CORSAIR=m
CONFIG_HID_COUGAR=m
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_PRODIKEYS is not set
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
# CONFIG_HID_CYPRESS is not set
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=m
# CONFIG_HID_ELAN is not set
# CONFIG_HID_ELECOM is not set
CONFIG_HID_ELO=m
CONFIG_HID_EVISION=m
CONFIG_HID_EZKEY=m
CONFIG_HID_FT260=m
CONFIG_HID_GEMBIRD=m
# CONFIG_HID_GFRM is not set
CONFIG_HID_GLORIOUS=m
CONFIG_HID_HOLTEK=m
CONFIG_HOLTEK_FF=y
CONFIG_HID_VIVALDI_COMMON=m
CONFIG_HID_GOOGLE_STADIA_FF=m
CONFIG_HID_VIVALDI=m
CONFIG_HID_GT683R=m
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=m
# CONFIG_HID_KYSONA is not set
CONFIG_HID_UCLOGIC=m
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_VRC2=m
CONFIG_HID_XIAOMI=m
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_LETSKETCH is not set
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
CONFIG_LOGITECH_FF=y
CONFIG_LOGIRUMBLEPAD2_FF=y
CONFIG_LOGIG940_FF=y
CONFIG_LOGIWHEELS_FF=y
CONFIG_HID_MAGICMOUSE=m
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=m
# CONFIG_HID_MEGAWORLD_FF is not set
CONFIG_HID_REDRAGON=m
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NINTENDO=m
# CONFIG_NINTENDO_FF is not set
# CONFIG_HID_NTI is not set
CONFIG_HID_NTRIG=m
CONFIG_HID_ORTEK=m
# CONFIG_HID_PANTHERLORD is not set
# CONFIG_HID_PENMOUNT is not set
# CONFIG_HID_PETALYNX is not set
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PLAYSTATION=m
# CONFIG_PLAYSTATION_FF is not set
CONFIG_HID_PXRC=m
CONFIG_HID_RAZER=m
CONFIG_HID_PRIMAX=m
CONFIG_HID_RETRODE=m
CONFIG_HID_ROCCAT=m
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
CONFIG_HID_SIGMAMICRO=m
CONFIG_HID_SONY=m
# CONFIG_SONY_FF is not set
CONFIG_HID_SPEEDLINK=m
CONFIG_HID_STEAM=m
# CONFIG_STEAM_FF is not set
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=m
CONFIG_SMARTJOYPLUS_FF=y
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=m
CONFIG_HID_TOPRE=m
# CONFIG_HID_THINGM is not set
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
CONFIG_HID_WACOM=m
CONFIG_HID_WIIMOTE=m
CONFIG_HID_WINWING=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
CONFIG_ZEROPLUS_FF=y
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
# CONFIG_HID_ALPS is not set
# CONFIG_HID_MCP2200 is not set
CONFIG_HID_MCP2221=m
# end of Special HID drivers

#
# HID-BPF support
#
# end of HID-BPF support

# CONFIG_I2C_HID is not set

#
# USB HID support
#
CONFIG_USB_HID=m
# CONFIG_HID_PID is not set
CONFIG_USB_HIDDEV=y
# end of USB HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=y
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_FEW_INIT_RETRIES=y
# CONFIG_USB_DYNAMIC_MINORS is not set
CONFIG_USB_OTG=y
CONFIG_USB_OTG_PRODUCTLIST=y
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_OTG_FSM=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_DEFAULT_AUTHORIZATION_MODE=1
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_XHCI_HISTB=y
CONFIG_USB_XHCI_MTK=m
CONFIG_USB_XHCI_MVEBU=m
CONFIG_USB_XHCI_RCAR=m
# CONFIG_USB_XHCI_SIDEBAND is not set
CONFIG_USB_EHCI_BRCMSTB=y
CONFIG_USB_BRCMSTB=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
# CONFIG_USB_EHCI_FSL is not set
CONFIG_USB_EHCI_HCD_NPCM7XX=m
# CONFIG_USB_EHCI_HCD_OMAP is not set
CONFIG_USB_EHCI_HCD_ORION=y
CONFIG_USB_EHCI_HCD_SPEAR=y
CONFIG_USB_EHCI_HCD_STI=m
CONFIG_USB_EHCI_HCD_AT91=m
CONFIG_USB_EHCI_SH=y
CONFIG_USB_EHCI_EXYNOS=m
# CONFIG_USB_EHCI_MV is not set
CONFIG_USB_EHCI_HCD_PLATFORM=m
CONFIG_USB_OXU210HP_HCD=y
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_ISP1362_HCD is not set
CONFIG_USB_OHCI_HCD=m
# CONFIG_USB_OHCI_HCD_SPEAR is not set
CONFIG_USB_OHCI_HCD_STI=m
CONFIG_USB_OHCI_HCD_S3C2410=m
# CONFIG_USB_OHCI_HCD_LPC32XX is not set
CONFIG_USB_OHCI_HCD_AT91=m
CONFIG_USB_OHCI_HCD_OMAP3=m
CONFIG_USB_OHCI_HCD_DAVINCI=m
CONFIG_USB_OHCI_EXYNOS=m
CONFIG_USB_OHCI_HCD_PLATFORM=m
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed; see USB_STORAGE Help for more info
#
# CONFIG_USB_STORAGE is not set

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set

#
# USB dual-mode controller drivers
#
CONFIG_USB_CDNS_SUPPORT=y
CONFIG_USB_CDNS3=m
# CONFIG_USB_CDNS3_HOST is not set
CONFIG_USB_CDNS3_TI=m
# CONFIG_USB_CDNS3_IMX is not set
CONFIG_USB_CDNS3_STARFIVE=m
CONFIG_USB_FOTG210=y
CONFIG_USB_FOTG210_HCD=y
# CONFIG_USB_MTU3 is not set
CONFIG_USB_MUSB_HDRC=m
CONFIG_USB_MUSB_HOST=y

#
# Platform Glue Layer
#
CONFIG_USB_MUSB_TUSB6010=m
CONFIG_USB_MUSB_OMAP2PLUS=m
CONFIG_USB_MUSB_DSPS=m
# CONFIG_USB_MUSB_UX500 is not set
# CONFIG_USB_MUSB_MEDIATEK is not set
CONFIG_USB_MUSB_POLARFIRE_SOC=m

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_HOST=y
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_NPCM=y
CONFIG_USB_CHIPIDEA_IMX=y
CONFIG_USB_CHIPIDEA_GENERIC=y
CONFIG_USB_CHIPIDEA_TEGRA=y
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1760_HCD=y
CONFIG_USB_ISP1760_HOST_ROLE=y

#
# USB port drivers
#
CONFIG_USB_SERIAL=m
# CONFIG_USB_SERIAL_GENERIC is not set
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=m
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=m
CONFIG_USB_SERIAL_EMPEG=m
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=m
CONFIG_USB_SERIAL_IPAQ=m
CONFIG_USB_SERIAL_IR=m
# CONFIG_USB_SERIAL_EDGEPORT is not set
CONFIG_USB_SERIAL_EDGEPORT_TI=m
CONFIG_USB_SERIAL_F81232=m
CONFIG_USB_SERIAL_F8153X=m
CONFIG_USB_SERIAL_GARMIN=m
CONFIG_USB_SERIAL_IPW=m
CONFIG_USB_SERIAL_IUU=m
CONFIG_USB_SERIAL_KEYSPAN_PDA=m
CONFIG_USB_SERIAL_KEYSPAN=m
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
CONFIG_USB_SERIAL_MCT_U232=m
CONFIG_USB_SERIAL_METRO=m
# CONFIG_USB_SERIAL_MOS7720 is not set
CONFIG_USB_SERIAL_MOS7840=m
# CONFIG_USB_SERIAL_MXUPORT is not set
CONFIG_USB_SERIAL_NAVMAN=m
# CONFIG_USB_SERIAL_PL2303 is not set
CONFIG_USB_SERIAL_OTI6858=m
CONFIG_USB_SERIAL_QCAUX=m
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
CONFIG_USB_SERIAL_SAFE=m
# CONFIG_USB_SERIAL_SAFE_PADDED is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
CONFIG_USB_SERIAL_TI=m
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_WWAN=m
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
CONFIG_USB_SERIAL_OPTICON=m
# CONFIG_USB_SERIAL_XSENS_MT is not set
CONFIG_USB_SERIAL_WISHBONE=m
CONFIG_USB_SERIAL_SSU100=m
# CONFIG_USB_SERIAL_QT2 is not set
CONFIG_USB_SERIAL_UPD78F0730=m
# CONFIG_USB_SERIAL_XR is not set
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_USS720=m
# CONFIG_USB_EMI62 is not set
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=m
CONFIG_USB_CYPRESS_CY7C63=m
CONFIG_USB_CYTHERM=m
# CONFIG_USB_IDMOUSE is not set
CONFIG_USB_APPLEDISPLAY=m
CONFIG_USB_QCOM_EUD=m
CONFIG_APPLE_MFI_FASTCHARGE=y
CONFIG_USB_SISUSBVGA=y
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
CONFIG_USB_EHSET_TEST_FIXTURE=y
CONFIG_USB_ISIGHTFW=y
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
CONFIG_USB_HUB_USB251XB=y
CONFIG_USB_HSIC_USB3503=m
CONFIG_USB_HSIC_USB4604=y
CONFIG_USB_LINK_LAYER_TEST=y
CONFIG_USB_CHAOSKEY=m
# CONFIG_BRCM_USB_PINMAP is not set
CONFIG_USB_ONBOARD_DEV=y
CONFIG_USB_ONBOARD_DEV_USB5744=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_KEYSTONE_USB_PHY is not set
CONFIG_NOP_USB_XCEIV=m
CONFIG_AM335X_CONTROL_USB=m
CONFIG_AM335X_PHY_USB=m
# CONFIG_TWL6030_USB is not set
CONFIG_USB_GPIO_VBUS=m
CONFIG_TAHVO_USB=y
CONFIG_TAHVO_USB_HOST_BY_DEFAULT=y
CONFIG_USB_ISP1301=m
CONFIG_USB_MXS_PHY=y
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=m
# CONFIG_TYPEC_TCPCI is not set
CONFIG_TYPEC_FUSB302=m
# CONFIG_TYPEC_QCOM_PMIC is not set
CONFIG_TYPEC_UCSI=m
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_STM32G0=m
# CONFIG_UCSI_LENOVO_YOGA_C630 is not set
# CONFIG_TYPEC_TPS6598X is not set
CONFIG_TYPEC_ANX7411=y
CONFIG_TYPEC_RT1719=y
CONFIG_TYPEC_HD3SS3220=m
CONFIG_TYPEC_STUSB160X=y
CONFIG_TYPEC_WUSB3801=y

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_FSA4480=y
CONFIG_TYPEC_MUX_GPIO_SBU=m
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# CONFIG_TYPEC_MUX_IT5205 is not set
# CONFIG_TYPEC_MUX_NB7VPQ904M is not set
CONFIG_TYPEC_MUX_PS883X=y
CONFIG_TYPEC_MUX_PTN36502=m
CONFIG_TYPEC_MUX_TUSB1046=m
CONFIG_TYPEC_MUX_WCD939X_USBSS=m
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_TBT_ALTMODE=m
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=y
CONFIG_PWRSEQ_EMMC=m
CONFIG_PWRSEQ_SIMPLE=m
# CONFIG_MMC_BLOCK is not set
CONFIG_SDIO_UART=m
CONFIG_MMC_TEST=m

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SUNPLUS=y
# CONFIG_MMC_ARMMMCI is not set
# CONFIG_MMC_PXA is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_UHS2=m
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDHCI_OF_ARASAN=m
CONFIG_MMC_SDHCI_OF_ASPEED=m
CONFIG_MMC_SDHCI_OF_AT91=m
CONFIG_MMC_SDHCI_OF_ESDHC=m
CONFIG_MMC_SDHCI_OF_DWCMSHC=m
# CONFIG_MMC_SDHCI_OF_K1 is not set
CONFIG_MMC_SDHCI_OF_SPARX5=m
# CONFIG_MMC_SDHCI_OF_MA35D1 is not set
CONFIG_MMC_SDHCI_CADENCE=m
CONFIG_MMC_SDHCI_ESDHC_IMX=m
CONFIG_MMC_SDHCI_DOVE=m
CONFIG_MMC_SDHCI_TEGRA=m
CONFIG_MMC_SDHCI_S3C=m
CONFIG_MMC_SDHCI_PXAV3=m
# CONFIG_MMC_SDHCI_PXAV2 is not set
CONFIG_MMC_SDHCI_SPEAR=m
CONFIG_MMC_SDHCI_S3C_DMA=y
CONFIG_MMC_SDHCI_BCM_KONA=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_SDHCI_MILBEAUT is not set
CONFIG_MMC_SDHCI_IPROC=m
CONFIG_MMC_SDHCI_NPCM=m
# CONFIG_MMC_MESON_GX is not set
CONFIG_MMC_MESON_MX_SDHC=y
# CONFIG_MMC_MESON_MX_SDIO is not set
CONFIG_MMC_MOXART=m
# CONFIG_MMC_SDHCI_ST is not set
# CONFIG_MMC_OMAP_HS is not set
CONFIG_MMC_SDHCI_MSM=m
CONFIG_MMC_MXC=m
CONFIG_MMC_MVSDIO=y
CONFIG_MMC_DAVINCI=m
CONFIG_MMC_SDHCI_SPRD=m
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_SDHI=y
CONFIG_MMC_SDHI_SYS_DMAC=m
CONFIG_MMC_SDHI_INTERNAL_DMAC=m
CONFIG_MMC_UNIPHIER=y
CONFIG_MMC_DW=m
CONFIG_MMC_DW_PLTFM=m
CONFIG_MMC_DW_BLUEFIELD=m
CONFIG_MMC_DW_EXYNOS=m
CONFIG_MMC_DW_HI3798CV200=m
CONFIG_MMC_DW_HI3798MV200=m
CONFIG_MMC_DW_K3=m
# CONFIG_MMC_DW_ROCKCHIP is not set
CONFIG_MMC_SH_MMCIF=m
CONFIG_MMC_VUB300=m
# CONFIG_MMC_USHC is not set
CONFIG_MMC_WMT=y
CONFIG_MMC_USDHI6ROL0=m
CONFIG_MMC_REALTEK_USB=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
CONFIG_MMC_BCM2835=m
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_BRCMSTB is not set
CONFIG_MMC_SDHCI_XENON=m
CONFIG_MMC_SDHCI_OMAP=m
CONFIG_MMC_SDHCI_AM654=m
# CONFIG_MMC_OWL is not set
CONFIG_MMC_LOONGSON2=m
CONFIG_MMC_SDHCI_EXTERNAL_DMA=y
# CONFIG_MMC_LITEX is not set
CONFIG_SCSI_UFSHCD=m
CONFIG_SCSI_UFS_BSG=y
# CONFIG_SCSI_UFS_FAULT_INJECTION is not set
# CONFIG_SCSI_UFS_HWMON is not set
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_SCSI_UFS_TI_J721E is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=m
CONFIG_MS_BLOCK=m

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_REALTEK_USB=m
CONFIG_LEDS_EXPRESSWIRE=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=m
CONFIG_LEDS_CLASS_MULTICOLOR=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_AN30259A=m
CONFIG_LEDS_ARIEL=m
CONFIG_LEDS_AW200XX=y
# CONFIG_LEDS_AW2013 is not set
# CONFIG_LEDS_BCM6328 is not set
CONFIG_LEDS_BCM6358=m
CONFIG_LEDS_LM3530=y
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
CONFIG_LEDS_LM3692X=m
# CONFIG_LEDS_COBALT_QUBE is not set
CONFIG_LEDS_COBALT_RAQ=y
# CONFIG_LEDS_SUN50I_A100 is not set
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
# CONFIG_LEDS_LP55XX_COMMON is not set
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_LP8864 is not set
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_PCA995X=m
# CONFIG_LEDS_WM8350 is not set
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=m
CONFIG_LEDS_BD2606MVV=y
CONFIG_LEDS_BD2802=y
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_MAX5970 is not set
# CONFIG_LEDS_MC13783 is not set
# CONFIG_LEDS_NS2 is not set
CONFIG_LEDS_NETXBIG=y
CONFIG_LEDS_TCA6507=m
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_MAX77650=y
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
CONFIG_LEDS_IS31FL319X=m
# CONFIG_LEDS_IS31FL32XX is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
CONFIG_LEDS_SYSCON=y
# CONFIG_LEDS_PM8058 is not set
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=y
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=m
# CONFIG_LEDS_LM36274 is not set
CONFIG_LEDS_ST1202=y
CONFIG_LEDS_TPS6105X=y
CONFIG_LEDS_IP30=m
CONFIG_LEDS_ACER_A500=m
CONFIG_LEDS_BCM63138=y
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
CONFIG_LEDS_AAT1290=m
CONFIG_LEDS_AS3645A=m
CONFIG_LEDS_KTD2692=m
CONFIG_LEDS_LM3601X=m
CONFIG_LEDS_MAX77693=m
CONFIG_LEDS_MT6360=m
CONFIG_LEDS_QCOM_FLASH=m
CONFIG_LEDS_RT4505=m
# CONFIG_LEDS_RT8515 is not set
# CONFIG_LEDS_SGM3140 is not set
# CONFIG_LEDS_SY7802 is not set
CONFIG_LEDS_TPS6131X=m

#
# RGB LED drivers
#
CONFIG_LEDS_GROUP_MULTICOLOR=m
CONFIG_LEDS_KTD202X=y
CONFIG_LEDS_NCP5623=m
# CONFIG_LEDS_PWM_MULTICOLOR is not set
# CONFIG_LEDS_QCOM_LPG is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_DISK=y
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
# CONFIG_LEDS_TRIGGER_GPIO is not set
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=m
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_TTY=m
CONFIG_LEDS_TRIGGER_INPUT_EVENTS=y

#
# Simatic LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_DEV_UIE_EMUL=y
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM886=y
CONFIG_RTC_DRV_ABB5ZES3=m
# CONFIG_RTC_DRV_ABEOZ9 is not set
CONFIG_RTC_DRV_ABX80X=m
# CONFIG_RTC_DRV_BRCMSTB is not set
CONFIG_RTC_DRV_AS3722=m
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
CONFIG_RTC_DRV_DS1374_WDT=y
CONFIG_RTC_DRV_DS1672=y
CONFIG_RTC_DRV_HYM8563=y
CONFIG_RTC_DRV_MAX6900=y
# CONFIG_RTC_DRV_MAX8907 is not set
# CONFIG_RTC_DRV_MAX8925 is not set
CONFIG_RTC_DRV_MAX31335=m
# CONFIG_RTC_DRV_MAX77686 is not set
# CONFIG_RTC_DRV_SPACEMIT_P1 is not set
CONFIG_RTC_DRV_NVIDIA_VRS10=y
CONFIG_RTC_DRV_NCT3018Y=y
# CONFIG_RTC_DRV_NCT6694 is not set
CONFIG_RTC_DRV_RK808=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
CONFIG_RTC_DRV_ISL12026=y
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=y
CONFIG_RTC_DRV_M41T80_WDT=y
CONFIG_RTC_DRV_BQ32K=y
CONFIG_RTC_DRV_TWL4030=m
# CONFIG_RTC_DRV_PALMAS is not set
CONFIG_RTC_DRV_TPS6586X=y
# CONFIG_RTC_DRV_TPS6594 is not set
CONFIG_RTC_DRV_RC5T583=m
CONFIG_RTC_DRV_RC5T619=m
CONFIG_RTC_DRV_S35390A=m
# CONFIG_RTC_DRV_FM3130 is not set
CONFIG_RTC_DRV_RX8010=y
CONFIG_RTC_DRV_RX8111=m
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
# CONFIG_RTC_DRV_EM3027 is not set
# CONFIG_RTC_DRV_RV3028 is not set
CONFIG_RTC_DRV_RV3032=m
CONFIG_RTC_DRV_RV8803=y
CONFIG_RTC_DRV_S5M=m
CONFIG_RTC_DRV_SD2405AL=y
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
CONFIG_RTC_DRV_PCF2127=y
CONFIG_RTC_DRV_PCF85063=m
CONFIG_RTC_DRV_RV3029C2=y
CONFIG_RTC_DRV_RX6110=m

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_CMOS is not set
CONFIG_RTC_DRV_ATCRTC100=y
# CONFIG_RTC_DRV_DS1286 is not set
CONFIG_RTC_DRV_DS1511=y
# CONFIG_RTC_DRV_DS1553 is not set
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
CONFIG_RTC_DRV_DS17285=y
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_DA9063=m
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=y
# CONFIG_RTC_DRV_BQ4802 is not set
CONFIG_RTC_DRV_RP5C01=y
# CONFIG_RTC_DRV_GAMECUBE is not set
CONFIG_RTC_DRV_WM8350=m
# CONFIG_RTC_DRV_SC27XX is not set
CONFIG_RTC_DRV_SPEAR=m
CONFIG_RTC_DRV_ZYNQMP=m

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_ASM9260=m
CONFIG_RTC_DRV_CV1800=y
CONFIG_RTC_DRV_DIGICOLOR=y
# CONFIG_RTC_DRV_IMXDI is not set
# CONFIG_RTC_DRV_FSL_FTM_ALARM is not set
CONFIG_RTC_DRV_MESON=m
# CONFIG_RTC_DRV_MESON_VRTC is not set
CONFIG_RTC_DRV_OMAP=y
CONFIG_RTC_DRV_S3C=y
CONFIG_RTC_DRV_EP93XX=m
# CONFIG_RTC_DRV_PL030 is not set
# CONFIG_RTC_DRV_PL031 is not set
CONFIG_RTC_DRV_AT91RM9200=y
CONFIG_RTC_DRV_AT91SAM9=m
# CONFIG_RTC_DRV_RZN1 is not set
# CONFIG_RTC_DRV_GENERIC is not set
# CONFIG_RTC_DRV_VT8500 is not set
CONFIG_RTC_DRV_SUN6I=y
CONFIG_RTC_DRV_SUNXI=m
CONFIG_RTC_DRV_MV=m
CONFIG_RTC_DRV_ARMADA38X=m
CONFIG_RTC_DRV_CADENCE=y
CONFIG_RTC_DRV_FTRTC010=m
# CONFIG_RTC_DRV_STMP is not set
CONFIG_RTC_DRV_MC13XXX=m
# CONFIG_RTC_DRV_JZ4740 is not set
# CONFIG_RTC_DRV_LOONGSON is not set
CONFIG_RTC_DRV_LPC24XX=m
# CONFIG_RTC_DRV_LPC32XX is not set
CONFIG_RTC_DRV_PM8XXX=m
CONFIG_RTC_DRV_TEGRA=y
CONFIG_RTC_DRV_MXC=y
CONFIG_RTC_DRV_MXC_V2=y
CONFIG_RTC_DRV_SNVS=y
CONFIG_RTC_DRV_BBNSM=m
CONFIG_RTC_DRV_IMX_BBM_SCMI=m
CONFIG_RTC_DRV_MOXART=y
CONFIG_RTC_DRV_MT2712=m
CONFIG_RTC_DRV_MT6397=m
# CONFIG_RTC_DRV_MT7622 is not set
# CONFIG_RTC_DRV_XGENE is not set
CONFIG_RTC_DRV_R7301=y
CONFIG_RTC_DRV_STM32=m
CONFIG_RTC_DRV_RTD119X=y
CONFIG_RTC_DRV_ASPEED=m
CONFIG_RTC_DRV_TI_K3=y
CONFIG_RTC_DRV_MA35D1=m
CONFIG_RTC_DRV_GOLDFISH=y
# CONFIG_RTC_DRV_MSC313 is not set
CONFIG_RTC_DRV_SSD202D=m
# CONFIG_RTC_DRV_AMLOGIC_A4 is not set
CONFIG_RTC_DRV_S32G=y

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_HID_SENSOR_TIME=m
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_OF=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_AMBA_PL08X=y
CONFIG_APPLE_ADMAC=m
# CONFIG_ARM_DMA350 is not set
CONFIG_AT_HDMAC=m
CONFIG_AXI_DMAC=y
CONFIG_BCM_SBA_RAID=m
# CONFIG_DMA_BCM2835 is not set
CONFIG_DMA_JZ4780=m
CONFIG_DMA_SA11X0=y
# CONFIG_DMA_SUN6I is not set
CONFIG_DW_AXI_DMAC=y
CONFIG_EP93XX_DMA=y
# CONFIG_FSL_EDMA is not set
CONFIG_FSL_QDMA=m
# CONFIG_IMG_MDC_DMA is not set
# CONFIG_IMX_DMA is not set
# CONFIG_IMX_SDMA is not set
# CONFIG_INTEL_IDMA64 is not set
CONFIG_K3_DMA=m
# CONFIG_LOONGSON1_APB_DMA is not set
CONFIG_LOONGSON2_APB_DMA=m
CONFIG_LPC18XX_DMAMUX=y
CONFIG_LPC32XX_DMAMUX=y
CONFIG_MCF_EDMA=y
CONFIG_MILBEAUT_HDMAC=y
CONFIG_MILBEAUT_XDMAC=y
CONFIG_MMP_PDMA=y
# CONFIG_MMP_TDMA is not set
# CONFIG_MV_XOR is not set
CONFIG_MXS_DMA=y
# CONFIG_NBPFAXI_DMA is not set
CONFIG_PL330_DMA=y
# CONFIG_PXA_DMA is not set
CONFIG_SOPHGO_CV1800B_DMAMUX=m
# CONFIG_SPRD_DMA is not set
CONFIG_TEGRA20_APB_DMA=m
CONFIG_TEGRA210_ADMA=m
CONFIG_TIMB_DMA=m
# CONFIG_UNIPHIER_MDMAC is not set
# CONFIG_UNIPHIER_XDMAC is not set
CONFIG_XGENE_DMA=m
# CONFIG_XILINX_DMA is not set
CONFIG_XILINX_XDMA=y
CONFIG_XILINX_ZYNQMP_DMA=y
CONFIG_XILINX_ZYNQMP_DPDMA=y
CONFIG_AMD_QDMA=m
CONFIG_MTK_HSDMA=m
CONFIG_MTK_CQDMA=m
# CONFIG_MTK_UART_APDMA is not set
# CONFIG_QCOM_ADM is not set
CONFIG_QCOM_BAM_DMA=m
CONFIG_QCOM_HIDMA_MGMT=m
CONFIG_QCOM_HIDMA=m
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=y
CONFIG_RZN1_DMAMUX=m
CONFIG_SF_PDMA=m
CONFIG_RENESAS_DMA=y
CONFIG_SH_DMAE_BASE=y
CONFIG_SH_DMAE=m
# CONFIG_RCAR_DMAC is not set
# CONFIG_RENESAS_USB_DMAC is not set
CONFIG_RZ_DMAC=y
CONFIG_TI_EDMA=y
CONFIG_DMA_OMAP=y
CONFIG_TI_DMA_CROSSBAR=y
CONFIG_INTEL_LDMA=y
CONFIG_STM32_DMA=y
CONFIG_STM32_DMAMUX=y
CONFIG_STM32_MDMA=y
CONFIG_STM32_DMA3=m

#
# DMA Clients
#
# CONFIG_ASYNC_TX_DMA is not set
# CONFIG_DMATEST is not set
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
CONFIG_DMABUF_SELFTESTS=m
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

CONFIG_VFIO=m
CONFIG_VFIO_GROUP=y
CONFIG_VFIO_CONTAINER=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_VIRQFD=y
# CONFIG_VFIO_DEBUGFS is not set

#
# VFIO support for platform devices
#
CONFIG_VFIO_PLATFORM_BASE=m
CONFIG_VFIO_PLATFORM=m
CONFIG_VFIO_AMBA=m

#
# VFIO platform reset drivers
#
# CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET is not set
CONFIG_VFIO_PLATFORM_AMDXGBE_RESET=m
CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET=m
# end of VFIO platform reset drivers
# end of VFIO support for platform devices

# CONFIG_VFIO_CDX is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=m
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_VDPA is not set
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_INPUT is not set
# CONFIG_VIRTIO_MMIO is not set
# CONFIG_VIRTIO_DEBUG is not set
CONFIG_VIRTIO_RTC=m

#
# WARNING: Consider enabling VIRTIO_RTC_PTP and/or VIRTIO_RTC_CLASS.
#

#
# Enable PTP_1588_CLOCK in order to enable VIRTIO_RTC_PTP.
#
# CONFIG_VIRTIO_RTC_CLASS is not set
CONFIG_VDPA=y
CONFIG_MLX5_VDPA=y
CONFIG_MLX5_VDPA_STEERING_DEBUG=y
CONFIG_VHOST_IOTLB=y
CONFIG_VHOST_TASK=y
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_NET is not set
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_VDPA is not set
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL=y

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
CONFIG_GREYBUS_BEAGLEPLAY=m
CONFIG_GREYBUS_ES2=m
# CONFIG_COMEDI is not set
CONFIG_GPIB=m
CONFIG_GPIB_COMMON=m
# CONFIG_GPIB_AGILENT_82357A is not set
# CONFIG_GPIB_CB7210 is not set
CONFIG_GPIB_NI_USB=m
CONFIG_GPIB_FLUKE=m
# CONFIG_GPIB_GPIO is not set
# CONFIG_GPIB_INES is not set
CONFIG_GPIB_LPVO=m
CONFIG_GPIB_NEC7210=m
CONFIG_STAGING=y
CONFIG_OCTEON_ETHERNET=y

#
# IIO staging drivers
#

#
# Accelerometers
#
# end of Accelerometers

#
# Analog to digital converters
#
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set
# end of Analog digital bi-direction converters

#
# Direct Digital Synthesis
#
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=m
# end of Network Analyzer, Impedance Converters
# end of IIO staging drivers

# CONFIG_STAGING_MEDIA is not set
CONFIG_GREYBUS_AUDIO=m
CONFIG_GREYBUS_AUDIO_APB_CODEC=m
CONFIG_GREYBUS_BOOTROM=m
CONFIG_GREYBUS_HID=m
CONFIG_GREYBUS_LIGHT=m
CONFIG_GREYBUS_LOG=m
CONFIG_GREYBUS_LOOPBACK=m
CONFIG_GREYBUS_POWER=m
# CONFIG_GREYBUS_RAW is not set
CONFIG_GREYBUS_VIBRATOR=m
CONFIG_GREYBUS_BRIDGED_PHY=m
CONFIG_GREYBUS_GPIO=m
CONFIG_GREYBUS_I2C=m
# CONFIG_GREYBUS_PWM is not set
CONFIG_GREYBUS_SDIO=m
# CONFIG_GREYBUS_UART is not set
CONFIG_GREYBUS_USB=m
CONFIG_GREYBUS_ARCHE=m
CONFIG_SND_BCM2835=m
CONFIG_XIL_AXIS_FIFO=y
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=m
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_CZNIC_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_OLPC_XO175=y
# CONFIG_SURFACE_PLATFORMS is not set
CONFIG_ARM64_PLATFORM_DEVICES=y
# CONFIG_EC_HUAWEI_GAOKUN is not set
CONFIG_EC_LENOVO_YOGA_C630=m
CONFIG_EC_LENOVO_THINKPAD_T14S=m
CONFIG_BCM_VIDEOCORE=m
CONFIG_BCM2835_VCHIQ=m
CONFIG_VCHIQ_CDEV=y
CONFIG_BCM2835_VCHIQ_MMAL=m
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
# CONFIG_CLK_SP810 is not set
CONFIG_CLK_VEXPRESS_OSC=m
# end of Clock driver for ARM Reference designs

CONFIG_CLK_HSDK=y
# CONFIG_COMMON_CLK_APPLE_NCO is not set
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_MAX9485=m
# CONFIG_COMMON_CLK_RK808 is not set
CONFIG_COMMON_CLK_RP1=m
CONFIG_COMMON_CLK_SCMI=m
CONFIG_COMMON_CLK_SCPI=y
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=m
CONFIG_COMMON_CLK_SI514=y
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_SI570=m
CONFIG_COMMON_CLK_BM1880=y
CONFIG_COMMON_CLK_CDCE706=m
# CONFIG_COMMON_CLK_TPS68470 is not set
# CONFIG_COMMON_CLK_CDCE925 is not set
CONFIG_COMMON_CLK_CS2000_CP=m
# CONFIG_COMMON_CLK_EN7523 is not set
CONFIG_COMMON_CLK_EP93XX=y
# CONFIG_COMMON_CLK_EYEQ is not set
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
CONFIG_COMMON_CLK_GEMINI=y
CONFIG_COMMON_CLK_LAN966X=m
CONFIG_COMMON_CLK_ASPEED=y
# CONFIG_COMMON_CLK_S2MPS11 is not set
CONFIG_CLK_TWL=m
CONFIG_CLK_TWL6040=m
CONFIG_COMMON_CLK_AXI_CLKGEN=y
# CONFIG_CLK_QORIQ is not set
# CONFIG_CLK_LS1028A_PLLDIG is not set
# CONFIG_COMMON_CLK_XGENE is not set
CONFIG_COMMON_CLK_LOCHNAGAR=m
CONFIG_COMMON_CLK_NPCM8XX=y
CONFIG_COMMON_CLK_LOONGSON2=y
CONFIG_COMMON_CLK_NXP=y
CONFIG_COMMON_CLK_PALMAS=m
CONFIG_COMMON_CLK_PWM=m
CONFIG_COMMON_CLK_RS9_PCIE=m
CONFIG_COMMON_CLK_SI521XX=y
CONFIG_COMMON_CLK_VC3=m
CONFIG_COMMON_CLK_VC5=y
# CONFIG_COMMON_CLK_VC7 is not set
CONFIG_COMMON_CLK_STM32F=y
CONFIG_COMMON_CLK_STM32H7=y
# CONFIG_COMMON_CLK_MMP2_AUDIO is not set
CONFIG_COMMON_CLK_BD718XX=m
CONFIG_COMMON_CLK_FIXED_MMIO=y
CONFIG_COMMON_CLK_SP7021=y
CONFIG_COMMON_CLK_RPMI=m
# CONFIG_CLK_ACTIONS is not set
# CONFIG_CLK_BAIKAL_T1 is not set
CONFIG_CLK_BCM2711_DVP=m
CONFIG_CLK_BCM2835=y
CONFIG_CLK_BCM_63XX=y
CONFIG_CLK_BCM_63XX_GATE=y
# CONFIG_CLK_BCM63268_TIMER is not set
CONFIG_CLK_BCM_KONA=y
CONFIG_COMMON_CLK_IPROC=y
# CONFIG_CLK_BCM_CYGNUS is not set
CONFIG_CLK_BCM_HR2=y
CONFIG_CLK_BCM_NSP=y
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
CONFIG_CLK_RASPBERRYPI=y
# CONFIG_COMMON_CLK_HI3516CV300 is not set
# CONFIG_COMMON_CLK_HI3519 is not set
CONFIG_COMMON_CLK_HI3559A=y
# CONFIG_COMMON_CLK_HI3660 is not set
CONFIG_COMMON_CLK_HI3670=y
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
CONFIG_RESET_HISI=y
CONFIG_COMMON_CLK_BOSTON=y
CONFIG_MXC_CLK=y
CONFIG_CLK_VF610=y
CONFIG_CLK_IMX8MM=m
CONFIG_CLK_IMX8MN=y
CONFIG_CLK_IMX8MP=m
CONFIG_CLK_IMX8MQ=m
CONFIG_CLK_IMX8ULP=m
CONFIG_CLK_IMX93=m
CONFIG_CLK_IMX95_BLK_CTL=y
# CONFIG_CLK_IMXRT1050 is not set

#
# Ingenic SoCs drivers
#
CONFIG_INGENIC_CGU_COMMON=y
# CONFIG_INGENIC_CGU_JZ4740 is not set
CONFIG_INGENIC_CGU_JZ4755=y
# CONFIG_INGENIC_CGU_JZ4725B is not set
CONFIG_INGENIC_CGU_JZ4760=y
CONFIG_INGENIC_CGU_JZ4770=y
# CONFIG_INGENIC_CGU_JZ4780 is not set
# CONFIG_INGENIC_CGU_X1000 is not set
# CONFIG_INGENIC_CGU_X1830 is not set
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

CONFIG_COMMON_CLK_KEYSTONE=y
CONFIG_TI_SCI_CLK=m
CONFIG_TI_SCI_CLK_PROBE_FROM_FW=y
CONFIG_TI_SYSCON_CLK=y

#
# Clock driver for MediaTek SoC
#
CONFIG_COMMON_CLK_MEDIATEK=y
CONFIG_COMMON_CLK_MEDIATEK_FHCTL=y
CONFIG_COMMON_CLK_MT2701=y
CONFIG_COMMON_CLK_MT2701_MMSYS=y
# CONFIG_COMMON_CLK_MT2701_IMGSYS is not set
# CONFIG_COMMON_CLK_MT2701_VDECSYS is not set
# CONFIG_COMMON_CLK_MT2701_HIFSYS is not set
CONFIG_COMMON_CLK_MT2701_ETHSYS=y
# CONFIG_COMMON_CLK_MT2701_BDPSYS is not set
# CONFIG_COMMON_CLK_MT2701_AUDSYS is not set
CONFIG_COMMON_CLK_MT2701_G3DSYS=y
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6735 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
CONFIG_COMMON_CLK_MT6779=m
CONFIG_COMMON_CLK_MT6779_MMSYS=m
CONFIG_COMMON_CLK_MT6779_IMGSYS=m
CONFIG_COMMON_CLK_MT6779_IPESYS=m
# CONFIG_COMMON_CLK_MT6779_CAMSYS is not set
CONFIG_COMMON_CLK_MT6779_VDECSYS=m
CONFIG_COMMON_CLK_MT6779_VENCSYS=m
# CONFIG_COMMON_CLK_MT6779_MFGCFG is not set
CONFIG_COMMON_CLK_MT6779_AUDSYS=m
# CONFIG_COMMON_CLK_MT6795 is not set
CONFIG_COMMON_CLK_MT6797=y
# CONFIG_COMMON_CLK_MT6797_MMSYS is not set
CONFIG_COMMON_CLK_MT6797_IMGSYS=y
CONFIG_COMMON_CLK_MT6797_VDECSYS=y
# CONFIG_COMMON_CLK_MT6797_VENCSYS is not set
CONFIG_COMMON_CLK_MT7622=m
CONFIG_COMMON_CLK_MT7622_ETHSYS=m
CONFIG_COMMON_CLK_MT7622_HIFSYS=m
CONFIG_COMMON_CLK_MT7622_AUDSYS=m
CONFIG_COMMON_CLK_MT7629=y
CONFIG_COMMON_CLK_MT7629_ETHSYS=y
# CONFIG_COMMON_CLK_MT7629_HIFSYS is not set
# CONFIG_COMMON_CLK_MT7981 is not set
CONFIG_COMMON_CLK_MT7986=m
CONFIG_COMMON_CLK_MT7986_ETHSYS=m
# CONFIG_COMMON_CLK_MT7988 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
CONFIG_COMMON_CLK_MT8167=y
CONFIG_COMMON_CLK_MT8167_AUDSYS=y
CONFIG_COMMON_CLK_MT8167_IMGSYS=y
CONFIG_COMMON_CLK_MT8167_MFGCFG=m
CONFIG_COMMON_CLK_MT8167_MMSYS=m
CONFIG_COMMON_CLK_MT8167_VDECSYS=m
CONFIG_COMMON_CLK_MT8173=y
# CONFIG_COMMON_CLK_MT8173_IMGSYS is not set
CONFIG_COMMON_CLK_MT8173_MMSYS=m
CONFIG_COMMON_CLK_MT8173_VDECSYS=m
CONFIG_COMMON_CLK_MT8173_VENCSYS=m
CONFIG_COMMON_CLK_MT8183=m
CONFIG_COMMON_CLK_MT8183_AUDIOSYS=m
# CONFIG_COMMON_CLK_MT8183_CAMSYS is not set
# CONFIG_COMMON_CLK_MT8183_IMGSYS is not set
CONFIG_COMMON_CLK_MT8183_IPU_CORE0=m
# CONFIG_COMMON_CLK_MT8183_IPU_CORE1 is not set
# CONFIG_COMMON_CLK_MT8183_IPU_ADL is not set
# CONFIG_COMMON_CLK_MT8183_IPU_CONN is not set
# CONFIG_COMMON_CLK_MT8183_MFGCFG is not set
CONFIG_COMMON_CLK_MT8183_MMSYS=m
# CONFIG_COMMON_CLK_MT8183_VDECSYS is not set
CONFIG_COMMON_CLK_MT8183_VENCSYS=m
# CONFIG_COMMON_CLK_MT8186 is not set
CONFIG_COMMON_CLK_MT8188=y
CONFIG_COMMON_CLK_MT8188_ADSP_AUDIO26M=m
CONFIG_COMMON_CLK_MT8188_CAMSYS=m
CONFIG_COMMON_CLK_MT8188_IMGSYS=y
CONFIG_COMMON_CLK_MT8188_IMP_IIC_WRAP=y
CONFIG_COMMON_CLK_MT8188_IPESYS=y
CONFIG_COMMON_CLK_MT8188_MFGCFG=m
CONFIG_COMMON_CLK_MT8188_VDECSYS=y
CONFIG_COMMON_CLK_MT8188_VDOSYS=y
CONFIG_COMMON_CLK_MT8188_VENCSYS=y
CONFIG_COMMON_CLK_MT8188_VPPSYS=y
# CONFIG_COMMON_CLK_MT8188_WPESYS is not set
# CONFIG_COMMON_CLK_MT8192 is not set
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8196 is not set
CONFIG_COMMON_CLK_MT8365=m
# CONFIG_COMMON_CLK_MT8365_APU is not set
CONFIG_COMMON_CLK_MT8365_CAM=m
CONFIG_COMMON_CLK_MT8365_MFG=m
# CONFIG_COMMON_CLK_MT8365_MMSYS is not set
CONFIG_COMMON_CLK_MT8365_VDEC=m
CONFIG_COMMON_CLK_MT8365_VENC=m
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

CONFIG_COMMON_CLK_PXA1908=y

#
# Clock support for Amlogic platforms
#
# CONFIG_COMMON_CLK_MESON8B is not set
# CONFIG_COMMON_CLK_AXG_AUDIO is not set
# end of Clock support for Amlogic platforms

CONFIG_MSTAR_MSC313_CPUPLL=y
CONFIG_MSTAR_MSC313_MPLL=y
# CONFIG_MCHP_CLK_MPFS is not set
CONFIG_COMMON_CLK_NUVOTON=y
CONFIG_CLK_MA35D1=y
# CONFIG_COMMON_CLK_PISTACHIO is not set
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_CLK_MT7621 is not set
CONFIG_CLK_MTMIPS=y
# CONFIG_CLK_RENESAS is not set
# CONFIG_COMMON_CLK_SAMSUNG is not set
CONFIG_EXYNOS_ACPM_CLK=m
CONFIG_CLK_SIFIVE=y
# CONFIG_CLK_SIFIVE_PRCI is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
CONFIG_CLK_SOPHGO_CV1800=y
CONFIG_CLK_SOPHGO_SG2042_PLL=m
# CONFIG_CLK_SOPHGO_SG2042_CLKGEN is not set
# CONFIG_CLK_SOPHGO_SG2044 is not set
CONFIG_CLK_SOPHGO_SG2044_PLL=m
CONFIG_SPACEMIT_CCU=y
# CONFIG_SPACEMIT_K1_CCU is not set
CONFIG_SPRD_COMMON_CLK=m
CONFIG_SPRD_SC9860_CLK=m
CONFIG_SPRD_SC9863A_CLK=m
CONFIG_SPRD_UMS512_CLK=m
CONFIG_CLK_STARFIVE_JH71X0=y
# CONFIG_CLK_STARFIVE_JH7100 is not set
CONFIG_CLK_STARFIVE_JH7110_PLL=y
CONFIG_CLK_STARFIVE_JH7110_SYS=y
# CONFIG_CLK_STARFIVE_JH7110_AON is not set
CONFIG_CLK_STARFIVE_JH7110_STG=y
# CONFIG_CLK_SUNXI is not set
# CONFIG_SUNXI_CCU is not set
CONFIG_COMMON_CLK_STM32MP=y
CONFIG_COMMON_CLK_STM32MP135=y
# CONFIG_COMMON_CLK_STM32MP157 is not set
# CONFIG_COMMON_CLK_STM32MP215 is not set
# CONFIG_COMMON_CLK_STM32MP257 is not set
CONFIG_COMMON_CLK_TI_ADPLL=y
CONFIG_CLK_UNIPHIER=y
CONFIG_COMMON_CLK_VISCONTI=y
# CONFIG_CLK_LGM_CGU is not set
CONFIG_XILINX_VCU=y
CONFIG_COMMON_CLK_XLNX_CLKWZRD=m
CONFIG_COMMON_CLK_ZYNQMP=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
CONFIG_BCM2835_TIMER=y
# CONFIG_BCM_KONA_TIMER is not set
CONFIG_DAVINCI_TIMER=y
CONFIG_DIGICOLOR_TIMER=y
CONFIG_OMAP_DM_TIMER=y
# CONFIG_DW_APB_TIMER is not set
# CONFIG_ECONET_EN751221_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_IXP4XX_TIMER is not set
# CONFIG_ROCKCHIP_TIMER is not set
# CONFIG_ARMADA_370_XP_TIMER is not set
CONFIG_MESON6_TIMER=y
CONFIG_ORION_TIMER=y
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
# CONFIG_REALTEK_OTTO_TIMER is not set
CONFIG_SUN4I_TIMER=y
CONFIG_SUN5I_HSTIMER=y
# CONFIG_TEGRA_TIMER is not set
# CONFIG_TEGRA186_TIMER is not set
CONFIG_VT8500_TIMER=y
CONFIG_NPCM7XX_TIMER=y
# CONFIG_CADENCE_TTC_TIMER is not set
CONFIG_ASM9260_TIMER=y
CONFIG_CLKSRC_NOMADIK_MTU=y
CONFIG_CLKSRC_DBX500_PRCMU=y
CONFIG_CLPS711X_TIMER=y
CONFIG_MXS_TIMER=y
CONFIG_NSPIRE_TIMER=y
# CONFIG_KEYSTONE_TIMER is not set
CONFIG_INTEGRATOR_AP_TIMER=y
CONFIG_CLKSRC_LPC32XX=y
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_TI_32K=y
CONFIG_CLKSRC_STM32=y
CONFIG_CLKSRC_STM32_LP=y
CONFIG_CLKSRC_MPS2=y
CONFIG_ARC_TIMERS=y
CONFIG_ARC_TIMERS_64BIT=y
CONFIG_ARM_GLOBAL_TIMER=y
CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=0
CONFIG_ARM_TIMER_SP804=y
CONFIG_CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK=y
CONFIG_ARMV7M_SYSTICK=y
# CONFIG_ATMEL_PIT is not set
CONFIG_ATMEL_ST=y
CONFIG_ATMEL_TCB_CLKSRC=y
# CONFIG_CLKSRC_EXYNOS_MCT is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
CONFIG_FSL_FTM_TIMER=y
CONFIG_NXP_PIT_TIMER=y
# CONFIG_MTK_TIMER is not set
# CONFIG_MTK_CPUX_TIMER is not set
CONFIG_CLKSRC_JCORE_PIT=y
CONFIG_SH_TIMER_CMT=y
# CONFIG_SH_TIMER_MTU2 is not set
CONFIG_RENESAS_OSTM=y
CONFIG_SH_TIMER_TMU=y
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_QCOM is not set
# CONFIG_CLKSRC_VERSATILE is not set
CONFIG_CLKSRC_PXA=y
CONFIG_CLKSRC_IMX_GPT=y
# CONFIG_CLKSRC_IMX_TPM is not set
CONFIG_TIMER_IMX_SYS_CTR=y
# CONFIG_CLKSRC_LOONGSON1_PWM is not set
CONFIG_CLKSRC_ST_LPC=y
# CONFIG_GXP_TIMER is not set
# CONFIG_MILBEAUT_TIMER is not set
CONFIG_MSC313E_TIMER=y
# CONFIG_INGENIC_TIMER is not set
CONFIG_INGENIC_SYSOST=y
# CONFIG_INGENIC_OST is not set
# CONFIG_MICROCHIP_PIT64B is not set
# CONFIG_GOLDFISH_TIMER is not set
# CONFIG_RALINK_TIMER is not set
# CONFIG_NXP_STM_TIMER is not set
# CONFIG_RTK_SYSTIMER is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_ARM_MHU=y
CONFIG_ARM_MHU_V2=m
CONFIG_ARM_MHU_V3=m
CONFIG_AST2700_MBOX=y
# CONFIG_CV1800_MBOX is not set
# CONFIG_EXYNOS_MBOX is not set
CONFIG_IMX_MBOX=m
CONFIG_PLATFORM_MHU=y
# CONFIG_PL320_MBOX is not set
CONFIG_ARMADA_37XX_RWTM_MBOX=m
CONFIG_OMAP2PLUS_MBOX=y
# CONFIG_ROCKCHIP_MBOX is not set
CONFIG_ALTERA_MBOX=y
CONFIG_TI_MESSAGE_MANAGER=m
CONFIG_MAILBOX_TEST=y
CONFIG_POLARFIRE_SOC_MAILBOX=m
# CONFIG_QCOM_APCS_IPC is not set
CONFIG_BCM_PDC_MBOX=m
CONFIG_STM32_IPCC=m
# CONFIG_MTK_ADSP_MBOX is not set
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_MTK_GPUEB_MBOX=m
CONFIG_SUN6I_MSGBOX=m
# CONFIG_SPRD_MBOX is not set
CONFIG_QCOM_IPCC=m
CONFIG_THEAD_TH1520_MBOX=m
CONFIG_CIX_MBOX=m
# CONFIG_BCM74110_MAILBOX is not set
CONFIG_IOMMU_IOVA=m
CONFIG_IOMMU_API=y
CONFIG_GENERIC_PT=y
# CONFIG_DEBUG_GENERIC_PT is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
CONFIG_REMOTEPROC_CDEV=y
CONFIG_INGENIC_VPU_RPROC=y
CONFIG_MTK_SCP=y
CONFIG_MESON_MX_AO_ARC_REMOTEPROC=y
CONFIG_PRU_REMOTEPROC=m
# CONFIG_RCAR_REMOTEPROC is not set
CONFIG_STM32_RPROC=y
# CONFIG_TI_K3_DSP_REMOTEPROC is not set
CONFIG_TI_K3_M4_REMOTEPROC=m
# CONFIG_TI_K3_R5_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CHAR is not set
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_MTK_SCP=y
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=y
CONFIG_MESON_CLK_MEASURE=y
CONFIG_MESON_GX_SOCINFO=y
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=y
CONFIG_ASPEED_LPC_SNOOP=y
# CONFIG_ASPEED_UART_ROUTING is not set
CONFIG_ASPEED_P2A_CTRL=m
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
CONFIG_SOC_BRCMSTB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
CONFIG_FSL_GUTS=y
CONFIG_DPAA2_CONSOLE=y
CONFIG_FSL_RCPM=y
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# Hisilicon SoC drivers
#
# end of Hisilicon SoC drivers

#
# i.MX SoC drivers
#
CONFIG_SOC_IMX8M=y
CONFIG_SOC_IMX9=m
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

CONFIG_LOONGSON2_GUTS=y

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=y
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=y
CONFIG_MTK_REGULATOR_COUPLER=y
CONFIG_MTK_MMSYS=y
CONFIG_MTK_SVS=m
CONFIG_MTK_SOCINFO=m
# end of MediaTek SoC drivers

# CONFIG_POLARFIRE_SOC_SYS_CTRL is not set
CONFIG_WPCM450_SOC=m

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_AOSS_QMP is not set
CONFIG_QCOM_COMMAND_DB=y
# CONFIG_QCOM_GENI_SE is not set
CONFIG_QCOM_GSBI=y
# CONFIG_QCOM_LLCC is not set
CONFIG_QCOM_PDR_HELPERS=m
CONFIG_QCOM_PDR_MSG=m
CONFIG_QCOM_QMI_HELPERS=m
CONFIG_QCOM_RAMP_CTRL=m
# CONFIG_QCOM_RMTFS_MEM is not set
CONFIG_QCOM_RPM_MASTER_STATS=m
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
CONFIG_QCOM_WCNSS_CTRL=m
CONFIG_QCOM_APR=m
CONFIG_QCOM_ICC_BWMON=m
CONFIG_QCOM_PBS=m
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
# CONFIG_PWC_RZV2M is not set
# CONFIG_RST_RCAR is not set
CONFIG_SYSC_RZ=y
CONFIG_SYSC_R9A08G045=y
CONFIG_SYS_R9A09G047=y
CONFIG_SYS_R9A09G056=y
# CONFIG_SYS_R9A09G057 is not set
CONFIG_ROCKCHIP_GRF=y
CONFIG_ROCKCHIP_IODOMAIN=m
# CONFIG_SOC_SAMSUNG is not set

#
# Sophgo SoC drivers
#
CONFIG_SOPHGO_CV1800_RTCSYS=y
# CONFIG_SOPHGO_SG2044_TOPSYS is not set
# end of Sophgo SoC drivers

CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
CONFIG_SOC_TI=y
CONFIG_TI_PRUSS=y
# CONFIG_UX500_SOC_ID is not set
CONFIG_SOC_INTEGRATOR_CM=y
# CONFIG_SOC_REALVIEW is not set

#
# VIA/WonderMedia SoC drivers
#
CONFIG_WMT_SOCINFO=y
# end of VIA/WonderMedia SoC drivers

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

#
# PM Domains
#
CONFIG_OWL_PM_DOMAINS_HELPER=y
CONFIG_OWL_PM_DOMAINS=y

#
# Amlogic PM Domains
#
CONFIG_MESON_EE_PM_DOMAINS=y
# end of Amlogic PM Domains

CONFIG_APPLE_PMGR_PWRSTATE=y
# CONFIG_ARM_SCMI_PERF_DOMAIN is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=m
CONFIG_ARM_SCPI_POWER_DOMAIN=m

#
# Broadcom PM Domains
#
CONFIG_BCM2835_POWER=y
# CONFIG_BCM_PMB is not set
CONFIG_BCM63XX_POWER=y
# end of Broadcom PM Domains

#
# i.MX PM Domains
#
# CONFIG_IMX_GPCV2_PM_DOMAINS is not set
CONFIG_IMX_SCU_PD=y
# end of i.MX PM Domains

#
# Marvell PM Domains
#
CONFIG_PXA1908_PM_DOMAINS=y
# end of Marvell PM Domains

#
# MediaTek PM Domains
#
# CONFIG_MTK_SCPSYS is not set
# CONFIG_MTK_SCPSYS_PM_DOMAINS is not set
# CONFIG_MTK_MFG_PM_DOMAIN is not set
# end of MediaTek PM Domains

#
# Qualcomm PM Domains
#
# end of Qualcomm PM Domains

#
# Renesas PM Domains
#
CONFIG_SYSC_RCAR=y
CONFIG_SYSC_RCAR_GEN4=y
# CONFIG_SYSC_RMOBILE is not set
CONFIG_SYSC_R8A7742=y
CONFIG_SYSC_R8A7743=y
# CONFIG_SYSC_R8A7745 is not set
# CONFIG_SYSC_R8A77470 is not set
CONFIG_SYSC_R8A774A1=y
# CONFIG_SYSC_R8A774B1 is not set
# CONFIG_SYSC_R8A774C0 is not set
# CONFIG_SYSC_R8A774E1 is not set
CONFIG_SYSC_R8A7779=y
# CONFIG_SYSC_R8A7790 is not set
CONFIG_SYSC_R8A7791=y
CONFIG_SYSC_R8A7792=y
# CONFIG_SYSC_R8A7794 is not set
CONFIG_SYSC_R8A7795=y
CONFIG_SYSC_R8A77960=y
# CONFIG_SYSC_R8A77961 is not set
CONFIG_SYSC_R8A77965=y
CONFIG_SYSC_R8A77970=y
CONFIG_SYSC_R8A77980=y
CONFIG_SYSC_R8A77990=y
CONFIG_SYSC_R8A77995=y
# CONFIG_SYSC_R8A779A0 is not set
# CONFIG_SYSC_R8A779F0 is not set
CONFIG_SYSC_R8A779G0=y
# CONFIG_SYSC_R8A779H0 is not set
# end of Renesas PM Domains

# CONFIG_UX500_PM_DOMAIN is not set
# CONFIG_JH71XX_PMU is not set
CONFIG_SUN20I_PPU=m
CONFIG_SUN50I_H6_PRCM_PPU=y
# CONFIG_SUN55I_PCK600 is not set
CONFIG_TI_SCI_PM_DOMAINS=m
# end of PM Domains

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=m
CONFIG_DEVFREQ_GOV_PASSIVE=y

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
CONFIG_ARM_TEGRA_DEVFREQ=m
CONFIG_ARM_MEDIATEK_CCI_DEVFREQ=m
CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ=m
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
# CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU is not set
CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
CONFIG_EXTCON_FSA9480=y
CONFIG_EXTCON_GPIO=y
# CONFIG_EXTCON_LC824206XA is not set
CONFIG_EXTCON_MAX14577=m
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
CONFIG_EXTCON_MAX77843=y
CONFIG_EXTCON_MAX14526=m
# CONFIG_EXTCON_PALMAS is not set
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_QCOM_SPMI_MISC=m
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=y
# CONFIG_EXTCON_USB_GPIO is not set
CONFIG_EXTCON_USBC_TUSB320=m
CONFIG_EXTCON_RTK_TYPE_C=m
CONFIG_MEMORY=y
CONFIG_DDR=y
CONFIG_ARM_PL172_MPMC=y
CONFIG_ATMEL_EBI=y
CONFIG_BRCMSTB_DPFE=m
# CONFIG_BRCMSTB_MEMC is not set
CONFIG_BT1_L2_CTL=y
CONFIG_TI_AEMIF=y
CONFIG_TI_EMIF=y
CONFIG_OMAP_GPMC=m
CONFIG_OMAP_GPMC_DEBUG=y
CONFIG_FPGA_DFL_EMIF=m
# CONFIG_MVEBU_DEVBUS is not set
# CONFIG_FSL_CORENET_CF is not set
CONFIG_FSL_IFC=y
CONFIG_JZ4780_NEMC=y
CONFIG_MTK_SMI=m
CONFIG_DA8XX_DDRCTL=y
CONFIG_PL353_SMC=m
CONFIG_RENESAS_RPCIF=m
CONFIG_STM32_FMC2_EBI=m
CONFIG_STM32_OMM=m
# CONFIG_SAMSUNG_MC is not set
CONFIG_TEGRA_MC=y
# CONFIG_TEGRA20_EMC is not set
CONFIG_TEGRA30_EMC=m
CONFIG_TEGRA124_EMC=m
CONFIG_TEGRA210_EMC_TABLE=y
CONFIG_TEGRA210_EMC=y
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_GTS_HELPER=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=m
CONFIG_IIO_BACKEND=y

#
# Accelerometers
#
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
CONFIG_ADXL345=m
CONFIG_ADXL345_I2C=m
CONFIG_ADXL355=y
CONFIG_ADXL355_I2C=y
CONFIG_ADXL367=m
CONFIG_ADXL367_I2C=m
CONFIG_ADXL372=m
CONFIG_ADXL372_I2C=m
CONFIG_ADXL380=m
CONFIG_ADXL380_I2C=m
CONFIG_BMA180=y
# CONFIG_BMA220 is not set
CONFIG_BMA400=m
CONFIG_BMA400_I2C=m
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
# CONFIG_BMI088_ACCEL is not set
# CONFIG_DA280 is not set
CONFIG_DA311=y
CONFIG_DMARD06=m
CONFIG_DMARD09=y
# CONFIG_DMARD10 is not set
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_HID_SENSOR_ACCEL_3D=m
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_IIO_KX022A=m
CONFIG_IIO_KX022A_I2C=m
# CONFIG_KXSD9 is not set
CONFIG_KXCJK1013=y
CONFIG_MC3230=y
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
CONFIG_MMA7660=m
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=m
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=m
# CONFIG_MSA311 is not set
# CONFIG_MXC4005 is not set
# CONFIG_MXC6255 is not set
CONFIG_STK8312=m
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_IIO_ADC_HELPER=y
CONFIG_88PM886_GPADC=m
CONFIG_AD7091R=m
CONFIG_AD7091R5=m
# CONFIG_AD7291 is not set
CONFIG_AD7405=m
CONFIG_AD7606=y
CONFIG_AD7606_IFACE_PARALLEL=y
# CONFIG_AD7625 is not set
# CONFIG_AD799X is not set
# CONFIG_ADI_AXI_ADC is not set
CONFIG_ASPEED_ADC=m
CONFIG_AT91_ADC=m
CONFIG_AT91_SAMA5D2_ADC=y
CONFIG_AXP20X_ADC=m
CONFIG_AXP288_ADC=m
CONFIG_BCM_IPROC_ADC=m
# CONFIG_BERLIN2_ADC is not set
# CONFIG_CC10001_ADC is not set
# CONFIG_DLN2_ADC is not set
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_EP93XX_ADC=y
CONFIG_EXYNOS_ADC=y
CONFIG_MXS_LRADC_ADC=y
CONFIG_FSL_MX25_ADC=m
CONFIG_GEHC_PMC_ADC=y
# CONFIG_HX711 is not set
# CONFIG_INA2XX_ADC is not set
# CONFIG_INGENIC_ADC is not set
CONFIG_IMX7D_ADC=m
CONFIG_IMX8QXP_ADC=m
CONFIG_IMX93_ADC=m
CONFIG_LPC18XX_ADC=y
CONFIG_LPC32XX_ADC=y
CONFIG_LTC2309=m
CONFIG_LTC2471=m
CONFIG_LTC2485=y
CONFIG_LTC2497=m
CONFIG_MAX1363=m
CONFIG_MAX34408=y
CONFIG_MAX9611=y
CONFIG_MCP3422=y
# CONFIG_MEDIATEK_MT6360_ADC is not set
CONFIG_MEDIATEK_MT6577_AUXADC=m
# CONFIG_MESON_SARADC is not set
CONFIG_MP2629_ADC=m
# CONFIG_NAU7802 is not set
CONFIG_NCT7201=m
CONFIG_NPCM_ADC=y
# CONFIG_PAC1921 is not set
CONFIG_PAC1934=m
# CONFIG_PALMAS_GPADC is not set
CONFIG_QCOM_VADC_COMMON=m
# CONFIG_QCOM_PM8XXX_XOADC is not set
# CONFIG_QCOM_SPMI_RRADC is not set
CONFIG_QCOM_SPMI_IADC=m
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=m
CONFIG_RCAR_GYRO_ADC=y
CONFIG_RN5T618_ADC=m
CONFIG_ROHM_BD79124=m
# CONFIG_ROCKCHIP_SARADC is not set
CONFIG_RICHTEK_RTQ6056=y
CONFIG_RZG2L_ADC=m
CONFIG_RZN1_ADC=y
# CONFIG_RZT2H_ADC is not set
CONFIG_SC27XX_ADC=y
CONFIG_SOPHGO_CV1800B_ADC=y
CONFIG_SPEAR_ADC=m
CONFIG_SD_ADC_MODULATOR=m
# CONFIG_STM32_ADC_CORE is not set
CONFIG_STM32_DFSDM_CORE=y
# CONFIG_STM32_DFSDM_ADC is not set
# CONFIG_SUN4I_GPADC is not set
CONFIG_SUN20I_GPADC=y
# CONFIG_TI_ADC081C is not set
CONFIG_TI_ADS1015=y
# CONFIG_TI_ADS1100 is not set
# CONFIG_TI_ADS1119 is not set
CONFIG_TI_ADS7138=m
# CONFIG_TI_ADS7924 is not set
CONFIG_TWL4030_MADC=m
CONFIG_TWL6030_GPADC=m
CONFIG_VF610_ADC=m
CONFIG_VIPERBOARD_ADC=m
CONFIG_XILINX_XADC=y
CONFIG_XILINX_AMS=m
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_HMC425 is not set
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=m
CONFIG_AD7746=m
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_AOSONG_AGS02MA is not set
CONFIG_ATLAS_PH_SENSOR=m
# CONFIG_ATLAS_EZO_SENSOR is not set
# CONFIG_BME680 is not set
CONFIG_CCS811=y
CONFIG_ENS160=y
CONFIG_ENS160_I2C=y
# CONFIG_IAQCORE is not set
CONFIG_MHZ19B=m
CONFIG_PMS7003=m
CONFIG_SCD30_CORE=m
CONFIG_SCD30_I2C=m
CONFIG_SCD30_SERIAL=m
CONFIG_SCD4X=m
CONFIG_SEN0322=y
CONFIG_SENSIRION_SGP30=y
# CONFIG_SENSIRION_SGP40 is not set
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
# CONFIG_SPS30_SERIAL is not set
CONFIG_SENSEAIR_SUNRISE_CO2=m
CONFIG_VZ89X=y
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

CONFIG_IIO_INV_SENSORS_TIMESTAMP=y
CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
CONFIG_IIO_SCMI=m
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD3552R_HS=m
CONFIG_AD3552R_LIB=m
CONFIG_AD5064=m
CONFIG_AD5380=y
CONFIG_AD5446=y
CONFIG_AD5446_I2C=y
# CONFIG_AD5593R is not set
# CONFIG_ADI_AXI_DAC is not set
CONFIG_AD5686=m
CONFIG_AD5696_I2C=m
# CONFIG_DPOT_DAC is not set
# CONFIG_DS4424 is not set
CONFIG_LPC18XX_DAC=y
CONFIG_M62332=y
# CONFIG_MAX517 is not set
CONFIG_MAX5821=m
# CONFIG_MCP4725 is not set
# CONFIG_MCP4728 is not set
CONFIG_STM32_DAC=y
CONFIG_STM32_DAC_CORE=y
CONFIG_TI_DAC5571=y
# CONFIG_VF610_DAC is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADMFM2000 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
CONFIG_HID_SENSOR_GYRO_3D=m
# CONFIG_MPU3050_I2C is not set
CONFIG_IIO_ST_GYRO_3AXIS=y
# CONFIG_IIO_ST_GYRO_I2C_3AXIS is not set
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4404 is not set
CONFIG_MAX30100=y
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
CONFIG_DHT11=m
# CONFIG_ENS210 is not set
CONFIG_HDC100X=m
# CONFIG_HDC2010 is not set
CONFIG_HDC3020=y
# CONFIG_HID_SENSOR_HUMIDITY is not set
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
CONFIG_HTU21=y
# CONFIG_SI7005 is not set
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_BMI160_I2C is not set
CONFIG_BMI270=y
CONFIG_BMI270_I2C=y
CONFIG_BMI323=m
CONFIG_BMI323_I2C=m
CONFIG_BOSCH_BNO055=m
# CONFIG_BOSCH_BNO055_SERIAL is not set
CONFIG_BOSCH_BNO055_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
CONFIG_KMX61=m
CONFIG_INV_ICM42600=y
CONFIG_INV_ICM42600_I2C=y
CONFIG_INV_ICM45600=y
CONFIG_INV_ICM45600_I2C=m
CONFIG_INV_ICM45600_I3C=y
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
CONFIG_SMI330=m
CONFIG_SMI330_I2C=m
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=m
# CONFIG_IIO_ST_LSM6DSX_I3C is not set
CONFIG_IIO_ST_LSM9DS0=m
CONFIG_IIO_ST_LSM9DS0_I2C=m
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=y
CONFIG_AL3000A=m
# CONFIG_AL3010 is not set
# CONFIG_AL3320A is not set
CONFIG_APDS9160=y
CONFIG_APDS9300=y
# CONFIG_APDS9306 is not set
CONFIG_APDS9960=y
CONFIG_AS73211=y
CONFIG_BH1745=m
# CONFIG_BH1750 is not set
# CONFIG_BH1780 is not set
CONFIG_CM32181=y
CONFIG_CM3232=m
# CONFIG_CM3323 is not set
# CONFIG_CM3605 is not set
CONFIG_CM36651=m
CONFIG_GP2AP002=m
# CONFIG_GP2AP020A00F is not set
CONFIG_IQS621_ALS=m
# CONFIG_SENSORS_ISL29018 is not set
# CONFIG_SENSORS_ISL29028 is not set
# CONFIG_ISL29125 is not set
CONFIG_ISL76682=y
CONFIG_HID_SENSOR_ALS=m
# CONFIG_HID_SENSOR_PROX is not set
CONFIG_JSA1212=m
CONFIG_ROHM_BU27034=y
CONFIG_RPR0521=m
# CONFIG_SENSORS_LM3533 is not set
# CONFIG_LTR390 is not set
CONFIG_LTR501=y
# CONFIG_LTRF216A is not set
CONFIG_LV0104CS=m
CONFIG_MAX44000=y
CONFIG_MAX44009=m
# CONFIG_NOA1305 is not set
CONFIG_OPT3001=y
# CONFIG_OPT4001 is not set
CONFIG_OPT4060=m
CONFIG_PA12203001=m
CONFIG_SI1133=y
# CONFIG_SI1145 is not set
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=y
CONFIG_SENSORS_TSL2563=y
# CONFIG_TSL2583 is not set
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=m
# CONFIG_TSL4531 is not set
# CONFIG_US5182D is not set
# CONFIG_VCNL4000 is not set
CONFIG_VCNL4035=m
CONFIG_VEML3235=y
# CONFIG_VEML6030 is not set
CONFIG_VEML6040=m
CONFIG_VEML6046X00=m
# CONFIG_VEML6070 is not set
CONFIG_VEML6075=m
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AF8133J=m
# CONFIG_AK8974 is not set
# CONFIG_AK8975 is not set
# CONFIG_AK09911 is not set
CONFIG_ALS31300=m
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
CONFIG_MAG3110=m
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
# CONFIG_MMC35240 is not set
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_INFINEON_TLV493D=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
# CONFIG_SI7210 is not set
# CONFIG_TI_TMAG5273 is not set
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=m
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_STM32_LPTIMER_TRIGGER=m
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# CONFIG_IQS624_POS is not set
# CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
# CONFIG_AD5272 is not set
CONFIG_DS1803=m
CONFIG_MAX5432=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=y
CONFIG_TPL0102=m
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=y
CONFIG_ROHM_BM1390=y
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_DLHL60D=m
CONFIG_DPS310=y
CONFIG_HID_SENSOR_PRESS=m
# CONFIG_HP03 is not set
CONFIG_HSC030PA=m
CONFIG_HSC030PA_I2C=m
CONFIG_ICP10100=y
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
# CONFIG_MPL3115 is not set
# CONFIG_MPRLS0025PA is not set
CONFIG_MS5611=y
# CONFIG_MS5611_I2C is not set
CONFIG_MS5637=m
CONFIG_SDP500=y
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=m
CONFIG_HP206C=y
CONFIG_ZPA2326=y
CONFIG_ZPA2326_I2C=y
CONFIG_ADP810=y
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_D3323AA is not set
CONFIG_HX9023S=m
CONFIG_IRSD200=y
# CONFIG_ISL29501 is not set
CONFIG_LIDAR_LITE_V2=y
# CONFIG_MB1232 is not set
CONFIG_PING=y
CONFIG_RFD77402=y
CONFIG_SRF04=m
CONFIG_SX_COMMON=y
CONFIG_SX9310=y
CONFIG_SX9324=y
CONFIG_SX9360=y
# CONFIG_SX9500 is not set
CONFIG_SRF08=y
CONFIG_VCNL3020=y
# CONFIG_VL53L0X_I2C is not set
CONFIG_AW96103=m
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=m
CONFIG_HID_SENSOR_TEMP=m
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=y
CONFIG_MLX90635=m
# CONFIG_TMP006 is not set
CONFIG_TMP007=y
# CONFIG_TMP117 is not set
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=y
CONFIG_MAX30208=m
CONFIG_MCP9600=y
# end of Temperature sensors

CONFIG_PWM=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_PROVIDE_GPIO=y
# CONFIG_PWM_ADP5585 is not set
CONFIG_PWM_AIROHA=y
CONFIG_PWM_APPLE=y
CONFIG_PWM_ARGON_FAN_HAT=m
CONFIG_PWM_ATMEL=y
CONFIG_PWM_ATMEL_HLCDC_PWM=m
CONFIG_PWM_ATMEL_TCB=m
CONFIG_PWM_AXI_PWMGEN=y
CONFIG_PWM_BCM2835=m
CONFIG_PWM_BCM_IPROC=y
# CONFIG_PWM_BCM_KONA is not set
CONFIG_PWM_BERLIN=y
# CONFIG_PWM_BRCMSTB is not set
# CONFIG_PWM_CLK is not set
CONFIG_PWM_CLPS711X=m
CONFIG_PWM_CRC=y
CONFIG_PWM_EP93XX=y
# CONFIG_PWM_FSL_FTM is not set
CONFIG_PWM_HIBVT=m
CONFIG_PWM_IMG=m
CONFIG_PWM_IMX1=y
# CONFIG_PWM_IMX27 is not set
CONFIG_PWM_IMX_TPM=y
CONFIG_PWM_INTEL_LGM=y
# CONFIG_PWM_IQS620A is not set
# CONFIG_PWM_JZ4740 is not set
CONFIG_PWM_KEEMBAY=m
# CONFIG_PWM_LOONGSON is not set
CONFIG_PWM_LPC18XX_SCT=m
CONFIG_PWM_LPC32XX=y
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PLATFORM=m
CONFIG_PWM_MAX7360=m
# CONFIG_PWM_MEDIATEK is not set
CONFIG_PWM_MESON=y
CONFIG_PWM_MICROCHIP_CORE=y
CONFIG_PWM_MTK_DISP=m
CONFIG_PWM_MXS=y
# CONFIG_PWM_OMAP_DMTIMER is not set
CONFIG_PWM_PCA9685=y
CONFIG_PWM_PXA=y
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RENESAS_RCAR is not set
CONFIG_PWM_RENESAS_RZG2L_GPT=y
CONFIG_PWM_RENESAS_TPU=y
CONFIG_PWM_ROCKCHIP=m
CONFIG_PWM_SAMSUNG=m
# CONFIG_PWM_SIFIVE is not set
CONFIG_PWM_SL28CPLD=y
# CONFIG_PWM_SOPHGO_SG2042 is not set
# CONFIG_PWM_SPEAR is not set
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STI is not set
CONFIG_PWM_STM32=m
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_SUN4I is not set
CONFIG_PWM_SUNPLUS=y
# CONFIG_PWM_TEGRA is not set
CONFIG_PWM_TIECAP=y
CONFIG_PWM_TIEHRPWM=y
CONFIG_PWM_TWL=y
CONFIG_PWM_TWL_LED=m
# CONFIG_PWM_VISCONTI is not set
# CONFIG_PWM_VT8500 is not set
CONFIG_PWM_XILINX=m

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_ARM_NVIC=y
CONFIG_IRQ_MSI_LIB=y
CONFIG_AL_FIC=y
CONFIG_BCM7038_L1_IRQ=m
# CONFIG_BCM7120_L2_IRQ is not set
# CONFIG_BRCMSTB_L2_IRQ is not set
# CONFIG_LAN966X_OIC is not set
CONFIG_MADERA_IRQ=m
# CONFIG_JCORE_AIC is not set
CONFIG_RENESAS_INTC_IRQPIN=y
CONFIG_RENESAS_IRQC=y
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_RENESAS_RZV2H_ICU is not set
CONFIG_SL28CPLD_INTC=y
CONFIG_TS4800_IRQ=y
# CONFIG_XILINX_INTC is not set
CONFIG_INGENIC_TCU_IRQ=y
CONFIG_STM32MP_EXTI=y
CONFIG_STM32_EXTI=y
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_MESON_IRQ_GPIO=y
# CONFIG_IMX_IRQSTEER is not set
CONFIG_IMX_INTMUX=y
CONFIG_IMX_MU_MSI=m
CONFIG_TI_SCI_INTR_IRQCHIP=m
CONFIG_TI_PRUSS_INTC=y
CONFIG_STARFIVE_JH8100_INTC=y
CONFIG_EXYNOS_IRQ_COMBINER=y
CONFIG_MST_IRQ=y
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_ARCH_HAS_RESET_CONTROLLER=y
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
CONFIG_RESET_ASPEED=m
CONFIG_RESET_ATH79=y
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
CONFIG_RESET_BRCMSTB_RESCAL=m
CONFIG_RESET_EIC7700=y
CONFIG_RESET_EYEQ=y
# CONFIG_RESET_GPIO is not set
CONFIG_RESET_HSDK=y
# CONFIG_RESET_IMX7 is not set
CONFIG_RESET_IMX8MP_AUDIOMIX=y
CONFIG_RESET_INTEL_GW=y
# CONFIG_RESET_K210 is not set
# CONFIG_RESET_K230 is not set
# CONFIG_RESET_LANTIQ is not set
CONFIG_RESET_LPC18XX=y
CONFIG_RESET_MCHP_SPARX5=y
# CONFIG_RESET_NPCM is not set
CONFIG_RESET_NUVOTON_MA35D1=y
CONFIG_RESET_PISTACHIO=y
# CONFIG_RESET_QCOM_AOSS is not set
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_RASPBERRYPI=m
CONFIG_RESET_RZG2L_USBPHY_CTRL=m
CONFIG_RESET_RZV2H_USB2PHY=m
# CONFIG_RESET_SCMI is not set
CONFIG_RESET_SIMPLE=y
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_SPACEMIT is not set
# CONFIG_RESET_SUNPLUS is not set
CONFIG_RESET_SUNXI=y
# CONFIG_RESET_TH1520 is not set
# CONFIG_RESET_TI_SCI is not set
CONFIG_RESET_TI_SYSCON=y
CONFIG_RESET_TI_TPS380X=m
CONFIG_RESET_TN48M_CPLD=m
CONFIG_RESET_UNIPHIER=y
# CONFIG_RESET_UNIPHIER_GLUE is not set
# CONFIG_RESET_ZYNQ is not set
CONFIG_RESET_ZYNQMP=y
CONFIG_RESET_MESON_COMMON=y
CONFIG_RESET_MESON=y
CONFIG_RESET_MESON_AUX=m
# CONFIG_RESET_MESON_AUDIO_ARB is not set
CONFIG_RESET_STARFIVE_JH71X0=y
CONFIG_RESET_STARFIVE_JH7100=y
CONFIG_RESET_STARFIVE_JH7110=y
# CONFIG_STIH407_RESET is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set
# CONFIG_RESET_TEGRA_BPMP is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_LPC18XX_USB_OTG=m
# CONFIG_PHY_PISTACHIO_USB is not set
CONFIG_PHY_SNPS_EUSB2=y
# CONFIG_PHY_XGENE is not set
CONFIG_USB_LGM_PHY=y
CONFIG_PHY_CAN_TRANSCEIVER=m
CONFIG_PHY_AIROHA_PCIE=m
CONFIG_PHY_NXP_PTN3222=m
CONFIG_PHY_SUN4I_USB=m
CONFIG_PHY_SUN6I_MIPI_DPHY=y
# CONFIG_PHY_SUN9I_USB is not set
CONFIG_PHY_SUN50I_USB3=m
CONFIG_PHY_MESON8_HDMI_TX=m
CONFIG_PHY_MESON8B_USB2=y
CONFIG_PHY_MESON_GXL_USB2=y
# CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG is not set
# CONFIG_PHY_MESON_G12A_USB2 is not set
CONFIG_PHY_MESON_G12A_USB3_PCIE=m
CONFIG_PHY_MESON_AXG_PCIE=m
CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG=y
# CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set

#
# PHY drivers for Broadcom platforms
#
CONFIG_PHY_BCM63XX_USBH=y
CONFIG_PHY_CYGNUS_PCIE=m
CONFIG_PHY_BCM_SR_USB=y
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_BCM_NS_USB2 is not set
CONFIG_PHY_BCM_NS_USB3=m
CONFIG_PHY_NS2_PCIE=y
# CONFIG_PHY_NS2_USB_DRD is not set
CONFIG_PHY_BRCM_SATA=y
CONFIG_PHY_BRCM_USB=m
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_CADENCE_TORRENT=y
CONFIG_PHY_CADENCE_DPHY=y
CONFIG_PHY_CADENCE_DPHY_RX=y
CONFIG_PHY_CADENCE_SIERRA=y
# CONFIG_PHY_CADENCE_SALVO is not set
CONFIG_PHY_FSL_IMX8MQ_USB=y
CONFIG_PHY_MIXEL_LVDS_PHY=m
CONFIG_PHY_MIXEL_MIPI_DPHY=y
# CONFIG_PHY_FSL_IMX8M_PCIE is not set
# CONFIG_PHY_FSL_IMX8QM_HSIO is not set
CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=y
CONFIG_PHY_FSL_LYNX_28G=m
CONFIG_PHY_HI6220_USB=m
# CONFIG_PHY_HI3660_USB is not set
CONFIG_PHY_HI3670_USB=y
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
CONFIG_PHY_HISI_INNO_USB2=y
CONFIG_PHY_INGENIC_USB=y
CONFIG_PHY_LANTIQ_VRX200_PCIE=y
# CONFIG_PHY_LANTIQ_RCU_USB2 is not set
CONFIG_ARMADA375_USBCLUSTER_PHY=y
CONFIG_PHY_BERLIN_SATA=y
CONFIG_PHY_BERLIN_USB=y
# CONFIG_PHY_MVEBU_A3700_UTMI is not set
CONFIG_PHY_MVEBU_A38X_COMPHY=y
# CONFIG_PHY_MVEBU_CP110_UTMI is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
CONFIG_PHY_PXA_28NM_USB2=m
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
CONFIG_PHY_MMP3_HSIC=m
CONFIG_PHY_MTK_PCIE=m
CONFIG_PHY_MTK_XFI_TPHY=m
CONFIG_PHY_MTK_TPHY=m
CONFIG_PHY_MTK_UFS=y
# CONFIG_PHY_MTK_XSPHY is not set
CONFIG_PHY_MTK_HDMI=y
# CONFIG_PHY_MTK_MIPI_CSI_0_5 is not set
CONFIG_PHY_MTK_MIPI_DSI=y
CONFIG_PHY_MTK_DP=m
CONFIG_PHY_SPARX5_SERDES=m
# CONFIG_PHY_LAN966X_SERDES is not set
CONFIG_PHY_CPCAP_USB=m
CONFIG_PHY_MAPPHONE_MDM6600=m
CONFIG_PHY_OCELOT_SERDES=m
CONFIG_PHY_MA35_USB=y
CONFIG_PHY_ATH79_USB=y
CONFIG_PHY_QCOM_EDP=y
# CONFIG_PHY_QCOM_IPQ4019_USB is not set
# CONFIG_PHY_QCOM_PCIE2 is not set
CONFIG_PHY_QCOM_QMP=y
# CONFIG_PHY_QCOM_QMP_COMBO is not set
# CONFIG_PHY_QCOM_QMP_PCIE is not set
CONFIG_PHY_QCOM_QMP_PCIE_8996=y
CONFIG_PHY_QCOM_QMP_UFS=m
CONFIG_PHY_QCOM_QMP_USB=m
CONFIG_PHY_QCOM_QMP_USB_LEGACY=y
CONFIG_PHY_QCOM_QUSB2=m
# CONFIG_PHY_QCOM_EUSB2_REPEATER is not set
CONFIG_PHY_QCOM_M31_USB=m
CONFIG_PHY_QCOM_M31_EUSB=y
CONFIG_PHY_QCOM_USB_HS=y
# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
# CONFIG_PHY_QCOM_USB_HSIC is not set
# CONFIG_PHY_QCOM_USB_HS_28NM is not set
CONFIG_PHY_QCOM_USB_SS=m
CONFIG_PHY_QCOM_IPQ806X_USB=m
CONFIG_PHY_QCOM_SGMII_ETH=m
CONFIG_PHY_MT7621_PCI=m
CONFIG_PHY_RALINK_USB=m
# CONFIG_PHY_RTK_RTD_USB2PHY is not set
CONFIG_PHY_RTK_RTD_USB3PHY=m
CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
CONFIG_PHY_RCAR_GEN3_USB3=y
# CONFIG_PHY_RZ_G3E_USB3 is not set
CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
CONFIG_PHY_ROCKCHIP_INNO_HDMI=y
CONFIG_PHY_ROCKCHIP_INNO_USB2=m
# CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_SAMSUNG_DCPHY is not set
CONFIG_PHY_ROCKCHIP_SAMSUNG_HDPTX=m
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
CONFIG_PHY_ROCKCHIP_TYPEC=m
CONFIG_PHY_EXYNOS_DP_VIDEO=m
CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
# CONFIG_PHY_EXYNOS_PCIE is not set
CONFIG_PHY_SAMSUNG_UFS=y
# CONFIG_PHY_SAMSUNG_USB2 is not set
CONFIG_PHY_UNIPHIER_USB2=m
# CONFIG_PHY_UNIPHIER_USB3 is not set
CONFIG_PHY_UNIPHIER_PCIE=m
# CONFIG_PHY_UNIPHIER_AHCI is not set
CONFIG_PHY_SOPHGO_CV1800_USB2=y
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
CONFIG_PHY_ST_SPEAR1340_MIPHY=m
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_STM32_COMBOPHY=m
CONFIG_PHY_STM32_USBPHYC=y
CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=y
CONFIG_PHY_STARFIVE_JH7110_DPHY_TX=m
CONFIG_PHY_STARFIVE_JH7110_PCIE=y
CONFIG_PHY_STARFIVE_JH7110_USB=m
CONFIG_PHY_SUNPLUS_USB=m
CONFIG_PHY_TEGRA194_P2U=y
CONFIG_PHY_DA8XX_USB=m
CONFIG_PHY_DM816X_USB=m
CONFIG_PHY_AM654_SERDES=m
CONFIG_PHY_J721E_WIZ=m
CONFIG_OMAP_CONTROL_PHY=y
CONFIG_OMAP_USB2=m
CONFIG_TI_PIPE3=m
# CONFIG_PHY_TUSB1210 is not set
# CONFIG_TWL4030_USB is not set
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
CONFIG_PHY_INTEL_KEEMBAY_USB=y
# CONFIG_PHY_INTEL_LGM_COMBO is not set
CONFIG_PHY_INTEL_LGM_EMMC=y
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
CONFIG_ARM_CCN=y
# CONFIG_ARM_CMN is not set
# CONFIG_ARM_NI is not set
# CONFIG_ARM_PMU is not set
CONFIG_FSL_IMX8_DDR_PMU=m
# CONFIG_FSL_IMX9_DDR_PMU is not set
# CONFIG_ARM_DMC620_PMU is not set
# CONFIG_ALIBABA_UNCORE_DRW_PMU is not set
# CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU is not set
CONFIG_MESON_DDR_PMU=y
# end of Performance monitor support

# CONFIG_RAS is not set

#
# Android
#
# end of Android

CONFIG_DAX=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_LAYOUTS=y

#
# Layout Types
#
# CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
CONFIG_NVMEM_LAYOUT_ONIE_TLV=m
CONFIG_NVMEM_LAYOUT_U_BOOT_ENV=m
# end of Layout Types

# CONFIG_NVMEM_AN8855_EFUSE is not set
CONFIG_NVMEM_APPLE_EFUSES=y
CONFIG_NVMEM_APPLE_SPMI=m
# CONFIG_NVMEM_BCM_OCOTP is not set
CONFIG_NVMEM_BRCM_NVRAM=m
CONFIG_NVMEM_IMX_IIM=y
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_NVMEM_IMX_OCOTP_ELE is not set
CONFIG_NVMEM_JZ4780_EFUSE=m
CONFIG_NVMEM_LAN9662_OTPC=y
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
CONFIG_NVMEM_LPC18XX_OTP=y
CONFIG_NVMEM_MAX77759=m
CONFIG_NVMEM_MESON_MX_EFUSE=m
CONFIG_NVMEM_MICROCHIP_OTPC=m
CONFIG_NVMEM_MTK_EFUSE=y
CONFIG_NVMEM_MXS_OCOTP=y
CONFIG_NVMEM_NINTENDO_OTP=y
# CONFIG_NVMEM_QCOM_QFPROM is not set
# CONFIG_NVMEM_QCOM_SEC_QFPROM is not set
# CONFIG_NVMEM_RCAR_EFUSE is not set
CONFIG_NVMEM_RMEM=m
CONFIG_NVMEM_ROCKCHIP_EFUSE=y
CONFIG_NVMEM_ROCKCHIP_OTP=y
CONFIG_NVMEM_SC27XX_EFUSE=m
CONFIG_NVMEM_SNVS_LPGPR=y
# CONFIG_NVMEM_SPMI_SDAM is not set
# CONFIG_NVMEM_SPRD_EFUSE is not set
# CONFIG_NVMEM_STM32_ROMEM is not set
CONFIG_NVMEM_SUNPLUS_OCOTP=m
CONFIG_NVMEM_U_BOOT_ENV=m
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set
CONFIG_NVMEM_QORIQ_EFUSE=y

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
CONFIG_STM_PROTO_SYS_T=m
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_INTEL_TH=m
# CONFIG_INTEL_TH_GTH is not set
CONFIG_INTEL_TH_STH=m
# CONFIG_INTEL_TH_PTI is not set
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

CONFIG_FPGA=m
CONFIG_FPGA_MGR_SOCFPGA=m
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
CONFIG_ALTERA_PR_IP_CORE=m
# CONFIG_ALTERA_PR_IP_CORE_PLAT is not set
# CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
CONFIG_FPGA_MGR_XILINX_CORE=m
CONFIG_FPGA_MGR_XILINX_SELECTMAP=m
CONFIG_FPGA_BRIDGE=m
CONFIG_ALTERA_FREEZE_BRIDGE=m
CONFIG_XILINX_PR_DECOUPLER=m
CONFIG_FPGA_REGION=m
CONFIG_OF_FPGA_REGION=m
CONFIG_FPGA_DFL=m
CONFIG_FPGA_DFL_FME=m
CONFIG_FPGA_DFL_FME_MGR=m
CONFIG_FPGA_DFL_FME_BRIDGE=m
# CONFIG_FPGA_DFL_FME_REGION is not set
CONFIG_FPGA_DFL_AFU=m
# CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000 is not set
# CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
CONFIG_FPGA_MGR_VERSAL_FPGA=m
CONFIG_FSI=y
# CONFIG_FSI_NEW_DEV_NODE is not set
# CONFIG_FSI_MASTER_GPIO is not set
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_MASTER_AST_CF=m
# CONFIG_FSI_MASTER_ASPEED is not set
# CONFIG_FSI_MASTER_I2CR is not set
CONFIG_FSI_SCOM=m
CONFIG_FSI_SBEFIFO=y
# CONFIG_FSI_OCC is not set
CONFIG_TEE=m
CONFIG_QCOMTEE=m
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=m
CONFIG_SLIMBUS=m
CONFIG_SLIM_QCOM_NGD_CTRL=m
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
# CONFIG_INTERCONNECT_MTK is not set
CONFIG_INTERCONNECT_QCOM_OSM_L3=m
CONFIG_INTERCONNECT_SAMSUNG=y
CONFIG_INTERCONNECT_EXYNOS=m
CONFIG_COUNTER=y
CONFIG_FTM_QUADDEC=m
CONFIG_INTERRUPT_CNT=m
CONFIG_MICROCHIP_TCB_CAPTURE=m
CONFIG_STM32_LPTIMER_CNT=y
CONFIG_STM32_TIMER_CNT=m
# CONFIG_TI_ECAP_CAPTURE is not set
CONFIG_TI_EQEP=y
# CONFIG_MOST is not set
# CONFIG_PECI is not set
CONFIG_HTE=y
CONFIG_HTE_TEGRA194=y
# CONFIG_HTE_TEGRA194_TEST is not set
CONFIG_CDX_BUS=y
CONFIG_CDX_CONTROLLER=m
# end of Device Drivers

#
# File systems
#
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_IOMAP=y
CONFIG_FS_STACK=y
CONFIG_BUFFER_HEAD=y
CONFIG_LEGACY_DIRECT_IO=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
# CONFIG_EXT2_FS_POSIX_ACL is not set
CONFIG_EXT2_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
# CONFIG_EXT4_FS_SECURITY is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_JFS_FS=y
CONFIG_JFS_POSIX_ACL=y
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
# CONFIG_XFS_FS is not set
CONFIG_GFS2_FS=y
CONFIG_BTRFS_FS=y
# CONFIG_BTRFS_FS_POSIX_ACL is not set
CONFIG_BTRFS_FS_RUN_SANITY_TESTS=y
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_EXPERIMENTAL is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_F2FS_IOSTAT is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
# CONFIG_INOTIFY_USER is not set
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
# CONFIG_QUOTA is not set
# CONFIG_QUOTA_NETLINK_INTERFACE is not set
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS_FS is not set
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=m
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
CONFIG_OVERLAY_FS_INDEX=y
CONFIG_OVERLAY_FS_NFS_EXPORT=y
# CONFIG_OVERLAY_FS_METACOPY is not set
# CONFIG_OVERLAY_FS_DEBUG is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_NETFS_DEBUG=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
CONFIG_CACHEFILES=y
# CONFIG_CACHEFILES_DEBUG is not set
CONFIG_CACHEFILES_ERROR_INJECTION=y
CONFIG_CACHEFILES_ONDEMAND=y
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
CONFIG_MSDOS_FS=y
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
# CONFIG_EXFAT_FS is not set
CONFIG_NTFS3_FS=m
# CONFIG_NTFS3_LZX_XPRESS is not set
CONFIG_NTFS3_FS_POSIX_ACL=y
CONFIG_NTFS_FS=m
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
CONFIG_ADFS_FS=m
CONFIG_ADFS_FS_RW=y
CONFIG_AFFS_FS=y
CONFIG_ECRYPT_FS=m
# CONFIG_ECRYPT_FS_MESSAGING is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
CONFIG_BEFS_FS=y
CONFIG_BEFS_DEBUG=y
# CONFIG_BFS_FS is not set
CONFIG_EFS_FS=m
CONFIG_JFFS2_FS=m
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_JFFS2_FS_WRITEBUFFER is not set
# CONFIG_JFFS2_SUMMARY is not set
# CONFIG_JFFS2_FS_XATTR is not set
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_LZO=y
# CONFIG_JFFS2_RTIME is not set
CONFIG_JFFS2_RUBIN=y
CONFIG_JFFS2_CMODE_NONE=y
# CONFIG_JFFS2_CMODE_PRIORITY is not set
# CONFIG_JFFS2_CMODE_SIZE is not set
# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
CONFIG_UBIFS_FS=y
CONFIG_UBIFS_FS_ADVANCED_COMPR=y
# CONFIG_UBIFS_FS_LZO is not set
CONFIG_UBIFS_FS_ZLIB=y
CONFIG_UBIFS_FS_ZSTD=y
CONFIG_UBIFS_ATIME_SUPPORT=y
CONFIG_UBIFS_FS_XATTR=y
CONFIG_UBIFS_FS_SECURITY=y
CONFIG_UBIFS_FS_AUTHENTICATION=y
CONFIG_CRAMFS=y
CONFIG_CRAMFS_BLOCKDEV=y
# CONFIG_CRAMFS_MTD is not set
CONFIG_SQUASHFS=y
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_CHOICE_DECOMP_BY_MOUNT is not set
CONFIG_SQUASHFS_COMPILE_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_COMPILE_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_COMP_CACHE_FULL=y
# CONFIG_SQUASHFS_ZLIB is not set
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
CONFIG_SQUASHFS_EMBEDDED=y
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
CONFIG_VXFS_FS=m
CONFIG_MINIX_FS=y
CONFIG_OMFS_FS=y
CONFIG_HPFS_FS=m
CONFIG_QNX4FS_FS=m
CONFIG_QNX6FS_FS=m
CONFIG_QNX6FS_DEBUG=y
# CONFIG_ROMFS_FS is not set
# CONFIG_PSTORE is not set
CONFIG_UFS_FS=y
# CONFIG_UFS_FS_WRITE is not set
# CONFIG_UFS_DEBUG is not set
CONFIG_EROFS_FS=y
# CONFIG_EROFS_FS_DEBUG is not set
CONFIG_EROFS_FS_XATTR=y
CONFIG_EROFS_FS_POSIX_ACL=y
# CONFIG_EROFS_FS_SECURITY is not set
CONFIG_EROFS_FS_BACKED_BY_FILE=y
# CONFIG_EROFS_FS_ZIP is not set
CONFIG_EROFS_FS_ONDEMAND=y
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_9P_FS=y
# CONFIG_9P_FSCACHE is not set
CONFIG_9P_FS_POSIX_ACL=y
# CONFIG_9P_FS_SECURITY is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=y
CONFIG_NLS_CODEPAGE_861=m
# CONFIG_NLS_CODEPAGE_862 is not set
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=y
CONFIG_NLS_CODEPAGE_869=m
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=m
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
CONFIG_NLS_CODEPAGE_1251=y
CONFIG_NLS_ASCII=m
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
CONFIG_NLS_ISO8859_3=y
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=m
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=m
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=m
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=m
CONFIG_NLS_UCS2_UTILS=y
CONFIG_UNICODE=y
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=m
CONFIG_HAVE_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TEE=y
# CONFIG_ENCRYPTED_KEYS is not set
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_KEY_NOTIFICATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_PROC_MEM_ALWAYS_FORCE=y
# CONFIG_PROC_MEM_FORCE_PTRACE is not set
# CONFIG_PROC_MEM_NO_FORCE is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_DEFAULT_SECURITY_DAC=y

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_STACK_ALL_PATTERN is not set
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_CC_HAS_SANCOV_STACK_DEPTH_CALLBACK=y
CONFIG_KSTACK_ERASE=y
CONFIG_KSTACK_ERASE_TRACK_MIN_SIZE=100
CONFIG_KSTACK_ERASE_METRICS=y
# CONFIG_KSTACK_ERASE_RUNTIME_DISABLE is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
# end of Memory initialization

#
# Bounds checking
#
# CONFIG_FORTIFY_SOURCE is not set
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_DEFAULT_ON=y
# end of Bounds checking

#
# Hardening of kernel data structures
#
CONFIG_LIST_HARDENED=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Hardening of kernel data structures

CONFIG_CC_HAS_RANDSTRUCT=y
CONFIG_RANDSTRUCT_NONE=y
# CONFIG_RANDSTRUCT_FULL is not set
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_ASYNC_TX_DISABLE_PQ_VAL_DMA=y
CONFIG_ASYNC_TX_DISABLE_XOR_VAL_DMA=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SIG=y
CONFIG_CRYPTO_SIG2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_KRB5ENC=y
# CONFIG_CRYPTO_BENCHMARK is not set
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=m
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ARIA=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_SERPENT=m
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=m
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_LRW=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=m
CONFIG_CRYPTO_NHPOLY1305=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
CONFIG_CRYPTO_GENIV=y
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=y
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=m
CONFIG_CRYPTO_WP512=m
# CONFIG_CRYPTO_XCBC is not set
CONFIG_CRYPTO_XXHASH=y
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=m
# CONFIG_CRYPTO_LZ4 is not set
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKS=64
CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE=32
CONFIG_CRYPTO_JITTERENTROPY_OSR=1
CONFIG_CRYPTO_KDF800108_CTR=y
CONFIG_CRYPTO_DF80090A=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
CONFIG_CRYPTO_USER_API_RNG=m
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
# CONFIG_CRYPTO_USER_API_AEAD is not set
# CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
# end of Userspace interface

#
# Accelerated Cryptographic Algorithms for CPU (arm)
#
# CONFIG_CRYPTO_AES_ARM is not set
# end of Accelerated Cryptographic Algorithms for CPU (arm)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
CONFIG_FIPS_SIGNATURE_SELFTEST=m
CONFIG_FIPS_SIGNATURE_SELFTEST_RSA=y
CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
# CONFIG_MODULE_SIG_KEY_TYPE_RSA is not set
CONFIG_MODULE_SIG_KEY_TYPE_ECDSA=y
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

# CONFIG_CRYPTO_KRB5 is not set
CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=y
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_HAVE_ARCH_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_STMP_DEVICE=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_CRC4=y
CONFIG_CRC8=y
CONFIG_CRC16=y
CONFIG_CRC_CCITT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC32=y
CONFIG_CRC64=y
CONFIG_CRC_OPTIMIZATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2B=y
CONFIG_CRYPTO_LIB_BLAKE2S_ARCH=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CHACHA_ARCH=y
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_MD5=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_POLY1305_ARCH=y
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=9
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA1_ARCH=y
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SHA512=y
CONFIG_CRYPTO_LIB_SHA3=y
# end of Crypto library routines

CONFIG_XXHASH=y
CONFIG_AUDIT_GENERIC=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_ARM64=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_RISCV=y
CONFIG_XZ_DEC_MICROLZMA=y
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=m
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_CLOSURES=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS_HELPERS=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_DMA_NEED_SYNC=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_GLOBAL_POOL=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_FORCE_NR_CPUS=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_POOL=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_STACKDEPOT_MAX_FRAMES=64
CONFIG_REF_TRACKER=y
CONFIG_SBITMAP=y
CONFIG_PARMAN=y
# CONFIG_OBJAGG is not set
# CONFIG_LWQ_TEST is not set
# end of Library routines

CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED=y
CONFIG_POLYNOMIAL=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_BUGVERBOSE_DETAILED is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_ULEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
CONFIG_DEBUG_INFO_DWARF5=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_COMPRESSED_NONE is not set
CONFIG_DEBUG_INFO_COMPRESSED_ZLIB=y
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=0
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_ARCH_HAS_UBSAN=y
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
# CONFIG_UBSAN_SHIFT is not set
# CONFIG_UBSAN_UNREACHABLE is not set
# CONFIG_UBSAN_BOOL is not set
CONFIG_UBSAN_ENUM=y
CONFIG_TEST_UBSAN=m
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# CONFIG_NET_DEV_REFCNT_TRACKER is not set
CONFIG_NET_NS_REFCNT_TRACKER=y
CONFIG_DEBUG_NET=y
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
# CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
CONFIG_SLUB_DEBUG=y
CONFIG_SLUB_DEBUG_ON=y
# CONFIG_PAGE_OWNER is not set
CONFIG_PAGE_POISONING=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SHRINKER_DEBUG=y
CONFIG_DEBUG_STACK_USAGE=y
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_VFS is not set
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_NOMMU_REGIONS=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=0
CONFIG_DETECT_HUNG_TASK_BLOCKER=y
# CONFIG_WQ_WATCHDOG is not set
# CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHEDSTATS is not set
# end of Scheduler Debugging

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
# CONFIG_DEBUG_RT_MUTEXES is not set
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=m
CONFIG_SCF_TORTURE_TEST=m
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_DEBUG_CLOSURES=y
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_LATENCYTOP is not set
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_FREGS=y
CONFIG_HAVE_EXTRA_IPI_TRACEPOINTS=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACE_CLOCK=y
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# arm Debugging
#
CONFIG_UNWINDER_ARM=y
CONFIG_ARM_UNWIND=y
CONFIG_DEBUG_USER=y
CONFIG_DEBUG_LL=y
# CONFIG_DEBUG_LPC18XX_UART0 is not set
# CONFIG_STM32F4_DEBUG_UART is not set
CONFIG_STM32F7_DEBUG_UART=y
# CONFIG_STM32H7_DEBUG_UART is not set
# CONFIG_DEBUG_VF_UART is not set
# CONFIG_DEBUG_ICEDCC is not set
# CONFIG_DEBUG_SEMIHOSTING is not set
# CONFIG_DEBUG_LL_UART_8250 is not set
# CONFIG_DEBUG_LL_UART_PL01X is not set
CONFIG_DEBUG_VF_UART_PORT=1
CONFIG_DEBUG_STM32_UART=y
CONFIG_DEBUG_UART_FLOW_CONTROL=y
CONFIG_DEBUG_LL_INCLUDE="debug/stm32.S"
CONFIG_DEBUG_UART_PHYS=0x40011000
CONFIG_DEBUG_UART_VIRT=0x40011000
CONFIG_DEBUG_UNCOMPRESS=y
CONFIG_UNCOMPRESS_INCLUDE="debug/uncompress.h"
CONFIG_EARLY_PRINTK=y
# CONFIG_CORESIGHT is not set
# end of arm Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_PM_NOTIFIER_ERROR_INJECT=y
CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=m
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
CONFIG_FAULT_INJECTION_USERCOPY=y
# CONFIG_FAIL_MAKE_REQUEST is not set
CONFIG_FAIL_IO_TIMEOUT=y
CONFIG_FAIL_FUTEX=y
# CONFIG_FAULT_INJECTION_DEBUG_FS is not set
CONFIG_FAULT_INJECTION_CONFIGFS=y
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
CONFIG_ARCH_HAS_KCOV=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
# CONFIG_KCOV_INSTRUMENT_ALL is not set
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
# CONFIG_KCOV_SELFTEST is not set
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
CONFIG_MEMTEST=y
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking
# end of Kernel hacking

#
# Documentation
#
# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Documentation

--ZqP4PjA61tW2Zu8s--

