Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369432131F6
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jul 2020 05:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgGCDBH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Jul 2020 23:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGCDBH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Jul 2020 23:01:07 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FE7C08C5C1
        for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2020 20:01:07 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id k23so31018674iom.10
        for <linux-rtc@vger.kernel.org>; Thu, 02 Jul 2020 20:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pIDnx8Dk7r3rcOJyS+imkzfgJ3jBfI35zwpUG232WeE=;
        b=ptulI2RxzblTpOwjhpRinC+gFu8Wf4sPNe2X2DVmRheb8NSYGbKyFALem3otiuN/wg
         RBTTMDEi17gmaKjJ7sc6e28+cLgZGglbhavtOQlCkdiGUnCm4/M12qq6AnxNw8JELAs/
         E8ldz9iWuPZIwa1s6FwYsNEo7evK8If83I5uCCP/y10Q7pC0/SO7prwBHpDNcy9Ey/1C
         lUrIBGYlsrgjm/HV2HJMboogAcjhcEABsXjQ8R29KQnWWrZR4cDq5+Jct8apv8glRCiW
         st5Io6qfELNJld6ZEK4+p9UAx02PASlBd0J/kNwKoiS+LfiErDNHy9gQUyBG7Jd6AL2u
         9FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIDnx8Dk7r3rcOJyS+imkzfgJ3jBfI35zwpUG232WeE=;
        b=K5N/jcGKaFn+SgDDwQifpfhV2ApMkIx01rruK3kFZ23eb31f0fEGBnJcDuxCAcBD+Z
         T15KBwLNqtQW6LyqLf0nCw3qpf68q1O3lW1q/akeoXJoMxxLVpRkmDGiGy5GzLHD4CUS
         H0j/kGQ/HniFhGzfHAyYp/VqfDlGfpzcE3qfonRgqnvtckQs3wi81bMRsNWvC7wo5SL7
         QSvm52/AbN33frwltPi3zRwDFLgW+rWPFWFquQjiAEwGIvKhw/NANDIxj94944aNGflE
         7Dzi0iQ3lFuf/E0h9rFJdHYQqkwpb8DBTSNG8oZHVpj2x8e3a8cswCDRJ7TTWXNdYrz/
         ADmQ==
X-Gm-Message-State: AOAM533t3Wjx5NJkdYFBbGFjWyqxMq2GMKbUX0kahLO9P5LZAyBlY/k/
        8q+u5rLuPBNrFvxC6wToTGe/P3zTwAhFnqXQmrw=
X-Google-Smtp-Source: ABdhPJzhqxJ1/ZP89lNvS3ZvWtWLuUdXGJSnINiEndq9Jdux857o9TBzyZpJNhU3qG31xVdG3xuAhYvE3b92eqzj8sc=
X-Received: by 2002:a05:6638:2649:: with SMTP id n9mr603370jat.126.1593745265973;
 Thu, 02 Jul 2020 20:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <1592654683-31314-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1592654683-31314-1-git-send-email-chenhc@lemote.com>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Fri, 3 Jul 2020 11:00:54 +0800
Message-ID: <CAAhV-H4iaAdxQD8GYYAZAusS+-dD6APy=jUMXm0QpdOXNS_N_Q@mail.gmail.com>
Subject: Re: [PATCH] rtc: goldfish: Enable interrupt in set_alarm() when necessary
To:     Miodrag Dinic <miodrag.dinic@mips.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Ping?

On Sat, Jun 20, 2020 at 8:03 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> When use goldfish rtc, the "hwclock" command fails with "select() to
> /dev/rtc to wait for clock tick timed out". This is because "hwclock"
> need the set_alarm() hook to enable interrupt when alrm->enabled is
> true. This operation is missing in goldfish rtc (but other rtc drivers,
> such as cmos rtc, enable interrupt here), so add it.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  drivers/rtc/rtc-goldfish.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/rtc/rtc-goldfish.c b/drivers/rtc/rtc-goldfish.c
> index 1a3420e..d5083b0 100644
> --- a/drivers/rtc/rtc-goldfish.c
> +++ b/drivers/rtc/rtc-goldfish.c
> @@ -73,6 +73,7 @@ static int goldfish_rtc_set_alarm(struct device *dev,
>                 rtc_alarm64 = rtc_tm_to_time64(&alrm->time) * NSEC_PER_SEC;
>                 writel((rtc_alarm64 >> 32), base + TIMER_ALARM_HIGH);
>                 writel(rtc_alarm64, base + TIMER_ALARM_LOW);
> +               writel(1, base + TIMER_IRQ_ENABLED);
>         } else {
>                 /*
>                  * if this function was called with enabled=0
> --
> 2.7.0
>
