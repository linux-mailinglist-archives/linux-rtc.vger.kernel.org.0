Return-Path: <linux-rtc+bounces-5742-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CEED3D192AE
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 14:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C2703023A2D
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 13:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F6D3921F4;
	Tue, 13 Jan 2026 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZcLiv4y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434622773CB
	for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312087; cv=none; b=CfUqdkhfLmsXto7IawbHwH8iodty80YdraVZ1N0rX/juLehh6OFjoLFzXrFgg/fbSEzIbQANhSHAablbjMvZNIL//d8xN4r+CnTfPd8HR5+LFZ9CwOg6kFIROnrKBv9YckuECUVmJxAuaiQXLuYl7MjlMOh+B+1GJZgLNy0V+b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312087; c=relaxed/simple;
	bh=vYdy+ons5VJFgXftP+MxcQtM1iizr7HoJy+lPu4vEQc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tmFoYH9DQH3qcP2Ke7tHKI2mzhjuOprr5U0BQNxCOm06k8U6JSSujL2x/6kJFUECGVrEdOHXgXzbAHZZSrf8dgoByJE1TZoFpvN6/Ib88qaVuCHW6+q+OBq+ChUvuMjpeztU6ruAgB8TA9Ex/RDWT58UvWcWcs/5FarZhZEOhgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZcLiv4y; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so4154967a91.3
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 05:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768312085; x=1768916885; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uLg+IuEqdWVCpF7uB5dpjBwkCvGq5aQKIvOco8dtWnY=;
        b=iZcLiv4yRL8DvjGD3yEhR1Sf8YfRZFxK26qhFg6uu2LxSK5CY+pxkDetxeXaQODNDU
         lpCSC/scmhPP/LVgWI9IC3GR5wxEkY9kZQVn6JwW6rpeXEAx2RxvTUzkweIcoEajsr6d
         6/vFYljhPCXvJ3jk+i6L555OmVUL1EJDunILOQTHxfBpGNAvgadceMZM3xnvj35TYFcE
         IsgP8zKUmtT0z5y/UbX9Wst9mxA1cyP34Jn8N75xUf0/JI/8TGolJzx4j+lJ2N0NnnSC
         XmfxRfZPL+U/2AUH4qvEH/7rPPDlN8dY3KNjxT2KtJC+3dmA2wGemrLMPN7+A0mKWRVh
         TVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312085; x=1768916885;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLg+IuEqdWVCpF7uB5dpjBwkCvGq5aQKIvOco8dtWnY=;
        b=gDZ2HJnATmmXLVH2FJSXJqt+E5K5Get8MF85qP/uyQxneZY7eJfa7yUJS4Zah0V8Bf
         rbOtZ+3ORsjYlHqt8jZu2DClXqjr99Cy9zsTZd1jcF4FhDYww5dOHBHBS6Qa3ypu8+qA
         am9qe2m/bx5ru1KEpqzmq88Upz/L8CnJGA1lfF8ef47PxTzC79daLFJ+0VSy1xpVG6XX
         A0er7ouRxbJhOB4u7A2s8afoYi0TP3cfx09W8X4paaER9psdSMUAkNgwLjsEZ7pndmLr
         9xApPtwkF2b3QH2G4BhfzgWHXTqfk0R1bV8X6Pl+z8Gyc0PJm+r08TgD74DVirieEbDF
         emww==
X-Forwarded-Encrypted: i=1; AJvYcCWDzSLdQTkVKNldVtKjjfo9Th2oi5O68Gdp5Zfh3a5cxe+O+0wLFt7WWUz6TSexpbtamcx+5VkpWTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRikU4gzFKdV59odt88MIIluxs4tvx6dGf4wxbJDKtk+ktKz4q
	8YoFlbabJjgV9milDXn7s1q+NzS4LdNSoD1h7lMeqKoqhDxcvNlqNnBGmP11Y95XExo=
X-Gm-Gg: AY/fxX4JATyvNXM/DtSklLRspk24T+ZkNpmlZKhSR8XqFMfmtom3LZFfed7WEwYNLdm
	88+QANuOCb4APKAb7w/nP6P730lmJBUgaq3p8eF+pHD3r9tW/zKkwRiz87Q0JkAOeXZk6Us1FEg
	4sdu041I0ASi5ET0XxvPw8CntASQ5XzcyEbdq6EEnQnWDYK0Ri9jxlBmAVvc6gJQE/W50KSnBop
	DQZh8OsuaMj2d+1Zec9jN4MeD6zxYYO/qDKt1cbAe6pFokLPMG0728fGHSxa13sXdx8Q5tXNkPF
	0EM/XmBBo1w1CKsyDaHXuSa89sVEXtamv4Mmg4zj9qAvtSfjNd+IRTHEkGK+lJYR9KoUZ55iu7U
	2+wKy1DXa5veiQvOPPFgunO7p3NUf5Yqb43jW8rtd+AUc7gDW33QtOYlVR6W1kmd8+sPxRt3pAW
	/2n/ogrLiCq6Ub3E2b
X-Google-Smtp-Source: AGHT+IFeQSct5UA3N1AFmGf5sMYHox3bg3cZpGk+UB6+tvysQdsZKND+0klTKDmYW2n2Whd5IVwbpg==
X-Received: by 2002:a17:90b:2587:b0:340:c179:365a with SMTP id 98e67ed59e1d1-34f68a29d18mr17579960a91.0.1768312085387;
        Tue, 13 Jan 2026 05:48:05 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb64d68sm7978211a91.12.2026.01.13.05.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:48:05 -0800 (PST)
Message-ID: <fd0136e17af78dc9960fdff215022fa6ea89f116.camel@linaro.org>
Subject: Re: [PATCH RESEND v2 3/3] mfd: sec: drop now unused struct
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
Date: Tue, 13 Jan 2026 13:48:36 +0000
In-Reply-To: <20260109104534.GF1118061@google.com>
References: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
	 <20251217-s5m-alarm-v2-3-b7bff003e94c@linaro.org>
	 <20260109104534.GF1118061@google.com>
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

Thanks for your review.

On Fri, 2026-01-09 at 10:45 +0000, Lee Jones wrote:
> On Wed, 17 Dec 2025, Andr=C3=A9 Draszik wrote:
>=20
> > This was used only to allow the s5m RTC driver to deal with the alarm
> > IRQ. That driver now uses a different approach to acquire that IRQ, and
> > ::irq_data doesn't need to be kept around anymore.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 +++---
> > =C2=A0drivers/mfd/sec-core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 63 ++++++++++++++++++----------------------
> > =C2=A0include/linux/mfd/samsung/core.h |=C2=A0 1 -
> > =C2=A04 files changed, 35 insertions(+), 40 deletions(-)
> >=20
> > diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> > index 77370db52a7ba81234136b29f85892f4b197f429..0021f9ae8484fd0afc2e47c=
813a953c91fa38546 100644
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
> > @@ -187,9 +188,9 @@ int sec_pmic_probe(struct device *dev, int device_t=
ype, unsigned int irq,
> > =C2=A0
> > =C2=A0	sec_pmic->pdata =3D pdata;
> > =C2=A0
> > -	ret =3D sec_irq_init(sec_pmic);
> > -	if (ret)
> > -		return ret;
> > +	irq_data =3D sec_irq_init(sec_pmic);
> > +	if (IS_ERR(irq_data))
> > +		return PTR_ERR(irq_data);
> > =C2=A0
> > =C2=A0	pm_runtime_set_active(sec_pmic->dev);
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
> > index 92c7558ab8b0de44a52e028eeb7998e38358cb4c..8d85c70c232612d1f7e5fb6=
1b2acd25bf03a62e0 100644
> > --- a/drivers/mfd/sec-core.h
> > +++ b/drivers/mfd/sec-core.h
> > @@ -18,6 +18,6 @@ int sec_pmic_probe(struct device *dev, int device_typ=
e, unsigned int irq,
> > =C2=A0		=C2=A0=C2=A0 struct regmap *regmap, struct i2c_client *client);
> > =C2=A0void sec_pmic_shutdown(struct device *dev);
> > =C2=A0
> > -int sec_irq_init(struct sec_pmic_dev *sec_pmic);
> > +struct regmap_irq_chip_data *sec_irq_init(struct sec_pmic_dev *sec_pmi=
c);
> > =C2=A0
> > =C2=A0#endif /* __SEC_CORE_INT_H */
> > diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> > index d992e41e716dcdc060421e1db8475523842a12be..96f53c3617da4cb54f650f9=
b98c0b934b823ceda 100644
> > --- a/drivers/mfd/sec-irq.c
> > +++ b/drivers/mfd/sec-irq.c
> > @@ -268,26 +268,28 @@ static const struct regmap_irq_chip s5m8767_irq_c=
hip =3D {
> > =C2=A0	.ack_base =3D S5M8767_REG_INT1,
> > =C2=A0};
> > =C2=A0
> > -static int s2mpg1x_add_chained_irq_chip(struct device *dev, struct reg=
map *regmap, int pirq,
> > -					struct regmap_irq_chip_data *parent,
> > -					const struct regmap_irq_chip *chip,
> > -					struct regmap_irq_chip_data **data)
> > +static struct regmap_irq_chip_data *
> > +s2mpg1x_add_chained_irq_chip(struct device *dev, struct regmap *regmap=
, int pirq,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap_irq_chip_data *parent,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct regmap_irq_chip *chip)
> > =C2=A0{
> > +	struct regmap_irq_chip_data *data;
> > =C2=A0	int irq, ret;
> > =C2=A0
> > =C2=A0	irq =3D regmap_irq_get_virq(parent, pirq);
> > =C2=A0	if (irq < 0)
> > -		return dev_err_probe(dev, irq, "Failed to get parent vIRQ(%d) for ch=
ip %s\n", pirq,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 chip->name);
> > +		return dev_err_ptr_probe(dev, irq, "Failed to get parent vIRQ(%d) fo=
r chip %s\n",
> > +					 pirq, chip->name);
> > =C2=A0
> > -	ret =3D devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT | IRQ=
F_SHARED, 0, chip, data);
> > +	ret =3D devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT | IRQ=
F_SHARED, 0, chip,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &data);
> > =C2=A0	if (ret)
> > -		return dev_err_probe(dev, ret, "Failed to add %s IRQ chip\n", chip->=
name);
> > +		return dev_err_ptr_probe(dev, ret, "Failed to add %s IRQ chip\n", ch=
ip->name);
> > =C2=A0
> > -	return 0;
> > +	return data;
> > =C2=A0}
> > =C2=A0
> > -static int sec_irq_init_s2mpg1x(struct sec_pmic_dev *sec_pmic)
> > +static struct regmap_irq_chip_data *sec_irq_init_s2mpg1x(struct sec_pm=
ic_dev *sec_pmic)
> > =C2=A0{
> > =C2=A0	const struct regmap_irq_chip *irq_chip, *chained_irq_chip;
> > =C2=A0	struct regmap_irq_chip_data *irq_data;
> > @@ -302,27 +304,28 @@ static int sec_irq_init_s2mpg1x(struct sec_pmic_d=
ev *sec_pmic)
> > =C2=A0		chained_pirq =3D S2MPG10_COMMON_IRQ_PMIC;
> > =C2=A0		break;
> > =C2=A0	default:
> > -		return dev_err_probe(sec_pmic->dev, -EINVAL, "Unsupported device typ=
e %d\n",
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 sec_pmic->device_type);
> > +		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "Unsupported device=
 type %d\n",
> > +					 sec_pmic->device_type);
> > =C2=A0	};
> > =C2=A0
> > =C2=A0	regmap_common =3D dev_get_regmap(sec_pmic->dev, "common");
> > =C2=A0	if (!regmap_common)
> > -		return dev_err_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap %d\=
n",
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 sec_pmic->device_type);
> > +		return dev_err_ptr_probe(sec_pmic->dev, -EINVAL, "No 'common' regmap=
 %d\n",
> > +					 sec_pmic->device_type);
> > =C2=A0
> > =C2=A0	ret =3D devm_regmap_add_irq_chip(sec_pmic->dev, regmap_common, s=
ec_pmic->irq, IRQF_ONESHOT, 0,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_chip, &irq_data);
> > =C2=A0	if (ret)
> > -		return dev_err_probe(sec_pmic->dev, ret, "Failed to add %s IRQ chip\=
n",
> > -				=C2=A0=C2=A0=C2=A0=C2=A0 irq_chip->name);
> > +		return dev_err_ptr_probe(sec_pmic->dev, ret, "Failed to add %s IRQ c=
hip\n",
> > +					 irq_chip->name);
> > =C2=A0
> > =C2=A0	return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec_pmic->reg=
map_pmic, chained_pirq,
> > -					=C2=A0=C2=A0=C2=A0 irq_data, chained_irq_chip, &sec_pmic->irq_dat=
a);
> > +					=C2=A0=C2=A0=C2=A0 irq_data, chained_irq_chip);
>=20
> That's a shame.
>=20
> By keeping irq_data, you could have cleaned-up a bunch of these ugly
> calls by simply passing around sec_pmic or better yet dev (then extract
> sec_pmic from there).
>=20
> Thus:
>=20
> =C2=A0=C2=A0=C2=A0 return s2mpg1x_add_chained_irq_chip(sec_pmic->dev, sec=
_pmic->regmap_pmic, chained_pirq,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 irq_data, chained_irq_chip, &sec_pmic->irq_data);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 irq_data, chained_irq_chip);
>=20
> Becomes:
>=20
> =C2=A0=C2=A0=C2=A0 return s2mpg1x_add_chained_irq_chip(dev, chained_pirq,=
 irq_data, chained_irq_chip);

s2mpg1x_add_chained_irq_chip() was modelled to be consistent with other
drivers doing a similar setup:
    drivers/mfd/intel_soc_pmic_bxtwc.c
    drivers/mfd/max77759.c

Maybe they're not good examples, but then maybe they also should be changed=
,
to ensure people don't copy from them.

As-is, it can easily be extended for additional chained chips, as the relev=
ant
arguments are parameters and it can be used as a template for the benefit o=
f
other (new) drivers (writers).

It slightly diverged from above two drivers in v2 since you requested for i=
t
to 'return' 'struct regmap_irq_chip_data *' instead of having=C2=A0
'struct regmap_irq_chip_data **' an additional argument in v1, though.

With your proposed change it won't be able to serve as example code as
easily. I see benefit in having similar code for similar setup. Anyway,
I'll change it again.


Cheers,
Andre'

