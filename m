Return-Path: <linux-rtc+bounces-1143-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 303578BFBDF
	for <lists+linux-rtc@lfdr.de>; Wed,  8 May 2024 13:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D778C1F21EA2
	for <lists+linux-rtc@lfdr.de>; Wed,  8 May 2024 11:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799787E799;
	Wed,  8 May 2024 11:22:04 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D85B8174F
	for <linux-rtc@vger.kernel.org>; Wed,  8 May 2024 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715167324; cv=none; b=olmqGIRLPxFw5a7Qvq3f1LsrlyWvbn+AUnXFvkpthq5XoISy7pUvZBpCi6mMuoKTYA8QgCTJZBH0J+HOwbbz4T5HlmzQjGJUtuQ0YkqIX7a0DYr7F7hNYlzm55nQmtqtBd/ftgVJj5GKnXxgMMkEhexQUSdGwZp3EflMhOo4n5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715167324; c=relaxed/simple;
	bh=Rk4IDAZWyh4Tcf01AB8ICMhQHOhx21y5B6Dx+Ev2wGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xr8WqLFe/JgrL+/5O6l9OimSnVzLmYPpY0dYspU0ea6Gqs/xfr3jLOVtXbNJAMC+GTAk6mLmKVAP2UzTMO2cyUPKCIObCKna14gd7W9p4mPXLSwFiBfUg7wqzxFLD4IGLXmKTrhHS71LvYY8SRYvKz8SerReFeo7K5uIEktz1AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Lb0bDhTUQ0esXLU2fS4aUg==
X-CSE-MsgGUID: 9VzBV9JSSwCjz+v7dEAKXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11181957"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11181957"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:20:55 -0700
X-CSE-ConnectionGUID: HGJoPe/URRmVu6wu0/Gqyw==
X-CSE-MsgGUID: ZS/RoXZCQ0+PGzxnXRYA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="28728397"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:20:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s4fLo-00000005PQT-42KN;
	Wed, 08 May 2024 14:20:44 +0300
Date: Wed, 8 May 2024 14:20:44 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v9 4/9] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
Message-ID: <ZjtgDMen_B8eCNm7@smile.fi.intel.com>
References: <20240508103118.23345-1-kabel@kernel.org>
 <20240508103118.23345-5-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508103118.23345-5-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 08, 2024 at 12:31:13PM +0200, Marek Behún wrote:
> Add support for true board poweroff (MCU can disable all unnecessary
> voltage regulators) and wakeup at a specified time, implemented via a
> RTC driver so that the rtcwake utility can be used to configure it.

...

> +	tmp = cpu_to_be32(get_unaligned_le32(&cmd[1]));
> +	put_unaligned_le32(crc32_be(0xffffffff, (void *)&tmp, sizeof(tmp)),
> +			   &cmd[5]);

	put_unaligned_le32(crc32_be(~0, (void *)&tmp, sizeof(tmp)), &cmd[5]);

-- 
With Best Regards,
Andy Shevchenko



