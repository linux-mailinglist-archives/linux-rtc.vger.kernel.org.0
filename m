Return-Path: <linux-rtc+bounces-5892-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMW3InU+d2mMdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5892-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:14:13 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FA286865
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F7C33018C2A
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 10:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4D732ED58;
	Mon, 26 Jan 2026 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHhE+Q5i"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240E30BF79;
	Mon, 26 Jan 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422419; cv=none; b=Efmv6lJ9gv7wEmzROSK1AhuREkOemHXb5ZQDLpvDwFd3nrFKmvDQn3JoScNmhzU6uNVB7HUOQA+m2TQNN/LLlbK1TIP+Z6CffTk1a0rdZHSm79oF0gVByA7hMhaiYoXELln5TEonTQ5ZodBfRI9wsCZ5XmfQl6PGrFcilskC37s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422419; c=relaxed/simple;
	bh=bxAsgAI1bcwqUPWb9MMZ6DfQMOVlA+K8LCl1jZgHiIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKxW9rMmwFAnDC2mSDD7+8mOfhSnRLjhcAQUiXWnZNY8Dj4BCGXw9Ua8eNtJ34KnUYKZzEJqJcvAlIq5g3aYuH34nvCrb7RW/7AMIuldMqB45oifNpM0/rxrVE+rCcAHW/ar6gN+f4WVqaqNiPtcVWHE9DWUoYcCPY2TWeLnT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHhE+Q5i; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769422417; x=1800958417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bxAsgAI1bcwqUPWb9MMZ6DfQMOVlA+K8LCl1jZgHiIU=;
  b=IHhE+Q5idfwXa8hviBbGwueVAX07CdwbyVL2ZuwjceO79V9Wktz1Rt2s
   9dsHiy0R8HdNPpc/NnHTmT8K+GxiKf5ZJZVl+Lnba/vsWXujIGklTBoaV
   JPvtjRRwgCjEP1rZdUnZl3kdm/zCclNz2z/sYE3rjGouGGP0c6JXP3Jbs
   F44H2THIFjUPTdXkJ3CDaU5zx/nWGF2I1M4S+x+7x157GYgwwmV8bJrG6
   tbG0wzCb+7l/SsZgZfJAPj0jK2nGNwGV1frKOJ0238ICLOdqPX5P8QmG1
   ne0AuD3C2eQbokCDirUYnYknNyWeswFtEXffBZH/MnG0E9s7pG7xF60QX
   g==;
X-CSE-ConnectionGUID: ijvVfCWKTXKuMKY3YaoHig==
X-CSE-MsgGUID: 6MrvQwnfRKW+jX8nEQOKtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74439626"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74439626"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:13:36 -0800
X-CSE-ConnectionGUID: Sbn7hhujTT2n2mu8LbYuKw==
X-CSE-MsgGUID: xGI3w2RgTCiNPUKvpvI9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207892953"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:13:32 -0800
Date: Mon, 26 Jan 2026 12:13:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 09/10] mfd: motorola-cpcap: diverge configuration
 per-board
Message-ID: <aXc-Sklb6QTWLvcE@smile.fi.intel.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-10-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125134302.45958-10-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5892-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: F0FA286865
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 03:43:01PM +0200, Svyatoslav Ryhel wrote:
> MFD have rigid subdevice structure which does not allow flexible dynamic
> subdevice linking. Address this by diverging CPCAP subdevice composition
> to take into account board specific configuration.
> 
> Create a common default subdevice composition, rename existing subdevice
> composition into cpcap_mapphone_mfd_devices since it targets mainly
> Mapphone board.

...

> +#include <linux/of.h>

Why?


...

> +	cpcap->cdata = of_device_get_match_data(&spi->dev);

device_get_match_data() from property.h.

> +	if (!cpcap->cdata)
> +		return -ENODEV;
> +

...

> +static const struct of_device_id cpcap_of_match[] = {
> +	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
> +	{ .compatible = "st,6556002", .data = &cpcap_default_data },
> +	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},

> +	{ /* sentinel */ },

No trailing comma for sentinel.

> +};
> +MODULE_DEVICE_TABLE(of, cpcap_of_match);

-- 
With Best Regards,
Andy Shevchenko



