Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E886C4079B5
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Sep 2021 19:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhIKRGf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 11 Sep 2021 13:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbhIKRGf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 11 Sep 2021 13:06:35 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D15C061756
        for <linux-rtc@vger.kernel.org>; Sat, 11 Sep 2021 10:05:22 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id f2so8821649ljn.1
        for <linux-rtc@vger.kernel.org>; Sat, 11 Sep 2021 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nyaNa5jh7u4OrH4aT60jYwA/34rGKStvVyqkKWK4Gkg=;
        b=Xob4PFHNa8tZ1GDNjHJX5f6b7gNZu+EbwhD3b0fGvMBPIGOZr2rUsTbSEsh9InOUxs
         TTOYUWIuKPiD9z0fhWWjBnl+oUe6UI9fnZBkhfxTQ+zIYbjEjHhks9fQBPotpWyssRUB
         peWcciku5OOo5siPQRO5nFhOP853uQDyf3HiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nyaNa5jh7u4OrH4aT60jYwA/34rGKStvVyqkKWK4Gkg=;
        b=Vcbv1Z7MauArZsUcb+M/ZQ2Z7zgrXlDN7fpQxXD/vgf93CJdKIh9HckeNZOHVCHPfh
         m+MWwFOD8xawF+0jTaLx84R4CDaLttIBjWWbLyTXuOCmnCYXLFqJtWWZENxbl5RhbJoD
         XhK3BmXSWI8j9gDfbm7NEL3+j6rZCz++MYIeLwEyibfeAXCNvC6G7CIiF0N37w/fMrKy
         bzGwLKMTAiQp5+OD/CE6SETg6t457yzONj2KpnrlLr9zSZGUgjpaFDYRoIAua0GzFIRx
         nqtu3tkCnvMBUAmUedDLyruxTSJVnqYgse7VGqQhj+ab7Py68iVU8sONZWnD3EKdQPOj
         tGnQ==
X-Gm-Message-State: AOAM532Oah96OUkcU6pBTCSscE7UQ8dJOizshtudB2aKrBw3XG2jNJ0p
        ziP4ZlBAvuSm2ki5e2LPf1aWu5SbR1TIQhMJbos=
X-Google-Smtp-Source: ABdhPJzHgfo97RVGwYt7Ky+/t/OIKurpNoPGTSBYC3arXb0OjY0fCplS9piU6CL+0daalcN7fPYVaw==
X-Received: by 2002:a05:651c:1683:: with SMTP id bd3mr2895223ljb.323.1631379920180;
        Sat, 11 Sep 2021 10:05:20 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id g10sm255750lfb.87.2021.09.11.10.05.19
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Sep 2021 10:05:19 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id q21so8807420ljj.6
        for <linux-rtc@vger.kernel.org>; Sat, 11 Sep 2021 10:05:19 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr2798909ljg.31.1631379918659;
 Sat, 11 Sep 2021 10:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <YTzSVk5Scx/nRP7K@piout.net>
In-Reply-To: <YTzSVk5Scx/nRP7K@piout.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 11 Sep 2021 10:05:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPJrMhr1_62O2xwD1QbT9oxJJ_uXw2mm6sa0hNDrFuwQ@mail.gmail.com>
Message-ID: <CAHk-=wgPJrMhr1_62O2xwD1QbT9oxJJ_uXw2mm6sa0hNDrFuwQ@mail.gmail.com>
Subject: Re: [GIT PULL] RTC changes for 5.15
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, Sep 11, 2021 at 8:59 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> The broken down time conversion is similar to what is done
> in the time subsystem since v5.14.

By "similar" you mean "identical", no?

Why is the rtc subsystem not just using the generic time64_to_tm()?

Yes, yes, I realize that due to historical mistakes, there's a
duplicate 'struct rtc_time' struct, but it turns out that that is
_identical_ to 'struct tm' except it also has a 'int tm_isdst' at the
end.

So you could literally make a union of the two, pass the 'struct tm'
part down to the generic code, and just do

     rtc_tm->tm_isdst = 0;

at the end.

Rather than have a duplicate copy of that admittedly clever Neri and
Schneider algorithm.

Hmm?

             Linus
