Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1C82F1504
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Jan 2021 14:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730416AbhAKNeT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Jan 2021 08:34:19 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:33620 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732133AbhAKNeO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Jan 2021 08:34:14 -0500
Received: by mail-ed1-f51.google.com with SMTP id j16so18879216edr.0;
        Mon, 11 Jan 2021 05:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9LXcLQjLFUIZwVreL9T4LwAn0Ka22u3rRcDfj0mv29s=;
        b=mPFgJF/Da5WqbAfNGkKhs0dOlIi0Lh9+HC1rYL6XXrBQJ6XJrrbsDxiHYG3iBCbJXy
         TtvWx4P6mhZ6qRU+aDzBZCQQK/8r9CwYWfYcEvKwDW5VH4FqXp5fzEpeDHE9pT1Mtsre
         1e25dkuq+4iUnbXyZUrjzOHx6isiH/lY9AnyHXnh8y1SHsBZp2qqIzzcvXgN/rK2bQmv
         lBt7TRlXrW5rlB/dkzaov1u98u+ngtCoLasXpaxLJNUdJ69ABAi1E6KLPLZ7OxY4SalX
         pS4PM0APbN53v3g0J5+2WTXICxkU3a4MYOwejcdQtzLEpuJeWRIo56aHYll1X2jswiXh
         p1nQ==
X-Gm-Message-State: AOAM532q+iGl67zWDXVUXFwaCcxqd+hPMZ/RqdBACdRgqfLCyKG1iTVz
        RDOyRtDhQosZZybiDYaePLo=
X-Google-Smtp-Source: ABdhPJzcO4R3XJgyHaTn67pp9BxEeB1a9oXk0gmETOpMRyDWZfAG+7U8td7yKEnnIP4Uy4GAAy0zOA==
X-Received: by 2002:a50:fc8b:: with SMTP id f11mr14123754edq.11.1610372012763;
        Mon, 11 Jan 2021 05:33:32 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id rs27sm7116396ejb.21.2021.01.11.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 05:33:31 -0800 (PST)
Date:   Mon, 11 Jan 2021 14:33:30 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 1/3] rtc: s5m: select REGMAP_I2C
Message-ID: <20210111133330.GA34341@kozik-lap>
References: <20210111124027.21586-1-brgl@bgdev.pl>
 <20210111124027.21586-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210111124027.21586-2-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jan 11, 2021 at 01:40:25PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The rtc-s5m uses the I2C regmap but doesn't select it in Kconfig so
> depending on the configuration the build may fail. Fix it.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/rtc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Fixes: 959df7778bbd ("rtc: Enable compile testing for Maxim and Samsung drivers")

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
