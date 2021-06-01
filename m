Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD763976EC
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Jun 2021 17:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbhFAPnK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Jun 2021 11:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbhFAPnK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 1 Jun 2021 11:43:10 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E48FC06174A
        for <linux-rtc@vger.kernel.org>; Tue,  1 Jun 2021 08:41:27 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id n4so14861509wrw.3
        for <linux-rtc@vger.kernel.org>; Tue, 01 Jun 2021 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9ITtNZNwlQldiOHh3k8Zcr3KS2X5VoqbKBn+PkTuH9w=;
        b=HWWIXMjpZY5Nv0Do85zKy0XnIH09Cv+I8O90aJOO3BSMIE4c5sIPyG45bCQfYVgiio
         eYhGJVSbT+KqeN62w97gEPyDfsykx6JnyGdcBK+mpLrSUajv6ANshRbBGSqALbl3YNIQ
         a/nWwSoYi1etW2NYalB9dhW5u/tJEf8kHUKOqjsh+HUwXk1fGB+GqNnL5y+XmIUi6BEb
         SiEIMa6Xd3KhWGNURw6qE8q2vkZwJfXT7lXdpeCk3SvF96Ko0x45vLAJXwmU0DDSQ7se
         aJg9JD7GZt0DuLh2vQqGCMLk2A0EVKfouceoqryeDu3pqPumOYK2PpxVDwzfiPZhtW0q
         lvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9ITtNZNwlQldiOHh3k8Zcr3KS2X5VoqbKBn+PkTuH9w=;
        b=epR6uLBTZ0YwTS6WBh8vSc/nCTzYQS7GtwIbj1KbtzkmlDSlAA7lFP3VAgX7M9Cfa6
         JPf73qYsTR1s7bwa+ynPGfx/EZ7TVM4P61fs+xi45/pkHMYDKMLGoOUgzzhRw0OPUA81
         ZNypycS5oJ5//ADwVGCIFcAvvK29CCp8tjhk/UQjoKtpk5c87Z00ausv0tSOyX91TPTM
         STQ2ToDVTARcDsM0FvN3uMLvE0QMmV6bd9xBjeuRvN4PJk2CojwMxMB5Kw0SnjtavU7e
         oYky7IJ7urnw94lpTuRppctG1JTqgnhZXSSBAyW9zTluI5/3vHbIirrrrxw2iftg+0oo
         lj9w==
X-Gm-Message-State: AOAM5325H0/SJF6lcRt/3Bg8D/TVctlmjFNm5Avkdep5YO2QrI3dprap
        n5skvORWTzALYqCc9XvBMw1AOQ==
X-Google-Smtp-Source: ABdhPJzHmIVw1vEegAeEcDl0WTBgV8jvsI8TadSWkcRQk7OSZx2qAUeHL1kPJexYHqY8+BXavqgFSA==
X-Received: by 2002:a05:6000:180f:: with SMTP id m15mr1762181wrh.60.1622562086113;
        Tue, 01 Jun 2021 08:41:26 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id a123sm3414501wmd.2.2021.06.01.08.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:41:25 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:41:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/7] mfd/power/rtc: Do not enforce (incorrect)
 interrupt trigger type
Message-ID: <20210601154123.GD2159518@dell>
References: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 26 May 2021, Krzysztof Kozlowski wrote:

> Hi,
> 
> This is a v2 with only minor changes:
> 1. Drop patches which landed in mainline.
> 2. Add acks.
> 3. Rebase max17040 power supply (dtschema conversion).
> 
> Patches are independent and there are no external dependencies, so
> please pick up freely.
> 
> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (7):
>   mfd: sec-irq: Do not enforce (incorrect) interrupt trigger type
>   mfd: max77686: Do not enforce (incorrect) interrupt trigger type
>   mfd: max77693: Do not enforce (incorrect) interrupt trigger type
>   mfd: max14577: Do not enforce (incorrect) interrupt trigger type
>   rtc: max77686: Do not enforce (incorrect) interrupt trigger type
>   power: supply: max17042: Do not enforce (incorrect) interrupt trigger
>     type
>   power: supply: max17040: Do not enforce (incorrect) interrupt trigger
>     type

MFD patches (at least) do not apply.

Please rebase and resubmit with my:

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
