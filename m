Return-Path: <linux-rtc+bounces-6248-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INtbISrIw2lKuAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6248-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 12:34:02 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3F323F70
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 12:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E41031683CC
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 11:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAE63CCFB2;
	Wed, 25 Mar 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRRg3P8r"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50473BE623;
	Wed, 25 Mar 2026 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437755; cv=none; b=QACSnGOucT5g1QJ+8Fv1xhX6hRbmwhUzCtftZ/LHuNgteGw1VkVNCB74VgRehuDlwkjYDsq4CmiEUs41lp2V1v1LGsacGzpfHGIl2EDv30sCx/iIxBtoPjk42GCyUWDs3kbjbZTMrv7B6pv7HmBaF0Zpj6yoMAc5fWWdWCl7WMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437755; c=relaxed/simple;
	bh=O6d0BGiBXFmx8FooLw5bLabbLInDXePEHVkVIeZrTSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgmPVTCHjdeRB1LOiBAYyohLlRX01GO9VA5xL8bUg7pg6/QcKOoXT088G0Mxm5ksa5VdXdy5go5KLvtyLlrmch631bUVsJFvsqniVLYyDsgRyRaHdg6A8T56dQJKYGMdTkxfAKA0pQ4ixpHHVSoFKOxx0PxPXk5gOGqe7bRqIfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRRg3P8r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD94FC2BC9E;
	Wed, 25 Mar 2026 11:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774437755;
	bh=O6d0BGiBXFmx8FooLw5bLabbLInDXePEHVkVIeZrTSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRRg3P8rXQ70MgQZPJRGO5qWoPsq0GPMlKJC1zMfMw/q90eAVc4KwYvMn83N7apeA
	 2HEwC6UcEZbNG4t6Q+sndvaqdgbgLslDuuaB2u+1qDPOq2S384D5UcHJrxYD/RdX7o
	 t8YSFuv+IaSqUBS/AKJmjCD3ZqITrMr+GZXU4wgx5EKnNCHcvxXFyRwVUNRc8MpgHN
	 cFjxNzBPpdza8AyE3dCrYUPLhIW9G+SkiG+PFn9Ja+7eDXGlBKpSUCiYeh3eEeFuUS
	 8plv/u+U5NfoBY3LSWuyNi4U5LV/6I8vmGBFj934eNhwWw3iffHNiFWVjQXhI15awr
	 xscZetLxYKQGw==
Date: Wed, 25 Mar 2026 11:22:28 +0000
From: Lee Jones <lee@kernel.org>
To: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
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
Message-ID: <20260325112228.GF2902881@google.com>
References: <20260222-sc27xx-mfd-cells-v1-0-69526fe74c77@abscue.de>
 <20260222-sc27xx-mfd-cells-v1-4-69526fe74c77@abscue.de>
 <20260309185856.GZ183676@google.com>
 <ab2i6i2D5q0t0xZ5@abscue.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab2i6i2D5q0t0xZ5@abscue.de>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6248-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,gmail.com,linux.alibaba.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BF3F323F70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Could you clarify what should be changed?

Sure.

> On Mon, Mar 09, 2026 at 06:58:56PM +0000, Lee Jones wrote:
> > On Sun, 22 Feb 2026, Otto Pflüger wrote:
> > 
> > > To allow instantiating subdevices such as the regulator and poweroff
> > > devices that do not have corresponding device tree nodes with a
> > > "compatible" property, use devm_mfd_add_devices() with MFD cells instead
> > > of devm_of_platform_populate(). Since different PMICs in the SC27xx
> > > series contain different components, use separate MFD cell tables for
> > > each PMIC model. Define cells for all components that have upstream
> > > drivers at this point.
> > 
> > We're not passing one device registration API's data (MFD)
> > through another (Device Tree).
> > 
> > Pass an identifier through and match on that instead.
> > 
> > Look at how all of the other drivers in MFD do it.
> >
> > [...]
> > > +static const struct mfd_cell sc2730_devices[] = {
> > > +	MFD_CELL_OF("sc2730-adc", NULL, NULL, 0, 0, "sprd,sc2730-adc"),
> > > +	MFD_CELL_OF("sc2730-bltc", NULL, NULL, 0, 0, "sprd,sc2730-bltc"),
> > > +	MFD_CELL_OF("sc2730-efuse", NULL, NULL, 0, 0, "sprd,sc2730-efuse"),
> > > +	MFD_CELL_OF("sc2730-eic", NULL, NULL, 0, 0, "sprd,sc2730-eic"),
> > > +	MFD_CELL_OF("sc2730-fgu", NULL, NULL, 0, 0, "sprd,sc2730-fgu"),
> > > +	MFD_CELL_OF("sc2730-rtc", NULL, NULL, 0, 0, "sprd,sc2730-rtc"),
> > > +	MFD_CELL_OF("sc2730-vibrator", NULL, NULL, 0, 0, "sprd,sc2730-vibrator"),
> > > +};
> > > +
> > > +static const struct mfd_cell sc2731_devices[] = {
> > > +	MFD_CELL_OF("sc2731-adc", NULL, NULL, 0, 0, "sprd,sc2731-adc"),
> > > +	MFD_CELL_OF("sc2731-bltc", NULL, NULL, 0, 0, "sprd,sc2731-bltc"),
> > > +	MFD_CELL_OF("sc2731-charger", NULL, NULL, 0, 0, "sprd,sc2731-charger"),
> > > +	MFD_CELL_OF("sc2731-efuse", NULL, NULL, 0, 0, "sprd,sc2731-efuse"),
> > > +	MFD_CELL_OF("sc2731-eic", NULL, NULL, 0, 0, "sprd,sc2731-eic"),
> > > +	MFD_CELL_OF("sc2731-fgu", NULL, NULL, 0, 0, "sprd,sc2731-fgu"),
> > > +	MFD_CELL_NAME("sc2731-poweroff"),
> > > +	MFD_CELL_NAME("sc2731-regulator"),
> > > +	MFD_CELL_OF("sc2731-rtc", NULL, NULL, 0, 0, "sprd,sc2731-rtc"),
> > > +	MFD_CELL_OF("sc2731-vibrator", NULL, NULL, 0, 0, "sprd,sc2731-vibrator"),
> > >  };
> 
> Assuming that these tables are the "registration API's data", I don't
> see where it is being passed through the device tree. The device tree
> contains nodes for some of these MFD components, and I've listed their
> compatibles here so that the MFD core finds these nodes and registers
> them with the corresponding devices (which was previously done
> automatically by devm_of_platform_populate).
> 
> > >  
> > >  /*
> > > @@ -59,12 +84,16 @@ static const struct sprd_pmic_data sc2730_data = {
> > >  	.irq_base = SPRD_SC2730_IRQ_BASE,
> > >  	.num_irqs = SPRD_SC2730_IRQ_NUMS,
> > >  	.charger_det = SPRD_SC2730_CHG_DET,
> > > +	.cells = sc2730_devices,
> > > +	.num_cells = ARRAY_SIZE(sc2730_devices),

Remove these from here.

Either replace them with an ID that you can match on or stop passing
'sc2730_data' through .data and pass an ID through there instead.  Then
choose 'sc2730_data' and 'sc2730_devices' in an switch() statement
instead, just like the vast majority of existing MFD drivers do.

> > >  };
> > >  
> > >  static const struct sprd_pmic_data sc2731_data = {
> > >  	.irq_base = SPRD_SC2731_IRQ_BASE,
> > >  	.num_irqs = SPRD_SC2731_IRQ_NUMS,
> > >  	.charger_det = SPRD_SC2731_CHG_DET,
> > > +	.cells = sc2731_devices,
> > > +	.num_cells = ARRAY_SIZE(sc2731_devices),
> > >  };
> 
> Here I am simply referencing the tables above in the device-specific
> MFD data. These structs containing device-specific data already exist,
> they are private to the MFD driver, and I wouldn't consider them part
> of the device tree.
> 
> I've looked at mt6397-core.c and it seems to be doing the exact same
> thing with its "struct chip_data".

That was a momentary oversight.  It's also passing a driver-level
call-back which I despise.  However, past mistakes are not good
justifications for new ones.

> Some other drivers use a numeric ID
> for this purpose, but how would that be different from a pointer as long
> as it identifies the same data within the MFD driver?

The point is that sc2731_data->cells would be passed through the Device
Tree's .data attribute, which is not allowed.

-- 
Lee Jones [李琼斯]

