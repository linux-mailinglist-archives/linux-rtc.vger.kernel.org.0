Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8770D44DAF2
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Nov 2021 18:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbhKKRIN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 12:08:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhKKRII (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Nov 2021 12:08:08 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AD2C061766
        for <linux-rtc@vger.kernel.org>; Thu, 11 Nov 2021 09:05:19 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id o26so13302015uab.5
        for <linux-rtc@vger.kernel.org>; Thu, 11 Nov 2021 09:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HpH5aIz9YnVDHI1tp8iTZZAenfgFZ0zd85byr9qx2Vg=;
        b=UdpJvinnJT+rLEFmcyE1XHdkYN5/vP9xkk5tjrHpQIiw4ffxoGhvbphUSs2mcUdX4D
         3r+xBe/0FJFrmNU4CbxYY2TdLL7CXWcvqB93caoIZdPwyJU/IgPt1NlEhwcFv53BWXf/
         qXqQFrmYNBd8smXfy/EhORtC667VtYArv9JzSNOJXozAK/ywKHZEv1xASbPwo0dx/pjg
         TktB1xI1teAGUwEa0ZB7Bkkun+VtcUmnNa38vGhhj+RHSYUllNIHBrRg1UA2SrZK34kR
         INkzZajs/okE0aVh48P1gDCtumnEJ4UfVHj910U9DcCdjHeMcu9ltMNPEPYP+gsrM/RD
         Ffpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HpH5aIz9YnVDHI1tp8iTZZAenfgFZ0zd85byr9qx2Vg=;
        b=qK2DgswcgixlLIusDEvfBfvzaEVlGf6r6s1w6ODuIK/VKQgsCjtcmMCjHXpR1bSblA
         jlOd+s/wBMSFLJ61BwELxW+SSGakoKTSVC4gGohCNkNV9F7LhyqDoFrwK4neAg+bsnGF
         esbxhxnElwItGCaopy5pZjUFXj8a3EH+w6sfcqagDRyMENYSEMfZ2Yw1vfyDhTCfdLoJ
         GeKfWYvJVNuParXEA3jNnZOqC/WeSNpyIZrxqEvqGOE2jHn8adEpsEhfzOz5k+1pCRMp
         f+rIw7VY5CU4UuqzdTgDYTMdo0VBA7BgX7HHYnNr/4rqYSPIaADNYYhzkTazPShuSFoz
         NeRw==
X-Gm-Message-State: AOAM531d3eK/VnQd3SFOtuWXKc+IonvjLp8p5y/eQgv6TRpztNdvF9B+
        d81bFIP6vEGixYED42oZKUH7Yiu6VDR79jow2fvl2g==
X-Google-Smtp-Source: ABdhPJzj9aD0XnB8FKZNP4f62gsXxPkbQXP07nxLWlCQRJ6aFNZfRb5dxpkDED6uVInZTLrnALcpuJSMqBG4Ju7YfXY=
X-Received: by 2002:a67:1781:: with SMTP id 123mr488406vsx.1.1636650318135;
 Thu, 11 Nov 2021 09:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20211021202256.28517-1-semen.protsenko@linaro.org> <163502632457.411308.6365977083733513077.b4-ty@bootlin.com>
In-Reply-To: <163502632457.411308.6365977083733513077.b4-ty@bootlin.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 11 Nov 2021 19:05:06 +0200
Message-ID: <CAPLW+4mBKH_-A5rWGKgpA=r8as6UqhmHf6h1DRg0fEY9jSmJQA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rtc: s3c: S3C driver improvements
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 24 Oct 2021 at 00:58, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On Thu, 21 Oct 2021 23:22:53 +0300, Sam Protsenko wrote:
> > While working on Exynos850 support (where this driver works fine in its
> > current state), I've stumbled upon some minor issue. This is the effort
> > to fix those.
> >
> >   * [PATCH 1/3]: moves S3C RTC driver to newer API usage
> >     (no functional changes)
> >   * [PATCH 2/3]: refactoring/cleanup (no functional changes)
> >   * [PATCH 3/3]: adds time range, as [PATCH 1/3] made it possible
> >
> > [...]
>
> Applied, thanks!
>

Hi Alexandre,

Just want to check if this series is going to be merged during current
merge window, or is it scheduled for the next one?

Thanks!

> [1/3] rtc: s3c: Remove usage of devm_rtc_device_register()
>       commit: dba28c37f23a09fc32dbc37463ddb2feb3886f98
> [2/3] rtc: s3c: Extract read/write IO into separate functions
>       commit: e4a1444e10cbda2892a4ea7325ef5efa47c75cfb
> [3/3] rtc: s3c: Add time range
>       commit: a5feda3b361e11b291786d5c4ff86d4b9a55498f
>
> Best regards,
> --
> Alexandre Belloni <alexandre.belloni@bootlin.com>
