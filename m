Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFB839771A
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Jun 2021 17:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhFAPtv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Jun 2021 11:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbhFAPtu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 1 Jun 2021 11:49:50 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E181CC061760
        for <linux-rtc@vger.kernel.org>; Tue,  1 Jun 2021 08:48:08 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id f2so3797505wri.11
        for <linux-rtc@vger.kernel.org>; Tue, 01 Jun 2021 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KONWqLG6CUXaRV5hwllfvFmPWL0Jl8cb7j10mpIM550=;
        b=cnK0ZkWs2/SewuH/NKxorjIyIkfEUPQUTZehAPoW6IoPQBKoMAWIelEfE5N22he+Gc
         ry06rfEAkFOH8dlo6LWXrBLW6aQBSrP9WxOem+QtD80sVfiHcXKP1XXe/xo5SvidJqSV
         sgxYV21GkcOlI5/fE9IU1kRGYWbIIpv5cqwg9V1foYeo5bs76GQqyqk1830N0Xju50lm
         M1lY/NGtba0vUnD7CvUmjigyMAN9qwPcw4j6OyQd/2ytRjOHSQie+uyAXO4qJzd8K6An
         C+q/oLNV1Emikd/WHxe4lXYioh4kU/qnLTOSfk+eJ/a5ntcg7QS88R3z2yHaMpiLsQS6
         /qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KONWqLG6CUXaRV5hwllfvFmPWL0Jl8cb7j10mpIM550=;
        b=CIfk50lwwtz2EjSTIPtt8XJpFyJwWZUbz05xdOkY8gbCMQ46cLqZAL4zNIUm52mUTR
         PwKsgtk7Sv0f64+kmHusTWvX61EkhyphU219TGAjD0hoUqR78ES2jXFzCIXfBMQimBKj
         Kbt1uXw1Kz5LpT5nGaLm0dQv3hdYRyqydxsySpUL2/zLLVMw5ZFmbggA1qccWZVdtKD8
         0EYAVO1C/YpZuUBjKiG8mJ5YNKcoty2IRANMb6x75PyS10HkwIKxZH4vIl/Eq28PBVso
         4QPANNRbPhrD5zmaVJqpKCZ1Y+utdo7KY5Jn6XLcpHwAvXQ7KKzbIpJbw8JcMHgut7Rq
         TRTQ==
X-Gm-Message-State: AOAM531HtBVl0i7Ik6fQE3I2buX1cSgXBSVvmocQ57xUiVY3PhcwDG3X
        +hAv5fjPNKwz8q/LL7tPdIX1jw==
X-Google-Smtp-Source: ABdhPJxcoVIpBA7C0tcHpkh8NoySQOCYDJ7uWohpbQ/QLRGQQmfdrpzXTq1Wc4+T7riMjaVVR4+/Tw==
X-Received: by 2002:adf:f044:: with SMTP id t4mr16812609wro.73.1622562487446;
        Tue, 01 Jun 2021 08:48:07 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id r7sm2872895wmq.3.2021.06.01.08.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:48:06 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:48:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 8/9] mfd: bd70528: Drop BD70528 support
Message-ID: <20210601154804.GA2165650@dell>
References: <cover.1621937490.git.matti.vaittinen@fi.rohmeurope.com>
 <d4e4213ffea09525814e4b55518fd689b5c3bf87.1621937490.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4e4213ffea09525814e4b55518fd689b5c3bf87.1621937490.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 25 May 2021, Matti Vaittinen wrote:

> The only known BD70528 use-cases are such that the PMIC is controlled
> from separate MCU which is not running Linux. I am not aware of
> any Linux driver users. Furthermore, it seems there is no demand for
> this IC. Let's ease the maintenance burden and drop the driver. We can
> always add it back if there is sudden need for it.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> 
> ---
> Please let me know if some of you think the driver is needed.
> ---
>  drivers/mfd/Kconfig              |  17 --
>  drivers/mfd/Makefile             |   1 -
>  drivers/mfd/rohm-bd70528.c       | 314 -------------------------
>  include/linux/mfd/rohm-bd70528.h | 391 -------------------------------
>  include/linux/mfd/rohm-generic.h |   1 -
>  5 files changed, 724 deletions(-)
>  delete mode 100644 drivers/mfd/rohm-bd70528.c
>  delete mode 100644 include/linux/mfd/rohm-bd70528.h

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
