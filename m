Return-Path: <linux-rtc+bounces-3185-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56007A33E06
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 12:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58A7E7A4ABD
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 11:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85925227E85;
	Thu, 13 Feb 2025 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ClNjhBiU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3F227E8C;
	Thu, 13 Feb 2025 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739445977; cv=none; b=rM04/yEJGXuqd/kgdJfkgUVcfpQtgPw78AebFNCxW4I0rHiF3Yrmuc9kSfCQmXkiSQmddwl7ijmuSY7HhjfmwhIM8/94HD2SLJ4MKvKkeSSAjtrJV/iJ5/KkuKcb3VhxKw2RvdNqeOenI84uH7Qglt9PEHu9QnrOqd0w1FSBvWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739445977; c=relaxed/simple;
	bh=a76uEsEM5QEz1KJiDQYQrLivs/y81VdE+BXmBQrGiJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qStXQ6+jZ99muCH8m2VLZv6rWjVu4nccV1LEodU/LORQTOyYPBnK794HkxHbWgk1pJaj0X0Z2Gm6DXzjjVGDny8zkf7UyhjGXTrQjyEDyHrPu7DeQYobwObLgM5p/Uu8D/XnpRy6bR+XsmwW0M2AcevpcCs+/V34odPkEXVwbdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ClNjhBiU; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BB9B204A5;
	Thu, 13 Feb 2025 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739445966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUZkMEvJv2/Nc54eZXgalM3L01O0l7yfmrIgB7KhrLk=;
	b=ClNjhBiU7bSJ2LVuVj3MhNmAjBfG5wdPHJR51Gst5UBx+tZo172PGsyFbW/ciciZ5Ih2te
	bePvC1qsSkNduxfr6W2DMo1Dt4H+HMBdal9tgCTfPZYTl2b58SxaQirU3X3n6M4xtEQCD+
	T+hsOlT+VbYJhcyn+1jF6QAkreHWn1IBAqbaTUQoclk1OT8TQEJppckzb5IrHgVzqrShBu
	Jn+PgHEuATNkPCv84wny9UR0TyAaZbYr+hQVZEpEti6Rj4Qb7z6XDU2tjEiwPZci7Oo52p
	alAUavb9fHcqfoqu0H/IITUwRgmvh4ftAnpzdYt83jle9DuCOCTbgP0pgl2VJQ==
Date: Thu, 13 Feb 2025 12:26:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
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
Message-ID: <202502131126057bac6f7a@mail.local>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
 <20250213033033.GA21937@localhost.localdomain>
 <20250213082032315c4327@mail.local>
 <20250213105257.GA29804@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213105257.GA29804@localhost.localdomain>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehpvghnghdrfhgrnhesohhsshdrnhigphdrtghomhdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehpvghnghdrf
 hgrnhesnhigphdrtghomhdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 13/02/2025 18:52:57+0800, Peng Fan wrote:
> On Thu, Feb 13, 2025 at 09:20:32AM +0100, Alexandre Belloni wrote:
> >On 13/02/2025 11:30:33+0800, Peng Fan wrote:
> >> >> IIUC on any pure DT based system, a device node exists per RTC and hence
> >> >> platform device associated with it. And the RTC devices are created with
> >> >> parent pointing to unique platform device.
> >> >> 
> >> >> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
> >> >> > current RTC framework, we could only pick one RTC and pass the id to BBM
> >> >> > server side.
> >> >> >
> >> >> > I am not sure whether Alexandre wanna me to update the code following each
> >> >> > parent could only support one RTC or else.
> >> >> >
> >> >
> >> >I want you to keep your changes local to your driver. I already stated
> >> >back in 2018 that you were on your own with the imx-sc driver and that I
> >> >don't like seeing multiple abstractions for existing RTCs. What is the
> >> >actual use case behind needing to access both RTCs using Linux?
> >> >Shouldn't this be handled on your firmware side?
> >> 
> >> The firmware exports two RTCs, RTC0 could be handled by Linux, RTC1
> >> could only be read by Linux and configuable by M7 per current i.MX95 EVK
> >> firmware.
> >
> >This doesn't answer the main question, why is this useful? Where is the
> >time of RTC1 coming from and why would linux set a different time on
> >RTC0 ? Can't the firwmare just set the same time on both RTC0 and RTC1?
> 
> To current i.MX95 EVK SCMI firmware, RTC0 is SoC internal RTC, RTC1 is
> board level RTC which is more acurrate.
> 
> There are safety island in i.MX95, M7 safety core is assigned owner of
> RTC1. Linux non-safety is assigned owner of RTC0, but Linux could read RTC1
> time, Linux not able to set alarm of RTC1.
> 
> I need ask firmware developer to see whether RTC1 time could be synced to
> RTC0 from firmware level. But considering RTC1 is more accurate, should we
> use RTC1?
> 
> The current firmware design is RTC0 is always there and exported, because
> it is SoC internal RTC. RTC1 is board level one, it could be optional per
> board design and firmware design.
> 
> The firmware could update to only export RTC1 if no safety need it,
> but this needs big change to the firmware BBM part, I need check with
> firmware developer. But things may not change.
> 
> >What would someone do if RTC0 and RTC1 don't agree on the time?
> 
> RTC1 is more accurate if it is there.
> 

Well, yes, you have your answer here, if the firmware knows RTC1 is more
accurate and will be your source of truth, then simply use this one.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

