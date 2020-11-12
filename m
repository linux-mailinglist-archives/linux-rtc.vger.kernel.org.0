Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183532B04A2
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Nov 2020 13:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbgKLMCT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Nov 2020 07:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgKLMB7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Nov 2020 07:01:59 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A304C0613D1
        for <linux-rtc@vger.kernel.org>; Thu, 12 Nov 2020 04:01:57 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id w142so7975005lff.8
        for <linux-rtc@vger.kernel.org>; Thu, 12 Nov 2020 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yUPb7b2T8a0CFH/JK9NuMjV/qPxHVp85asS2uyoMYdc=;
        b=D4OGpAIWDI/RmWMQAO/nDaZuRT1yUD13JXa0Jdk8P8bZLq+3LUUxqY90y0f2ge+3uP
         +TxACM38kzJpoXmO+HgbkVIeoiMI5MacURI0XQbK6xXMREfi32ehHwrPcIAq5/h5fW3m
         aoXg2wzwpOxqtcDvPrBWGdpBm/vadVvF4i3Z/kGqvoCnY0Jwal6SGRnt9zcGdE0HtJVO
         HWhoK9pxXaXvNdTaxhLIyw4Y+/VFDtlrnqzGFwjYC+pwDnUtMNTw648qFinnY5/mT2Il
         Z+hxjfSYE26lEOq1OQZQ4r4Dw5zempb1bnIzqXA71jNomFXdaRq32tshSaiY20LMyP1A
         ONeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yUPb7b2T8a0CFH/JK9NuMjV/qPxHVp85asS2uyoMYdc=;
        b=NlNc0LKolBR7AveqV8n7InPN+80/7a0RRv6Qcfiprb0zlNeJAfIaCA82Qv1WJl3FLd
         wQIzZw+c8i8SEssWD9kfYJSanefPZgDfsng+QvYE+Hkmak74sFsPUwHRaa/1bx0ncRCs
         S/RLPebX+XDKXQ01DJK/nAOXjz7CA9dZT9rA8jnBEzBI3kz75QzoHYjbCj28KcMOw03A
         4jpiCbJmk666wUnG8sMh2ccTECNgmijvK3N3YsifsuqmFjtdtyPhCWfna6177gSzCqw2
         0y97pVaAwmxb8+Hvn3m4v51OytJLHkzYjWKB+2zbMd8IXOPGndqVyiY3FgVuDPxE7a8y
         G2EA==
X-Gm-Message-State: AOAM532XlvNno4z+UfcPYKWwekA3WXdiFtJmpt8BofnS3quK0h4VcSvh
        l/b3BCiDGqRgIUh9fvVJBwnIspoW4CmIP8bngoo8Ew==
X-Google-Smtp-Source: ABdhPJwHlAANwMuqz5BFJBUCFHGsDlulOmRXVxqQtuhmluYr0fVppsjU8/6yWn+XdbFKkUcGjqEqxqow3OqvSCruRTI=
X-Received: by 2002:a19:e08:: with SMTP id 8mr2659466lfo.441.1605182515635;
 Thu, 12 Nov 2020 04:01:55 -0800 (PST)
MIME-Version: 1.0
References: <20201112093139.32566-1-zhengliang6@huawei.com>
In-Reply-To: <20201112093139.32566-1-zhengliang6@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Nov 2020 13:01:44 +0100
Message-ID: <CACRpkdbRQEUQR6OuSnmbk9Pw5Tm=SQTtSNb_di1zZWyZMaPhtw@mail.gmail.com>
Subject: Re: [PATCH] rtc: pl031: fix resource leak in pl031_probe
To:     Zheng Liang <zhengliang6@huawei.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org, wangli74@huawei.com, fangwei1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Nov 12, 2020 at 9:34 AM Zheng Liang <zhengliang6@huawei.com> wrote:

> When devm_rtc_allocate_device is failed in pl031_probe, it should release
> mem regions with device.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Liang <zhengliang6@huawei.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
