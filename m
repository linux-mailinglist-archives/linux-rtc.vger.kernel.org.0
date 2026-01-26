Return-Path: <linux-rtc+bounces-5886-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G+HAC4+d2mMdQEAu9opvQ
	(envelope-from <linux-rtc+bounces-5886-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:13:02 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90977867E0
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BA57302E412
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 10:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C4132E72B;
	Mon, 26 Jan 2026 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ui9b5nwa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD13064AF;
	Mon, 26 Jan 2026 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422248; cv=none; b=G0e65kHYcoSiJE8gfuNtGpM3jAupTg/e3HEJXtl5ESnU4ic+yj/5M1jDuD2y5JVg9SFNpu62upX6gwSPGLHWkQvPrwpxw0FgqQJ+IBSZh7m7cSR2pVn3Qfw8e9gQSadXOi1YfeS1NLzrj0XW1okwNBD3HeAUK9WwTwnABVrGQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422248; c=relaxed/simple;
	bh=Tw1PGm4BgpZd9LnQ5sgcPOcjTd28/XnCmSCwK2lu8Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loztVnPzXo6ZEbD4igoCgp1x12x+ubNTkGGSFoc71/VL/pVskqhlPob47cLlnT6AdNFcwqT2M9INTId7/bOsytzt1kB4L0ZzZyz8OsQXi2FHSi5DaV1X+W76DqjlYBwk2a3ZHppwrTGQi1jOpLCo6iGQktvhqPqlFdtk30u3CRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ui9b5nwa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769422247; x=1800958247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tw1PGm4BgpZd9LnQ5sgcPOcjTd28/XnCmSCwK2lu8Vw=;
  b=Ui9b5nwaKcQ8BLx9ZkevT5VfqxA9bowd+uoBxew9PhCHejjCJTclE8mQ
   xeEkq4+b07weUxWPsnATSEYyikV0hstMEGKGuLC+4k5I2tUqf26kbnI0g
   RRhhrgjyNyPK0RP55yczHad5v3HKFb8FHtpJKKibGpmAnviAB6SlbXLPy
   NSChIDWfRLoWpkO1zkg89PS8t9otyVqw48D3pkEwDxqQAkLrbPRsXuMfd
   U0CFNhg6R72lXTeaUnqy+/+rb6RGRKpqDXDJ7HDVrLa2dPWfBoTza2hk7
   uiaJK8yZg8DsYGh62KqSmwp39am4/ylJFtACmWUIzVhwuCxq0tROFkpKE
   g==;
X-CSE-ConnectionGUID: gPl97HbmSOqWn9QTcrvoxQ==
X-CSE-MsgGUID: mWkYWzcJTCWOkuBLZo/W+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74439458"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74439458"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:10:46 -0800
X-CSE-ConnectionGUID: PS1MA59iSFafenoqNWnutg==
X-CSE-MsgGUID: ASba5ayqQdi7cp9BIj2Fxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207892624"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 02:10:41 -0800
Date: Mon, 26 Jan 2026 12:10:39 +0200
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
Subject: Re: [PATCH v1 02/10] regulator: cpcap-regulator: add support for Mot
 regulators
Message-ID: <aXc9n_gc7TEFvNA8@smile.fi.intel.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260125134302.45958-3-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5886-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,smile.fi.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90977867E0
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 03:42:54PM +0200, Svyatoslav Ryhel wrote:
> Add support for regulator set used in Motorola Mot board, used as a base
> for Atrix 4G and Droid X2 smartphones.

...

> +static const unsigned int sw_mot_val_tbl[] =  { 600000, 612500, 625000,
> +						637500, 650000, 662500,
> +						675000, 687500, 700000,
> +						712500, 725000, 737500,
> +						750000, 762500, 775000,
> +						787500, 800000, 812500,
> +						825000, 837500, 850000,
> +						862500, 875000, 887500,
> +						900000, 912500, 925000,
> +						937500, 950000, 962500,
> +						975000, 987500, 1000000,
> +						1012500, 1025000, 1037500,
> +						1050000, 1062500, 1075000,
> +						1087500, 1100000, 1112500,
> +						1125000, 1137500, 1150000,
> +						1162500, 1175000, 1187500,
> +						1200000, 1212500, 1225000,
> +						1237500, 1250000, 1262500,
> +						1275000, 1287500, 1300000,
> +						1312500, 1325000, 1337500,
> +						1350000, 1362500, 1375000,
> +						1387500, 1400000, 1412500,
> +						1425000, 1437500, 1450000,
> +						1462500, 1475000, };

What a style! (Yeah, I see it's being used elsewhere here...)

...

> +	CPCAP_REG(VAUDIO, CPCAP_REG_VAUDIOC, CPCAP_REG_ASSIGN4,
> +		  CPCAP_BIT_VAUDIO_SEL, vaudio_val_tbl,
> +		  0x16, 0x1, 0x5, 0, 0),

> +	{ /* sentinel */ },

No trailing comma for sentinel.

> +};

-- 
With Best Regards,
Andy Shevchenko



