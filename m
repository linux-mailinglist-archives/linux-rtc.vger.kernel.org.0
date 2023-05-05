Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74D926F88D5
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 20:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbjEESqT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 14:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbjEESqQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 14:46:16 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6968203E0;
        Fri,  5 May 2023 11:46:15 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50bc040c7b8so3282777a12.2;
        Fri, 05 May 2023 11:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683312374; x=1685904374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL+1qoziu9QsKZaGAp4w2GCjNWWHE42lzOyIZ2hEKeo=;
        b=YIfG+3VlUPqHPZoZ5pe5sVJDjfpIkRHTnLS9nbyd28/0urK0wSthkXftlxmEmMybUw
         65HtGg0JDmHhaw1+rUv1YeSAFT3N6jjdcOnPH7WfR3iSRfegj+Pf5a++8HD61opYOlln
         v1cUkRky/kb8cx92/+9TEMUZXbi4jXNin3VDfLCnNvi+uFdJ5+oY3nrGjqYs2PKWiZxJ
         +hEIy4NkaIHeeRnwBXezTnWMfK7vFykXvuDeBw6K+h9dza2sLHiCYYlEz4/BFALZKMFf
         A+1DasHNTCiKNRqojiyfMMlYvKD5v6xHawDrk9aZffDQpMsmaBgmU5Ivq7oKMghFiqCm
         kOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683312374; x=1685904374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OL+1qoziu9QsKZaGAp4w2GCjNWWHE42lzOyIZ2hEKeo=;
        b=U+FoLCG8Y9RDhYl00PwWAmUgidhaQc1y86AObFmloP1giEvXwoQr3uRKOWdBskpFsD
         gS7ff53v1Ola/0vJG0Rb1nV+r4uBPjtAJGdTv1D8HBE9HR7frSGZaVvhWBAXYpn5Ros4
         W5VLpBfRylECEQypWxCXbjwfYfMqCec4ue1eHbPRBzpP+p2nnbZhSPae1xVE/t0HFywv
         jthjt/dwB9qOzyYnyFtbzpD5aoWSWkrsucYryLeV/SBwmT+Fxoyf1xJJAYA5bDT/HT8c
         mgJl2ba+moDz3+5G9gtUIFW5O1LlskoCc+klqzGF46IR2xvsAry7f8Qk7zInsx0WFgCG
         fHBQ==
X-Gm-Message-State: AC+VfDyuV0qTRVJ67bp2SDlc52ZceAM/nemiRKQNYfYsiZCswnQW4GLf
        TxnO46iDq4U9CoHRCMKgpvU=
X-Google-Smtp-Source: ACHHUZ5NZnESKFbkWrc+8ONER0zwRZSahRZS7mWNfc1zuF8NuHoqqlR4Oa8H1LKUwXFmtMxyRLiyAQ==
X-Received: by 2002:aa7:df8e:0:b0:50b:c58a:a7ae with SMTP id b14-20020aa7df8e000000b0050bc58aa7aemr2336540edy.4.1683312374077;
        Fri, 05 May 2023 11:46:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7d883000000b00504ecc4fa96sm3163911edq.95.2023.05.05.11.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 11:46:13 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 45/68] rtc: sun6i: Add a determine_rate hook
Date:   Fri, 05 May 2023 20:46:12 +0200
Message-ID: <1852119.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-45-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-45-971d5077e7d2@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dne petek, 05. maj 2023 ob 13:25:47 CEST je Maxime Ripard napisal(a):
> The Allwinner sun6i RTC clock implements a mux with a set_parent hook,
> but doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidates to
> trigger that parent change are either the assigned-clock-parents device
> tree property or a call to clk_set_rate(), with determine_rate()
> figuring out which parent is the best suited for a given rate.
> 
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
> 
> Similarly, it doesn't look like the device tree using that clock driver
> uses any of the assigned-clock properties on that clock.
> 
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
> 
> The latter case would be equivalent to setting the determine_rate
> implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
> determine_rate implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise.
> 
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
> 
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-sunxi@lists.linux.dev
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/rtc/rtc-sun6i.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index dc76537f1b62..71548dd59a3a 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -214,6 +214,7 @@ static int sun6i_rtc_osc_set_parent(struct clk_hw *hw,
> u8 index)
> 
>  static const struct clk_ops sun6i_rtc_osc_ops = {
>  	.recalc_rate	= sun6i_rtc_osc_recalc_rate,
> +	.determine_rate	= clk_hw_determine_rate_no_reparent,
> 
>  	.get_parent	= sun6i_rtc_osc_get_parent,
>  	.set_parent	= sun6i_rtc_osc_set_parent,




