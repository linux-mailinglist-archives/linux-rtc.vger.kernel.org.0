Return-Path: <linux-rtc+bounces-5849-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIn+GjiXdWlUGgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5849-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 05:08:24 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B358F7FBBE
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 05:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA96C301368C
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Jan 2026 04:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66023221DB1;
	Sun, 25 Jan 2026 04:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb1ND8Ea"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E71373;
	Sun, 25 Jan 2026 04:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769314074; cv=none; b=U6NUNnKuyDvjUCyR2Vrxrm1Hz50NX8TcSo0BiX4iaxsc2t1x1oiR9GFEt6xuEEGsPTX2bjCEct3yFVo/Y6Enk4RxPrqiZ2FG682kTTTgIFnndIkBwP6nFTbY9LZr1Yt6Jg+idnQi38CEcav7h6jkHUidTdeCTPQ1v6TC7QCL44s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769314074; c=relaxed/simple;
	bh=z/Q3Uki5iUeDrYudztHt8sojXXIhjVcCLpsmjGeWo9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQyDZDAjk7Xa1KJPy+da/y3EmHmYhe776ejokc+bKgr/lzOsKidcIOuWci+DuLygVajzD9qRwRZ5O70lcuV0/XhTjLzcXBAghUtKWsKgRtkjLsQlP84r/b6Ve8aXxUM+2TzRTg54ApC3LtgwakqY6VrQAdXZYmkTPt4de9LH8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb1ND8Ea; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769314072; x=1800850072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z/Q3Uki5iUeDrYudztHt8sojXXIhjVcCLpsmjGeWo9c=;
  b=Fb1ND8Ea94J+Y4nFNEdPnomrjWCL0q8j0fXJ3xKW6PyKUjmJUVTUstty
   oX5eB4iXrmc/uXFoMkArZDR3UZMTOwupPNyXqj1Pj0qqfh/l4naG0SJUZ
   oSj9goCW68oaa9SAZKKdvEyhr/vFm/0rBESgIuuOmoc6Olpwiq+aCj749
   9LTQ7xyl2EsGu0zkkZD2nOBB6CaDWNoUqIIfOUeZxJnopMB40jRa8Rvn7
   PlH3OzvuhasO3jI79eQbqYGEBo+hsC/18T0Y5viQcbgfIWATE0FrfJ8Tt
   RK+hKJEzsrqOoCwWX6TeXzMERDCA5FjufceoFqeXWyHupzePutRWEUzZS
   g==;
X-CSE-ConnectionGUID: o/516+K9QF6KreD5GQCXiQ==
X-CSE-MsgGUID: vDsYl2jXTg+rKeLw/qWl5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70419465"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70419465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 20:07:51 -0800
X-CSE-ConnectionGUID: nM2A70SRQ/+OhsvZU2XmIQ==
X-CSE-MsgGUID: iJHVGoymRpu9ROwGyASi6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207798954"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jan 2026 20:07:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjrPc-00000000Vl4-2R1P;
	Sun, 25 Jan 2026 04:07:44 +0000
Date: Sun, 25 Jan 2026 12:07:37 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH 4/7] clk: sunxi-ng: Extract common RTC CCU clock logic
Message-ID: <202601251139.9CCmxdok-lkp@intel.com>
References: <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5849-lists,linux-rtc=lfdr.de];
	FREEMAIL_TO(0.00)[pigmoral.tech,baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: B358F7FBBE
X-Rspamd-Action: no action

Hi Junhui,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/dt-bindings-rtc-sun6i-Add-Allwinner-A733-support/20260121-192151
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260121-a733-rtc-v1-4-d359437f23a7%40pigmoral.tech
patch subject: [PATCH 4/7] clk: sunxi-ng: Extract common RTC CCU clock logic
config: arm64-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251139.9CCmxdok-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251139.9CCmxdok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251139.9CCmxdok-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ccu_iosc_32k_ops" [drivers/clk/sunxi-ng/sun6i-rtc-ccu.ko] undefined!
>> ERROR: modpost: "ccu_iosc_ops" [drivers/clk/sunxi-ng/sun6i-rtc-ccu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

