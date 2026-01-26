Return-Path: <linux-rtc+bounces-5891-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDp3Bs0+d2mMdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5891-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:15:41 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A06FE869AD
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B23A8300DF72
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 10:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFEA33030F;
	Mon, 26 Jan 2026 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6PEMxGs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42E3064AF;
	Mon, 26 Jan 2026 10:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422288; cv=none; b=ig3pmOQfwogQS1AWyP5FyyO0yj5XGKz7Byl7FJAm6uuML3QkyCS5S57AAsGYvz/N2wPhJ7wvlZR1+NaYz7Q0VRadHVCC68mPrlNeOyfs4RrwRYjD0cyW+gOz/XLlXRMEi77U50ABfVmc3wF541QJ8c7A9gqdXfWPsEMMKFJjxuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422288; c=relaxed/simple;
	bh=Pmr/8bMfIURHj4kvuP+Z5tCsiw6ufGUR1THBYRM6fnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2d/K8W0QxkKQaJ6gK9yRl9PLb7yyol4uJ6lFhjHqqT41KCsVcDa4NZVU9CgUZ2YKtNUHdKeuAuMfgrObB1CsBUBf47bAh9Uh7ztqak0KAP2CdK9saxDUu8/FWvszDn+LLbeHi1M6mzB8OYN1pJCUEicYlXRB9X2fERVGLWOumQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6PEMxGs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769422287; x=1800958287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pmr/8bMfIURHj4kvuP+Z5tCsiw6ufGUR1THBYRM6fnI=;
  b=S6PEMxGsmuDV5U+XJJSYgEtMgu/LN2KANetS13thAPKaC6kpvz01W9hj
   wlRjf2NBOQSgbgVmvdp4KORr0RdqS/ESo2AkiPXVELdaP7MEyfGNnc/q2
   o64jdFDXfXEv+EJSaTqjlhQlpj6a6VGKUJfJ/8MVBPKVGl3tSSsepkvK0
   q23heSPf2Ta0UB7XMaknaJ39Sy32cs7FxLp7e+5e3bRsLRlNfIp8eN9/i
   CKpLbouWWyTvwymq3E5Hiut4LP3vfUVBoZb6HK2kplfp1vJ32cEzbwdZp
   mSMssYMYWYl01Om5u+cKugJ5J9EjdYQeFUuZduy11/Ze185TiL/4b3qYf
   w==;
X-CSE-ConnectionGUID: kX6DYKA4RHufK/4IPvoD7Q==
X-CSE-MsgGUID: JhSWxA2gSY2p0mmRDkScpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74226710"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74226710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:11:26 -0800
X-CSE-ConnectionGUID: I6229W/iQKCOPsGa4oMNMQ==
X-CSE-MsgGUID: a0bMpN71QlKz83jXby+wtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="206760843"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:11:21 -0800
Date: Mon, 26 Jan 2026 12:11:18 +0200
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
Subject: Re: [PATCH v1 04/10] iio: adc: cpcap-adc: add support for Mot ADC
Message-ID: <aXc9xnUfvLg3diRR@smile.fi.intel.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125134302.45958-5-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5891-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smile.fi.intel.com:mid,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A06FE869AD
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 03:42:56PM +0200, Svyatoslav Ryhel wrote:
> Add support for ADC found in Motorola Mot board, used as a base for
> Atrix 4G and Droid X2 smartphones.

...

> -	{ }
> +	{ /* sentinel */ },

Stray change.

-- 
With Best Regards,
Andy Shevchenko



