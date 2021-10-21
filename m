Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE94A436B79
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Oct 2021 21:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhJUTvU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Oct 2021 15:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJUTvU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Oct 2021 15:51:20 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFD3C061764
        for <linux-rtc@vger.kernel.org>; Thu, 21 Oct 2021 12:49:04 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id f3so3426240uap.6
        for <linux-rtc@vger.kernel.org>; Thu, 21 Oct 2021 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=506SnosJu2/k7veB5Auol9VGHyPyzo6ab/OrxVZJdFc=;
        b=JZeRQvhOimryHQTO0F1yK8ihzbC/IVWHgTOcrfhaJ1QgKmHtIb9FPtaoXxJXzLCepk
         0pc0gLbmtclOHyfWODXsmlN0T/zcv+5Bid66yCjZR28gKB4+ecuHtN+zZYfLpiQuJypb
         9snbIJAmr2/89bUHVp+jINBxclOHw0uCjGV8hXoYu/MEazJ7bOsVUAMnALH5OlFviYEx
         EOgXtMlWXrRf4q/CdZB4mSS9IOTXNfbvKgn4RNtkCrTX8r0IIt9fPmtZ49UhMB5w6LZj
         wo2Nh0mBp0rHAznuCL6fMlVRUFPWy3vlVYZHk5I9FPTPwZKWbwjYfB5VzZTdfTfXiEi9
         X1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=506SnosJu2/k7veB5Auol9VGHyPyzo6ab/OrxVZJdFc=;
        b=NdrB1f9aFFxLI1DET1IKH5XbCRjnCBnQaVNqpaLC5GKvceVQW06UiHBjlNDfr1+F4Y
         0siY4/xpkpVC0YxAAlKgqqUX15INSA53fexJBzpAbMuky/mZdJsLDstE9CzXpw5t1Svw
         kUkbGe7Qz1cdFigvrkiVsYqReZBLDK8znD8hEvFAfh3UN+vm4biKgq4tTj4uZVi/+W5J
         LhW0m6U/4dsKko40UOahnOODue9xR3dHoWYkl1R3gK+QdMt+4zQQAiaBpHMBjzxOwKMj
         szsowTb/8fKYJnbutUHVpo86LP6QPFzNClYrgmm1kvd8sRBO5TC1AAh7zasyFEZ7beqB
         FQ0Q==
X-Gm-Message-State: AOAM532wzYq6cg3MZUJp8dVXwddUPwyU/5HdE2mcZc7D8t9CKmLA0hGY
        GsV5ymdjTvdl7/oKg+5x74Jxtf+VqC6OFFOn9Rg7nw==
X-Google-Smtp-Source: ABdhPJz4I5Z/WBFSBkX6/q4/uVeYKIfIu9yEzNWeEn5ErrVs1m/Y7PwD0YcrX1Lkqqjdhm5YITQcRIqFFsa0Oxa4pTw=
X-Received: by 2002:a67:d91b:: with SMTP id t27mr9275555vsj.55.1634845743358;
 Thu, 21 Oct 2021 12:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org> <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
 <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com> <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
 <YW8E6oeIoRdpmPL8@piout.net> <CAPLW+4k26qZDug4JkuPaM_gZMgz8LPg7GHe-5C7zKzEGtzdp=g@mail.gmail.com>
 <effeb83b-7923-7086-5b4f-36266015e137@canonical.com>
In-Reply-To: <effeb83b-7923-7086-5b4f-36266015e137@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 21 Oct 2021 22:48:51 +0300
Message-ID: <CAPLW+4=RuoT016zHotKvrNNxB_bZt4VXhZRWkGuJs22XeOpcpA@mail.gmail.com>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 20 Oct 2021 at 09:29, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 19/10/2021 21:12, Sam Protsenko wrote:
> > Krzysztof, do you have by chance the doc for different SoCs supported
> > by S3C RTC driver? I can implement proper values for min/max range for
> > each SoC, as Alexandre asked, by adding those to driver data. But I
> > need max year register value (100, 1000, etc) for each of those chips:
> >
> >   - "samsung,s3c2410-rtc"
> >   - "samsung,s3c2416-rtc"
> >   - "samsung,s3c2443-rtc"
> >   - "samsung,s3c6410-rtc"
> >   - "samsung,exynos3250-rtc"
> >
> > For example Exynos850 TRM states that BCDYEAR register has [11:0] bits
> > for holding the year value in BCD format, so it's 10^(12/4)=1000 years
> > max.
> >
>
> I think all S3C chips have only 8-bit wide year, so 2000-2099, while
> S5Pv210 and Exynos has 12-bit (1000 years). However I doubt there is big
> benefit of supporting more than 2100. :) If you still want, you would
> need to create the patch carefully because not many people can test it...
>

Guys,

After testing thoroughly, I can confirm that Alexandre is right about
leap years (Exynos850 RTC treats both 2000 and 2100 as leap years).
And it also overflows internally on 2159 year, limiting the actual
time range at 160 years. So I'll keep that range at 100 years for all
RTCs. As Krzysztof said, there is no practical reasons in trying to
increase it anyway. Will send v2 soon.

What I'm curious about is RTC testing. I've found this test suite:

    tools/testing/selftests/rtc/rtctest.c

But it doesn't seem to cover corner cases (like checking leap years,
which was discussed here). Just a thought: maybe it should be added
there, so everyone can benefit from that? For example, I know that in
Linaro we are running LKFT tests for different boards, so that might
theoretically reveal some bugs. Though I understand possible
implications: we probably don't know which ranges are supported in
driver that's being tested. Anyway, just saying.

>
> Best regards,
> Krzysztof
