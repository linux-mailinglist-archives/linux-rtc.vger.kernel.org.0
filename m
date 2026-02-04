Return-Path: <linux-rtc+bounces-5937-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGujL3hWg2mJlQMAu9opvQ
	(envelope-from <linux-rtc+bounces-5937-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 04 Feb 2026 15:23:52 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26119E7086
	for <lists+linux-rtc@lfdr.de>; Wed, 04 Feb 2026 15:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FBD304600D
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Feb 2026 14:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BF0413252;
	Wed,  4 Feb 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsGX0+oe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350F41323D
	for <linux-rtc@vger.kernel.org>; Wed,  4 Feb 2026 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214641; cv=none; b=FDHFjRkOiz5YbOyDDpq9eul2Br3OryStoxfZFVM2kG0qDWgyXc8vw09COGn+Q8bsmRZRpTedZSyHE7q88MhW2DKgS3eVcj5tI6Hx4aJYnqKgpfG1A77EfMa9cYTD4CxcqpoRvOgu1kUHyiidp7R/OpA+QS86Xv0+YidMnpYcxjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214641; c=relaxed/simple;
	bh=fqK/sV1/SV/2SRm0hf98CdMaH9ntyCY9/h5a4/cBf9g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FzsCM5caVRXXXAubDPNgs/MzZ8sLUVYjHLcsjqXxXI3Xoko2Ap3OOOMYoYJtNms/xWD+1SfcEvVRF9jmNFAKODslNaHsMmp+5VSqNZR5Nqe4g9Wh22wZN0OdiKAori7mXA6CQjyt/PbFcBavKDJ6XFt1QOnp1kJ+bM0glKSOX88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bsGX0+oe; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so991095666b.2
        for <linux-rtc@vger.kernel.org>; Wed, 04 Feb 2026 06:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770214639; x=1770819439; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tf4Ir5IFLu+SmMvPSgo65r/HAkUdr4ohgIhUVdFKVQ0=;
        b=bsGX0+oe2f6kv1WuWDGyQq47Hdrkes/K8kavT53wP9EcH4dF4drmeiFGOx+QezlfhL
         yDQjdFEp6vjBFkNX2wUXPEl/X+yJmAo6H9BMcC54fRPWClUb0MwejiDUX83I904oq8u0
         hh1sQA/yVGKoIgVrhZ0rCEbqMxEqR2gJLpFc2onS7bvZWCyjPOWTF9MQnXm4tOvfzzMM
         Bo+ooU702vGUm1uVlM7Q9+wtf5H9d0Bf+ruq7qi/4d4zX2ab2hVrIZgHNykm7l2mMl9k
         ZHd5wsIInLssCDc/cCAjQtCZyvan7OO4WTZT+Ws/Ocw8kwgjGieMnsdz0GyGC6G7w51O
         kCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770214639; x=1770819439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tf4Ir5IFLu+SmMvPSgo65r/HAkUdr4ohgIhUVdFKVQ0=;
        b=Q0OFC40ymsUHzDEkoTiqkzaiaIhm4C5oLmP9+JaEKUJ8qcT7Gm12KmFSjFmQPZf30i
         PSxhDIHivnTIyT/2N9NniK0ZfGpSOdbNr9KCenFn3h+j19gAQ5zOA++zcNeoralwuIYE
         d53uPNgVZ7HY+7scCkGvNdVNCuwEUjBBKxzJVknfP8HhwMJl0eLNXA8pzvoqEFiilj/4
         F5qh3FZ0oFk1SFo2rJBbSMLGXTgPfG4M4ceRYqOqMLaVy29U+ES3FEbb5bJXtb6+m0az
         dHwkjeGgHcx0KKTwS//VNBslBvQhFe2LUH/RtfaUtTfOv4TrVunZEU1syXR+E9CemLpE
         JLaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW18/LYLvQ+w6/EmnwXvr1EHiQXZXeswaR4DAVClGzltHQgAKTTkohrqnfOzoNaPRW90vgVPvZmbz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuq02NC7egAc7tM5tbjZxmptzecnvtzubC7OgP25AKlmuBAQpX
	rp+AQHroc/0xSQrNCQ9TtFHMirEnt6tASnvaIQapMcfFOJiEjIIAPrkGf3fDD8G3nR8=
X-Gm-Gg: AZuq6aK5sPrihLdCZ/SgOt8c6xE6Ty8JkKvIVB+DrFlyqY64aM0ENMSRr83ccfzGp1i
	ozMwLS7qajasqVUtZHXPn3gQ/ftC8zs/DwEhGU1Cb5zaYwIFj+MXQDYDVLtEYKHrG6O/iRTC9D2
	OhOtBPuo4ivd1xJh8YrF+pc4YI7yZIacOiRsfBfuE947azRW/bYdZuje4ynWq8wlcpHo2//Lcwa
	azw4TdGgIPnJjg4/IY5V/c2rcApmt75PqegNulvI9nKOT+91bvzWs8W5j9RMnJPv9G+uxKXgiep
	FW9IwUZy7jl5rgARXv6hUXYmEdnVVSEXkW7bs/3KoyxE5cuuSHWgGTaR835G3PyzpV9+wZGFmeR
	5HJAy88jhUoC7MFC6EG2X/sA6V6LO04Q/0S16YBEDPYK/hnMaAjwLDRnXRAtvH5dSMbsH4SNJ3b
	HeWS3QLUqpc2XUDc3yOA==
X-Received: by 2002:a17:907:72d0:b0:b87:6:371d with SMTP id a640c23a62f3a-b8e9f42bb01mr227190666b.49.1770214639112;
        Wed, 04 Feb 2026 06:17:19 -0800 (PST)
Received: from draszik.lan ([212.129.76.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0044a09sm125346166b.56.2026.02.04.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:17:18 -0800 (PST)
Message-ID: <f6d1340062448cf52e4c034d250524e030877898.camel@linaro.org>
Subject: Re: [PATCH v2 07/12] mfd: sec: store hardware revision in
 sec_pmic_dev and add S2MU005 support
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
Date: Wed, 04 Feb 2026 14:17:35 +0000
In-Reply-To: <20260126-s2mu005-pmic-v2-7-78f1a75f547a@disroot.org>
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
	 <20260126-s2mu005-pmic-v2-7-78f1a75f547a@disroot.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5937-lists,linux-rtc=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,disroot.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 26119E7086
X-Rspamd-Action: no action

Hi Kaustabh,

On Mon, 2026-01-26 at 00:37 +0530, Kaustabh Chakraborty wrote:
> The device revision matters in cases when in some PMICs, the correct
> register offsets very in different revisions. Instead of just debug

s/very/vary

> printing the value, store it in the driver data struct.

Please mention that you're not doing that for s2mpg1x, though.

>=20
> Unlike other devices, S2MU005 has its hardware revision ID in register
> offset 0x73. Allow handling different devices and add support for S2MU005=
.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 41 ++++++++++++++++++++++++++++++----------
> =C2=A0include/linux/mfd/samsung/core.h |=C2=A0 1 +
> =C2=A02 files changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index bc2a1f2c6dc7a..069a1ba9aa1f1 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -16,6 +16,7 @@
> =C2=A0#include <linux/mfd/samsung/irq.h>
> =C2=A0#include <linux/mfd/samsung/s2mps11.h>
> =C2=A0#include <linux/mfd/samsung/s2mps13.h>
> +#include <linux/mfd/samsung/s2mu005.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/pm.h>
> @@ -111,17 +112,38 @@ static const struct mfd_cell s2mu005_devs[] =3D {
> =C2=A0	MFD_CELL_OF("s2mu005-rgb", NULL, NULL, 0, 0, "samsung,s2mu005-rgb"=
),
> =C2=A0};
> =C2=A0
> -static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
> +static int sec_pmic_store_rev(struct sec_pmic_dev *sec_pmic)
> =C2=A0{
> -	unsigned int val;
> +	unsigned int reg, mask, shift;
> +	int ret;
> =C2=A0
> -	/* For s2mpg1x, the revision is in a different regmap */
> -	if (sec_pmic->device_type =3D=3D S2MPG10)
> -		return;
> +	switch (sec_pmic->device_type) {
> +	case S2MPG10:
> +		/* For s2mpg1x, the revision is in a different regmap */
> +		return 0;
> +	case S2MU005:
> +		reg =3D S2MU005_REG_ID;
> +		mask =3D S2MU005_ID_MASK;
> +		shift =3D S2MU005_ID_SHIFT;
> +		break;
> +	default:
> +		/* For other device types, the REG_ID is always the first register. */
> +		reg =3D S2MPS11_REG_ID;
> +		mask =3D ~0;
> +		shift =3D 0;
> +	}
> +
> +	ret =3D regmap_read(sec_pmic->regmap_pmic, reg, &sec_pmic->revision);
> +	if (ret) {
> +		dev_err(sec_pmic->dev, "Failed to read PMIC revision (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	sec_pmic->revision &=3D mask;
> +	sec_pmic->revision >>=3D shift;
> =C2=A0
> -	/* For each device type, the REG_ID is always the first register */
> -	if (!regmap_read(sec_pmic->regmap_pmic, S2MPS11_REG_ID, &val))
> -		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
> +	dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", sec_pmic->revision);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
> @@ -262,9 +284,8 @@ int sec_pmic_probe(struct device *dev, int device_typ=
e, unsigned int irq,
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	sec_pmic_configure(sec_pmic);
> -	sec_pmic_dump_rev(sec_pmic);
> =C2=A0
> -	return ret;
> +	return sec_pmic_store_rev(sec_pmic);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(sec_pmic_probe);
> =C2=A0
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung=
/core.h
> index 43e0c5e55f5d3..56aa33d7e3d60 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -70,6 +70,7 @@ struct sec_pmic_dev {
> =C2=A0
> =C2=A0	int device_type;
> =C2=A0	int irq;
> +	unsigned int revision;

kerneldoc needs to be updated.

Given the LED driver is the only driver & device so far which needs the
PMIC revision, maybe for now that driver could determine the revision
itself instead of adding this new member for everybody?

Cheers,
Andre'

> =C2=A0};
> =C2=A0
> =C2=A0struct sec_platform_data {

