Return-Path: <linux-rtc+bounces-5161-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB346C0A2F6
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Oct 2025 06:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1B724E120A
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Oct 2025 05:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A437826B0AE;
	Sun, 26 Oct 2025 05:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8qsAmp5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E423A58E;
	Sun, 26 Oct 2025 05:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761455687; cv=none; b=lXmZ4a7CEurfGQO5Gd+HN/2uSIwCOJa+h7JzGsS0dPmQL24TCyl6IYQl7zO0tl/kxvf6li6LeIe/RhBk/e32UlA1/rLrXdv6TaBOzjHWe+obzM2BKzm8eo1YP3AtZVo4jMcI2Q0ryLkKbrILF7t5qWAqwg+l6JTKoTOK5icPrvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761455687; c=relaxed/simple;
	bh=gKJE14w1KDbJqmE7/dHsKdynDf2xulvE3IRzaIW6bj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUpsPP47SytO41m6krLNn2z9/KLGLAMDF6ww/QLMYSPxabu8z7b6PueTqMwbPA3hYWzPgnbsioRpy/9uracKx+dyuF6y+5DhkiodEeK2GXpYSK32cGhMthLUvV4P7LQoDZelKDECzictHcHd/H0ES5uWTlsbB0lwveynDaVH7OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8qsAmp5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761455686; x=1792991686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gKJE14w1KDbJqmE7/dHsKdynDf2xulvE3IRzaIW6bj4=;
  b=O8qsAmp5Xb1Vp8UtM3qikDGuIaM9tuveqLPWl80LDT/hHVF5a7mLoZXw
   YanvayHuKbIdoYFZJ6RS9kD70PYBszj+4UkyU7mQYIgL/Fk5nt99zw0GG
   N4pFZEuHcd04EG0zLtRjqsLpqQ6SvnbkmGjdlq+udTwwmCr5IXmzaYY8X
   RrqizPJsP1adMNqjsSyUP51RQPGwGxUuL0b2vgqIE6P25J/Ot0SCGdF+p
   ybQ799tCXL0qpBggm9+yE18OIrjoBSG1tCXfM3tZlJ3Rkufu3D0PYHj3C
   iCExywP8x36IgJSp8f1uH1bCMdp5J+Tgux7/0i4I2fIjqomTh3bNA6sYA
   A==;
X-CSE-ConnectionGUID: /3cmkCkdQw+hHTulJVx9sw==
X-CSE-MsgGUID: QfU1L3V2TL6oUtk7gidY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51150163"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="51150163"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 22:14:45 -0700
X-CSE-ConnectionGUID: 3IfibMsMR/SdoNhlTH/RrA==
X-CSE-MsgGUID: x7CYNeabSyG2So3RbmdNKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184839789"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2025 22:14:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCt5F-000Fty-0a;
	Sun, 26 Oct 2025 05:14:34 +0000
Date: Sun, 26 Oct 2025 13:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alexandre.belloni@bootlin.com
Cc: oe-kbuild-all@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 2/2] rtc: Add support for MT6685 Clock IC's RTC over
 SPMI
Message-ID: <202510261223.NRLximA4-lkp@intel.com>
References: <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024083318.25890-3-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-rtc-Add-MediaTek-MT6685-PM-Clock-IC-Real-Time-Clock/20251024-164423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20251024083318.25890-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/2] rtc: Add support for MT6685 Clock IC's RTC over SPMI
config: sparc64-randconfig-r062-20251026 (https://download.01.org/0day-ci/archive/20251026/202510261223.NRLximA4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261223.NRLximA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261223.NRLximA4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/rtc/rtc-mt6685.c: In function 'rtc_mt6685_probe':
   drivers/rtc/rtc-mt6685.c:380:13: error: implicit declaration of function 'devm_spmi_subdevice_alloc_and_add' [-Werror=implicit-function-declaration]
     380 |  sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-mt6685.c:380:11: warning: assignment to 'struct spmi_subdevice *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     380 |  sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
         |           ^
   In file included from drivers/rtc/rtc-mt6685.c:20:
>> drivers/rtc/rtc-mt6685.c:397:51: error: dereferencing pointer to incomplete type 'struct spmi_subdevice'
     397 |  rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
         |                                                   ^~
   include/linux/regmap.h:775:6: note: in definition of macro '__regmap_lockdep_wrapper'
     775 |   fn(__VA_ARGS__, &_key,     \
         |      ^~~~~~~~~~~
   drivers/rtc/rtc-mt6685.c:397:16: note: in expansion of macro 'devm_regmap_init_spmi_ext'
     397 |  rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +397 drivers/rtc/rtc-mt6685.c

   358	
   359	static int rtc_mt6685_probe(struct platform_device *pdev)
   360	{
   361		struct regmap_config mt6685_rtc_regmap_config = {
   362			.reg_bits = 16,
   363			.val_bits = 8,
   364			.max_register = 0x60,
   365			.fast_io = true,
   366			.use_single_read = true,
   367			.use_single_write = true,
   368		};
   369		struct device *dev = &pdev->dev;
   370		struct spmi_subdevice *sub_sdev;
   371		struct spmi_device *sparent;
   372		struct mt6685_rtc *rtc;
   373		int ret;
   374	
   375		rtc = devm_kzalloc(dev, sizeof(struct mt6685_rtc), GFP_KERNEL);
   376		if (!rtc)
   377			return -ENOMEM;
   378	
   379		sparent = to_spmi_device(dev->parent);
 > 380		sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
   381		if (IS_ERR(sub_sdev))
   382			return PTR_ERR(sub_sdev);
   383	
   384		ret = of_property_read_u32(pdev->dev.of_node, "reg",
   385					   &mt6685_rtc_regmap_config.reg_base);
   386		if (ret)
   387			return ret;
   388	
   389		rtc->irq = platform_get_irq(pdev, 0);
   390		if (rtc->irq < 0)
   391			return rtc->irq;
   392	
   393		rtc->mclk = devm_clk_get(dev, 0);
   394		if (IS_ERR(rtc->mclk))
   395			return PTR_ERR(rtc->mclk);
   396	
 > 397		rtc->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &mt6685_rtc_regmap_config);
   398		if (IS_ERR(rtc->regmap))
   399			return PTR_ERR(rtc->regmap);
   400	
   401		rtc->rdev = devm_rtc_allocate_device(dev);
   402		if (IS_ERR(rtc->rdev))
   403			return PTR_ERR(rtc->rdev);
   404	
   405		platform_set_drvdata(pdev, rtc);
   406	
   407		/* Clock is required to auto-synchronize IRQ enable to RTC */
   408		ret = clk_prepare_enable(rtc->mclk);
   409		if (ret)
   410			return ret;
   411	
   412		ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
   413						rtc_mt6685_irq_handler_thread,
   414						IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
   415						"mt6685-rtc", rtc);
   416		clk_disable_unprepare(rtc->mclk);
   417		if (ret)
   418			return dev_err_probe(&pdev->dev, ret, "Cannot request alarm IRQ");
   419	
   420		device_init_wakeup(&pdev->dev, true);
   421	
   422		rtc->rdev->ops = &rtc_mt6685_ops;
   423		rtc->rdev->range_min = RTC_TIMESTAMP_BEGIN_1900;
   424		rtc->rdev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
   425		rtc->rdev->start_secs = mktime64(1968, 1, 1, 0, 0, 0);
   426		rtc->rdev->set_start_time = true;
   427	
   428		return devm_rtc_register_device(rtc->rdev);
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

