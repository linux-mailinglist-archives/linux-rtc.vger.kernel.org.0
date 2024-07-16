Return-Path: <linux-rtc+bounces-1529-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA66933439
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2024 00:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 701AC1F21A9E
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 22:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861581428F3;
	Tue, 16 Jul 2024 22:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hce1rIEZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C13613D262;
	Tue, 16 Jul 2024 22:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721168888; cv=none; b=ajIVOJwFWDVTqlz4L0HBxz9dKq+upz6B4zteSgYqoOpc0T4ZH/XaGMQ4k7JAXGpIe3jAXzaPQRw7HDymw0D0MQL6uh6yDaKeCdxGYR42XjfFQJM1jjbOUJ8P18zmRKySvOGcPYRoEtg7Vdv1jw9qqeQn8dUivwmlq12ySTiyPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721168888; c=relaxed/simple;
	bh=NfPZkGC+r85TH2hak7B3uZ5xb2lxTRsz0Snd8QaZPZA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Qr/b1DfmA5errGWbnrYXEMM54AoCZQiQBF0jEFetK3lLGIMU1xvAdWhXOR73yY/CXJMq8sW2KJ8efwBILdA9+xz/UcLL8PvEf2OAvCRiyPycJH7WIWOy5GbIZj9Vo7zYmS1kuezi4iHdGNryZm+yGyzbaHGBDTNuJ8y/HPkXtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hce1rIEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C32C116B1;
	Tue, 16 Jul 2024 22:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721168887;
	bh=NfPZkGC+r85TH2hak7B3uZ5xb2lxTRsz0Snd8QaZPZA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Hce1rIEZ0Thyin4pnSSKLVdjqAvQt5o4Bi8Wljh+Q4reiza4WyXEcCRTWY+Z3l6iF
	 yziZSPyhD3Y05kE8JY+eHXFL3qoH4h8/TUFDFWa+BkQe5w41h3WMkO7R5Ji55Hd4gn
	 D1eXAIgPvKD4LltPe4u+48sJnfTki9tQqM1Pe3U/e5KEHLp++QOpzlpzm0RNg1p2cI
	 X21mE4Px7LjIdWjLAkbqg97IMG4ri907ymCqjEjQLG60JAj94NbqyiWJ98r3kGhV9U
	 v0L0F7+GfRqT5g+WKvPkjPxgtq+egE6G/63jwYwCFbhHOKJSKYrYYkWiRWRlVHB9ZZ
	 0YT9Jt4a4HwEA==
Message-ID: <2abcd440664067d95b1ac0e765ad55a3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240716103025.1198495-4-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com> <20240716103025.1198495-4-claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 03/11] clk: renesas: clk-vbattb: Add VBATTB clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, claudiu.beznea@tuxon.dev, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, alexandre.belloni@bootlin.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lee@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Tue, 16 Jul 2024 15:28:05 -0700
User-Agent: alot/0.10

Quoting Claudiu (2024-07-16 03:30:17)
> diff --git a/drivers/clk/renesas/clk-vbattb.c b/drivers/clk/renesas/clk-v=
battb.c
> new file mode 100644
> index 000000000000..8effe141fc0b
> --- /dev/null
> +++ b/drivers/clk/renesas/clk-vbattb.c
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VBATTB clock driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>

Prefer clk providers to not be clk consumers.

> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>

Is of_platform.h used?

Include mod_devicetable.h for of_device_id.

> +#include <linux/platform_device.h>
> +
> +#define VBATTB_BKSCCR                  0x0
> +#define VBATTB_BKSCCR_SOSEL            BIT(6)
> +#define VBATTB_SOSCCR2                 0x8
> +#define VBATTB_SOSCCR2_SOSTP2          BIT(0)
[..]
> +
> +static int vbattb_clk_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +       struct clk_parent_data parent_data =3D {};
> +       struct device *dev =3D &pdev->dev;
> +       struct clk_init_data init =3D {};
> +       struct vbattb_clk *vbclk;
> +       u32 load_capacitance;
> +       struct clk_hw *hw;
> +       int ret, bypass;
> +
> +       vbclk =3D devm_kzalloc(dev, sizeof(*vbclk), GFP_KERNEL);
> +       if (!vbclk)
> +               return -ENOMEM;
> +
> +       vbclk->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(vbclk->base))
> +               return PTR_ERR(vbclk->base);
> +
> +       bypass =3D vbattb_clk_need_bypass(dev);

This is a tri-state bool :(

> +       if (bypass < 0) {
> +               return bypass;
> +       } else if (bypass) {
> +               parent_data.fw_name =3D "clkin";
> +               bypass =3D VBATTB_BKSCCR_SOSEL;

And now it is a mask value.

> +       } else {
> +               parent_data.fw_name =3D "xin";
> +       }
> +
> +       ret =3D of_property_read_u32(np, "renesas,vbattb-load-nanofarads"=
, &load_capacitance);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D vbattb_clk_validate_load_capacitance(vbclk, load_capacita=
nce);
> +       if (ret)
> +               return ret;
> +
> +       vbattb_clk_update_bits(vbclk->base, VBATTB_BKSCCR, VBATTB_BKSCCR_=
SOSEL, bypass);

Please don't overload 'bypass'. Use two variables or a conditional.

I also wonder if this is really a mux, and either assigned-clock-parents
should be used, or the clk_ops should have an init routine that looks at
which parent is present by determining the index and then use that to
set the mux. The framework can take care of failing to set the other
parent when it isn't present.

> +
> +       spin_lock_init(&vbclk->lock);
> +
> +       init.name =3D "vbattclk";
> +       init.ops =3D &vbattb_clk_ops;
> +       init.parent_data =3D &parent_data;
> +       init.num_parents =3D 1;
> +       init.flags =3D 0;
> +
> +       vbclk->hw.init =3D &init;
> +       hw =3D &vbclk->hw;
> +
> +       ret =3D devm_clk_hw_register(dev, hw);
> +       if (ret)
> +               return ret;
> +
> +       return of_clk_add_hw_provider(np, of_clk_hw_simple_get, hw);
> +}
> +
> +static const struct of_device_id vbattb_clk_match[] =3D {
> +       { .compatible =3D "renesas,r9a08g045-vbattb-clk" },
> +       { /* sentinel */ }
> +};

Any MODULE_DEVICE_TABLE?

