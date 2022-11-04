Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F91D619F7B
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Nov 2022 19:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbiKDSL2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Nov 2022 14:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiKDSL1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Nov 2022 14:11:27 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0360F12633;
        Fri,  4 Nov 2022 11:11:26 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id t1so3471127wmi.4;
        Fri, 04 Nov 2022 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:references:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgAHyV5MssUU8DmgqTLqByPHjrUlZTpRzsXy7QZTV1w=;
        b=m1k1aGhFcGwAzy8+jR8i8dgnxBKgmbv+HEcBN9clOnBC8JDxQ1WLH/jaC98+SUuhn1
         ojpUIvzLvAjOEtONQNG3fEjMYr6YmyE21HCNBu13dHQQCKT1MZYzip/HLcRMuJacgFsk
         D55A4srqhE9k1graGmYJvC73InZQsK8+3y7hORWhx8V9sPZvLSdaAKZue8yFET0sqAK6
         QCfmTlWLBXdiCGceVK43T3rcfW1aWRAA7EsaVybuem8YgF0fY+TkmF3j/WgfSTXHeBZr
         9yfwVW6BUgHERrFBi1RgnqxfwanJH3Intmfl0rdZ0bNVoL/stqFGyIUMqw38czj+U/IY
         +ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:references:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CgAHyV5MssUU8DmgqTLqByPHjrUlZTpRzsXy7QZTV1w=;
        b=RNCXFmycpjYxusGYtIGQWD+Vwm1GBEhunusPQsKrFvS+VuTsIoojLJigV5u/ATE8HY
         aNU8B1BRX0GLcnf0P1KU+h4whniFE1Iw/XBx3RfeYItFZw4YMD6Wk6IGq6GaFn7DXVBO
         VME0hSZhVk7N3OAFHwYpxuvlxeZ61R0R7gKApQDZalDIc5Yuq/oo0+o1ilU1K1gTHOOk
         aTgTpWwuaTho2oHrgmk0W31p6suphloW70tgqGsZizCnzTq4IuXZsuVhP4RwoRZHedZx
         T1e/cI9oY6dR/R4JuTlGmYo89NhbPJueQrgVSqmIS5C/ubGGvfn74V2/3GTMsrW326a1
         I5rw==
X-Gm-Message-State: ACrzQf0Ktj3p64xgRHLKZ7E49W2Xllyez8pkxDNXzK73GLCrgnnkvLRS
        TFqYb9G/cGiH+p4qEf36vBg=
X-Google-Smtp-Source: AMsMyM5+00Cvx4Zit5cSiVEHfTNn4dr0i6mIADmjwE6QFA7y0/yyBqq7C4ech+m2YPARidv5n/8G+w==
X-Received: by 2002:a05:600c:21c9:b0:3cf:68f8:7901 with SMTP id x9-20020a05600c21c900b003cf68f87901mr283147wmj.69.1667585484372;
        Fri, 04 Nov 2022 11:11:24 -0700 (PDT)
Received: from localhost (94.197.10.32.threembb.co.uk. [94.197.10.32])
        by smtp.gmail.com with ESMTPSA id az2-20020adfe182000000b00226dba960b4sm36409wrb.3.2022.11.04.11.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 11:11:23 -0700 (PDT)
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
From:   Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Takashi Iwai <tiwai@suse.com>,
        David Airlie <airlied@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Lechner <david@lechnology.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-stm32@st-md-mailman.stormreply.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Date:   Fri, 04 Nov 2022 17:35:29 +0000
In-reply-to: <20221104145946.orsyrhiqvypisl5j@houat>
Message-ID: <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


Maxime Ripard <maxime@cerno.tech> writes:

> Hi Paul,
>
> On Fri, Nov 04, 2022 at 02:31:20PM +0000, Paul Cercueil wrote:
>> Le ven. 4 nov. 2022 =C3=A0 14:18:13 +0100, Maxime Ripard <maxime@cerno.t=
ech> a
>> =C3=A9crit :
>> > The Ingenic CGU clocks implements a mux with a set_parent hook, but
>> > doesn't provide a determine_rate implementation.
>> >
>> > This is a bit odd, since set_parent() is there to, as its name implies,
>> > change the parent of a clock. However, the most likely candidate to
>> > trigger that parent change is a call to clk_set_rate(), with
>> > determine_rate() figuring out which parent is the best suited for a
>> > given rate.
>> >
>> > The other trigger would be a call to clk_set_parent(), but it's far le=
ss
>> > used, and it doesn't look like there's any obvious user for that clock.
>> >
>> > So, the set_parent hook is effectively unused, possibly because of an
>> > oversight. However, it could also be an explicit decision by the
>> > original author to avoid any reparenting but through an explicit call =
to
>> > clk_set_parent().
>> >
>> > The driver does implement round_rate() though, which means that we can
>> > change the rate of the clock, but we will never get to change the
>> > parent.
>> >
>> > However, It's hard to tell whether it's been done on purpose or not.
>> >
>> > Since we'll start mandating a determine_rate() implementation, let's
>> > convert the round_rate() implementation to a determine_rate(), which
>> > will also make the current behavior explicit. And if it was an
>> > oversight, the clock behaviour can be adjusted later on.
>>
>> So it's partly on purpose, partly because I didn't know about
>> .determine_rate.
>>
>> There's nothing odd about having a lonely .set_parent callback; in my ca=
se
>> the clocks are parented from the device tree.
>>
>> Having the clocks driver trigger a parent change when requesting a rate
>> change sounds very dangerous, IMHO. My MMC controller can be parented to=
 the
>> external 48 MHz oscillator, and if the card requests 50 MHz, it could sw=
itch
>> to one of the PLLs. That works as long as the PLLs don't change rate, bu=
t if
>> one is configured as driving the CPU clock, it becomes messy.
>> The thing is, the clocks driver has no way to know whether or not it is
>> "safe" to use a designated parent.
>>
>> For that reason, in practice, I never actually want to have a clock
>> re-parented - it's almost always a bad idea vs. sticking to the parent c=
lock
>> configured in the DTS.
>
> Yeah, and this is totally fine. But we need to be explicit about it. The
> determine_rate implementation I did in all the patches is an exact
> equivalent to the round_rate one if there was one. We will never ask to
> change the parent.
>
> Given what you just said, I would suggest to set the
> CLK_SET_RATE_NO_REPARENT flag as well.
>

Ideally there should be a way for drivers and the device tree to
say, "clock X must be driven by clock Y", but the clock framework
would be allowed to re-parent clocks freely as long as it doesn't
violate any DT or driver constraints.

That way allowing reparenting doesn't need to be an all-or-nothing
thing, and it doesn't need to be decided at the clock driver level
with special flags.

Regards,
Aidan

>> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> > ---
>> >  drivers/clk/ingenic/cgu.c | 15 ++++++++-------
>> >  1 file changed, 8 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
>> > index 1f7ba30f5a1b..0c9c8344ad11 100644
>> > --- a/drivers/clk/ingenic/cgu.c
>> > +++ b/drivers/clk/ingenic/cgu.c
>> > @@ -491,22 +491,23 @@ ingenic_clk_calc_div(struct clk_hw *hw,
>> >  	return div;
>> >  }
>> >
>> > -static long
>> > -ingenic_clk_round_rate(struct clk_hw *hw, unsigned long req_rate,
>> > -		       unsigned long *parent_rate)
>> > +static int ingenic_clk_determine_rate(struct clk_hw *hw,
>> > +				      struct clk_rate_request *req)
>> >  {
>> >  	struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
>> >  	const struct ingenic_cgu_clk_info *clk_info =3D
>> > to_clk_info(ingenic_clk);
>> >  	unsigned int div =3D 1;
>> >
>> >  	if (clk_info->type & CGU_CLK_DIV)
>> > -		div =3D ingenic_clk_calc_div(hw, clk_info, *parent_rate, req_rate);
>> > +		div =3D ingenic_clk_calc_div(hw, clk_info, req->best_parent_rate,
>> > +					   req->rate);
>>
>> Sorry but I'm not sure that this works.
>>
>> You replace the "parent_rate" with the "best_parent_rate", and that means
>> you only check the requested rate vs. the parent with the highest freque=
ncy,
>> and not vs. the actual parent that will be used.
>
> best_parent_rate is initialized to the current parent rate, not the
> parent with the highest frequency:
> https://elixir.bootlin.com/linux/v6.1-rc3/source/drivers/clk/clk.c#L1471
>
> Maxime
