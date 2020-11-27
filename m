Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864032C619B
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Nov 2020 10:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgK0JXg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Nov 2020 04:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgK0JXg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Nov 2020 04:23:36 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE4AC0613D4
        for <linux-rtc@vger.kernel.org>; Fri, 27 Nov 2020 01:23:35 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id u19so3647575edx.2
        for <linux-rtc@vger.kernel.org>; Fri, 27 Nov 2020 01:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0DpItTEwRoT37q4YugTk/Cc30zbGqoSLcQiv1n2CIMU=;
        b=fCdlfLtqLOkDWFQC9fi4o46nXKnrYNYqwvOA1LnGl24HuAuGVRtxn4zKR+VFTh8mRT
         o7ao90MbkYXulnIz3nSoPLtSUnv3vE42BvoDQePZr0ASuoUuiAysIfQbV+MWWXTLSmZ/
         XB5+X0hGZtHyE8ywXJDtg4Di/Hv1/xZ++C8JsHto2nuOENGD0/MDLGggmzn8+j5Zibhd
         xWVFFLK8wa+tKaE2/BL5bInFUNTMIt6Wm5H2fiCtS4t0lwkY/5QsWTohTUFCk3GsCuNU
         qPtNVFyxq/wedp3TCRC4TKik6VvgKMr82m79tY766+Ux9X6k8XbdPr6zJlv+WP3MflqF
         t7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0DpItTEwRoT37q4YugTk/Cc30zbGqoSLcQiv1n2CIMU=;
        b=IhcxKzAsh5AcgK7JHCIty3+TG0ypOpK7GYxmJCFI3zf+OQ/G79+kjCD9gEs6AFWsrA
         qRHWfhnofVNK8NV6swU//YLFWc7jxxlW8eMSKTequhqNSauXGAm98e+wTh6PSp2eK7qF
         eP6s95hch9BrC4Uiu5+QRjTNf2nE0oYITG9Ay6PasdKx5QA/YAsx/m93PrDchzn9SEkD
         s1xIcEV63FA7oMwsD6TBo2rCqpUQrnwJj9Gt0Hbom6yiw1ilg62nGRSRc9gMA0K8YOeB
         1ofGnH2v7TcX0w9bsouH2s1Ub9h6zbzKP8QIctLQ2ySAsOJovMTNS6LDDmkB9tkraVN6
         /LpQ==
X-Gm-Message-State: AOAM531PC6oARE0+tqMW+Rh0RF+gd++CK4309p38+kwH9lhcd1OkU9iV
        5T98XD/urC2K3nSzj4iSQzk9Nj0Ord7JwoGu1ouJ8w==
X-Google-Smtp-Source: ABdhPJywcFbPMR7tanAmYG3sGRVp94wC+b8Z3sGPs+7QKFoKHkkKvNl4UFNEDpl5LzaPHcf2lRJdLwuH7n2x2x5NrkA=
X-Received: by 2002:a05:6402:cb4:: with SMTP id cn20mr6823862edb.186.1606469014514;
 Fri, 27 Nov 2020 01:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20201109163409.24301-1-brgl@bgdev.pl> <20201109163409.24301-8-brgl@bgdev.pl>
 <CAF2Aj3inp8=dn9xuc8f3uJbL+m5LH7W3BDoOeZyiiOupmbfgOw@mail.gmail.com>
In-Reply-To: <CAF2Aj3inp8=dn9xuc8f3uJbL+m5LH7W3BDoOeZyiiOupmbfgOw@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 27 Nov 2020 10:23:23 +0100
Message-ID: <CAMpxmJXa8L0TaeENeYsypmgfkabdP8pH6H6iniwmy0KJs8w4Pg@mail.gmail.com>
Subject: Re: [PATCH 7/8] rtc: rework rtc_register_device() resource management
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Nov 27, 2020 at 10:16 AM Lee Jones <lee.jones@linaro.org> wrote:
>
>
>
> On Mon, 9 Nov 2020 at 16:34, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> rtc_register_device() is a managed interface but it doesn't use devres
>> by itself - instead it marks an rtc_device as "registered" and the devres
>> callback for devm_rtc_allocate_device() takes care of resource release.
>>
>> This doesn't correspond with the design behind devres where managed
>> structures should not be aware of being managed. The correct solution
>> here is to register a separate devres callback for unregistering the
>> device.
>>
>> While at it: rename rtc_register_device() to devm_rtc_register_device()
>> and add it to the list of managed interfaces in devres.rst. This way we
>> can avoid any potential confusion of driver developers who may expect
>> there to exist a corresponding unregister function.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  .../driver-api/driver-model/devres.rst        |  1 +
>>  arch/alpha/kernel/rtc.c                       |  2 +-
>>  drivers/mfd/menelaus.c                        |  2 +-
>
>
> This patch should have been sent to and Acked by MFD too.
>

Sorry Lee, I missed the fact that there were changes outside of
drivers/rtc/. Other than skipping the MFD maintainer - do you see
anything wrong in that bit?

Bartosz
