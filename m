Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DAF433C69
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 18:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234343AbhJSQhw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 12:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhJSQhv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 12:37:51 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F05C06161C
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 09:35:38 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id ba39so9627023vkb.11
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hcpunpJfD02BVk7gvPKYSvVCpndtXyJiwVOsvlKcqZI=;
        b=BdQ2OzL6SWeWZ9lnMcxZWN5DaQ/d8jf2h45OJs9cH+GlYlrjJIzPQv/DepQEx0AVuv
         GWiTPlZoXqr7Cy5NtlV+3wWBgyR+jVTfzAaFvSmKS8dWGevDt7UhY+6L0iEorvlsoL5J
         1P+ObMZy40jiLfXR1cMZS5RKUUsOUcevGJNt1CczAFeX2ABB7TVvmfrByhRVJQYdP4ww
         po/itndSylNqIpsco0VtIYqycpaCG0ykS21mfQb1sIzwGhUMUin7+QPSc4XvP2qjOvuF
         drZXawwJ2H2xmZBU7yxOYB+Z1GROv1vQOl0WCCjGw20ACo8d0nKaUqK1TGVhF0EKUnXu
         Mfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hcpunpJfD02BVk7gvPKYSvVCpndtXyJiwVOsvlKcqZI=;
        b=n6CDzyQHz2hYi5u/+Tfu1mcij0vrFo71O+fPCcAj0dDLbjFNU2m2rhFNQRH0/MT5y5
         tIY1TZNwrTuyDf2pUfzmekq1j02jnT0LqQxSqSJrkY1qzBDlf1eX6R8Zaq4Wbm1x2Onv
         phAnQWPvkX5e2qOxURjksyCTGAPsynRjBZfUcwrafJFHMth/Z+0MHRz2rUx+zpxk3K8B
         ykFDQ3ZUj2ky20Ns4FiVTlWsuWRWEGZ37rFi5UYac2x33mOHcoHemBwrZWh9s5jGFR+w
         BiwmK54708vRiJvPeduW3VVIvU8C2j/J4gtELtQCyfh8ZBOfJicUL9Lq3JhfGdyskyhJ
         axjQ==
X-Gm-Message-State: AOAM531QDaIOcW445iIUdTkk0VrbSIim0AJ51jE3HuXcuX95IS2lJTDh
        OMhPP0I1JWNeHBXbK1CD6IQZYtKjILoAO/WPAm5vlg==
X-Google-Smtp-Source: ABdhPJxiZkNnPp8L2tDYceQO0IZ4U2Vv1yzsBlHqRJNbQZbT3vX8Ww0HOFEE3jsk6TcubludTT/ovXMLWY9QcgDhjJM=
X-Received: by 2002:a1f:f241:: with SMTP id q62mr13676041vkh.12.1634661338139;
 Tue, 19 Oct 2021 09:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org> <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
 <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
In-Reply-To: <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 19 Oct 2021 19:35:26 +0300
Message-ID: <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 19 Oct 2021 at 19:22, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 19/10/2021 18:17, Krzysztof Kozlowski wrote:
> > On 19/10/2021 15:17, Sam Protsenko wrote:
> >> This RTC driver only accepts dates from 2000 to 2099 year. It starts
> >> counting from 2000 to avoid Y2K problem,
> >
> > 1. Where is the minimum (2000) year set in the RTC driver?
>
> Ah, indeed. I found it now in the driver.
>
> >
> >> and S3C RTC only supports 100
> >
> > On some of the devices 100, on some 1000, therefore, no. This does not
> > look correct.
>
> That part of sentence is still incorrect, but change itself makes sense.
> Driver does not support <2000.
>

Driver itself does not allow setting year >= 2100:

<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
    if (year < 0 || year >= 100) {
        dev_err(dev, "rtc only supports 100 years\n");
        return -EINVAL;
    }
<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>

Devices might allow it, so the commit message phrasing is incorrect
and should be replaced, yes. But the code should be correct. Should I
send v2 with fixed commit message?

> Best regards,
> Krzysztof
