Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CE22CBD2A
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Dec 2020 13:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgLBMjW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Dec 2020 07:39:22 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44570 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgLBMjW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Dec 2020 07:39:22 -0500
Received: by mail-ed1-f68.google.com with SMTP id l5so3636326edq.11;
        Wed, 02 Dec 2020 04:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fkWhrCveGzrEexEtL2n4XQHQOORXAlu2mP1oRk1HA1s=;
        b=FfnH8mrvBXuzkCgtxvgBOE7g8t02pz8AlMcVK6OauFOT5Isc19jDMDUyIimCyZxeDi
         NkdhFnCVuLknkhnyvcW9euWKm6gelsDE2vc+TEMdzgJn9pnC9UyuXp08GoHfjcP9iW4V
         xG3yOrFMSJbC1Kzo5mlmhz6J9n08p3GlY2a5KxX8+iENW7wljyDbld/zQQ8Q9TxCeKrJ
         18KrhXz6SC/4XAYzy29bOSccahfObNJGo/O4+x1FH3mbkvCDenv6cMuccvXcw8Ax5WNu
         DRFjS9x15qQC3KK57rh5adbdZn7MCXfPw2jHZO7dE21zctFhVKicO04R6kKVaeVOcv3F
         jhoA==
X-Gm-Message-State: AOAM532TgrpW8DJT08TaCCyiCjWAWExzqM8+Ks7lutD9ZqyKAPjXCT6H
        MAhnAd6Va6SQ1YKVGzEJeVv9D7lodkM=
X-Google-Smtp-Source: ABdhPJyP28J7WuevEQ7UuS3F0FKaSTUOx5QyLIzTJYPzNxsrsL4f8t9cuit+Kn5MjXz63DieBItZSg==
X-Received: by 2002:a05:6402:17b5:: with SMTP id j21mr2363942edy.94.1606912714816;
        Wed, 02 Dec 2020 04:38:34 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id m24sm1099440ejo.52.2020.12.02.04.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 04:38:33 -0800 (PST)
Date:   Wed, 2 Dec 2020 14:38:31 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] rtc: s3c: Disable all enable (RTC, tick) bits in the
 probe
Message-ID: <20201202123831.GA36340@kozik-lap>
References: <CGME20201202111328eucas1p25b7a68b4fe94addf6088cc3ad4bedcf1@eucas1p2.samsung.com>
 <20201202111318.5353-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201202111318.5353-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Dec 02, 2020 at 12:13:17PM +0100, Marek Szyprowski wrote:
> Bootloader might use RTC hardware and leave it in the enabled state. Ensure
> that the potentially enabled periodic tick interrupts are disabled before
> enabling the driver, because they might cause lockup if tick interrupt
> happens after disabling RTC gate clock.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/rtc/rtc-s3c.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 24a41909f049..16a326e95d46 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -503,6 +503,10 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  			goto err_src_clk;
>  	}
>  
> +	/* disable RTC enable bits potentially set by the bootloader */
> +	if (info->data->disable)
> +		info->data->disable(info);
> +

It took me some time to figure out why this makes sense: disable
followed immediately by enable. :) You could add in commit msg that
enable() callback does not enable the tick interrupt.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
