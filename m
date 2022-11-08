Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA57062125E
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Nov 2022 14:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbiKHN1V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Nov 2022 08:27:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234360AbiKHN1V (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Nov 2022 08:27:21 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2300B4FF94
        for <linux-rtc@vger.kernel.org>; Tue,  8 Nov 2022 05:27:19 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id n12so38506672eja.11
        for <linux-rtc@vger.kernel.org>; Tue, 08 Nov 2022 05:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N/2yj1vtV3WtEYwU3cNvgg/PVgtVCmwn3eJn8jo49wk=;
        b=VMnat+U1KSonabFKRPuR13L5JqFFcM/AvvqPUwa+9VtqcDpyz6Op4uI9k8fhWWUfgj
         OQMGyd7nBSVagfiyDveayuziCLNEcnxn2ErDoMUoLlpt3yo8/JHVhiTmfW1xUoXEQ8ch
         5jJZRKNOXfrIQxouT0FZtywu8oBKzwLv6/7PIprEyWb5tHAmIqyiFvsPphy4dzO+D1O/
         ByJEsT3p8EBbAPP+gKvFSCFRhufjqGSeVaHTdjl/xTUCo6crbpyBuirSVOUQflk15qBf
         1q39gU7+oVdTRiJwpV9lCujVgxFVrOBGfRo6fbxcreewXR1hDWvKWjF1rSAwPNJVX2jh
         IlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/2yj1vtV3WtEYwU3cNvgg/PVgtVCmwn3eJn8jo49wk=;
        b=ljeQHUJJBNEWWM07RG27Ri/byxuTaUDYVoD348PMl69u7+nSIL3kUxIsqLIFYNAO43
         zg2w571Y25y8+HYR7z4sA4FHHbwfTlQzt9K8zkddId8a45PTtYsSZbjCTjaRKYNc5EB8
         Z4xD6hHhzFUv6zV0fUsmLC5tJd26t3aXEnflvdprBR7dJNJsMHGMbenKqvVqXWO0kOUk
         9uyJE1fgTI7ixDAmxQVpdfvL14uLtp4r6t1xwWBs6VYhz5t6ahcbZU51jJH3KpQTIvPO
         dTjXow1zYDkslOTLg01+CRz8kfA9HKDiEtoiPqrPkjj0dU12eyI+nNWgw6YP1DzlL56S
         Vr4g==
X-Gm-Message-State: ACrzQf3QCzq++bz3ajZVyh5WX0yGoQcWJArmYV7x5miJx92/pfBLrLuv
        cnEgxI5C0Ncb9qsosHrrkwNnczUJlGVxXlw+ThtwtQ==
X-Google-Smtp-Source: AMsMyM4SQlliAGfUpQoe5HVHzBogl+LIrkzKv8wyDOakcTA7xnKfY84HO6wUWBApVXLz+WmeEpt0AVEmstNop5fvJLQ=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr54058070ejw.203.1667914037645; Tue, 08
 Nov 2022 05:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech> <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 14:27:06 +0100
Message-ID: <CACRpkdaOM=T1pRJNK6hdc76m5tQfrjvF9nVBp7ZDf3wOMNSwyg@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Stephen Boyd <sboyd@kernel.org>,
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
        Paul Cercueil <paul@crapouillou.net>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Nov 4, 2022 at 2:32 PM Maxime Ripard <maxime@cerno.tech> wrote:

> The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> hook, but doesn't provide a determine_rate implementation.
>
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
>
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
>
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
>
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
