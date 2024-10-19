Return-Path: <linux-rtc+bounces-2251-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9814C9A4CAF
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 11:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FC1E2850A6
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 09:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911BD1DF744;
	Sat, 19 Oct 2024 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bv7kXMeQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BCA1CCB38;
	Sat, 19 Oct 2024 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729331075; cv=none; b=lx71SvCsIJLav7GrP/cGRYce0K51/Zso/aPAtUxTyth2iquCCt+wWFUYYGQfwFdSo0jVsm5BL8NXOVSZ6GvPAgGcoomFbc+hJYJYw9ml1lGPnD3yZZSFjCLeQ/lH1dGvQym6WUGF9wxqLfWsu2mDgzm/FErhtogNHcFgWDNQlPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729331075; c=relaxed/simple;
	bh=QX8/nemducOmQswsWe9Bi0VvgQBgVJdn0IlaRkFtIso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGeqI5XU247u338RNYW5OpfTVsWVgBsIARx5NFzya18BfS41i8vf+2pIsDdLr4WEQMOmbgs9d14tOceroh1eCzq7M4UdQhVYD3dPKVmlHt/C9cNGC3K/z76E00cYItChoPPLypmMS4JKhdIJmSvWSjOMF6UpQwcR85uObBpTSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bv7kXMeQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729331072; x=1760867072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QX8/nemducOmQswsWe9Bi0VvgQBgVJdn0IlaRkFtIso=;
  b=Bv7kXMeQ1DdRsmA/9yU37SJnXJaGjggZJWTWPzV4DIKX37h0/bzblXCf
   7KPUpXeZ+9mRJGUP9jYDPxgmxm379UufK8/ev61KUkb25djdBO1X2HxqN
   xXso/lvUwLgvHBPcZjq/TlAPW8XbJGSOrb7oGT4kCDOPG/jhOkBwy7MDx
   WxW9fsPGBBRznLKdGc75pi3+nFJV0IAKOk67vYFvQdZsoht3UDp3kRcjQ
   gdXgbAwWhnt/QftVV5Wx1HabrIyW3SKEvy3GCz+l8GtgRwz8GY92rdlzR
   yQYZJSrTHyEvjQ0fkoO0jQNYlm02eOuWaTYzR1/uaDV+JRdOi3TY8G/bD
   A==;
X-CSE-ConnectionGUID: Wcyxw59WRemxv4Jp0D+EZg==
X-CSE-MsgGUID: wL45fbQ+QZK8t3D8yueItg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28995770"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="28995770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 02:44:31 -0700
X-CSE-ConnectionGUID: X6HaMBOMTZKR/RO4MH0ySw==
X-CSE-MsgGUID: 7lKwWQgETyGgi6Hmw0eIxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79145233"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Oct 2024 02:44:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t260X-000OsD-1w;
	Sat, 19 Oct 2024 09:44:25 +0000
Date: Sat, 19 Oct 2024 17:43:51 +0800
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
Message-ID: <202410191711.oc5s2ZYc-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on robh/for-next arm64/for-next/core linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-rtc-add-schema-for-NXP-S32G2-S32G3-SoCs/20241015-185302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20241015105133.656360-3-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
config: alpha-randconfig-r071-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191711.oc5s2ZYc-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191711.oc5s2ZYc-lkp@intel.com/

smatch warnings:
drivers/rtc/rtc-s32g.c:221 s32g_rtc_read_time() warn: unsigned 'sec' is never less than zero.
drivers/rtc/rtc-s32g.c:221 s32g_rtc_read_time() warn: error code type promoted to positive: 'sec'
drivers/rtc/rtc-s32g.c:239 s32g_rtc_read_alarm() warn: unsigned 'sec' is never less than zero.
drivers/rtc/rtc-s32g.c:239 s32g_rtc_read_alarm() warn: error code type promoted to positive: 'sec'

vim +/sec +221 drivers/rtc/rtc-s32g.c

   210	
   211	static int s32g_rtc_read_time(struct device *dev,
   212				      struct rtc_time *tm)
   213	{
   214		struct rtc_priv *priv = dev_get_drvdata(dev);
   215		u64 sec;
   216	
   217		if (!tm)
   218			return -EINVAL;
   219	
   220		sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
 > 221		if (sec < 0)
   222			return -EINVAL;
   223	
   224		rtc_time64_to_tm(sec, tm);
   225	
   226		return 0;
   227	}
   228	
   229	static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
   230	{
   231		struct rtc_priv *priv = dev_get_drvdata(dev);
   232		u32 rtcc, sec_left;
   233		u64 sec;
   234	
   235		if (!alrm)
   236			return -EINVAL;
   237	
   238		sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
 > 239		if (sec < 0)
   240			return -EINVAL;
   241	
   242		rtc_time64_to_tm(sec, &alrm->time);
   243	
   244		rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
   245		alrm->enabled = sec && (rtcc & RTCC_RTCIE);
   246	
   247		alrm->pending = 0;
   248		if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
   249			alrm->pending = !!sec_left;
   250	
   251		return 0;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

