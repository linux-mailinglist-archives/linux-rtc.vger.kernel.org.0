Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72614251B4D
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Aug 2020 16:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgHYOvv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 25 Aug 2020 10:51:51 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42812 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHYOvt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 25 Aug 2020 10:51:49 -0400
Received: by mail-lj1-f196.google.com with SMTP id t6so14123147ljk.9;
        Tue, 25 Aug 2020 07:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4P0Mqj4dl1NT6bCCZOf37xl543y0SvyDIEq1kl/4Bo=;
        b=kRwe3FO3JRyOVlGPT3UsQFGRKjqGa4zqKP6NNrcBU5p/DmMhFzgfpCfdveytz8nDiK
         ZDO0s5332ybFPLmGJu+tUC3n+82g/QBdY6gvs4mLsSk9nC4tgUbVhOZ1Z6fjDnrsnYRR
         zsdR2BTxsqiYfK4z5FGHNAzPQIVBFwyn50F2r1Hpp/3ulvRnePfYSyq9901Nnwq9GQYu
         C7aTgNtNRcooinqHbpknYb4I4knfS2UPUVZ2TMFJBnMVqzkP36ReicHd/c1ySyS5B4zx
         +sGNdm79APZSLspb+dERCD4JRNEp3A5V94KWzz4kPnenSWj3HLHs7pipbo4PSRvx6CNh
         L8iQ==
X-Gm-Message-State: AOAM532NWRAPYlR8xVdhERlMiMjkQI4lET9vgv1fpHfKcCFq+xKFh+mX
        Vh0drs5Fe+E/seqQDwNfDXE7eDsDNR22Dw==
X-Google-Smtp-Source: ABdhPJzEaToII+E+MJulFKcYStOY/UgSO/IsLxXa/ccxOwY8j/Bh+qTlVEKJUepl0TqR4VA02EKwUw==
X-Received: by 2002:a2e:8945:: with SMTP id b5mr4683045ljk.381.1598367106690;
        Tue, 25 Aug 2020 07:51:46 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id t4sm2879161ljh.122.2020.08.25.07.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:51:46 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 12so6575146lfb.11;
        Tue, 25 Aug 2020 07:51:46 -0700 (PDT)
X-Received: by 2002:a05:6512:31c2:: with SMTP id j2mr5148160lfe.85.1598367105913;
 Tue, 25 Aug 2020 07:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200823075815.23457-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200823075815.23457-1-dinghao.liu@zju.edu.cn>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 25 Aug 2020 22:51:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v640zTha1tzjOo3L+=T=N3hDRG+8qf2xu+bD8BMUnkhORQ@mail.gmail.com>
Message-ID: <CAGb2v640zTha1tzjOo3L+=T=N3hDRG+8qf2xu+bD8BMUnkhORQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Aug 23, 2020 at 3:59 PM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> When clk_hw_register_fixed_rate_with_accuracy() fails,
> clk_data should be freed. It's the same for the subsequent
> error paths.

I suppose you should also unregister the already registered clocks
in the latter two error paths?

> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/rtc/rtc-sun6i.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index e2b8b150bcb4..a837c5a40508 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -272,7 +272,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>                                                                 300000000);
>         if (IS_ERR(rtc->int_osc)) {
>                 pr_crit("Couldn't register the internal oscillator\n");
> -               return;
> +               goto err;
>         }
>
>         parents[0] = clk_hw_get_name(rtc->int_osc);
> @@ -290,7 +290,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>         rtc->losc = clk_register(NULL, &rtc->hw);
>         if (IS_ERR(rtc->losc)) {
>                 pr_crit("Couldn't register the LOSC clock\n");
> -               return;
> +               goto err;
>         }
>
>         of_property_read_string_index(node, "clock-output-names", 1,
> @@ -301,7 +301,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>                                           &rtc->lock);
>         if (IS_ERR(rtc->ext_losc)) {
>                 pr_crit("Couldn't register the LOSC external gate\n");
> -               return;
> +               goto err;
>         }
>
>         clk_data->num = 2;
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
