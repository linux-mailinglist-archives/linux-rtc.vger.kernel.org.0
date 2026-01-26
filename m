Return-Path: <linux-rtc+bounces-5895-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGQAMDtWd2nMeAEAu9opvQ
	(envelope-from <linux-rtc+bounces-5895-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 12:55:39 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7387E27
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 12:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B11303B4D2
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 11:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63B933372E;
	Mon, 26 Jan 2026 11:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQCE72yr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404123314C3;
	Mon, 26 Jan 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428251; cv=none; b=DJOvYrCgaKwMOJQzu+1gCrMAUQdDghj1ufO5lHRiq8p6cZ+goXU3Lh9E4ajD07MeiJeKuqxghMsGqiHXuc05sjwtnPIDbuxhDestCNHfSKwAuoIXQkFYtJEY9FyLZ+G6a5yqjKL2afYvekoyu0AVpkX4tqFUvcVZgvnWBULbMGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428251; c=relaxed/simple;
	bh=jQrD/YnqEmhH+/JMx3dt7/PiA6+c+hcKXnVnjT1UfMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWXdVNA5C6C47SkEPqAHYSGggBLH9soXDo6Fxg7DGmOdB0pXzEKq3T6ouEt95jXNQxL7evur43pVDZ21Ph3B0fb83slC8Z7PK9MK1EP+1ItbfDbbMqvDGbzaBYG/w8YL4oOVBY5Mmp32ZjniEZQk4YgtY8clCg046PXaSv+yOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQCE72yr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769428250; x=1800964250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jQrD/YnqEmhH+/JMx3dt7/PiA6+c+hcKXnVnjT1UfMA=;
  b=HQCE72yrX1aBtZq4joxePaf0vt6ckGBabaYb3bn5F0BHTMXEpkGuJm2F
   dWrGMRz6DpQXSWn4+EhVxfhqAFDCYltlssYMMQDFJrPDIXbopPv2syREI
   6UK2xhp21zYE6FGT3+VSdURn2DwiZJRCyWA9ZJxWYoFKlCNwFdI5baJpC
   AXXXkygd31rQKH+BhpBm+Svh7ef/c7EoV2HXW73BIlDyVmcBzR5lMy/gB
   hgpZ8ydcujlCd/Dg0eQrgbJE+u6M5h5+9NxByGhdAENEBv3vgljt0wFHb
   wGexiqonELMTjJ8NCT3MjG3gHsOTcQ1R+RistgCCzn9VCb7ptw/GfvxFm
   A==;
X-CSE-ConnectionGUID: RTBvYqBgQ9uveeHlQ7u0ZQ==
X-CSE-MsgGUID: tm+oHFG3SROjNxq5ld/cuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70646542"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70646542"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:50:50 -0800
X-CSE-ConnectionGUID: q1XQs/B5R0SyTvVYgtRR5g==
X-CSE-MsgGUID: lI3OErbwTUCCByJAmwLyEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="238340181"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.122])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:50:44 -0800
Date: Mon, 26 Jan 2026 13:50:42 +0200
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
Message-ID: <aXdVEtHVmArFhqFB@smile.fi.intel.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-3-clamor95@gmail.com>
 <aXc9n_gc7TEFvNA8@smile.fi.intel.com>
 <CAPVz0n0MM6OcjOWnNBaGk=6eYcb09P0XBFDn+MYHtXXcgkcvQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0MM6OcjOWnNBaGk=6eYcb09P0XBFDn+MYHtXXcgkcvQQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-5895-lists,linux-rtc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smile.fi.intel.com:mid]
X-Rspamd-Queue-Id: 25E7387E27
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 12:13:39PM +0200, Svyatoslav Ryhel wrote:
> пн, 26 січ. 2026 р. о 12:10 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Sun, Jan 25, 2026 at 03:42:54PM +0200, Svyatoslav Ryhel wrote:

...

> > What a style! (Yeah, I see it's being used elsewhere here...)
> 
> I have just made it in same way the other tables present in here.

I understood that (see my note in the parentheses above).

-- 
With Best Regards,
Andy Shevchenko



