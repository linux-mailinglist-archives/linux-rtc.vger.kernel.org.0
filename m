Return-Path: <linux-rtc+bounces-2253-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4029A4CE8
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 12:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90BF41C211FE
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 10:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7DC1DF749;
	Sat, 19 Oct 2024 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEF1cgSz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537D1DE4FE;
	Sat, 19 Oct 2024 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729334195; cv=none; b=eVoM8E/5SMCfel3V3F9becXf2+Nwv25ZZwMVFyLkSGxTNWUu+JiNXctZ1tpd5yumXV/jgHJFJRJn8s6bR01JOc2OxZVhwS+0lR82Q3g/q4K/GY2230tJRnysmy4JbetandvfpO4WmtJtfGaOwKumDGvJkbtnGh8H+GIPU56sRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729334195; c=relaxed/simple;
	bh=UipNdPw5pGNY1kN1FE/U/T/fYmGN6H1910arigY7NCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zpjxa4nAeyx6epCdijnj8Xe+y+XOHymStmszrXqFRMogqe+wo6md0bXV7gZ4r3CISQ+sHzzlBCEvFS70xq+NDBiXJDYZi/483ODtoIgTHRFjQpviOoO4pYO5Ap9Ciyb1DbYQ7/KSal538LkyDsC6UImbvqO9cr9WAuZu3l3edpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEF1cgSz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729334194; x=1760870194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UipNdPw5pGNY1kN1FE/U/T/fYmGN6H1910arigY7NCc=;
  b=kEF1cgSztPOJgUlFGi/c0dCq/Bthh0Gf051ciyQ23+eGK8suReOOTrAO
   55i2L4CL0TWBOBkfb9yD1yJhWMOsnhoLS1PNU9FyiBndPB/DsNetYdZJ9
   dNfkC4nqE4XHvOz4s6VO88eOm8kG+IZv+2NxjAJle6lzb7EeVWet8aUfA
   RpDDawBTn5dpSVJ6yUfQKy379jrR93BmG89gOgg+5i7yG12YG/6Yq+89l
   S+qVIvyATrSHBlVq1PiHpZdNhB7wVotBDzVKH1J6674BnWzVn0jqb/pBm
   f1wgWMumoLMD0DJMtubCN3PXxA9Z7PXoKkt7ZG9tCDyasI7nX6pdHd6og
   A==;
X-CSE-ConnectionGUID: iuahNjVbTNSVgcp8BhOWjQ==
X-CSE-MsgGUID: O3TndJdEQRu1th6agrp+cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="39491155"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="39491155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 03:36:33 -0700
X-CSE-ConnectionGUID: 4Hsu7CY1Q3yNdZHnqQIOzg==
X-CSE-MsgGUID: zGKS7FqpR1iuq7oKnwQgYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79902047"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Oct 2024 03:36:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t26os-000Otn-1o;
	Sat, 19 Oct 2024 10:36:26 +0000
Date: Sat, 19 Oct 2024 18:36:05 +0800
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
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <202410191710.kHHObl1i-lkp@intel.com>
References: <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next arm64/for-next/core linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20241015-185302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20241015105133.656360-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: arm-randconfig-r123-20241018 (https://download.01.org/0day-ci/archive/20241019/202410191710.kHHObl1i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241019/202410191710.kHHObl1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191710.kHHObl1i-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/rtc/rtc-s32g.o: in function `cycles_to_sec':
>> rtc-s32g.c:(.text.cycles_to_sec+0x60): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/rtc/rtc-s32g.o: in function `rtc_clk_src_switch':
   rtc-s32g.c:(.text.rtc_clk_src_switch+0x110): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

