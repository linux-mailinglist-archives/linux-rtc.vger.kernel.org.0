Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C1930C737
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 18:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236972AbhBBRNh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 12:13:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236258AbhBBQ1S (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 11:27:18 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D0DC061794
        for <linux-rtc@vger.kernel.org>; Tue,  2 Feb 2021 08:26:37 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id y205so14669885pfc.5
        for <linux-rtc@vger.kernel.org>; Tue, 02 Feb 2021 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=l4h6Ivu7DxeeLevJc1wQ+Ze6BVBDNOqfFBaVlOOvfD0=;
        b=Prj01pdPh3i/44KjbGbWaacJo35qLM4VarOzw/eGcQFhdfXnRipH1JT6n5AVVzqyBB
         ElkQT02SXpzSxXEy/04+RB50ZxAsJ7bfObZzNTc//m4oD5tL75/ltzjotxdcTRWkt2Kx
         rYR4RwqyrT6K3Hi2lJuJ4rzgoZhlwAbidDy3aOU8x7lhv0m/bd1mlqIDEGbKQ3nnZ7mK
         711c/pTmQ5kjzjDkYniVLcjV4kVMa+Bv4pVgbwq1kZaHpxgvJcy2YM9G+B9WlYBIPTxU
         JmvVCPC2OFaQ8I74JdqNI34TMPp1+GkN9FIFr2PjkpgjFhAmSdFlo28ayqjcOKiOrpkc
         jrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=l4h6Ivu7DxeeLevJc1wQ+Ze6BVBDNOqfFBaVlOOvfD0=;
        b=HCNUBSibbgdHpjWhWdthkFp0tDSci3/XcWbgermxN/e+y7LY/MeqGaziuU6PqtNBb+
         /HVMw3v5RjtMTyUq/PMtQxLewvPAM5AfDrPdTYjafXyqMfIAYnhUQfqQ2s6vVWIGr7/y
         4c3O7By+VU/9enXZdubZ7gJk9AZJ4UU39RKsk9EaWhpQ68/0GGdXdi0ZRfN2a7Jg3CmU
         Bh9U5mOOqvpM/nCH4ac7mqKQo9UG8n3qVCZBmpusfmi62n6L2hvJKIGY4zqVKif7wMeo
         ANhsWXd/er+/Jx+fJ6a0XMIon/t8yAWThLzROyRUgFYzgb+a+TkPLQazsjlrXDqyi/Q5
         0PhA==
X-Gm-Message-State: AOAM533oOAI10qMHb5kejznpzTnTMnC7DEbN6j5RUxutln4afEvQv9uv
        tVuO+4o4uBC6bX9+ywSTTaHi4Q==
X-Google-Smtp-Source: ABdhPJz23hBGlWbblH5zl60/YjQ3RKwRUlZd50alKTD1+nw88ReAaT0M2kwABWE88CwZbsdwgcrgmw==
X-Received: by 2002:a63:fe13:: with SMTP id p19mr22812940pgh.119.1612283196793;
        Tue, 02 Feb 2021 08:26:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id o14sm24015155pgr.44.2021.02.02.08.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:26:35 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 10/21] rtc: meson: quiet maybe-unused variable warning
In-Reply-To: <20210202112219.3610853-11-alexandre.belloni@bootlin.com>
References: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
 <20210202112219.3610853-11-alexandre.belloni@bootlin.com>
Date:   Tue, 02 Feb 2021 08:26:35 -0800
Message-ID: <7hsg6eh1vo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> When CONFIG_OF is disabled then the matching table is not referenced.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/rtc/rtc-meson.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
> index 8642c06565ea..44bdc8b4a90d 100644
> --- a/drivers/rtc/rtc-meson.c
> +++ b/drivers/rtc/rtc-meson.c
> @@ -380,7 +380,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static const struct of_device_id meson_rtc_dt_match[] = {
> +static const __maybe_unused struct of_device_id meson_rtc_dt_match[] = {
>  	{ .compatible = "amlogic,meson6-rtc", },
>  	{ .compatible = "amlogic,meson8-rtc", },
>  	{ .compatible = "amlogic,meson8b-rtc", },
> -- 
> 2.29.2
