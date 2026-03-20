Return-Path: <linux-rtc+bounces-6240-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKvrE/ymvWkAAAMAu9opvQ
	(envelope-from <linux-rtc+bounces-6240-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 20:58:52 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0FF2E0A25
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 20:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A84D23054672
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2026 19:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ECD3542E2;
	Fri, 20 Mar 2026 19:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b="NX0bTnSQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D68D346AD7;
	Fri, 20 Mar 2026 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.28.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774036217; cv=none; b=N2hEYb4RVXRjB3yEdqDQ6nvM6/MAXKgct5poEFL0vXKqGKWy9ewlAN3j2IwI5sztUbBmfG7IvYkopQGtobvzpkA5AYL3DsepXKF1wKg5n1grFM/CRAy2dLo3IiPQcPRYWFsPz+S5NFxdbWd+/Dn5SEYKwM3Hn97Gy7G7wh1EhiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774036217; c=relaxed/simple;
	bh=B/ky4PGRNNPwvyb7fxbPkwqn5WgnAc0pdjMw1TIYUh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCxCptvTdwO0ak5pkgAu+p1YJMMCo3/Q6O9qKgGH99dPg0rQo914YoFj0zv81yUSiTG0DBa0tBWeMX/pl9HQU+0KpmuLy/DiQCACbqci6nCO/P25kOjiBgQSjUNshj14PtmkJ2QD4Gqp6kniTYaZY6jmDHhQtfoie4H0aq+gCJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de; spf=pass smtp.mailfrom=abscue.de; dkim=pass (2048-bit key) header.d=abscue.de header.i=@abscue.de header.b=NX0bTnSQ; arc=none smtp.client-ip=89.58.28.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=abscue.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abscue.de
Date: Fri, 20 Mar 2026 20:41:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abscue.de; s=dkim;
	t=1774035696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TodcsqwI5ROLukzlDCPSJPqsdnPQpyDS0/5H+3q7Ng8=;
	b=NX0bTnSQab948BmULIE2Ptruv/tMxhE8hiI9Cq2979f+b9JOXCGXh58wsNonDP+c99bq4j
	70RsjA7KCYuLwXkhSNtG4Ta/i7aX3VOhC4pFQLGt+Mnsa3azDbF6JEGYQunIvPKtXcvksu
	YEYkfvAtBgZ9XoWxbGSuumofla32noZKW+D8/GRYnTo75kuDwQfmt58gbQLmVBThfHF3qH
	9C4Oa5gM/2kGpUn9HUdY/7BQw607bij6V0NKE2d+mMmH+mgdeJ7S+c40KxsJ/vKFV6Ehbg
	N/cY0YKI2RGgopP+xSeCGcipBQXV6bAOPtXCMudm/1eZ0ohjkrTZsS/KMBMsBg==
From: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To: Lee Jones <lee@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/6] mfd: sprd-sc27xx: Switch to devm_mfd_add_devices()
Message-ID: <ab2i6i2D5q0t0xZ5@abscue.de>
References: <20260222-sc27xx-mfd-cells-v1-0-69526fe74c77@abscue.de>
 <20260222-sc27xx-mfd-cells-v1-4-69526fe74c77@abscue.de>
 <20260309185856.GZ183676@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309185856.GZ183676@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[abscue.de:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6240-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[abscue.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[otto.pflueger@abscue.de,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[abscue.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,abscue.de:dkim,abscue.de:mid]
X-Rspamd-Queue-Id: BE0FF2E0A25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 06:58:56PM +0000, Lee Jones wrote:
> On Sun, 22 Feb 2026, Otto Pflüger wrote:
> 
> > To allow instantiating subdevices such as the regulator and poweroff
> > devices that do not have corresponding device tree nodes with a
> > "compatible" property, use devm_mfd_add_devices() with MFD cells instead
> > of devm_of_platform_populate(). Since different PMICs in the SC27xx
> > series contain different components, use separate MFD cell tables for
> > each PMIC model. Define cells for all components that have upstream
> > drivers at this point.
> 
> We're not passing one device registration API's data (MFD)
> through another (Device Tree).
> 
> Pass an identifier through and match on that instead.
> 
> Look at how all of the other drivers in MFD do it.
>
> [...]
> > +static const struct mfd_cell sc2730_devices[] = {
> > +	MFD_CELL_OF("sc2730-adc", NULL, NULL, 0, 0, "sprd,sc2730-adc"),
> > +	MFD_CELL_OF("sc2730-bltc", NULL, NULL, 0, 0, "sprd,sc2730-bltc"),
> > +	MFD_CELL_OF("sc2730-efuse", NULL, NULL, 0, 0, "sprd,sc2730-efuse"),
> > +	MFD_CELL_OF("sc2730-eic", NULL, NULL, 0, 0, "sprd,sc2730-eic"),
> > +	MFD_CELL_OF("sc2730-fgu", NULL, NULL, 0, 0, "sprd,sc2730-fgu"),
> > +	MFD_CELL_OF("sc2730-rtc", NULL, NULL, 0, 0, "sprd,sc2730-rtc"),
> > +	MFD_CELL_OF("sc2730-vibrator", NULL, NULL, 0, 0, "sprd,sc2730-vibrator"),
> > +};
> > +
> > +static const struct mfd_cell sc2731_devices[] = {
> > +	MFD_CELL_OF("sc2731-adc", NULL, NULL, 0, 0, "sprd,sc2731-adc"),
> > +	MFD_CELL_OF("sc2731-bltc", NULL, NULL, 0, 0, "sprd,sc2731-bltc"),
> > +	MFD_CELL_OF("sc2731-charger", NULL, NULL, 0, 0, "sprd,sc2731-charger"),
> > +	MFD_CELL_OF("sc2731-efuse", NULL, NULL, 0, 0, "sprd,sc2731-efuse"),
> > +	MFD_CELL_OF("sc2731-eic", NULL, NULL, 0, 0, "sprd,sc2731-eic"),
> > +	MFD_CELL_OF("sc2731-fgu", NULL, NULL, 0, 0, "sprd,sc2731-fgu"),
> > +	MFD_CELL_NAME("sc2731-poweroff"),
> > +	MFD_CELL_NAME("sc2731-regulator"),
> > +	MFD_CELL_OF("sc2731-rtc", NULL, NULL, 0, 0, "sprd,sc2731-rtc"),
> > +	MFD_CELL_OF("sc2731-vibrator", NULL, NULL, 0, 0, "sprd,sc2731-vibrator"),
> >  };

Assuming that these tables are the "registration API's data", I don't
see where it is being passed through the device tree. The device tree
contains nodes for some of these MFD components, and I've listed their
compatibles here so that the MFD core finds these nodes and registers
them with the corresponding devices (which was previously done
automatically by devm_of_platform_populate).

> >  
> >  /*
> > @@ -59,12 +84,16 @@ static const struct sprd_pmic_data sc2730_data = {
> >  	.irq_base = SPRD_SC2730_IRQ_BASE,
> >  	.num_irqs = SPRD_SC2730_IRQ_NUMS,
> >  	.charger_det = SPRD_SC2730_CHG_DET,
> > +	.cells = sc2730_devices,
> > +	.num_cells = ARRAY_SIZE(sc2730_devices),
> >  };
> >  
> >  static const struct sprd_pmic_data sc2731_data = {
> >  	.irq_base = SPRD_SC2731_IRQ_BASE,
> >  	.num_irqs = SPRD_SC2731_IRQ_NUMS,
> >  	.charger_det = SPRD_SC2731_CHG_DET,
> > +	.cells = sc2731_devices,
> > +	.num_cells = ARRAY_SIZE(sc2731_devices),
> >  };

Here I am simply referencing the tables above in the device-specific
MFD data. These structs containing device-specific data already exist,
they are private to the MFD driver, and I wouldn't consider them part
of the device tree.

I've looked at mt6397-core.c and it seems to be doing the exact same
thing with its "struct chip_data". Some other drivers use a numeric ID
for this purpose, but how would that be different from a pointer as long
as it identifies the same data within the MFD driver?

Could you clarify what should be changed?

