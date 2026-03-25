Return-Path: <linux-rtc+bounces-6255-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNp9MzX9w2lwvQQAu9opvQ
	(envelope-from <linux-rtc+bounces-6255-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 16:20:21 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47718327C74
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 16:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0377333D6CF3
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Mar 2026 15:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FE53FE35F;
	Wed, 25 Mar 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I43VyWvU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B184A3DB644;
	Wed, 25 Mar 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450733; cv=none; b=W5uYcEVAXxKUif13HKcKci4cTIy/Cfl1lBwneabpOBHC1SgRu8dRHb4moIFAqyRNqZb84775rB/JsyDbgeT0QnO4Ne2VXjt3qmaqKDE7NG0W4ClHBYdOxf/iCgjjRdmsDSRuQM0ADXqmvEZXFfYbzt6/IvEfKsfEQhZhspfsJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450733; c=relaxed/simple;
	bh=Q7Y7TIr5LpH0Ie+lGeQIaP4vsrzzTVRfvln8R9Xm3mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I11kNrDO0GcefvY2qyu6X5qOZBGc9sgyDX6N0j6+fzm/UaSFy0rsuC85uvNrpGI3frY3sb8Qa5XhorV44aI3lNUWrNYSP6uR2y45MReq6F7z8nY5tQliIh+m/uFfJF27nLDL3GP+CoCUfIctn3+ubvZJ/1P/onxd30yFp6kXiGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I43VyWvU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3FFC2BCB2;
	Wed, 25 Mar 2026 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774450733;
	bh=Q7Y7TIr5LpH0Ie+lGeQIaP4vsrzzTVRfvln8R9Xm3mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I43VyWvUYyWmv/3FJuYZZsdDxXr19VOjCy5ldO7lQsh/kprsrY7EQrRXKkIPuPDxN
	 r5hdgtYKSRO6UPhQk34MwMvPTzofuTvelcJd8MxQwrBjFccKrPAIJGqR7xC5kUBACS
	 8/tXY6iBXcLjJUHIlld31norhL65jSQgz+Z1lz5Nwsce7VuibNsI3vSK+zyZPVI+Sn
	 GYzSOqo96sH4DobOhWAsSmiqhLZVKtxCOoR44wbfXKNpqz1C0PwONeSdZGrb8UG/2j
	 1Pz3AsEEdo3ywSYu3nIjEGpaUzXhSzX5gSyUkWFeW9UN3qvn3RadOZUPp+hRqdURW9
	 0MAt1fcMbAusg==
Date: Wed, 25 Mar 2026 14:58:45 +0000
From: Lee Jones <lee@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
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
	Nam Tran <trannamatk@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 09/13] leds: flash: add support for Samsung S2M series
 PMIC flash LED device
Message-ID: <20260325145845.GC1141718@google.com>
References: <20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org>
 <20260225-s2mu005-pmic-v3-9-b4afee947603@disroot.org>
 <20260310113835.GG183676@google.com>
 <DH1XVOS6IIOE.HGIH6JQRHNAM@disroot.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DH1XVOS6IIOE.HGIH6JQRHNAM@disroot.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6255-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,disroot.org:email]
X-Rspamd-Queue-Id: 47718327C74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026, Kaustabh Chakraborty wrote:

> On 2026-03-10 11:38 +00:00, Lee Jones wrote:
> > On Wed, 25 Feb 2026, Kaustabh Chakraborty wrote:
> >
> >> Add support for flash LEDs found in certain Samsung S2M series PMICs.
> >> The device has two channels for LEDs, typically for the back and front
> >> cameras in mobile devices. Both channels can be independently
> >> controlled, and can be operated in torch or flash modes.
> >> 
> >> The driver includes initial support for the S2MU005 PMIC flash LEDs.
> >> 
> >> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> >> ---
> >>  drivers/leds/flash/Kconfig          |  12 +
> >>  drivers/leds/flash/Makefile         |   1 +
> >>  drivers/leds/flash/leds-s2m-flash.c | 429 ++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 442 insertions(+)
> >> 
> >> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> >> index 5e08102a67841..be62e05277429 100644
> >> --- a/drivers/leds/flash/Kconfig
> >> +++ b/drivers/leds/flash/Kconfig
> >> @@ -114,6 +114,18 @@ config LEDS_RT8515
> >>  	  To compile this driver as a module, choose M here: the module
> >>  	  will be called leds-rt8515.
> >>  
> >> +config LEDS_S2M_FLASH
> >> +	tristate "Samsung S2M series PMICs flash/torch LED support"
> >> +	depends on LEDS_CLASS
> >> +	depends on MFD_SEC_CORE
> >> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> >> +	select REGMAP_IRQ
> >> +	help
> >> +	  This option enables support for the flash/torch LEDs found in
> >> +	  certain Samsung S2M series PMICs, such as the S2MU005. It has
> >> +	  a LED channel dedicated for every physical LED. The LEDs can
> >> +	  be controlled in flash and torch modes.
> >> +
> >>  config LEDS_SGM3140
> >>  	tristate "LED support for the SGM3140"
> >>  	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> >> diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
> >> index 712fb737a428e..44e6c1b4beb37 100644
> >> --- a/drivers/leds/flash/Makefile
> >> +++ b/drivers/leds/flash/Makefile
> >> @@ -10,6 +10,7 @@ obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
> >>  obj-$(CONFIG_LEDS_QCOM_FLASH)	+= leds-qcom-flash.o
> >>  obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
> >>  obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
> >> +obj-$(CONFIG_LEDS_S2M_FLASH)	+= leds-s2m-flash.o
> >>  obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
> >>  obj-$(CONFIG_LEDS_SY7802)	+= leds-sy7802.o
> >>  obj-$(CONFIG_LEDS_TPS6131X)	+= leds-tps6131x.o

[...]

> >> +static int s2mu005_fled_torch_brightness_set(struct led_classdev *cdev,
> >> +					     enum led_brightness value)
> >> +{
> >> +	struct s2m_fled *priv = to_led_priv(to_cdev_flash(cdev));
> >> +	struct regmap *regmap = priv->regmap;
> >> +	int ret;
> >> +
> >> +	mutex_lock(&priv->lock);
> >> +
> >> +	if (value == LED_OFF) {
> >
> > These defines are deprecated.
> >
> > From include/linux/leds.h:
> >
> > /* This is obsolete/useless. We now support variable maximum brightness. */
> > enum led_brightness {
> >         LED_OFF         = 0,
> >         LED_ON          = 1,
> >         LED_HALF        = 127,
> >         LED_FULL        = 255,
> > };
> >
> 
> Let me know what am I supposed to use then. The
> brightness_set_blocking() function is defined as such:
> 
> 	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
> 				       enum led_brightness brightness);
> 
> Which has enum led_brightness as one of its params.
> 
> Do I just ignore the 'obsolete' param for now and replace ` == LED_OFF`
> with a logical NOT?

I'm pretty sure most places just treat this as a u8 these days.

-- 
Lee Jones [李琼斯]

