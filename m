Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95EA2304B6E
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Jan 2021 22:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbhAZEpk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jan 2021 23:45:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729163AbhAYN56 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jan 2021 08:57:58 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC211C06174A
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jan 2021 05:57:02 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d16so11955971wro.11
        for <linux-rtc@vger.kernel.org>; Mon, 25 Jan 2021 05:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gp+PA16ZKrofmtCmx5UhAkgHt0xYogsEGnsOJd6xTQE=;
        b=NjF0v5DM0oqi8sw3YmeQQIJUkZfUfqK64M3Yi82RuNzJls6JgVdgIjkxiXnZzo1qq0
         J73iuRwsB90hlBOt6ILA7lZO3U5d7AapAQma5JRNgDM8EMSIjVP9rWbNn1tb3nUOEdxn
         dOPMPvOvwB21iTmclhTVfRRuZ3KYA/35xII87arNPAgi6hbrLv497OF/u8J3D00h7l6O
         XqsRq5GS9r2gc55GcpiZmh6y0YlK61v4fUlHIMek2mus/+iIZKMSFZJmbeE55HFXASgn
         WSzP8e7ahIXJpxohMkbLFi5NXVd/CucpXHP0tpaDaRuTOTEAO9BALNx7wmkQTqy567+n
         Jp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gp+PA16ZKrofmtCmx5UhAkgHt0xYogsEGnsOJd6xTQE=;
        b=cVX4x3n1CuJiJPGZayOOvQxQ9xXBocT3ul+oBaE6Rl8BWyY+xntHLLZkwsm2q7kFpW
         4xo2RICIvHHQc2cadkzGUNutKmxVBVqYTe8MvxG4lf1vd+ukP8+F3+h2XJovSfXIN+xR
         5ObK+g0I29InfhkVCjYPkPkEsoU+eDtgc6hiaujLTKVhcuvCdBbmUEZ+xZoJPJW/Zu0x
         LrgVl6e/L3mdbLbB7dATFyy9XMeQ47vZECWgnd8STDa3YDVQ7wpNDSuqOsk/ystF5L6L
         zERYDN52PVD/iUV1Y3Ztwto3JzeiJOm7OwLUcN+z6X1oClWsRlz5UVOuS2K/cZY7ZeVd
         nQ2w==
X-Gm-Message-State: AOAM531ESS4bN6tP16otXIRWI3Lpf7QjpsUyqwRsT3M54ITAwCY+NxLj
        BN/lkxxoi/5D4ou5VjhYLy5gwQ==
X-Google-Smtp-Source: ABdhPJyi2GzmE6f+sfhyMtpP1PlJIpmf78IeJrAWHg2Oa08dZ6qBFoHoZBQqh2g2gbVG82raB5QfKA==
X-Received: by 2002:adf:eed0:: with SMTP id a16mr1085622wrp.107.1611583021391;
        Mon, 25 Jan 2021 05:57:01 -0800 (PST)
Received: from dell ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id g1sm22627542wrq.30.2021.01.25.05.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 05:57:00 -0800 (PST)
Date:   Mon, 25 Jan 2021 13:56:58 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 04/17] mfd: bd718x7: simplify by cleaning unnecessary
 device data
Message-ID: <20210125135658.GX4903@dell>
References: <cover.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
 <b722c33ef2e499da3860b442f263e1c7bfe13e51.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b722c33ef2e499da3860b442f263e1c7bfe13e51.1611037866.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 19 Jan 2021, Matti Vaittinen wrote:

> Most ROHM PMIC sub-devices only use the regmap pointer from
> parent device. They can obtain this by dev_get_regamap so in
> most cases the MFD device does not need to allocate and populate
> the driver data. Simplify drivers by removing this.
> 
> The BD70528 still needs the access to watchdog mutex so keep
> rohm_regmap_dev in use on BD70528 RTC and WDG drivers for now.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> 
> No changes since v1
> 
>  drivers/mfd/rohm-bd718x7.c       | 43 ++++++++++++--------------------
>  include/linux/mfd/rohm-bd718x7.h | 13 ----------
>  2 files changed, 16 insertions(+), 40 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
