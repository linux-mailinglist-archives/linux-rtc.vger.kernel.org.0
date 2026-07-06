Return-Path: <linux-rtc+bounces-6923-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GEYoOr7ZS2qmbQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6923-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 18:37:18 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F317135CF
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 18:37:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NssBhG6O;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6923-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6923-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1FB030901C6
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 15:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2439C1E1DE5;
	Mon,  6 Jul 2026 15:49:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870241229E
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 15:49:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352961; cv=none; b=dFymyPSfH8onr0pEMexmePnp1H3IXIUqi6SmuQfi/vAwfPflRyzABHM/jJrlLPFv4bgNvmo8PIpdqnQNiITOue8ViSGt8TOXoOCRJFKea5ohNsLuNZVIViX7l8MUo89P8GHvZMVALQ5zvwuHImX30ygklKJKHzqMUMeewcgTvL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352961; c=relaxed/simple;
	bh=pl1KEDOMoRl8LBORmoKUvE6Y1V92qEX1J/mJ+bBXXcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=akogAgxER8cgEXGMypRTSaL7bV8gNOMx0Z4MK0rJd5WrPSIwv6rWv1PUvfnAu0VXgW9PFfvPDLNWq47QiAEvoZPi8vnyXhK/tujl8qUIdTf1/qnBm791LqFtVkrf5ZllwS4SLmm6aOsx+NsDj/jhsXLIy87RsEaId2ML0qsmEr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NssBhG6O; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA221F00A3F
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783352957;
	bh=x7aoi7iDnEPU3KXLwcvJh+y+bvu9z1UExF3xdy/AKzk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=NssBhG6OWSogreUfjnBrNElKqA+l46MsjNYMWeKs4z/Ib79yPFqrxuxiEvOqNOFbj
	 k9I57Pa8Jvc5PhKKi/mMMWB5QA7u6vl8CDKeBmFf0zdzvkrf2Kn2wXYPR149zXzBsB
	 qFkBIGoZySQzH2/602ENObjxGrF0j8nndKYNnK5dGzvTe+PKBeUMuUFIXCYgLcdsx/
	 4DQT7WpdyChNpweoI+6Cfu9q0IlfN+ney66mI/W+6OPkbHrNrifngU2JLQDs+Q7ZkK
	 fSQcoSE18HJzQxM9iLS86xphv6eabE4fEDOPH50tqnv2Pkx8pSwoM6CC4SHGhi46b7
	 tMrZXJ9jCh5lw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c62764c7cso1756421fa.0
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 08:49:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpbiAZMyNuCWSLO5i2Ia9dZygwpb3HoZ2Y4fO/yWjhb5L50PtrA2M29bJSvi9TlNGimV/x33Pcip3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV8fUuMhtHs0SR4fCnCwbY9xLpMM7Xb6OyAcp2//iCe9hyrnX+
	8nhGQ3U6IyoKZOtmQeoPh6RDG8QthntfCIEr3OZu/E5i2foqmr05OTmZWepTpFvv5SuIcaNzNjk
	TqODoZwJ3Ds6Y9Ob1LQny3K4ph4TMZ8Y=
X-Received: by 2002:a2e:a989:0:b0:393:aa48:8243 with SMTP id
 38308e7fff4ca-39b4536de31mr31562521fa.18.1783352955971; Mon, 06 Jul 2026
 08:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com> <20260706-a733-rtc-v4-8-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-8-f330728db3d3@baylibre.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 6 Jul 2026 23:49:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v67P9W9v-iWshJFqQfuB_qhD2S1PRCdwowGEcRBi=-ZHDw@mail.gmail.com>
X-Gm-Features: AVVi8CeWczpk78VcWF1dP30DqhdG3iRBi9A4c_ikMSI7IzDTUwpjlrCHftcPHAU
Message-ID: <CAGb2v67P9W9v-iWshJFqQfuB_qhD2S1PRCdwowGEcRBi=-ZHDw@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] clk: sunxi-ng: sun6i-rtc: split main oscillator
 div and gate.
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6923-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-rtc@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,baylibre.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9F317135CF

On Mon, Jul 6, 2026 at 5:32=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On the a733 the "osc24M-32k" clock has the same gate bits as the previous=
ly
> supported SoC but a different divider implementation.
>
> Instead of a fixed 750 divider, the divider is selected based on the
> rate of the oscillator. It can be seen as a simple read-only divider.
>
> To easily replace the divider part depending the SoC, split the divider
> and gate into two separate clock entities.

Actually, an even bigger reason to do this is because the read-only divider
and gate are in different registers, something that our combined clocks
don't support. So they need to be separate clock entities.

I think this should be mentioned. Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 20 +++++++++++---------
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 ++-
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.c
> index b24c8b196e66..25dd87e78eb7 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -218,17 +218,18 @@ static const struct clk_parent_data osc24M[] =3D {
>         { .fw_name =3D "hosc", .name =3D "osc24M" }
>  };
>
> -static struct ccu_gate osc24M_32k_clk =3D {
> -       .enable =3D BIT(16),
> -       .common =3D {
> -               .reg            =3D LOSC_OUT_GATING_REG,
> -               .prediv         =3D 750,
> -               .features       =3D CCU_FEATURE_ALL_PREDIV,
> -               .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("osc24M-32k"=
, osc24M,
> -                                                          &ccu_gate_ops,=
 0),
> -       },
> +static struct clk_fixed_factor osc24M_32k_div_clk =3D {
> +       .mult =3D 1,
> +       .div =3D 750,
> +       .hw.init =3D CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
> +                                           osc24M,
> +                                           &clk_fixed_factor_ops,
> +                                           0),
>  };
>
> +static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_c=
lk.hw,
> +                        LOSC_OUT_GATING_REG, BIT(16), 0);
> +
>  static const struct clk_hw *rtc_32k_parents[] =3D {
>         &osc32k_clk.common.hw,
>         &osc24M_32k_clk.common.hw
> @@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_cl=
ks =3D {
>                 [CLK_EXT_OSC32K_GATE]   =3D &ext_osc32k_gate_clk.common.h=
w,
>                 [CLK_OSC24M_32K]        =3D &osc24M_32k_clk.common.hw,
>                 [CLK_RTC_32K]           =3D &rtc_32k_clk.common.hw,
> +               [CLK_OSC24M_32K_DIV]    =3D &osc24M_32k_div_clk.hw,
>         },
>  };
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.h
> index 9ae821fc2599..ab7b92b47f59 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
> @@ -9,7 +9,8 @@
>  #define CLK_EXT_OSC32K_GATE    4
>  #define CLK_OSC24M_32K         5
>  #define CLK_RTC_32K            6
> +#define CLK_OSC24M_32K_DIV     7
>
> -#define CLK_NUMBER             (CLK_RTC_32K + 1)
> +#define CLK_NUMBER             (CLK_OSC24M_32K_DIV + 1)
>
>  #endif /* _CCU_SUN6I_RTC_H */
>
> --
> 2.47.3
>

