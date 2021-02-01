Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C810630B065
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Feb 2021 20:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhBATd0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 1 Feb 2021 14:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhBATdX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 1 Feb 2021 14:33:23 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031ECC06174A
        for <linux-rtc@vger.kernel.org>; Mon,  1 Feb 2021 11:32:42 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id u25so24395700lfc.2
        for <linux-rtc@vger.kernel.org>; Mon, 01 Feb 2021 11:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwv3A3bSAAqY2wCAqqrB5nV+HQVHfwBw6+UsuhpSUq8=;
        b=G5S/Dgal7HfdGnSG6SXEgiDdPQZpL7d6sxZU5vSTKcrz5SG3Vkd1+T8LCywp7pDMQQ
         mB4bD3LmgpPCneKJZmgvxxUqZH3E07tAUqXpmaC9yo4ArxGnnCAs6hXbgpHnHMxPlmzG
         4Cram0LsRP+Czba7W0OFxbOwKKpvGrBkOeOiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwv3A3bSAAqY2wCAqqrB5nV+HQVHfwBw6+UsuhpSUq8=;
        b=ajHj4MeCqCOerOkZlZtRSN+Bu4/H+TfCT0o9fS8m4sa31iEwqwrW2rvQNAWeXGuYTt
         TvCyCPzE3bQum2ztimBWDCT7Gs9I/PSkGazLWc/3WLC8YDkeOgE+I2YEXI09Py56QmQF
         VfApdo6w0Z25wudGKSaewgwi5MqLdOOyBiIVFzvS6jp1fmw+sAV0/MLPqHZnN1Ecye95
         EOgZOabZD7wehShOM8Z2aXALzK2yhPBn9jq9ewJlBDlr7TSInD575ySwt4k4G79qqKbH
         AmfIkdUDVnxGIdznmDifnDAPXM12EGmT5WX3dZEMifiXYVO3+M77xgxflwFgMpyCnuD6
         1UQg==
X-Gm-Message-State: AOAM533KZ044z9EKGnYED0EZOjicG5AihTwQO9v5xSEq0+TFlq4pJVg7
        KSlIaaNbhacphs3QR0lJj8BUgun6vig59A==
X-Google-Smtp-Source: ABdhPJy7RSgjZd+9ttlO6QXHv9sdbDZfynKMbGrNtJnM+vzy/xqklJh98kwNzSURYGbT2b+A/LeY2w==
X-Received: by 2002:a05:6512:34ce:: with SMTP id w14mr6140828lfr.553.1612207961209;
        Mon, 01 Feb 2021 11:32:41 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id n16sm3060946lfq.301.2021.02.01.11.32.38
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 11:32:40 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id q8so24420125lfm.10
        for <linux-rtc@vger.kernel.org>; Mon, 01 Feb 2021 11:32:38 -0800 (PST)
X-Received: by 2002:a19:8186:: with SMTP id c128mr3292880lfd.377.1612207958309;
 Mon, 01 Feb 2021 11:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20201206214613.444124194@linutronix.de> <20201206220541.594826678@linutronix.de>
 <19a7753c-c492-42e4-241a-8a052b32bb63@digikod.net> <871re7hlsg.fsf@nanos.tec.linutronix.de>
 <98cb59e8-ecb4-e29d-0b8f-73683ef2bee7@digikod.net> <87y2gfg18p.fsf@nanos.tec.linutronix.de>
 <87tur3fx7w.fsf@nanos.tec.linutronix.de> <ghft2hwevu.fsf@gouders.net>
 <877dnrc2sv.fsf@depni.sinp.msu.ru> <8735yfd2q4.fsf@nanos.tec.linutronix.de> <87zh0nbnha.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87zh0nbnha.fsf@nanos.tec.linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 1 Feb 2021 11:32:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg_-_FP+B6ePabvj55_ok1YbYCsGHzYsZ064FpE4RqkTQ@mail.gmail.com>
Message-ID: <CAHk-=wg_-_FP+B6ePabvj55_ok1YbYCsGHzYsZ064FpE4RqkTQ@mail.gmail.com>
Subject: Re: [PATCH V2] rtc: mc146818: Dont test for bit 0-5 in Register D
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Serge Belyshev <belyshev@depni.sinp.msu.ru>,
        Dirk Gouders <dirk@gouders.net>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        John Stultz <john.stultz@linaro.org>,
        Prarit Bhargava <prarit@redhat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Feb 1, 2021 at 11:24 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> While it cures the problem on the reporters machine it breaks machines
> with Intel chipsets which use bit 0-5 of the D register. So check only
> for bit 6 being 0 which is the case on these Intel machines as well.

This looks fine, but it might also be worth it simply just checking
for the only really special value: 0xff, and going "ok, that looks
like missing hardware".

That's what a few other drivers historically do in their probing
routines, so it's not unheard of (ie you can find drivers doing that
kind of

        /* If we read 0xff from the LSR, there is no UART here. */
        if (inb(.. port ..) == 0xff)

in their init routines.

Not a big deal either way, I just think it would be more in like with
what other places do in similar situations

      Linus
