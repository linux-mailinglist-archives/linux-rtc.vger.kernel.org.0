Return-Path: <linux-rtc+bounces-3810-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1BBA7D8C2
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 10:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23BFD1777BE
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 08:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75AC22A7E8;
	Mon,  7 Apr 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypu/Nfye"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB084229B05
	for <linux-rtc@vger.kernel.org>; Mon,  7 Apr 2025 08:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016152; cv=none; b=u1fzn4ygm6QrHvxMcNyuWT+QRyimUjDmfyFYWmQJuSeXuAvCMSvwJuqBxng51+oswH0Yuca2/ZhhPFS5otjrCdRrUOLw1quUxLB9o/TJqx4IyiMtGWaJaq6ujC+NdbOfOrFr9YXlMZUpC4lOh6UNZs/PpXn3iuHCkEeLW1shHn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016152; c=relaxed/simple;
	bh=0OLQI/RJjtpMhMe/e1bBeJkkny0qk2ULECSY66zw7uc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iwz3/twvgzHVJvEJ69mqrtQTbR2C6aikgG278/azRmhh/+iw9BNJGtCVmioZ3atsBJ589Xxu9ukqgmSUtEmQqTnrpvvu8bwBxypIQwHCdctyVVp/jze5kKWt1yN0hFDyks3kqxW59dV2igJBbOIcJQRjEwgZJHOKiGixLX7g3n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypu/Nfye; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edb40f357so17375965e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 07 Apr 2025 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744016147; x=1744620947; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=usZvs6KCLTgjGr0SVDdV9KkJaypefAlDD3xqFkv+Ahk=;
        b=ypu/Nfye5uU362Pwj3xMxkcDcidtsFIQWXRAdVZWYkJLeLUHU0Z6lpz8XfcPgRnf/8
         gLwStplfK/9nR6L2DYKaNjwGEnX1xlE9grY9sm0b+ioiw4ML3TzcDaH/E5WI2KeKnyvF
         JTaRzOEJVTVbxvdZ3D2sZma7L7hgTTjpxWVN7wwXMGzQKm/FBRjPwnZlef4nUneTWv2J
         lJBlOMLH/tnh8py2T38/4yqoodu+TiIoXjpNvfxIZlqntGiXeX4u0FWAd1KVm2vM9NGI
         Br8GCWqfbggdwVPzV8LTNOJtYkb1+UvY0UEwKNDt0CNRtUYKiYV2vnauRF79pK2EXnpy
         a2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016147; x=1744620947;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=usZvs6KCLTgjGr0SVDdV9KkJaypefAlDD3xqFkv+Ahk=;
        b=gnapj6CLGCBKdUdOaw18ebF9eHyhc3nNYFtarAhBv8vlT9wwiaOvJO/ej37TPuk4Tu
         IwUTOWTKwWeo1zUPFZk3zLA/HdWwfErjW+B+iiFXcPNHO8GJ4omDuo1U8A51uPkHMR/F
         6LV4Vh/lqo84ryRFsRmMhvUxAG8brGbXZkiOinQn8EijmFMND+cA7Ey7K7TOd7vpLdpL
         Fea4SNJjDSqW8lXBb7ZtUgAKKlENKHh/bnv23Sk/MBi0Ou9zjbU0N44zt28vzlpMumhu
         +9nGyydWoobSr24550OqNOdcGQxw6BdTCSz1EoEjq5Q4CLz+iScDtxBfGvFjG8CtQBG/
         T0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWEtJQflmOvmVSticJWFObhqeQz4Waw07goTkicNCq3ukMl48X0/gY+Dwjf9XO0D67oVQ+f15iG0jc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy3M74qh735TfBKMqB71h8Qz00PVmc2sb81OYt+3vTCjMhOv1/
	Bc7eDwnlkYLXIsesnsfGE+tNOboWsNcRduzfwEwvJpgIM4jT2iPOeWz4sTZskBk=
X-Gm-Gg: ASbGncv2bz4IwzQChxltNfICKsdbJ9kd4Jx/0vOgpUjSsavJoKyE7ogMuXqHi66T7nZ
	k/+Pggm5AXB7fWEXuFiLfe/r7FuNPbnPowrFLNF/faibfxzndnP8XCm5hGQWesJTwsKnMJ7b9sA
	DcQ6NrZM35UbOPDVmStk3Ibb+pANXFHP2DmuBS80l+XmyHW1SfJnAHzd+cDb1UTU5fSbzlblYrm
	KrWjRB3lW7xD7+QRenQujArGs2LWWRygO9ThENyaGC3ybgD8WdRX3iFlyM3HmNsJgiXRccWq9Hc
	xYiDP7TtLC/BA78NWtKZlDp2OND0UXhnMjeaPYqY/5q+JT81
X-Google-Smtp-Source: AGHT+IHkOpZ5UWfNCm7D0PZAZL/ZLHhBDc6m6mb4xiPQsIW15234vRHFYT+yvby5B9w2sdj4Hzpxzg==
X-Received: by 2002:a05:600c:3489:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43ee0617025mr74208375e9.7.1744016147044;
        Mon, 07 Apr 2025 01:55:47 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec163107csm127864145e9.3.2025.04.07.01.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:55:46 -0700 (PDT)
Message-ID: <0a1f45f3221f74fdde0f388b3693e51c771bb307.camel@linaro.org>
Subject: Re: [PATCH v3 09/32] mfd: sec: add support for S2MPG10 PMIC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 07 Apr 2025 09:55:45 +0100
In-Reply-To: <20250404091858.GA43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-9-b542b3505e68@linaro.org>
	 <20250404091858.GA43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Thanks Lee for your review!

On Fri, 2025-04-04 at 10:18 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:

[...]

> > diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..39dbb968086ac835b96ed3e=
4efa68868fda63429
> > --- /dev/null
> > +++ b/drivers/mfd/sec-acpm.c
> > @@ -0,0 +1,465 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2020 Google Inc
> > + * Copyright 2025 Linaro Ltd.
> > + *
> > + * Samsung S2MPG1x ACPM driver
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/device.h>
> > +#include <linux/firmware/samsung/exynos-acpm-protocol.h>
> > +#include <linux/mfd/samsung/core.h>
> > +#include <linux/mfd/samsung/rtc.h>
> > +#include <linux/mfd/samsung/s2mpg10.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include "sec-core.h"
> > +
> > +#define ACPM_MAX_BULK_DATA=C2=A0=C2=A0 8
> > +
> > +struct sec_pmic_acpm_platform_data {
>=20
> This isn't platform data.=C2=A0 It's driver data.
>=20
> Platform data is passed in, driver data is derived.

This is the match data from of_device_id::data, it is passed in
via device_get_match_data().

>=20
> See how the other drivers do this:
>=20
> =C2=A0 $ git grep ddata -- drivers/mfd

I had followed the example of drivers/mfd/rk8xx-i2c.c

I can rename it to struct sec_pmic_acpm_chip_data if you prefer or
something like that, but the rk8xx driver also calls this platform
data.

ddata in drivers/mfd/ generally seems used for dynamically allocated
runtime driver data. That's not the case here.

> > +	int device_type;
> > +
> > +	unsigned int acpm_chan_id;
> > +	u8 speedy_channel;
> > +
> > +	const struct regmap_config *regmap_cfg_common;
> > +	const struct regmap_config *regmap_cfg_pmic;
> > +	const struct regmap_config *regmap_cfg_rtc;
> > +	const struct regmap_config *regmap_cfg_meter;
> > +};
> > +
> > +static const struct regmap_range s2mpg10_common_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x02), /* CHIP_ID_M, INT, INT_MASK */
> > +	regmap_reg_range(0x0a, 0x0c), /* speedy control */
> > +	regmap_reg_range(0x1a, 0x2a), /* debug */
>=20
> Nit: I like comments to start with an upper-case char.

OK

>=20
> > +};
> > +
> > +static const struct regmap_range s2mpg10_common_ro_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x01),
> > +	regmap_reg_range(0x28, 0x2a),
>=20
> Why describe some, but not all ranges?

They're all covered above. I'll duplicate them here and elsewhere.

> > +struct sec_pmic_acpm_shared_bus_context {
> > +	const struct acpm_handle *acpm;
> > +	unsigned int acpm_chan_id;
> > +	u8 speedy_channel;
> > +};
> > +
> > +enum sec_pmic_acpm_accesstype {
> > +	SEC_PMIC_ACPM_ACCESSTYPE_COMMON =3D 0x00,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_PMIC =3D 0x01,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_RTC =3D 0x02,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_METER =3D 0x0a,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_WLWP =3D 0x0b,
> > +	SEC_PMIC_ACPM_ACCESSTYPE_TRIM =3D 0x0f,
> > +};
> > +
> > +struct sec_pmic_acpm_bus_context {
> > +	struct sec_pmic_acpm_shared_bus_context *shared;
> > +	enum sec_pmic_acpm_accesstype type;
> > +};
> > +
> > +static int sec_pmic_acpm_bus_write(void *context, const void *data,
> > +				=C2=A0=C2=A0 size_t count)
>=20
> Nit: You can tidy this, and similar line-feeds, up by using 100-chars her=
e.

Will do.

> > +{
> > +	struct sec_pmic_acpm_bus_context *ctx =3D context;
> > +	const struct acpm_handle *acpm =3D ctx->shared->acpm;
> > +	const struct acpm_pmic_ops *pmic_ops =3D &acpm->ops.pmic_ops;
> > +	u8 reg;
> > +
> > +	if (count < 2 || count > (ACPM_MAX_BULK_DATA + 1))
>=20
> 2 because?=C2=A0 Either comment or define magic numbers please.
>=20
> > +		return -EINVAL;
> > +
> > +	reg =3D *(u8 *)data;
>=20
> No API to conduct this raw read for you?=C2=A0 readl(), *_to_cpu() or sim=
ilar?

This is just regmap, passing a buffer. First byte(s) contains the reg
address, depending on the regmap_config used during creation, and remainder
the values starting from that address. This is not an I/O read as such, it'=
s
only extracting the register address. See e.g. regmap_parse_8().

I'll reflow it a little.

>=20
> > +	++data;
> > +	--count;
> > +
> > +	return pmic_ops->bulk_write(acpm, ctx->shared->acpm_chan_id,
> > +				=C2=A0=C2=A0=C2=A0 ctx->type, reg,
> > +				=C2=A0=C2=A0=C2=A0 ctx->shared->speedy_channel, count, data);
> > +}
> > +
> > +static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf,
> > +				=C2=A0 size_t reg_size, void *val_buf,
> > +				=C2=A0 size_t val_size)
> > +{
> > +	struct sec_pmic_acpm_bus_context *ctx =3D context;
> > +	const struct acpm_handle *acpm =3D ctx->shared->acpm;
> > +	const struct acpm_pmic_ops *pmic_ops =3D &acpm->ops.pmic_ops;
> > +	u8 reg;
> > +
> > +	if (reg_size !=3D 1 || !val_size || val_size > ACPM_MAX_BULK_DATA)
> > +		return -EINVAL;
> > +
> > +	reg =3D *(u8 *)reg_buf;
> > +
> > +	return pmic_ops->bulk_read(acpm, ctx->shared->acpm_chan_id,
> > +				=C2=A0=C2=A0 ctx->type, reg,
> > +				=C2=A0=C2=A0 ctx->shared->speedy_channel,
> > +				=C2=A0=C2=A0 val_size, val_buf);
> > +}
> > +
> > +static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned i=
nt reg,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int mask,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int val)
> > +{
> > +	struct sec_pmic_acpm_bus_context *ctx =3D context;
> > +	const struct acpm_handle *acpm =3D ctx->shared->acpm;
> > +	const struct acpm_pmic_ops *pmic_ops =3D &acpm->ops.pmic_ops;
> > +
> > +	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id,
> > +				=C2=A0=C2=A0=C2=A0 ctx->type, reg & 0xff,
> > +				=C2=A0=C2=A0=C2=A0 ctx->shared->speedy_channel, val, mask);
> > +}
> > +
> > +static const struct regmap_bus sec_pmic_acpm_regmap_bus =3D {
> > +	.write =3D sec_pmic_acpm_bus_write,
> > +	.read =3D sec_pmic_acpm_bus_read,
> > +	.reg_update_bits =3D sec_pmic_acpm_bus_reg_update_bits,
> > +	.max_raw_read =3D ACPM_MAX_BULK_DATA,
> > +	.max_raw_write =3D ACPM_MAX_BULK_DATA,
> > +};
> > +
> > +static struct regmap *
> > +sec_pmic_acpm_regmap_init(struct device *dev,
>=20
> Place both of these on the same line please.
>=20
> > +			=C2=A0 struct sec_pmic_acpm_shared_bus_context *shared_ctx,
> > +			=C2=A0 enum sec_pmic_acpm_accesstype type,
> > +			=C2=A0 const struct regmap_config *cfg, bool do_attach)
> > +{
> > +	struct sec_pmic_acpm_bus_context *ctx;
> > +	struct regmap *regmap;
> > +
> > +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ctx->shared =3D shared_ctx;
> > +	ctx->type =3D type;
> > +
> > +	regmap =3D devm_regmap_init(dev, &sec_pmic_acpm_regmap_bus, ctx, cfg)=
;
> > +	if (IS_ERR(regmap))
> > +		return ERR_PTR(dev_err_probe(dev, PTR_ERR(regmap),
>=20
> dev_err_cast_probe()
>=20
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init (%s) failed\n",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 cfg->name));
> > +
> > +	if (do_attach) {
> > +		int ret;
> > +
> > +		ret =3D regmap_attach_dev(dev, regmap, cfg);
> > +		if (ret)
> > +			return ERR_PTR(dev_err_probe(dev, ret,
>=20
> dev_err_ptr_probe()

Thanks! I had forgotten about those two.

> > +						=C2=A0=C2=A0=C2=A0=C2=A0 "regmap attach (%s) failed\n",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 cfg->name));
> > +	}
> > +
> > +	return regmap;
> > +}
> > +
> > +static void sec_pmic_acpm_mask_common_irqs(void *regmap_common)
> > +{
> > +	regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 S2MPG10_COMMON_INT_SRC);
>=20
> Single line.=C2=A0 And others like it.
>=20
> > +}
> > +
> > +static int sec_pmic_acpm_probe(struct platform_device *pdev)
> > +{
> > +	struct regmap *regmap_common, *regmap_pmic, *regmap;
> > +	const struct sec_pmic_acpm_platform_data *pdata;
> > +	struct sec_pmic_acpm_shared_bus_context *shared_ctx;
> > +	const struct acpm_handle *acpm;
> > +	struct device *dev;
> > +	int ret, irq;
> > +
> > +	dev =3D &pdev->dev;
>=20
> You can do this during the declaration.
>=20
> > +	pdata =3D device_get_match_data(dev);
> > +	if (!pdata)
> > +		return dev_err_probe(dev, -ENODEV,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "unsupported device type\n");
> > +
> > +	acpm =3D devm_acpm_get_by_node(dev, pdev->dev.parent->of_node);
>=20
> You have 'dev' now.=C2=A0 Please use it.
>=20
> > +	if (IS_ERR(acpm))
> > +		return dev_err_probe(dev, PTR_ERR(acpm),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get acpm (2)\n");
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	shared_ctx =3D devm_kzalloc(dev, sizeof(*shared_ctx), GFP_KERNEL);
> > +	if (!shared_ctx)
> > +		return -ENOMEM;
> > +
> > +	shared_ctx->acpm =3D acpm;
> > +	shared_ctx->acpm_chan_id =3D pdata->acpm_chan_id;
> > +	shared_ctx->speedy_channel =3D pdata->speedy_channel;
> > +
> > +	regmap_common =3D sec_pmic_acpm_regmap_init(dev, shared_ctx,
> > +						=C2=A0 SEC_PMIC_ACPM_ACCESSTYPE_COMMON,
> > +						=C2=A0 pdata->regmap_cfg_common, false);
> > +	if (IS_ERR(regmap_common))
> > +		return PTR_ERR(regmap_common);
> > +
> > +	/* Mask all interrupts from 'common' block, until successful init */
> > +	ret =3D regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK,
> > +			=C2=A0=C2=A0 S2MPG10_COMMON_INT_SRC);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to mask common block interrupts\n=
");
> > +
> > +	regmap_pmic =3D sec_pmic_acpm_regmap_init(dev, shared_ctx,
> > +						SEC_PMIC_ACPM_ACCESSTYPE_PMIC,
> > +						pdata->regmap_cfg_pmic, false);
> > +	if (IS_ERR(regmap_pmic))
> > +		return PTR_ERR(regmap_pmic);
> > +
> > +	regmap =3D sec_pmic_acpm_regmap_init(dev, shared_ctx,
> > +					=C2=A0=C2=A0 SEC_PMIC_ACPM_ACCESSTYPE_RTC,
> > +					=C2=A0=C2=A0 pdata->regmap_cfg_rtc, true);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	regmap =3D sec_pmic_acpm_regmap_init(dev, shared_ctx,
> > +					=C2=A0=C2=A0 SEC_PMIC_ACPM_ACCESSTYPE_METER,
> > +					=C2=A0=C2=A0 pdata->regmap_cfg_meter, true);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	ret =3D sec_pmic_probe(dev, pdata->device_type, irq, regmap_pmic, NUL=
L);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (device_property_read_bool(dev, "wakeup-source"))
> > +		devm_device_init_wakeup(dev);
> > +
> > +	/*
> > +	 * Unmask PMIC interrupt from 'common' block, now that everything is =
in
> > +	 * place.
> > +	 */
> > +	ret =3D regmap_clear_bits(regmap_common, S2MPG10_COMMON_INT_MASK,
> > +				S2MPG10_COMMON_INT_SRC_PMIC);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to unmask PMIC interrupt\n");
> > +
> > +	/* Mask all interrupts from 'common' block on shutdown */
> > +	ret =3D devm_add_action_or_reset(dev, sec_pmic_acpm_mask_common_irqs,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regmap_common);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static void sec_pmic_acpm_shutdown(struct platform_device *pdev)
> > +{
> > +	sec_pmic_shutdown(&pdev->dev);
>=20
> sec_pmic_shutdown() takes a pointer to i2c_client (unless you changed it
> somewhere else).=C2=A0 If the later is true, then why not make it take a
> pointer to platform_device and omit this abstraction?

I changed it earlier indeed to support both I2C and ACPM transports, simila=
r
to drivers/mfd/rk*. The I2C driver doesn't have a struct platform_device,
but it has struct i2c_client::dev, hence I'm passing struct device to the
common code, like in the rk8xx example.

[...]

>=20
> > diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> > index 4d49bb42bd0d109263f485c8b58e88cdd8d598d9..bf86281401ac6ff05c90c2d=
71c84744709ed79cb 100644
> > --- a/drivers/mfd/sec-irq.c
> > +++ b/drivers/mfd/sec-irq.c
> > @@ -11,6 +11,7 @@
> > =C2=A0#include <linux/irq.h>
> > =C2=A0#include <linux/mfd/samsung/core.h>
> > =C2=A0#include <linux/mfd/samsung/irq.h>
> > +#include <linux/mfd/samsung/s2mpg10.h>
> > =C2=A0#include <linux/mfd/samsung/s2mps11.h>
> > =C2=A0#include <linux/mfd/samsung/s2mps14.h>
> > =C2=A0#include <linux/mfd/samsung/s2mpu02.h>
> > @@ -20,6 +21,60 @@
> > =C2=A0#include <linux/regmap.h>
> > =C2=A0#include "sec-core.h"
> > =C2=A0
> > +static const struct regmap_irq s2mpg10_irqs[] =3D {
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWRONF, 0, S2MPG10_IRQ_PWRONF_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWRONR, 0, S2MPG10_IRQ_PWRONR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_JIGONBF, 0, S2MPG10_IRQ_JIGONBF_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_JIGONBR, 0, S2MPG10_IRQ_JIGONBR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_ACOKBF, 0, S2MPG10_IRQ_ACOKBF_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_ACOKBR, 0, S2MPG10_IRQ_ACOKBR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWRON1S, 0, S2MPG10_IRQ_PWRON1S_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_MRB, 0, S2MPG10_IRQ_MRB_MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_RTC60S, 1, S2MPG10_IRQ_RTC60S_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_RTCA1, 1, S2MPG10_IRQ_RTCA1_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_RTCA0, 1, S2MPG10_IRQ_RTCA0_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_RTC1S, 1, S2MPG10_IRQ_RTC1S_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WTSR_COLDRST, 1, S2MPG10_IRQ_WTSR_COLDRST_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WTSR, 1, S2MPG10_IRQ_WTSR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WRST, 1, S2MPG10_IRQ_WRST_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SMPL, 1, S2MPG10_IRQ_SMPL_MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_120C, 2, S2MPG10_IRQ_INT120C_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_140C, 2, S2MPG10_IRQ_INT140C_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_TSD, 2, S2MPG10_IRQ_TSD_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PIF_TIMEOUT1, 2, S2MPG10_IRQ_PIF_TIMEOUT1_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PIF_TIMEOUT2, 2, S2MPG10_IRQ_PIF_TIMEOUT2_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SPD_PARITY_ERR, 2, S2MPG10_IRQ_SPD_PARITY_=
ERR_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SPD_ABNORMAL_STOP, 2, S2MPG10_IRQ_SPD_ABNO=
RMAL_STOP_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PMETER_OVERF, 2, S2MPG10_IRQ_PMETER_OVERF_=
MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B1M, 3, S2MPG10_IRQ_OCP_B1M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B2M, 3, S2MPG10_IRQ_OCP_B2M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B3M, 3, S2MPG10_IRQ_OCP_B3M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B4M, 3, S2MPG10_IRQ_OCP_B4M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B5M, 3, S2MPG10_IRQ_OCP_B5M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B6M, 3, S2MPG10_IRQ_OCP_B6M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B7M, 3, S2MPG10_IRQ_OCP_B7M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B8M, 3, S2MPG10_IRQ_OCP_B8M_MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B9M, 4, S2MPG10_IRQ_OCP_B9M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_OCP_B10M, 4, S2MPG10_IRQ_OCP_B10M_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WLWP_ACC, 4, S2MPG10_IRQ_WLWP_ACC_MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SMPL_TIMEOUT, 4, S2MPG10_IRQ_SMPL_TIMEOUT_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_WTSR_TIMEOUT, 4, S2MPG10_IRQ_WTSR_TIMEOUT_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_SPD_SRP_PKT_RST, 4, S2MPG10_IRQ_SPD_SRP_PK=
T_RST_MASK),
> > +
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH0, 5, S2MPG10_IRQ_PWR_WARN_CH0_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH1, 5, S2MPG10_IRQ_PWR_WARN_CH1_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH2, 5, S2MPG10_IRQ_PWR_WARN_CH2_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH3, 5, S2MPG10_IRQ_PWR_WARN_CH3_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH4, 5, S2MPG10_IRQ_PWR_WARN_CH4_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH5, 5, S2MPG10_IRQ_PWR_WARN_CH5_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH6, 5, S2MPG10_IRQ_PWR_WARN_CH6_=
MASK),
> > +	REGMAP_IRQ_REG(S2MPG10_IRQ_PWR_WARN_CH7, 5, S2MPG10_IRQ_PWR_WARN_CH7_=
MASK),
> > +};
> > +
> > =C2=A0static const struct regmap_irq s2mps11_irqs[] =3D {
> > =C2=A0	[S2MPS11_IRQ_PWRONF] =3D {
> > =C2=A0		.reg_offset =3D 0,
> > @@ -320,6 +375,16 @@ static const struct regmap_irq s5m8767_irqs[] =3D =
{
> > =C2=A0	},
> > =C2=A0};
> > =C2=A0
> > +static const struct regmap_irq_chip s2mpg10_irq_chip =3D {
> > +	.name =3D "s2mpg10",
> > +	.irqs =3D s2mpg10_irqs,
> > +	.num_irqs =3D ARRAY_SIZE(s2mpg10_irqs),
> > +	.num_regs =3D 6,
> > +	.status_base =3D S2MPG10_PMIC_INT1,
> > +	.mask_base =3D S2MPG10_PMIC_INT1M,
> > +	/* all interrupt sources are read-to-clear */
>=20
> TOUPPER(a);
>=20
> Comments usually go on-top of the thing they're commenting on.

This comment is where .ack_base would usually be specified, but I'll move i=
t.

[...]

> > diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/sa=
msung/s2mpg10.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..778ff16ef6668ded514e8dc=
7242f369cb9c2d0e6
> > --- /dev/null
> > +++ b/include/linux/mfd/samsung/s2mpg10.h
> > @@ -0,0 +1,454 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright 2015 Samsung Electronics
> > + * Copyright 2020 Google Inc
> > + * Copyright 2025 Linaro Ltd.
> > + */
> > +
> > +#ifndef __LINUX_MFD_S2MPG10_H
> > +#define __LINUX_MFD_S2MPG10_H
> > +
> > +/* Common registers (type 0x000) */
> > +enum s2mpg10_common_reg {
> > +	S2MPG10_COMMON_CHIPID,
> > +	S2MPG10_COMMON_INT,
> > +	S2MPG10_COMMON_INT_MASK,
> > +	S2MPG10_COMMON_SPD_CTRL1 =3D 0x0a,
> > +	S2MPG10_COMMON_SPD_CTRL2,
> > +	S2MPG10_COMMON_SPD_CTRL3,
> > +	S2MPG10_COMMON_MON1SEL =3D 0x1a,
> > +	S2MPG10_COMMON_MON2SEL,
> > +	S2MPG10_COMMON_MONR,
> > +	S2MPG10_COMMON_DEBUG_CTRL1,
> > +	S2MPG10_COMMON_DEBUG_CTRL2,
> > +	S2MPG10_COMMON_DEBUG_CTRL3,
> > +	S2MPG10_COMMON_DEBUG_CTRL4,
> > +	S2MPG10_COMMON_DEBUG_CTRL5,
> > +	S2MPG10_COMMON_DEBUG_CTRL6,
> > +	S2MPG10_COMMON_DEBUG_CTRL7,
> > +	S2MPG10_COMMON_DEBUG_CTRL8,
> > +	S2MPG10_COMMON_TEST_MODE1,
> > +	S2MPG10_COMMON_TEST_MODE2,
> > +	S2MPG10_COMMON_SPD_DEBUG1,
> > +	S2MPG10_COMMON_SPD_DEBUG2,
> > +	S2MPG10_COMMON_SPD_DEBUG3,
> > +	S2MPG10_COMMON_SPD_DEBUG4,
> > +};
> > +
> > +/* for S2MPG10_COMMON_INT and S2MPG10_COMMON_INT_MASK */
>=20
> TOUPPER(f), etc.

Still getting used to this, sorry I missed them

Thanks Lee!

Andre'


