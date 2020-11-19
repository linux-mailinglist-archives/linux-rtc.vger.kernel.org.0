Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E742B9270
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 13:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbgKSMPt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 07:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgKSMPq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 07:15:46 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB80C0613CF
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 04:15:46 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id q3so5554638edr.12
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 04:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D5s9bbkRbansoqRWidTzLpWZYFdCdII2aFHWDapQgIg=;
        b=iotwngR15/MvNh34vaGg47omxkqq21H2TUiKi4CgNhJabPPQzTim91jykiEhpzXFuu
         KUZlAYLKwJshfDf9rAJbGOQ3kP7h4IvoPtXXOs9RZ/eHWmLOvQtS7vCb/+/WU7fvCQjj
         yCKWLigviRiG32h/mYRA7mSUEc41FToHkgjSakcknIoBFmUl+ZjFQt8OKSOQHPxXKcmw
         Mgl5QBO66jdIJhHD9VbgDtyPWyDoEvWRgw9dGvsmVSg5d0QMa8IMYuhobUSKYL6CdbUe
         MCZ/N4iuIw7N7MWJsesR6Fg1tyWkg1tUM3GC6zhslIF4SWT6hnaz/aCLgIsnDAzqqMO5
         7eLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D5s9bbkRbansoqRWidTzLpWZYFdCdII2aFHWDapQgIg=;
        b=ocS3pqwy2pE1COC3A/0MSsic+Cg9gWYy4aFMv3dITB5M8n/Tq3OilXRw0AysrPgg9N
         eVsM65U9WT8/i4IOt3ojgDrcpOez4q0EWUg0ZOTFlN0QQDwIiXiIkp+6YKL320OZ5LtQ
         frYDdj0UsrThniOtYBg2bMthanRZPqJh/FrbR0TXltKS8+aGLflIBOB8c4z3Nm3cJqRh
         UhjaCHWULj2gVnukqV+Q61slBfmH7o3kwRo3bHi3yVtfg/L6mCY+hsiKKHNMI5xHT0+2
         Zhsu3Ho1eZfkcV/a9hhl/+841kq+2YEiOPDgZzjB0rMxvHusK45mM0R2ATJXfoS42KWr
         XdrQ==
X-Gm-Message-State: AOAM5303IUF0ZAk36s9H7CfEJFRjUp2Khk16QYDeTxNRljNPBqmxp7Y9
        /8Z3URZdpOhdfrCz9OGt9CO9vbjOT7/vk6JUjl40Dw==
X-Google-Smtp-Source: ABdhPJwJ0rC+sNdIFhaYH3Qqb6/pUOvAf2unlOJzIyWzNwBln7z5oKUQIBP0mjIrJS3CKSzJtLcPIHjCEudLZBnHxY8=
X-Received: by 2002:a50:ab15:: with SMTP id s21mr30086261edc.88.1605788144878;
 Thu, 19 Nov 2020 04:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20201119114149.4117-1-brgl@bgdev.pl> <20201119114814.GA165507@piout.net>
In-Reply-To: <20201119114814.GA165507@piout.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 19 Nov 2020 13:15:33 +0100
Message-ID: <CAMpxmJXJd5CgRC9Dm7WfP06bffbmA0VNapkg1c8UBoGx19p6Pg@mail.gmail.com>
Subject: Re: [PATCH 00/59] rtc: remove all uses of devm_rtc_device_register()
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Nov 19, 2020 at 12:48 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 19/11/2020 12:40:50+0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > So we now have two functions whose names are easy to confuse. I spent some
> > time and simply converted all RTC drivers to using the preferred interface.
> >
> > Obviously these have only been compile-tested. I hope I didn't broke too
> > many drivers in the process. Most of the conversions was easy, sometime
> > it required removing unnecessary goto labels. There's also one patch
> > using a different devres helpers in here.
> >
>
> I'm not going to apply this series as this is not how I wanted to
> proceed (else this would have been done a while ago).
>

What's the plan then?

Bartosz
