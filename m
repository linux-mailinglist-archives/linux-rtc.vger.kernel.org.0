Return-Path: <linux-rtc+bounces-6260-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EXFFWeSyGlOngUAu9opvQ
	(envelope-from <linux-rtc+bounces-6260-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 04:45:59 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50E350745
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 04:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 935FF301DCC4
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Mar 2026 02:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED62623C516;
	Sun, 29 Mar 2026 02:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJWFP9vO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5FF40DFA9;
	Sun, 29 Mar 2026 02:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774752268; cv=none; b=XP7zEIhKCfBER6YYHYW++oQVazt7zOnxjU1BMmgK5eEfaQRjk78MigEwur/Ek0H4L7EqG5vdXR7E0dtqQygkP+ny097CAIPczs2P8jZ3AOJ21B+jSnYe+fuILMQrC8QphoFBDl6IU2guJuzKLkYRJ8Mzq5b8qg06CzBKm4Jm4nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774752268; c=relaxed/simple;
	bh=zP8pKciSR07cE+zE4CuckNxlz1naeSv/P8AgYFY+L+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLYtwKSSZWt1ledKCaCiy/yyzO10aSX3HyLnjTSNOAG2bX2y2Pe65d+Mf/V9DOilkKvr1UBc+f8nQtPMDXZxV5Kl0NRL6VMi6s9ipgQ9lSRwuD0akWVJ0erWSUNA/uOV/PKIHcJQBtCrjhmU5maiPhyndw72YaFvYhCZSffdp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJWFP9vO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774752266; x=1806288266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zP8pKciSR07cE+zE4CuckNxlz1naeSv/P8AgYFY+L+0=;
  b=lJWFP9vOPi5B8ij+TirJ1RfGtpFn6xCB76oo7hfifZMHJoQhF4YR8MVW
   6tNSR15i+UzUwSRySedtAIs8P7JFqz/uqQIq8h3kYBliN/4PqHWZ6AwEq
   trWPnIEqXhMP0eKhK7ZGwmVPKSJg4jvZ9lOd695/SXfqn2lbabOFMJAY/
   vgYepJGigPl0AUAwPL+uLKtAuNR13BBtMLKlftnDTw/3gH0AW7AA8LvrH
   +pokTqnVGG0FD7Z4LcyXmZEBjTHrk7ifRwaCgYfT1+1n+i0XlEfIsQ2ZS
   7WdKHNDfKqYk09taY5vYBG35rK/EraQiVWa1emwackQY3cBm3zjpnOwPn
   g==;
X-CSE-ConnectionGUID: P2/rlQQSQNmcRVVys6UmGg==
X-CSE-MsgGUID: 0lQYCxcmQMSqs0nqI1FF+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93165221"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="93165221"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 19:44:25 -0700
X-CSE-ConnectionGUID: /GOkUf93RbSK9TYX5Vm+Zw==
X-CSE-MsgGUID: PiBYSUfHRqK2zAYwZmdP0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="224730212"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2026 19:44:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6g8P-00000000C1B-46D9;
	Sun, 29 Mar 2026 02:44:17 +0000
Date: Sun, 29 Mar 2026 10:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
Subject: Re: [PATCH v2 3/5] mfd: sprd-sc27xx: Switch to devm_mfd_add_devices()
Message-ID: <202603291013.6DnmGjG3-lkp@intel.com>
References: <20260325-sc27xx-mfd-cells-v2-3-d0ebb60aa4a7@abscue.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-sc27xx-mfd-cells-v2-3-d0ebb60aa4a7@abscue.de>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6260-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[abscue.de,bootlin.com,kernel.org,gmail.com,linux.alibaba.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AC50E350745
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Otto,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c]

url:    https://github.com/intel-lab-lkp/linux/commits/Otto-Pfl-ger/dt-bindings-rtc-sc2731-Add-compatible-for-SC2730/20260327-162827
base:   85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
patch link:    https://lore.kernel.org/r/20260325-sc27xx-mfd-cells-v2-3-d0ebb60aa4a7%40abscue.de
patch subject: [PATCH v2 3/5] mfd: sprd-sc27xx: Switch to devm_mfd_add_devices()
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260329/202603291013.6DnmGjG3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291013.6DnmGjG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291013.6DnmGjG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/sprd-sc27xx-spi.c:188:14: warning: cast to smaller integer type 'enum sprd_pmic_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     188 |         pmic_type = (enum sprd_pmic_type)of_device_get_match_data(&spi->dev);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +188 drivers/mfd/sprd-sc27xx-spi.c

   179	
   180	static int sprd_pmic_probe(struct spi_device *spi)
   181	{
   182		struct sprd_pmic *ddata;
   183		enum sprd_pmic_type pmic_type;
   184		const struct sprd_pmic_data *pdata;
   185		const struct mfd_cell *cells;
   186		int ret, i, num_cells;
   187	
 > 188		pmic_type = (enum sprd_pmic_type)of_device_get_match_data(&spi->dev);
   189	
   190		switch (pmic_type) {
   191		case PMIC_TYPE_SC2730:
   192			pdata = &sc2730_data;
   193			cells = sc2730_devices;
   194			num_cells = ARRAY_SIZE(sc2730_devices);
   195			break;
   196		case PMIC_TYPE_SC2731:
   197			pdata = &sc2731_data;
   198			cells = sc2731_devices;
   199			num_cells = ARRAY_SIZE(sc2731_devices);
   200			break;
   201		default:
   202			dev_err(&spi->dev, "Invalid device ID\n");
   203			return -EINVAL;
   204		}
   205	
   206		ddata = devm_kzalloc(&spi->dev, sizeof(*ddata), GFP_KERNEL);
   207		if (!ddata)
   208			return -ENOMEM;
   209	
   210		ddata->regmap = devm_regmap_init(&spi->dev, &sprd_pmic_regmap,
   211						 &spi->dev, &sprd_pmic_config);
   212		if (IS_ERR(ddata->regmap)) {
   213			ret = PTR_ERR(ddata->regmap);
   214			dev_err(&spi->dev, "Failed to allocate register map %d\n", ret);
   215			return ret;
   216		}
   217	
   218		spi_set_drvdata(spi, ddata);
   219		ddata->dev = &spi->dev;
   220		ddata->irq = spi->irq;
   221		ddata->pdata = pdata;
   222	
   223		ddata->irq_chip.name = dev_name(&spi->dev);
   224		ddata->irq_chip.status_base =
   225			pdata->irq_base + SPRD_PMIC_INT_MASK_STATUS;
   226		ddata->irq_chip.unmask_base = pdata->irq_base + SPRD_PMIC_INT_EN;
   227		ddata->irq_chip.ack_base = 0;
   228		ddata->irq_chip.num_regs = 1;
   229		ddata->irq_chip.num_irqs = pdata->num_irqs;
   230	
   231		ddata->irqs = devm_kcalloc(&spi->dev,
   232					   pdata->num_irqs, sizeof(struct regmap_irq),
   233					   GFP_KERNEL);
   234		if (!ddata->irqs)
   235			return -ENOMEM;
   236	
   237		ddata->irq_chip.irqs = ddata->irqs;
   238		for (i = 0; i < pdata->num_irqs; i++)
   239			ddata->irqs[i].mask = BIT(i);
   240	
   241		ret = devm_regmap_add_irq_chip(&spi->dev, ddata->regmap, ddata->irq,
   242					       IRQF_ONESHOT, 0,
   243					       &ddata->irq_chip, &ddata->irq_data);
   244		if (ret) {
   245			dev_err(&spi->dev, "Failed to add PMIC irq chip %d\n", ret);
   246			return ret;
   247		}
   248	
   249		ret = devm_mfd_add_devices(&spi->dev, PLATFORM_DEVID_AUTO,
   250					   cells, num_cells, NULL, 0,
   251					   regmap_irq_get_domain(ddata->irq_data));
   252		if (ret) {
   253			dev_err(&spi->dev, "Failed to populate sub-devices %d\n", ret);
   254			return ret;
   255		}
   256	
   257		ret = devm_device_init_wakeup(&spi->dev);
   258		if (ret)
   259			return dev_err_probe(&spi->dev, ret, "Failed to init wakeup\n");
   260	
   261		return 0;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

