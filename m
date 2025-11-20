Return-Path: <linux-rtc+bounces-5448-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB24C749B4
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 15:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id D854F30D87
	for <lists+linux-rtc@lfdr.de>; Thu, 20 Nov 2025 14:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEB82C0298;
	Thu, 20 Nov 2025 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mleDF+KZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEB329BDB1
	for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649525; cv=none; b=WXh9/FvyR9AwQ/i9FDzK9rjRP3wdVlvOS2QXzaA5RlxG1N+HFbKhgkpwyC74ZAOATmfWlhh8Mw9DUlb/v8Fbsjh5ICQdJx5nrbg7YC2VU/hb2nAGqyFnCQCju6tQG9Tvt1PtF01yKhDLYbpfrep+oe9l5p0h7StQv2xm7jjLGkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649525; c=relaxed/simple;
	bh=GTgkvU5nt4oucx2ObHZ/qeA66yilYDZYirvqQWkM47E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j3f5ZYDiyfyqsvE6mwpR89d9ifAmRgepl9ay8awx6UusTzBioClr7H1JDfzfFuIFumdGu6yGGKm5XOBZDK1WoHqwUWJoEyiYEMAuQwTdhWDR1tPahRgykAUzGa8EXmp/qVtS5oFGvSaaKy1A6rLE9ObRwz1q3PqSEBISKAcHePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mleDF+KZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47790b080e4so5397185e9.3
        for <linux-rtc@vger.kernel.org>; Thu, 20 Nov 2025 06:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763649520; x=1764254320; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d+Gk+u1cLmmQhRrNwXBITHX/Uq7EYJbjzXfudNzArng=;
        b=mleDF+KZLKwlHRt1x8+mkDjf+z4i2Ys63Y1+iSvf1lD8EJQMGXhQw5c92V1xQr/IXb
         6jTMYlVu1dofm1No/Zq7Zys3e9qtpIPvqKAwqhzFWFKDnWstRoC92RY9+8Libpvbealp
         J+EmxD/am9vXD3ZviIE6RQhe+I8xxTMHLWxyuVPpY0aE52WBpgqmepG4kA7I/b0s38uv
         EdVJadm4gBMQ12uGGNIQBVumDuHFQRrNPzRRmj8zy4nDzUD/gja7wbOvmhi2HvNmZpuD
         StDtwi2uX18fWGlnhVzFu96Qgfd6uuBk/BMmxvIcpOtM7jBBTLQdfQkANzV2Mp9QJRgZ
         yLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649520; x=1764254320;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+Gk+u1cLmmQhRrNwXBITHX/Uq7EYJbjzXfudNzArng=;
        b=B3yScWPzKDC8pJWh3daRNorvDI2iCtTDkIrpcYqWPhosrykAPx5SytUh0XjdpqvIx0
         nv73dyzV1uuwr7owbd/Or6hQQD0s350amVrp05kaAkv8vGq2vWzY/cGmFvulrwS5PZit
         vSN34m0Qeqhh+zo0p9bb/qHYLT753e+fJZwDXlFRNwebfzFLfKk+NwHkmkoYVmYB8x9p
         mfICUB/UeuLKWfSk0QAK7BB0as29GkUUY4ftLGsp68pLfwNIq0dsa+gtYibBj4KNPG5s
         6mw+vqnEDbKqhFqVRUZNN9LLQ88g2C7Xo6HZfYeqGhERj+HJVUGtFHn2lObHnRvXAUKW
         Ej3A==
X-Forwarded-Encrypted: i=1; AJvYcCWccm2ffMNzyg0LnANitx7n8Bo0LkEvRxWp4K00L3ZsFu0sdo/KHE744uCpCUVNkdRXv38/AuNEq8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjU/2YKFPxngN1XPwA5eOghz0y1BshIkt3K5RBEU9GHiz1y1P7
	PFlcsUVVnhP/qbOBc2edepVo0UnzkIi60VLhASiE6emf6iEY2NOys7Z/YU9sxLJgGSg=
X-Gm-Gg: ASbGncu7HLnuHgBVvjDuiE69BR79Nxa5qm4+QQ8cArU7OvTz8UO6NISrhvDjDF5yetK
	RVrIQYOU6SbUvXeEYvoIQlsIPin+inKOaRiw4/CrWQbuVPMxxnGq/FZ1cSlqRMqTt2DZ0oNyrcf
	NqKhlBSKL+LI7pi7idqdMIhD/KAKAcDc2YBoaYKwiQM0BZITTNbN5DPh554Hsh9sPoEUeQ+v91a
	nMDmUPN2WjbTNEL+uOeXKZc2SU4lsT9zFygGDEpcgPmLRcfHlI/ujaXOhIRaTDBOgykc9SuqgYz
	3VCe76DK8i/nXZi0uKaXNRf9Txm3Ohupc8hHepVaUmvStzRigza5V796RFX4GGoKLTZJ9LKJ3Fu
	gk17Cb838hM6p1QMK/pvdcUUK/+1YUauEvU8RHfeHDlddMKDkMnusd0jmOElOL3ABCpuqyJWm+L
	KjYoVXWJ7NE/O5pzMuFQ==
X-Google-Smtp-Source: AGHT+IGNffRGHMdGK2Pc9TlZ2cmIUd1fVmspc8blchwuE4FjMGnuDHqUpy5uyPwzDSdYveJmee61sQ==
X-Received: by 2002:a05:600c:3115:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-477b8a9d734mr31646905e9.29.1763649520253;
        Thu, 20 Nov 2025 06:38:40 -0800 (PST)
Received: from draszik.lan ([212.129.72.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f49a7bsm5766381f8f.19.2025.11.20.06.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:38:39 -0800 (PST)
Message-ID: <bf9e08adfa72ff873baca60fc437a2f85f447a1e.camel@linaro.org>
Subject: Re: [PATCH 3/3] mfd: sec: drop now unused struct
 sec_pmic_dev::irq_data
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, Juan Yescas	 <jyescas@google.com>, Douglas
 Anderson <dianders@chromium.org>, 	kernel-team@android.com, Kaustabh
 Chakraborty <kauschluss@disroot.org>, 	linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, 	linux-rtc@vger.kernel.org
Date: Thu, 20 Nov 2025 14:38:46 +0000
In-Reply-To: <20251120103553.GZ1949330@google.com>
References: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
	 <20251114-s5m-alarm-v1-3-c9b3bebae65f@linaro.org>
	 <20251120103553.GZ1949330@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Thu, 2025-11-20 at 10:35 +0000, Lee Jones wrote:
> On Fri, 14 Nov 2025, Andr=C3=A9 Draszik wrote:
>=20
> > This was used only to allow the s5m RTC driver to deal with the alarm
> > IRQ. That driver now uses a different approach to acquire that IRQ, and
> > ::irq_data doesn't need to be kept around anymore.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++--
> > =C2=A0drivers/mfd/sec-core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++--------
> > =C2=A0include/linux/mfd/samsung/core.h |=C2=A0 1 -
> > =C2=A04 files changed, 6 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> > index 77370db52a7ba81234136b29f85892f4b197f429..794c4e5398e7dd1a816aff9=
a6559a6c19fec75a5 100644
> > --- a/drivers/mfd/sec-common.c
> > +++ b/drivers/mfd/sec-common.c
> > @@ -163,6 +163,7 @@ sec_pmic_parse_dt_pdata(struct device *dev)
> > =C2=A0int sec_pmic_probe(struct device *dev, int device_type, unsigned =
int irq,
> > =C2=A0		=C2=A0=C2=A0 struct regmap *regmap, struct i2c_client *client)
> > =C2=A0{
> > +	struct regmap_irq_chip_data *irq_data;
> > =C2=A0	struct sec_platform_data *pdata;
> > =C2=A0	const struct mfd_cell *sec_devs;
> > =C2=A0	struct sec_pmic_dev *sec_pmic;
> > @@ -187,7 +188,7 @@ int sec_pmic_probe(struct device *dev, int device_t=
ype, unsigned int irq,
> > =C2=A0
> > =C2=A0	sec_pmic->pdata =3D pdata;
> > =C2=A0
> > -	ret =3D sec_irq_init(sec_pmic);
> > +	ret =3D sec_irq_init(sec_pmic, &irq_data);
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > @@ -240,7 +241,7 @@ int sec_pmic_probe(struct device *dev, int device_t=
ype, unsigned int irq,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 sec_pmic->device_type);
> > =C2=A0	}
> > =C2=A0	ret =3D devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_se=
c_devs,
> > -				=C2=A0=C2=A0 NULL, 0, regmap_irq_get_domain(sec_pmic->irq_data));
> > +				=C2=A0=C2=A0 NULL, 0, regmap_irq_get_domain(irq_data));
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
> > index 92c7558ab8b0de44a52e028eeb7998e38358cb4c..c639180ea686f4308af3f87=
2cb1d2209d201b2e7 100644
> > --- a/drivers/mfd/sec-core.h
> > +++ b/drivers/mfd/sec-core.h
> > @@ -18,6 +18,6 @@ int sec_pmic_probe(struct device *dev, int device_typ=
e, unsigned int irq,
> > =C2=A0		=C2=A0=C2=A0 struct regmap *regmap, struct i2c_client *client);
> > =C2=A0void sec_pmic_shutdown(struct device *dev);
> > =C2=A0
> > -int sec_irq_init(struct sec_pmic_dev *sec_pmic);
> > +int sec_irq_init(struct sec_pmic_dev *sec_pmic, struct regmap_irq_chip=
_data **irq_data);
> > =C2=A0
> > =C2=A0#endif /* __SEC_CORE_INT_H */
> > diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> > index c5c80b1ba104e6c5a55b442d2f10a8554201a961..05d4cc350a351d994e00ba0=
8f5ce966d0d5c6a0b 100644
> > --- a/drivers/mfd/sec-irq.c
> > +++ b/drivers/mfd/sec-irq.c
> > @@ -253,7 +253,7 @@ static const struct regmap_irq_chip s5m8767_irq_chi=
p =3D {
> > =C2=A0	.ack_base =3D S5M8767_REG_INT1,
> > =C2=A0};
> > =C2=A0
> > -int sec_irq_init(struct sec_pmic_dev *sec_pmic)
> > +int sec_irq_init(struct sec_pmic_dev *sec_pmic, struct regmap_irq_chip=
_data **irq_data)
>=20
> Instead of passing around pointers to pointers, why not return irq_data
> or NULL?

That was mainly to keep change smaller - I've updated the code as per
your suggestion in v2:
https://lore.kernel.org/r/20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org

Cheers,
Andre'

