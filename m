Return-Path: <linux-rtc+bounces-3180-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D66ACA339D2
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 09:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAB57188BED2
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 08:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4582613B29B;
	Thu, 13 Feb 2025 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yufct0LQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BF52066FF;
	Thu, 13 Feb 2025 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434838; cv=none; b=jIELLMPbfz8ZTOtm7aO/c/jNMRceqFb6QsqE1E/lTmZUCi2mcacl7qI30YaFPJEatkcQugWP7w1PyaOqu9CtEF6EWwMyoZKw7PFn2R3jr5Rz9QglEfWX3FABGodIDCx91VwqE3YY/Jvw3upzlS6x3nsQinp2xVqj+9Owhfk4Te4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434838; c=relaxed/simple;
	bh=eZY0RSFdj1VOHfIqg0pyMMayaR6oFDsPhtdC4e9B6Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzp6Ij08XkPEAz4nDaCaYroltFxPbNDytY93P3Gd71CbiiJRkwXx4G0QcjFaXpzEne4KPIpWrSGy2+oO+xYeRgf/zZylfdiAtIMAwgyUbGBbSjkfWoVByoLefeSO9GVcdEt24rPRTZ0SvkhhIc2nR71FWDAHF0M2X3iN9SB+9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yufct0LQ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6B09204A9;
	Thu, 13 Feb 2025 08:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739434833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9e8PtI2UeyluQx0sxUhBSF+kEkrKX+GNL5KqQq+l8c=;
	b=Yufct0LQU+4cKHaoTyLiUTo1UYDqedce2F1RZjsE648kRr8ako6nYTTGsErPgBvKJp4ohF
	idOZ+N27ri6jmN1Bgk853QTxw7ueooqKIadPFvYTPXURiX6ir43bKErg5yyF+BqSTHPW9V
	5xUsMMDDqiLUC8QRXH2sUxn5N/VGq6szX+nachAT1VzKmxuNv2qy7axNCQHJkgD7yzYx7s
	o/NO/TbmRgSmKxFBLijw+fn8A3BumM5ltir7aUdR/xzNfluMrG36HTTIXWv4+n2n0jntaL
	paxF4LfpwNj3xL7NC2YfcZ3hN8kRYOgiit98zN29UFr7EUXY41R3VkgpGgJBMA==
Date: Thu, 13 Feb 2025 09:20:32 +0100
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
Message-ID: <20250213082032315c4327@mail.local>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120102117538ef59b@mail.local>
 <PAXPR04MB8459968DFDE5979802CC034A88E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z6uCCeG2d395ZGDS@bogus>
 <20250212063532.GB15796@localhost.localdomain>
 <Z6x7TBSjBFBxGo77@bogus>
 <20250212170147ee6863dc@mail.local>
 <20250213033033.GA21937@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213033033.GA21937@localhost.localdomain>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegiedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegukeejvgemudgsudgsmeeltdekgeemtggtfhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehpvghnghdrfhgrnhesohhsshdrnhigphdrtghomhdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehpvghnghdrf
 hgrnhesnhigphdrtghomhdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 13/02/2025 11:30:33+0800, Peng Fan wrote:
> >> IIUC on any pure DT based system, a device node exists per RTC and hence
> >> platform device associated with it. And the RTC devices are created with
> >> parent pointing to unique platform device.
> >> 
> >> > However i.MX SCMI BBM exports two RTCs(id: 0, id: 1), so to make it work for
> >> > current RTC framework, we could only pick one RTC and pass the id to BBM
> >> > server side.
> >> >
> >> > I am not sure whether Alexandre wanna me to update the code following each
> >> > parent could only support one RTC or else.
> >> >
> >
> >I want you to keep your changes local to your driver. I already stated
> >back in 2018 that you were on your own with the imx-sc driver and that I
> >don't like seeing multiple abstractions for existing RTCs. What is the
> >actual use case behind needing to access both RTCs using Linux?
> >Shouldn't this be handled on your firmware side?
> 
> The firmware exports two RTCs, RTC0 could be handled by Linux, RTC1
> could only be read by Linux and configuable by M7 per current i.MX95 EVK
> firmware.

This doesn't answer the main question, why is this useful? Where is the
time of RTC1 coming from and why would linux set a different time on
RTC0 ? Can't the firwmare just set the same time on both RTC0 and RTC1?
What would someone do if RTC0 and RTC1 don't agree on the time?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

