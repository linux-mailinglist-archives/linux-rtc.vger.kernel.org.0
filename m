Return-Path: <linux-rtc+bounces-5958-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJkANh4Di2kMPQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5958-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 11:06:22 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3E119631
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 11:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7073E302D10D
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 10:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1209A346A1D;
	Tue, 10 Feb 2026 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EOOlesKt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84340342534
	for <linux-rtc@vger.kernel.org>; Tue, 10 Feb 2026 10:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717810; cv=none; b=dByZ4C8YUDikh3maXQtIJjF8rL6ICkvdMRCyuaa8fXH6pe87kC72zkTUPVXeKYJqfVEiXgKPnJUY1ygwxcr6JSALiKH/128UBUEpRqpurXTd1jrLULGTJ1twtOx3cQP4e9rjQbOQbcDoHGuXYORqwmklct+hiCAVVLlpq7CPr84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717810; c=relaxed/simple;
	bh=ooeVV8I5d2AY+h6j1zoh4cyaCKKTOE9f6ezxXnFdb+w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dHxJVo8kBE8ZGKLYUmJ4RkrBSXROpniSh+zda/zRf4xR+MM/wh/DhApRafFcSJisWiXQLAgAzbEHxjFkcyunbDoi09NOB2zRzwlcIK5yABfFW9YB8suRgNxPbJakXiU0NK03AjXm3CBGzldTh2UMRzog2pIuoOIdAZE2CeExcyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EOOlesKt; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65a196a735eso446483a12.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Feb 2026 02:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770717807; x=1771322607; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ns0DYDWCgMFgOR7nvQ7X66gxpQehvS3KSJ9w3htiepE=;
        b=EOOlesKtlaSdzc2lmfIXxU7CZxjF+WP1s8qKfaQgZrWodzVRyED/uYw3QGOAy0h5HY
         TJi8Hhfm6RChdUUVAFUA3MKkEAM2xRhKn6bqQE/SkMUjDnchOE0iL1Qady4At4IWjuo9
         EIc1qR1tsY4OG9MiKUx4ZQy4pnK2mLYoberzhV6pqsxe1wiCyBy504EKoJA0BIX02rV4
         CvtHrpD4hQ0ZeK5YKxRUJ9IMgH63hu+/1/DThPxFvNUmWGSpYg2mbC7PoPTeIJ+SFrh1
         TmC/ovN9RK271JM8oo2kncBN/98+lJ5otLijmTrgsEcisLeu2sfxv+/AUN6lmgH5btTs
         5Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717807; x=1771322607;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns0DYDWCgMFgOR7nvQ7X66gxpQehvS3KSJ9w3htiepE=;
        b=DzzcoU0leeMWvU52dNGIupgePlyaavTdlgZwT2HTOSAbOMzO0Z4NiihifD+p2iI4PW
         i/Thp8ijZdatBf1mGZ/UnD+q2cbxYklahxeW9YEwdsqWJWsU6n6NEjTovMGwupl3fX24
         lXbseXfUFsWfHemLOFdTOGjxbE0u+G6t67bpzvb1lgu7r22ps6CRNiAePzIdXDu/q1Pj
         ZT3yLt0Ob3soCF14VqJItPw3y64+GpVOk/Hga9O1mehDFIcC8Molqvif7VaRDrzTgs5+
         KYdX4uFDjNa9F3+OZfJfFzViAmBgoC4Gpzml6iFTaFiZGVBaLZ0xVVcdr4qZP6rEVRko
         AgAg==
X-Forwarded-Encrypted: i=1; AJvYcCXsAsv/2sMCgNPk/3jkqNX8D08nBZ7Sv31uCUcq5w+hB6j7NezCf5MYz+K9TPiPYyRriZSnE+pBd0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcQWh/hJXqeH7+VZo+eeCX/P8NVMZYdbiWj/ACDg6HukgIw5Qb
	bssySzl1pn7LdCFq0T6/VIsEkOjzF828Ho636rVx6frHL+ItJjEtc4rMhT44+oSwgQ0=
X-Gm-Gg: AZuq6aLqScHq/T7fEqM4p0dStrYd7kcOrAblePckxsY+sxOmtfGq+mjxLu1RtN90Z7K
	yAf+nONOdj+LDLIdZz64S+3Z7DetUOb+vWqoRBC6sb9LGeOsrhkOh+S5LsD329jykYql6bGnYLu
	72alpOD7ZMWw8z9CMXJv9Y+tUFx7IiN5KkVysEE2Uo5ltDb5qSra1mcB851uVqFfHNL4/HYvZ9K
	g8BioET3BstP24gJI4eSzDmQ1/cNyAlPV1qAIpv6pHFlUDbafZK+qcHuG9MhA6U8O/eV+3xpMl8
	4ALsYh5zMWUkna/bbcxR5+GrDoVdSpCGrvPVsW7uIMSOSF5VfLsQRhjNiLo48GiyMh+Xl7jca7Q
	MYyRT8uGijcrM6SHwjG0xGDunMJ/Qc1d0KmOgxhjRS1xQbR5qfbmRSiw7hirlqMoIh0nQwX3/QZ
	41NL00eQD9llmIDqRoYCU2+tvUdxYYBg==
X-Received: by 2002:a05:6402:3507:b0:659:3ff1:58fc with SMTP id 4fb4d7f45d1cf-6598415c2bamr7583421a12.22.1770717806807;
        Tue, 10 Feb 2026 02:03:26 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983eaa4d4sm3635754a12.4.2026.02.10.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 02:03:25 -0800 (PST)
Message-ID: <9dad174d88c814d3ad2086a31e8dfc222fd431e4.camel@linaro.org>
Subject: Re: [PATCH v2 08/12] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Tue, 10 Feb 2026 10:03:52 +0000
In-Reply-To: <DG75VP6IIUXD.1VA6YSMNTPJQ6@disroot.org>
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
	 <20260126-s2mu005-pmic-v2-8-78f1a75f547a@disroot.org>
	 <e34d429e27392eba894b9592724a77fa82fc8009.camel@linaro.org>
	 <DG75VP6IIUXD.1VA6YSMNTPJQ6@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5958-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BC3E119631
X-Rspamd-Action: no action

On Thu, 2026-02-05 at 21:46 +0530, Kaustabh Chakraborty wrote:
> On 2026-02-04 16:55 +00:00, Andr=C3=A9 Draszik wrote:
> > Hi,
> >=20
> > On Mon, 2026-01-26 at 00:37 +0530, Kaustabh Chakraborty wrote:
> > > Add support for flash LEDs found in certain Samsung S2M series PMICs.
> > > The device has two channels for LEDs, typically for the back and fron=
t
> > > cameras in mobile devices. Both channels can be independently
> > > controlled, and can be operated in torch or flash modes.
> > >=20
> > > The driver includes initial support for the S2MU005 PMIC flash LEDs.
> > >=20
> > > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > > ---
> > > =C2=A0drivers/leds/flash/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> > > =C2=A0drivers/leds/flash/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0drivers/leds/flash/leds-s2m-flash.c | 410 +++++++++++++++++++++=
+++++++++++++++
> > > =C2=A03 files changed, 423 insertions(+)
> > >=20
> > > diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
> > > index 5e08102a67841..be62e05277429 100644
> > > --- a/drivers/leds/flash/Kconfig
> > > +++ b/drivers/leds/flash/Kconfig
> > > @@ -114,6 +114,18 @@ config LEDS_RT8515
> > > =C2=A0	=C2=A0 To compile this driver as a module, choose M here: the =
module
> > > =C2=A0	=C2=A0 will be called leds-rt8515.
> > > =C2=A0
> > > +config LEDS_S2M_FLASH
> > > +	tristate "Samsung S2M series PMICs flash/torch LED support"
> > > +	depends on LEDS_CLASS
> > > +	depends on MFD_SEC_CORE
> > > +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> > > +	select REGMAP_IRQ
> > > +	help
> > > +	=C2=A0 This option enables support for the flash/torch LEDs found i=
n
> > > +	=C2=A0 certain Samsung S2M series PMICs, such as the S2MU005. It ha=
s
> > > +	=C2=A0 a LED channel dedicated for every physical LED. The LEDs can
> > > +	=C2=A0 be controlled in flash and torch modes.
> > > +
> > > =C2=A0config LEDS_SGM3140
> > > =C2=A0	tristate "LED support for the SGM3140"
> > > =C2=A0	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> > > diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefil=
e
> > > index 712fb737a428e..44e6c1b4beb37 100644
> > > --- a/drivers/leds/flash/Makefile
> > > +++ b/drivers/leds/flash/Makefile
> > > @@ -10,6 +10,7 @@ obj-$(CONFIG_LEDS_MAX77693)	+=3D leds-max77693.o
> > > =C2=A0obj-$(CONFIG_LEDS_QCOM_FLASH)	+=3D leds-qcom-flash.o
> > > =C2=A0obj-$(CONFIG_LEDS_RT4505)	+=3D leds-rt4505.o
> > > =C2=A0obj-$(CONFIG_LEDS_RT8515)	+=3D leds-rt8515.o
> > > +obj-$(CONFIG_LEDS_S2M_FLASH)	+=3D leds-s2m-flash.o
> > > =C2=A0obj-$(CONFIG_LEDS_SGM3140)	+=3D leds-sgm3140.o
> > > =C2=A0obj-$(CONFIG_LEDS_SY7802)	+=3D leds-sy7802.o
> > > =C2=A0obj-$(CONFIG_LEDS_TPS6131X)	+=3D leds-tps6131x.o
> > > diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash=
/leds-s2m-flash.c
> > > new file mode 100644
> > > index 0000000000000..1be2745c475bf
> > > --- /dev/null
> > > +++ b/drivers/leds/flash/leds-s2m-flash.c
> > > @@ -0,0 +1,410 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Flash and Torch LED Driver for Samsung S2M series PMICs.
> > > + *
> > > + * Copyright (c) 2015 Samsung Electronics Co., Ltd
> > > + * Copyright (c) 2025 Kaustabh Chakraborty <kauschluss@disroot.org>
> > > + */
> > > +
> > > +#include <linux/container_of.h>
> > > +#include <linux/led-class-flash.h>
> > > +#include <linux/mfd/samsung/core.h>
> > > +#include <linux/mfd/samsung/s2mu005.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +#include <media/v4l2-flash-led-class.h>
> > > +
> > > +#define MAX_CHANNELS	2
> > > +
> > > +struct s2m_fled {
> > > +	struct device *dev;
> > > +	struct regmap *regmap;
> > > +	struct led_classdev_flash cdev;
> > > +	struct v4l2_flash *v4l2_flash;
> > > +	struct mutex lock;
> >=20
> > Please add a (brief) comment describing what the mutex protects.
>=20
> The mutex object prevents the concurrent access of flash control
> registers by the LED and V4L2 subsystems. -- will add this.
>=20
> > > +
> > > +	/*
> > > +	 * Get the LED enable register address. Revision EVT0 has the
> > > +	 * register at CTRL4, while EVT1 and higher have it at CTRL6.
> > > +	 */
> > > +	if (priv->pmic_revision =3D=3D 0)
> > > +		reg_enable =3D S2MU005_REG_FLED_CTRL4;
> > > +	else
> > > +		reg_enable =3D S2MU005_REG_FLED_CTRL6;
> >=20
> > You could REG_FIELD() and friends for this and everywhere else with
> > similar if / else.
> >=20
>=20
> REG_FIELD(), from what I understood, is for selecting a bit field inside
> a single register. However this code chooses between two separate
> registers. I believe your interpretation was incorrect? Please clarify.

The first argument to REG_FIELD is the register itself, so reg fields can
be used to describe this difference. See e.g. drivers/leds/rgb/leds-mt6370-=
rgb.c
Of course, you could have a member variable instead to hold the register
index if all bits are the same in both revisions. Either way would avoid
having to constantly check the revision during runtime.

Cheers,
Andre'

