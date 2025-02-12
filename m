Return-Path: <linux-rtc+bounces-3178-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FABA32CAE
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 18:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 754551889A40
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Feb 2025 17:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD29256C62;
	Wed, 12 Feb 2025 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nkvwUDIq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AB7230D0E;
	Wed, 12 Feb 2025 17:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379713; cv=none; b=poV2W822BScs5LHaPanEocXRO2Q9f0u4Dtpi921UtWkLCa4Jd/RsJtvwS3mt66TWL9eAPpLi0jNtwt3YsQrvaLhLz2vwZ5Jfy60nVv+7bUkVlKidGAFXhKpGMQJIGrG+SXxg0EiUIFk+9X0oL6B4NDsbz1BBgWba65vX+a3GujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379713; c=relaxed/simple;
	bh=f7bsZrSCJK8cknmuE7idaLw1uF5TvWN0yXycVuabkyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuMzUSF92C+WMX45heSKjXNzrvwWdkQokQ6EK7mKaso7hKD4qbefj5ZLjyGKODlTVbFxLvVXZgVRV8x6BrmrjJDg7Vw5RTE18GR25/X7v25PysqEmQ88ApyxhWe/ZPk6o06m1kHp4XUBzaT4ta68jHe4pVyqV4GMvIcTvKed6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nkvwUDIq; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E03B344288;
	Wed, 12 Feb 2025 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739379708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tIDxvtWqr76y3j2xTfmMPHMycoVkae0xjT2IX/8T/vg=;
	b=nkvwUDIqCe5vB1DWqOwWLRbo3G8bL56ZprANHyRUp5ixVPfrcZDZKNSDVsnm30aWHbQ7uB
	9B0ccFJj5lVDXxVwVjujlSkasHJoCDbOGwcGx+xA+H+537/jhg6I1RyZPtvei+cSdUxZdh
	gUCehJBOYUxyQYAZ6HmWDKSel+pcwdK0q3maBtTnsuirFim4qt7mM8qVYOtElUN4QAAQ3C
	emWcl0uAYO6RDmKcqM9v3ScmmJJrsmAETCEisnh6JvZbsp6PAJvBRBJc87VNaN3YOXwnSL
	OO733W4m3sMViJX2HBMUEw1sy0F8jX+wPpN/Eed4oKwyexv+PmjWzqTnYIapIQ==
Date: Wed, 12 Feb 2025 18:01:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Message-ID: <20250212170147ee6863dc@mail.local>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6x7TBSjBFBxGo77@bogus>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehpvghnghdrfhgrnhesohhsshdrnhigphdrtghomhdprhgtphhtthhopehpvghnghdrf
 hgrnhesnhigphdrtghomhdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 12/02/2025 10:43:24+0000, Sudeep Holla wrote:
> On Wed, Feb 12, 2025 at 02:35:32PM +0800, Peng Fan wrote:
> > On Tue, Feb 11, 2025 at 04:59:53PM +0000, Sudeep Holla wrote:
> > >On Tue, Jan 21, 2025 at 02:31:55PM +0000, Peng Fan wrote:
> > >> 
> > >> It is the i.MX SCMI Protocol exports two RTCs using one protocol.
> > >> 
> > >> Two RTC devices are created, but share one parent device.
> > >> 
> > >> Do you mean each RTC device should have a unique parent device?
> > >>
> > >
> > >Can you point where is this check for unique parent ? I am not so familiar
> > >with RTC but I couldn't find myself with quick search.
> > 
> > The RTC ops takes the rtc parent as input parameter
> > https://elixir.bootlin.com/linux/v6.13.2/source/drivers/rtc/interface.c#L94
> > "err = rtc->ops->read_time(rtc->dev.parent, tm);"
> > 
> > So in the rtc device driver, there is no way to know which rtc it is just
> > from the parent device.
> >
> 
> If that is the expectation, you could create a platform or normal device
> per instance of RTC on your platform and slap them as parent device.

This would seem like the proper solution, why not using an MFD or
auxiliary bus ?

> 
> IIUC on any pure DT based system, a device node exists per RTC and hence
> platform device associated with it. And the RTC devices are created with
> parent pointing to unique platform device.
> 
> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
> > current RTC framework, we could only pick one RTC and pass the id to BBM
> > server side.
> >
> > I am not sure whether Alexandre wanna me to update the code following each
> > parent could only support one RTC or else.
> >

I want you to keep your changes local to your driver. I already stated
back in 2018 that you were on your own with the imx-sc driver and that I
don't like seeing multiple abstractions for existing RTCs. What is the
actual use case behind needing to access both RTCs using Linux?
Shouldn't this be handled on your firmware side?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

