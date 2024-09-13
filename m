Return-Path: <linux-rtc+bounces-1980-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5572977F11
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 13:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 080E31C20D4F
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 11:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D04F1D88BC;
	Fri, 13 Sep 2024 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6O9F7NP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9187B1D88A0;
	Fri, 13 Sep 2024 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228742; cv=none; b=aTLet/EDjW5ED4gTiaLeUT3BIK29ypu3EVwW6xfyCj62RadETTy3md13aRfaP9fxX8LlMnidjsUP0yV7sjTKTe3ZT3dBsYDcW5ZxmpT2vlzRD6qK0YTyD4gYKfGnpOjvDHakyopIlZql5KaPueWUh7HhWy9RmFL5/HKXfzN+/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228742; c=relaxed/simple;
	bh=AZHXRLJsSTYEt/qjTqze+Z2qsR1But2NuNPf/jl1ZSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4nZfEJeOBkeO1EXb1NcyK/tY+gku43SV1FacP0Kt/L43nCTLKIgoLB7zlRBCn5A98PQwapdbL6raAlSDWIgsfLQjA1pEgQrybuwjYZWPtSl2Vg3V83ooiQvYCoPVhrtMin1cBlNeFD/vS3UWCoLQp48kNcAteHZI251dnSBAmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6O9F7NP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726228739; x=1757764739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AZHXRLJsSTYEt/qjTqze+Z2qsR1But2NuNPf/jl1ZSE=;
  b=O6O9F7NPA+7S+3ATB4HpmWV0A4VIzXWwVo+gmCzGp2y5nBkwBzGfbyqG
   DMxcYpLyAUORhnqXMS11+7npMnif8rBpGZox+BpUeWHEavZlD/PlhCZHZ
   4Co/o7jLU3wWTu+f9WxnVURTMJgvZGd4WPXjubLdUWMNQcsnk8dMwjsYR
   1ummXs9Dg4uUrRovF/cfF+dyLvJ3QBexkbKE0TBqI0/1YpW2WX5iCIuSw
   4A7ejSU3JfuwpMCwZhCnvWoJOFE4DTdFe3FLBu3DcN73W1aDh4i6GnEPk
   XRJw8TgtXPXtymIZKCnd9NQSdMucwS0ShwQsOMTn/eepCuBH/mFEd1eDR
   g==;
X-CSE-ConnectionGUID: 8GsT5SAhRYyzWHFIXrhD7w==
X-CSE-MsgGUID: sm6e1E2eQOqtt6Jh2J+Zwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35792061"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="35792061"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 04:58:59 -0700
X-CSE-ConnectionGUID: 8HlKHWXsR5K6uLQzqnwe+g==
X-CSE-MsgGUID: +RAOk1pZTYq/Yzxlq5UnWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72797822"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Sep 2024 04:58:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp4wu-0006UY-1n;
	Fri, 13 Sep 2024 11:58:52 +0000
Date: Fri, 13 Sep 2024 19:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202409131950.ozDVVv5X-lkp@intel.com>
References: <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on robh/for-next arm64/for-next/core linus/master v6.11-rc7 next-20240912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20240911-150205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240911070028.127659-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: hexagon-randconfig-r112-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131950.ozDVVv5X-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce: (https://download.01.org/0day-ci/archive/20240913/202409131950.ozDVVv5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131950.ozDVVv5X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/rtc/rtc-s32g.c:7:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/rtc/rtc-s32g.c:7:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/rtc/rtc-s32g.c:7:
   In file included from include/linux/of_irq.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/rtc/rtc-s32g.c:668:34: warning: unused variable 'rtc_dt_ids' [-Wunused-const-variable]
     668 | static const struct of_device_id rtc_dt_ids[] = {
         |                                  ^~~~~~~~~~
   7 warnings generated.


vim +/rtc_dt_ids +668 drivers/rtc/rtc-s32g.c

   667	
 > 668	static const struct of_device_id rtc_dt_ids[] = {
   669		{.compatible = "nxp,s32g-rtc" },
   670		{ /* sentinel */ },
   671	};
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

