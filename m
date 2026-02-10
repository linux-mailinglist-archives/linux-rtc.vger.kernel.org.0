Return-Path: <linux-rtc+bounces-5957-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK3ZHW4Ai2nJPAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5957-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 10:54:54 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E311931D
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 10:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C184300830B
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Feb 2026 09:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EE9342CA1;
	Tue, 10 Feb 2026 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQz7nBck"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7237342538
	for <linux-rtc@vger.kernel.org>; Tue, 10 Feb 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717291; cv=none; b=lwuxi/HZSXLSW2v4zOp0YARtp2UDJFWKDQXkSrcxN0ww2i1j70v1VvFrws9+CAiXdq8Dh6fiXJIz6qK6f7jqJUAciIDBLr5gyxPGDGSIVxcG3VAN+LmhDso82/r+K50V4kZLRuBIVMO2kDEliWd5l1MP8twvoBVPmILh67dvDBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717291; c=relaxed/simple;
	bh=HxxenadFwN0QecO/VcAoIcmjFPcwyrISlXCM0v/oOYo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NlKDjTMocsIz4pLMDPi6qpXfqJ3/1YEJrLuH5pSurGdqWkxaMTjmPieoc2dOHfl6FyDR/J11tQFf+e1F5L09QRahHQjwCeRdrVPmHEdcChFALcCWxAaEf+mXIi6MFSNKOv/59p2zSTusfvFLxUr9F/bivUZ0jpSQ0M2wDm85M5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQz7nBck; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso3924515e9.3
        for <linux-rtc@vger.kernel.org>; Tue, 10 Feb 2026 01:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770717288; x=1771322088; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8HYdS+zrmd+b3Wrxo0gB3qyloTrSaCZ1qSRZuELJtL4=;
        b=ZQz7nBckSlVgz3NphooJaa4UG/JHDyLHzGwmCJrkG3TW0W46js5oASREoep3pjUDeX
         hY98/9Qvbt9lVdm9We9DLBc1PNR+mlInuHdl/4Wwi9mGrNgrz+S5vPy7Grw9dsEJs1vi
         YVSpbsP3xvFbPHVz19ui1gt1/tH6oRt/FMAmyq68Pm9V1+bcKvQ+pAmJ3whgwbRpF/go
         iNGy/EhkvHhDFT9kEwrXIWpF14HZrCgeddPgNGBMQkfq7XBuiNoYS95dsYM1JFFO4095
         u6su+gUqs5ZGHINTxlZiLKwFsMVne/PaglGpr+SNkALVS/SkgRUtGeuSH/lVD8Bb6LhR
         iSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717288; x=1771322088;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8HYdS+zrmd+b3Wrxo0gB3qyloTrSaCZ1qSRZuELJtL4=;
        b=P56ehWtcKVFjyF866N2q8Y8aD204dYlZ8aGvxYTxfO0v6lUmT//hL4uAdbadW6CL8C
         dOm1dFJLvimAH1LRFkkiOCpw9MS02OuGk6H1XrQCfxymf/hTueXSoDA5s8F4oFNCnx2V
         5p3XI5GrkZew9J2nE2vxf+Fe6PnI4YEHB7K/5tg2hIWpt2QPRlYJDcX/qoduMCL/O7fu
         g/XmQxYOyokij55ZPtF+TdUL7gHEwFMXfDZt3Kajp2nSs31m1gWb4q0tJrBl36AlrvLc
         tfHXHMNvd8/kCYnIwNm3q1Ia2qRbGSv+sOOTdhO//76MZyqF8goR8WnOUsVLFPjg+PpJ
         q8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUa0fGHRUGZbph7BVl5yeesmSOJJXU+cpPdFLQUUUpk6QfCbPgaSF9BBrmxr/1+keiOR84w5ZWyeCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTksIB5Ik8c6NaENm3j/7i/FDm2YM5+U1EZjSxb2mTsxd6tcS9
	ymngWE11M5t77AyJb5j4LAyY1JIr8oA2V8V+dilhXG4rjVLuqeCoudgbxucjhTu8Ec0=
X-Gm-Gg: AZuq6aK9AkW4uSQsfM6J1yLZoLvTTnLAMt8Ym8mB1D7xxM2n1LdGZPUZog2075rBRvX
	nT5o4k7CBDwAiq5iyGGIfipsdXBBsUuDUqoKTU9dhgmOl0QIjYwJMtRgcE2UYJI+E8gcbP1VQPR
	S6JnglNSjWc2Jg4w0I0CNkUh/wx6zFyXv8PmJON4RKOkynVSHEAy9CBT3CcYzSKDE3ftGHITXef
	oU4iIdgZXs1/pYcJgi2LmiBxg5jxhETrkzbN7Czm6TnC/NGVLLucC9KZTXP8AMmoH/XUMTHG+K2
	ZlU07drbnbZqoTyYfXsaCF9cHX4M+9o9gURQadF4iLbharLSAwhxdAsqTZeA25NTZF0KOBh7bfv
	jHqgp3/SOczsel+JucZqqvdbLqYoknDhR41+sleT0pUZ7OOiypVzrUAQy4pVQRI9SwglOh2o26L
	LrtKwreuDJGU6qZk24HwlTUTYnrTHwx60wj/RUPmgr
X-Received: by 2002:a05:600c:3509:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-4832021604amr182180095e9.22.1770717288054;
        Tue, 10 Feb 2026 01:54:48 -0800 (PST)
Received: from draszik.lan ([212.129.79.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320961701sm214759035e9.5.2026.02.10.01.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:54:47 -0800 (PST)
Message-ID: <6cb639e1b655efb68aebc8b21ae34450b8936830.camel@linaro.org>
Subject: Re: [PATCH v2 06/12] mfd: sec: add support for S2MU005 PMIC
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
Date: Tue, 10 Feb 2026 09:55:14 +0000
In-Reply-To: <DG74Y3QSCLIO.32Q8ZKCTISXXB@disroot.org>
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
	 <20260126-s2mu005-pmic-v2-6-78f1a75f547a@disroot.org>
	 <69e2c1b1a2f3d2ed5e5da995cc5ee49bb3627597.camel@linaro.org>
	 <DG74Y3QSCLIO.32Q8ZKCTISXXB@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5957-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 102E311931D
X-Rspamd-Action: no action

On Thu, 2026-02-05 at 21:02 +0530, Kaustabh Chakraborty wrote:
> On 2026-02-04 15:23 +00:00, Andr=C3=A9 Draszik wrote:
> > Hi,
> >=20
> > On Mon, 2026-01-26 at 00:37 +0530, Kaustabh Chakraborty wrote:
> > > Samsung's S2MU005 PMIC includes subdevices for a charger, an MUIC (Mi=
cro
> > > USB Interface Controller), and flash and RGB LED controllers.
> > >=20
> > > S2MU005's interrupt registers can be properly divided into three regm=
ap
> > > IRQ chips, one each for the charger, flash LEDs, and the MUIC.
> > >=20
> > > Add initial support for S2MU005 in the PMIC driver, along with it's t=
hree
> > > interrupt chips.
> > >=20
> > > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > > ---
> > > =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 ++
> > > =C2=A0drivers/mfd/sec-i2c.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> > > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 ++++++++
> > > =C2=A0include/linux/mfd/samsung/core.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> > > =C2=A0include/linux/mfd/samsung/irq.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 66 ++++++++
> > > =C2=A0include/linux/mfd/samsung/s2mu005.h | 328 +++++++++++++++++++++=
+++++++++++++++
> > > =C2=A06 files changed, 497 insertions(+)
> > >=20
>=20
> [...]
>=20
> > > diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> > > index 3132b849b4bc4..3f1d70cc3292b 100644
> > > --- a/drivers/mfd/sec-i2c.c
> > > +++ b/drivers/mfd/sec-i2c.c
> > > @@ -17,6 +17,7 @@
> > > =C2=A0#include <linux/mfd/samsung/s2mps14.h>
> > > =C2=A0#include <linux/mfd/samsung/s2mps15.h>
> > > =C2=A0#include <linux/mfd/samsung/s2mpu02.h>
> > > +#include <linux/mfd/samsung/s2mu005.h>
> > > =C2=A0#include <linux/mfd/samsung/s5m8767.h>
> > > =C2=A0#include <linux/mod_devicetable.h>
> > > =C2=A0#include <linux/module.h>
> > > @@ -130,6 +131,11 @@ static const struct regmap_config s2mpu05_regmap=
_config =3D {
> > > =C2=A0	.val_bits =3D 8,
> > > =C2=A0};
> > > =C2=A0
> > > +static const struct regmap_config s2mu005_regmap_config =3D {
> > > +	.reg_bits =3D 8,
> > > +	.val_bits =3D 8,
> > > +};
> >=20
> > No cache? And what is the .max_register value?
> >=20
>=20
> This was in the previous revision, but I ended up removing it because
> (at least I thought at that time) interfered with interrupts firing in
> some way. The actual issue was unrelated, so I will add it back.
>=20
> However, there is also another thing I see in logs:
>=20
> sec-pmic-i2c 2-003d: using zero-initialized flat cache, this may cause un=
expected behavior
>=20
> This is due to REGCACHE_FLAT, I am not sure if I should just ignore
> this.

I think the error might be because you should also specify num_reg_defaults=
_raw:

.max_register =3D xxx,
.num_reg_defaults_raw =3D xxx + 1,


Cheers,
Andre'

