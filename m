Return-Path: <linux-rtc+bounces-6495-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +m5HFA2HBGoJLQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6495-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 13 May 2026 16:13:33 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3A534C90
	for <lists+linux-rtc@lfdr.de>; Wed, 13 May 2026 16:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E8D2309B7F7
	for <lists+linux-rtc@lfdr.de>; Wed, 13 May 2026 14:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2212E8DEF;
	Wed, 13 May 2026 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQrubRky"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41092224B15;
	Wed, 13 May 2026 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680846; cv=none; b=pkegR0J7EHWvqx0IemCeo/IJ9PjQSeGZZhYkrpq1Y0parR5pgAa1aKTtnAAO6wcl5s4bAE6ZjYIuOFODOafLukTQol9GTZCM/C5qwyb4ZdiB3/VYOLLrZCqapUiRvHPPP+dJulzbePykLQo9pO+56K020jYOqjUE9a3Upt4TkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680846; c=relaxed/simple;
	bh=Fg1mrlWMnj05/L7JUG6z1j7E/W6et1xH3QyvjiwbRfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c120GcPb2YrxHa5AqsQcUpXboyIt1FwMA4JGgCaAPGvAcjL1/xiBNPJy4RRu/1YeRvrHjZgcOGYMPXwBGQe+cnzdnxQdSOviZc/YlvXpLwLVrIml6egyf5SP8l9Be+a6GTy8C8x5S8oGVJoqpkp1+1UYjaDDxjyM+GwVPQFyEJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQrubRky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908BEC2BCB3;
	Wed, 13 May 2026 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778680845;
	bh=Fg1mrlWMnj05/L7JUG6z1j7E/W6et1xH3QyvjiwbRfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQrubRkyOCuBrBGRrIsyYlVDWDvPJ4V6CSDxAQC259nErLzuRA4/P9Aun/PuF78Ba
	 WNzSB/3z0G4JR0qv6LJCChcSL679reLh5GcyK+J1+uEjdxSV4hEJ111ufEL4W6qjlP
	 jV1B0moohypLZ+me+iE2q3ljGq8oAmF8vYNufO5dzC7YjseUyIcrNku92SxUMolIbW
	 XMvB45YU6TpasjrVbsmml0KIvnnDWXrZpyQIk8oU/ZqQFWUaKfbmTw1UH1LxFil/O6
	 ZebrehYM/ZHrPO0Oz5Wy0zkw7nxYH5VUclM9rTyIcLvIwcZ2vPS9r2RZZhVL99qeQ0
	 TVpw87ouR6EtQ==
Date: Wed, 13 May 2026 15:00:38 +0100
From: Lee Jones <lee@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nam Tran <trannamatk@gmail.com>,
	=?utf-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?= <kernel@lvkasz.us>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 07/11] leds: flash: add support for Samsung S2M series
 PMIC flash LED device
Message-ID: <20260513140038.GB305027@google.com>
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-7-fcbc9da5a004@disroot.org>
 <20260507164654.GS305027@google.com>
 <80d85385-f5af-44e3-b9ed-d4489542d4da@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80d85385-f5af-44e3-b9ed-d4489542d4da@gmail.com>
X-Rspamd-Queue-Id: 41B3A534C90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6495-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[disroot.org,kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,disroot.org:email]
X-Rspamd-Action: no action

On Thu, 07 May 2026, Jacek Anaszewski wrote:

> Hi Lee,
> 
> On 5/7/26 6:46 PM, Lee Jones wrote:
> > On Fri, 24 Apr 2026, Kaustabh Chakraborty wrote:
> > 
> > > Add support for flash LEDs in certain Samsung S2M series PMICs.
> > > The device has two channels for LEDs, typically for the back and front
> > > cameras in mobile devices. Both channels can be independently
> > > controlled, and can be operated in torch or flash modes.
> > > 
> > > The driver includes initial support for the S2MU005 PMIC flash LEDs.
> > > 
> > > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > > ---
> > >   drivers/leds/flash/Kconfig          |  12 ++
> > >   drivers/leds/flash/Makefile         |   1 +
> > >   drivers/leds/flash/leds-s2m-flash.c | 358 ++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 371 insertions(+)
> > > 
> > > diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> > > index 5e08102a67841..be62e05277429 100644
> > > --- a/drivers/leds/flash/Kconfig
> > > +++ b/drivers/leds/flash/Kconfig
> > > @@ -114,6 +114,18 @@ config LEDS_RT8515
> > >   	  To compile this driver as a module, choose M here: the module
> > >   	  will be called leds-rt8515.
> > > +config LEDS_S2M_FLASH
> > > +	tristate "Samsung S2M series PMICs flash/torch LED support"
> > > +	depends on LEDS_CLASS
> > > +	depends on MFD_SEC_CORE
> > > +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> > 
> > The `|| !V4L2_FLASH_LED_CLASS` part of this dependency makes it
> > unconditionally true. Was this intended? Perhaps this dependency can be
> > removed entirely.
> This is for a reason to allow building the driver if
> V4L2_FLASH_LED_CLASS is turned off, or build it as a module
> if V4L2_FLASH_LED_CLASS=m. You will get nice explanation from
> Google AI if you type just
> "V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS".
> 
> See e.g. [0], which fixes undefined symbol error by adding this.
> 
> [0] https://git.paulk.fr/projects/linux.git/commit/drivers?h=sunxi/cedrus/jpeg-nv16&id=dbeb02a0bc41b9e9b9c05e460890351efecf1352

I see.  Thanks for the explanation.

-- 
Lee Jones

