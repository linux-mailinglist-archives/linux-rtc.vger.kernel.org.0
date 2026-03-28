Return-Path: <linux-rtc+bounces-6257-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMWyBb/vx2mcfAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6257-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 16:11:59 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BE34ECD0
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 16:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 670EA3025F40
	for <lists+linux-rtc@lfdr.de>; Sat, 28 Mar 2026 15:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8792882CD;
	Sat, 28 Mar 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LD4gT7Ye"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E5199920
	for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710715; cv=none; b=FtfZEtZlUEhS63F7ZQo5sDGyK/ahGTfTWDcJis/fmHDieP5U3B5aisAXKQYo/BTu/NoJx1tjni7Z2a3wU2CiDkV2uEdzlYQ+CO7IWChVCCzkQXhuVxJCxFfWewIB6RkL643mszf8A784Od/mdapYuFKu+QKtMLGop3yvsgetxxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710715; c=relaxed/simple;
	bh=KKQVwFdQjyUaujdMXD5QVwTfES9/1zQUSB0BxSq0yV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9nTsBvZlMZuEnNOTS+D8SxMMk9V6577wThz8r/FVxdT30vanCm8y1JcMJ/PE7aSblrV2bGJ0/4jPYlAr1qHz90FvBugWPI0BdB+YE2zt2LcR/D+6cDU+KdUDZ44sudP8A8cr5/LleyoDojDO4y2neKUXKMyCx6OJ6OG1f/r4GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LD4gT7Ye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BF9C4CEF7
	for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774710715;
	bh=KKQVwFdQjyUaujdMXD5QVwTfES9/1zQUSB0BxSq0yV8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=LD4gT7YeyxCCTu6lVIxHmLL1Ajdn2GdbmO1RNS3liqgi8PNdxfrUa9P6SxLzo4KfY
	 jShWS81b0WCwSZen/KxGyMzIrV6Ql6mUIVd/SLzkavpwth+Y/x6HcMUTFNml8oTH8K
	 IDuWXAHjl5A4c8LNkV6f7t2NwXPqrAUwwndCCVQRv/p4FafRp0qRS7DhsiecPlNY5N
	 PPeJ0q0vfoDXca4d8NBDfRCwc6129Vwe+RCMmdK0vfvD8XBLty/Q/txdmSoRXwAG88
	 doq6TjmPTGjlVeffY63Xse+kdex8VPMcl0xJB/aN/AWzr6jld8G6KkCiLpAewkVVwy
	 6qUcoON2slrHQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so3666500a12.1
        for <linux-rtc@vger.kernel.org>; Sat, 28 Mar 2026 08:11:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMqtyWsnjrlvKeOfNo+Wi3I+opomoIhdiUeTT2Chv6eZ1IrniLgKx09DEN2h8z/GRkGUZXJNRW3zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCY3XF/cCt1J7RxKQ1qSeAf53w/L5jJSx/KISoAmgUeoHgJutA
	+wW3S4uGnr3gdF0nVyDTUgTtKUdB9cOltaiVW0vK84KxKjY8jm4mqwownLV5HSmLzmww8CFLZbK
	j2HE4gSEsgwHDvPONnQlK3pVTQNubuK4=
X-Received: by 2002:a05:651c:198d:b0:38a:212d:2bc2 with SMTP id
 38308e7fff4ca-38c74049edemr21842881fa.30.1774708892384; Sat, 28 Mar 2026
 07:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-7-d359437f23a7@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 22:41:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
X-Gm-Features: AQROBzBLEeTThL1bImGqhfJySnF1gONkJ6dZaJRRh6NTzlpZImaR-U-U0weYl5s
Message-ID: <CAGb2v64euL+QNXiJdTn0JygYLXg0WoguPSprKT4sKGZGVZbwug@mail.gmail.com>
Subject: Re: [PATCH 7/7] clk: sunxi-ng: Add Allwinner A733 RTC CCU support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6257-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,sholland.org,bootlin.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,pigmoral.tech:email]
X-Rspamd-Queue-Id: 6E4BE34ECD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add support for the internal CCU found in the RTC module of the Allwinner
> A733 SoC. While the basic 16MHz (IOSC) and 32kHz logic remains compatible
> with older SoCs like the sun6i, the A733 introduces several new features.
>
> The A733 RTC CCU supports choosing one of three external crystal
> frequencies: 19.2MHz, 24MHz, and 26MHz. It features hardware detection
> logic to automatically identify the frequency used on the board and
> exports this DCXO signal as the "hosc" clock.
>
> Furthermore, the driver implements logic to derive a 32kHz reference
> from the HOSC. This is achieved through a muxed clock path using fixed
> pre-dividers to normalize the different crystal frequencies to ~32kHz.

Have you tested whether the actually normalizes the frequency, i.e.
selects a different divider based on the DCXO frequency? Otherwise
we're just lying about the frequency.

> This path reuses the same hardware mux registers as the HOSC clock.
>
> Additionally, this CCU provides several gate clocks for specific
> peripherals, including SerDes, HDMI, and UFS. The driver is implemented
> as an auxiliary driver to be bound to the sun6i-rtc driver.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/Kconfig               |   5 +
>  drivers/clk/sunxi-ng/Makefile              |   2 +
>  drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c | 204 +++++++++++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h |  18 +++
>  drivers/clk/sunxi-ng/ccu_rtc.h             |   7 +
>  5 files changed, 236 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 6af2d020e03e..16afbf249f26 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -67,6 +67,11 @@ config SUN55I_A523_R_CCU
>         default ARCH_SUNXI
>         depends on ARM64 || COMPILE_TEST
>
> +config SUN60I_A733_RTC_CCU
> +       tristate "Support for the Allwinner A733 RTC CCU"
> +       default ARCH_SUNXI
> +       depends on ARM64 || COMPILE_TEST
> +
>  config SUN4I_A10_CCU
>         tristate "Support for the Allwinner A10/A20 CCU"
>         default ARCH_SUNXI
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefil=
e
> index c3f810a025a8..b0d823440c33 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_SUN50I_H616_CCU) +=3D sun50i-h616-ccu.o
>  obj-$(CONFIG_SUN55I_A523_CCU)  +=3D sun55i-a523-ccu.o
>  obj-$(CONFIG_SUN55I_A523_MCU_CCU)      +=3D sun55i-a523-mcu-ccu.o
>  obj-$(CONFIG_SUN55I_A523_R_CCU)        +=3D sun55i-a523-r-ccu.o
> +obj-$(CONFIG_SUN60I_A733_RTC_CCU)      +=3D sun60i-a733-rtc-ccu.o
>  obj-$(CONFIG_SUN4I_A10_CCU)    +=3D sun4i-a10-ccu.o
>  obj-$(CONFIG_SUN5I_CCU)                +=3D sun5i-ccu.o
>  obj-$(CONFIG_SUN6I_A31_CCU)    +=3D sun6i-a31-ccu.o
> @@ -67,6 +68,7 @@ sun50i-h616-ccu-y             +=3D ccu-sun50i-h616.o
>  sun55i-a523-ccu-y              +=3D ccu-sun55i-a523.o
>  sun55i-a523-mcu-ccu-y          +=3D ccu-sun55i-a523-mcu.o
>  sun55i-a523-r-ccu-y            +=3D ccu-sun55i-a523-r.o
> +sun60i-a733-rtc-ccu-y          +=3D ccu-sun60i-a733-rtc.o
>  sun4i-a10-ccu-y                        +=3D ccu-sun4i-a10.o
>  sun5i-ccu-y                    +=3D ccu-sun5i.o
>  sun6i-a31-ccu-y                        +=3D ccu-sun6i-a31.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c b/drivers/clk/sun=
xi-ng/ccu-sun60i-a733-rtc.c
> new file mode 100644
> index 000000000000..d17aceffa16e
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.c
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +
> +#include "ccu_common.h"
> +
> +#include "ccu_gate.h"
> +#include "ccu_mux.h"
> +#include "ccu_rtc.h"
> +
> +#include "ccu-sun60i-a733-rtc.h"
> +
> +static struct ccu_common iosc_clk =3D {
> +       .reg            =3D DCXO_CTRL_REG,
> +       .features       =3D CCU_FEATURE_IOSC_CALIBRATION,
> +       .hw.init        =3D CLK_HW_INIT_NO_PARENT("iosc", &ccu_iosc_ops,
> +                                               CLK_GET_RATE_NOCACHE),
> +};
> +
> +static struct ccu_common iosc_32k_clk =3D {
> +       .features       =3D CCU_FEATURE_IOSC_CALIBRATION,
> +       .hw.init        =3D CLK_HW_INIT_HW("iosc-32k", &iosc_clk.hw,
> +                                        &ccu_iosc_32k_ops,
> +                                        CLK_GET_RATE_NOCACHE),
> +};
> +
> +static SUNXI_CCU_GATE_FW(ext_osc32k_gate_clk, "ext-osc32k-gate",
> +                        "ext-osc32k", 0x0, BIT(4), 0);
> +
> +static const struct clk_hw *osc32k_parents[] =3D {
> +       &iosc_32k_clk.hw,
> +       &ext_osc32k_gate_clk.common.hw,
> +};
> +
> +static struct ccu_mux osc32k_clk =3D {
> +       .mux    =3D _SUNXI_CCU_MUX(0, 1),
> +       .common =3D {
> +               .reg            =3D LOSC_CTRL_REG,
> +               .features       =3D CCU_FEATURE_KEY_FIELD,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("osc32k",
> +                                                        osc32k_parents,
> +                                                        &ccu_mux_ops,
> +                                                        0),
> +       },
> +};
> +
> +static const struct clk_parent_data hosc_parents[] =3D {
> +       { .fw_name =3D "osc24M" },
> +       { .fw_name =3D "osc19M" },
> +       { .fw_name =3D "osc26M" },
> +       { .fw_name =3D "osc24M" },
> +};

As mentioned in my reply to the binding, this is wrong. There is only
one input.

The most you can do is check the rate of the parent clock against the
detected one, and _scream_ that the DT is wrong. And maybe override
the reported frequency.

If you want to do the latter, you could add a new fixed rate gated
clock type to our library. You would fill in the rate before the
clocks get registered. I probably wouldn't go that far. We want people
to have correct hardware descriptions.

Funnily enough Allwinner's BSP actually implements a fixed rate gate
for the next 24M-to-32k divider clock.

> +
> +struct ccu_mux hosc_clk =3D {
> +       .enable =3D DCXO_CTRL_DCXO_EN,
> +       .mux    =3D _SUNXI_CCU_MUX(14, 2),
> +       .common =3D {
> +               .reg            =3D DCXO_CTRL_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("hosc",
> +                                                          hosc_parents,
> +                                                          &ccu_mux_ro_op=
s,
> +                                                          0),
> +       },
> +};

So this is wrong.

> +
> +static const struct ccu_mux_fixed_prediv hosc_32k_predivs[] =3D {
> +       { .index =3D 0, .div =3D 732 },

Why is it 732 instead of 750?

> +       { .index =3D 1, .div =3D 586 },
> +       { .index =3D 2, .div =3D 793 },
> +       { .index =3D 3, .div =3D 732 },
> +};
> +
> +static struct ccu_mux hosc_32k_mux_clk =3D {
> +       .enable         =3D DCXO_CTRL_DCXO_EN,

No. The parent "hosc" clock owns this.  The enable bit for this clock
is actually bit 16 of LOSC_OUT_GATING_REG, which you model below as
a separate gate.

> +       .mux            =3D {
> +               .shift          =3D 14,
> +               .width          =3D 2,
> +               .fixed_predivs  =3D hosc_32k_predivs,
> +               .n_predivs      =3D ARRAY_SIZE(hosc_32k_predivs),
> +       },
> +       .common         =3D {
> +               .reg            =3D DCXO_CTRL_REG,
> +               .features       =3D CCU_FEATURE_FIXED_PREDIV,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("hosc-32k-mu=
x",
> +                                                          hosc_parents,
> +                                                          &ccu_mux_ro_op=
s,

Again, this is just not the way to do it.

> +                                                          0),
> +       },
> +};

I would test that it actually does switch dividers, Or at the very least,
it has a larger divider for 26M.

Maybe Andre can help? At least on this SoC the fanout pins are much more
accessible.

> +
> +static SUNXI_CCU_GATE_HW(hosc_32k_clk, "hosc-32k", &hosc_32k_mux_clk.com=
mon.hw,
> +                        LOSC_OUT_GATING_REG, BIT(16), 0);
> +
> +static const struct clk_hw *rtc_32k_parents[] =3D {
> +       &osc32k_clk.common.hw,
> +       &hosc_32k_clk.common.hw,
> +};
> +
> +static struct ccu_mux rtc_32k_clk =3D {
> +       .mux    =3D _SUNXI_CCU_MUX(1, 1),
> +       .common =3D {
> +               .reg            =3D LOSC_CTRL_REG,
> +               .features       =3D CCU_FEATURE_KEY_FIELD,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("rtc-32k",
> +                                                        rtc_32k_parents,
> +                                                        &ccu_mux_ops,
> +                                                        0),
> +       },
> +};
> +
> +static const struct clk_parent_data osc32k_fanout_parents[] =3D {
> +       { .hw =3D &osc32k_clk.common.hw },
> +       { .hw =3D &ext_osc32k_gate_clk.common.hw },
> +       { .hw =3D &hosc_32k_clk.common.hw },
> +};
> +
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(osc32k_fanout_clk, "osc32k-fanout", =
osc32k_fanout_parents,
> +                                   LOSC_OUT_GATING_REG,
> +                                   1, 2,       /* mux */
> +                                   BIT(0),     /* gate */
> +                                   0);
> +
> +static SUNXI_CCU_GATE_HW(hosc_serdes1_clk, "hosc-serdes1", &hosc_clk.com=
mon.hw,
> +                        DCXO_GATING_REG, DCXO_SERDES1_GATING, 0);

                                            ^
Just use the BIT() expression here. Adding these macros doesn't really help=
.

> +static SUNXI_CCU_GATE_HW(hosc_serdes0_clk, "hosc-serdes0", &hosc_clk.com=
mon.hw,
> +                        DCXO_GATING_REG, DCXO_SERDES0_GATING, 0);
> +static SUNXI_CCU_GATE_HW(hosc_hdmi_clk, "hosc-hdmi", &hosc_clk.common.hw=
,
> +                        DCXO_GATING_REG, DCXO_HDMI_GATING, 0);
> +static SUNXI_CCU_GATE_HW(hosc_ufs_clk, "hosc-ufs", &hosc_clk.common.hw,
> +                        DCXO_GATING_REG, DCXO_UFS_GATING, 0);
> +
> +static struct ccu_common *sun60i_rtc_ccu_clks[] =3D {
> +       &iosc_clk,
> +       &iosc_32k_clk,
> +       &ext_osc32k_gate_clk.common,
> +       &osc32k_clk.common,
> +       &hosc_clk.common,
> +       &hosc_32k_mux_clk.common,
> +       &hosc_32k_clk.common,
> +       &rtc_32k_clk.common,
> +       &osc32k_fanout_clk.common,
> +       &hosc_serdes1_clk.common,
> +       &hosc_serdes0_clk.common,
> +       &hosc_hdmi_clk.common,
> +       &hosc_ufs_clk.common,
> +};
> +
> +static struct clk_hw_onecell_data sun60i_rtc_ccu_hw_clks =3D {
> +       .num =3D CLK_NUMBER,
> +       .hws =3D {
> +               [CLK_IOSC]              =3D &iosc_clk.hw,
> +               [CLK_OSC32K]            =3D &osc32k_clk.common.hw,
> +               [CLK_HOSC]              =3D &hosc_clk.common.hw,
> +               [CLK_RTC_32K]           =3D &rtc_32k_clk.common.hw,
> +               [CLK_OSC32K_FANOUT]     =3D &osc32k_fanout_clk.common.hw,
> +               [CLK_HOSC_SERDES1]      =3D &hosc_serdes1_clk.common.hw,
> +               [CLK_HOSC_SERDES0]      =3D &hosc_serdes0_clk.common.hw,
> +               [CLK_HOSC_HDMI]         =3D &hosc_hdmi_clk.common.hw,
> +               [CLK_HOSC_UFS]          =3D &hosc_ufs_clk.common.hw,
> +               [CLK_IOSC_32K]          =3D &iosc_32k_clk.hw,
> +               [CLK_EXT_OSC32K_GATE]   =3D &ext_osc32k_gate_clk.common.h=
w,
> +               [CLK_HOSC_32K_MUX]      =3D &hosc_32k_mux_clk.common.hw,
> +               [CLK_HOSC_32K]          =3D &hosc_32k_clk.common.hw,
> +       },
> +};
> +
> +static const struct sunxi_ccu_desc sun60i_rtc_ccu_desc =3D {
> +       .ccu_clks       =3D sun60i_rtc_ccu_clks,
> +       .num_ccu_clks   =3D ARRAY_SIZE(sun60i_rtc_ccu_clks),
> +
> +       .hw_clks        =3D &sun60i_rtc_ccu_hw_clks,
> +};
> +
> +static int sun60i_rtc_ccu_probe(struct auxiliary_device *adev,
> +                               const struct auxiliary_device_id *id)
> +{
> +       struct device *dev =3D &adev->dev;
> +       void __iomem *reg =3D dev->platform_data;
> +
> +       return devm_sunxi_ccu_probe(dev, reg, &sun60i_rtc_ccu_desc);
> +}
> +
> +static const struct auxiliary_device_id sun60i_ccu_rtc_ids[] =3D {
> +       { .name =3D SUN6I_RTC_AUX_ID(sun60i) },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, sun60i_ccu_rtc_ids);
> +
> +static struct auxiliary_driver sun60i_ccu_rtc_driver =3D {
> +       .probe =3D sun60i_rtc_ccu_probe,
> +       .id_table =3D sun60i_ccu_rtc_ids,
> +};
> +module_auxiliary_driver(sun60i_ccu_rtc_driver);
> +
> +MODULE_IMPORT_NS("SUNXI_CCU");
> +MODULE_DESCRIPTION("Support for the Allwinner A733 RTC CCU");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h b/drivers/clk/sun=
xi-ng/ccu-sun60i-a733-rtc.h
> new file mode 100644
> index 000000000000..41ec6195b5e7
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-rtc.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
> + */
> +
> +#ifndef _CCU_SUN60I_A733_RTC_H_
> +#define _CCU_SUN60I_A733_RTC_H_
> +
> +#include <dt-bindings/clock/sun60i-a733-rtc.h>
> +
> +#define CLK_IOSC_32K           9
> +#define CLK_EXT_OSC32K_GATE    10
> +#define CLK_HOSC_32K_MUX       11
> +#define CLK_HOSC_32K           12
> +
> +#define CLK_NUMBER             (CLK_HOSC_32K + 1)
> +
> +#endif /* _CCU_SUN60I_A733_RTC_H_ */
> diff --git a/drivers/clk/sunxi-ng/ccu_rtc.h b/drivers/clk/sunxi-ng/ccu_rt=
c.h
> index 1c44c2206a25..665162723796 100644
> --- a/drivers/clk/sunxi-ng/ccu_rtc.h
> +++ b/drivers/clk/sunxi-ng/ccu_rtc.h
> @@ -27,8 +27,15 @@
>  #define LOSC_OUT_GATING_REG            0x60
>
>  #define DCXO_CTRL_REG                  0x160
> +#define DCXO_CTRL_DCXO_EN              BIT(1)
>  #define DCXO_CTRL_CLK16M_RC_EN         BIT(0)
>
> +#define DCXO_GATING_REG                        0x16c


> +#define DCXO_SERDES1_GATING            BIT(5)
> +#define DCXO_SERDES0_GATING            BIT(4)
> +#define DCXO_HDMI_GATING               BIT(1)
> +#define DCXO_UFS_GATING                        BIT(0)

Adding them to the header is probably even less useful, as the output
could change in future chips.


ChenYu

