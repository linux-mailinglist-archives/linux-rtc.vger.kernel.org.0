Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 438EBCEB7C
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 20:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbfJGSJS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 14:09:18 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38210 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbfJGSJR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 14:09:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id x10so8690998pgi.5
        for <linux-rtc@vger.kernel.org>; Mon, 07 Oct 2019 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=GeChysEpyXENIdkz70FTwZQNrGJAliQm6LKcOJ4pwgg=;
        b=1g4svc2i2jhyiyQgS7H2WqaqlY4rawaEfSSoyLIcO9cblF0u1gFFqp/KTw35+0FZfc
         MwzkbFI30GsMRmv2OloegWaVbSjb8KDnm+dfMEbweYWsOm1wGCxZsUSg/z+13uH3xzh1
         RupL3Su0rST4Jq9HoZjj9nGm9XoyTwDep1/8UQyx/IVu9uLc6qpUfKWUlHyLvUMgJXNW
         aB2X3gCDtmoi4cYwtVghiMaLgJrHmdzn/5lss3HRCyoE4uQU4faG8oZ0vBV7mGtmCjn5
         1yBEDl3LzEuJXvBb0Jp2SepKw/cROrKcSFBMbcUwB1odwRJ0Wn5DcdTOh2g1tJhlI8t4
         bchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=GeChysEpyXENIdkz70FTwZQNrGJAliQm6LKcOJ4pwgg=;
        b=ansQ9IBScqLg3vfcxdIJ96yBMkBepdcoZe960tLDIFP9jgVm/6SC3bjwq+YMjcpSl1
         Dtcyb5XwCFB9di+PVoV/ov9vnLoDcLavYZwjZBD/0GMSv2RCQlTHB8msDhYkHhlK1Fit
         QSvfQijnCAmpV6pOAHn0Sv7CW8kgAAUj5XlCPG48JSyIgA7dga7qSSeq6utXdu31Himp
         b1ry49sM2NrHJveHOZkmdXqsnYSlJ2a5JvA3GDLRqWeDIjhcNwP+g2ZGpr/FWfggy2af
         mI1+uG4H6BJDBLpjWq1SKY4qXsYr9v1QgeUtVGWdJYW2ALCAUQ+Mjqgbwohd+2wimlWq
         D8sw==
X-Gm-Message-State: APjAAAVoK8sgSfMw9+b4laAiIXS0VcNcIsYQ5g4M3hf+eGBoMvX5WpWu
        fNd+L6Q8UFeTGfTD7su6FKzxyg==
X-Google-Smtp-Source: APXvYqyCq2Sjyl//q7G2IzZThRFyehP3F/3geHI2eKnTCZnkHRsOjKjZK4tPTO1jHMEhvfanawQuGw==
X-Received: by 2002:a65:688a:: with SMTP id e10mr31994989pgt.221.1570471756657;
        Mon, 07 Oct 2019 11:09:16 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:bd18:5fe6:bf81:d473])
        by smtp.gmail.com with ESMTPSA id s73sm155793pjb.15.2019.10.07.11.09.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 11:09:16 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     YueHaibing <yuehaibing@huawei.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, joel@jms.id.au, andrew@aj.id.au,
        nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        computersforpeace@gmail.com, gregory.0xf0@gmail.com,
        f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linus.walleij@linaro.org, baruch@tkos.co.il, paul@crapouillou.net,
        vz@mleia.com, slemieux.tyco@gmail.com, eddie.huang@mediatek.com,
        sean.wang@mediatek.com, matthias.bgg@gmail.com,
        patrice.chotard@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, mripard@kernel.org, wens@csie.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux@prisktech.co.nz, michal.simek@xilinx.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next 16/34] rtc: meson: use devm_platform_ioremap_resource() to simplify code
In-Reply-To: <20191006102953.57536-17-yuehaibing@huawei.com>
References: <20191006102953.57536-1-yuehaibing@huawei.com> <20191006102953.57536-17-yuehaibing@huawei.com>
Date:   Mon, 07 Oct 2019 11:09:15 -0700
Message-ID: <7hk19gfmwk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> writes:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/rtc/rtc-meson.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
> index e08b981..9bd8478 100644
> --- a/drivers/rtc/rtc-meson.c
> +++ b/drivers/rtc/rtc-meson.c
> @@ -292,7 +292,6 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	};
>  	struct device *dev = &pdev->dev;
>  	struct meson_rtc *rtc;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret;
>  	u32 tm;
> @@ -312,8 +311,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	rtc->rtc->ops = &meson_rtc_ops;
>  	rtc->rtc->range_max = U32_MAX;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.7.4
