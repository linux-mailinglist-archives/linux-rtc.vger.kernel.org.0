Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8C0DF414
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 19:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfJURU1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 13:20:27 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:45667 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfJURUX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 13:20:23 -0400
Received: by mail-qt1-f193.google.com with SMTP id c21so22136579qtj.12
        for <linux-rtc@vger.kernel.org>; Mon, 21 Oct 2019 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+Q0g4cWBSCHSC+Ozo2/kutzUkLzjJxIG298R3fZU7c=;
        b=XXi0FSGZgO+h0gcJPglCZdCdti7BxqJBrErIQES23s8EEgu+CNrK3sGDOUaOQN0aHn
         NL2x/JrK4qROiRGz9V04fD2pKog2nYUwqoj3iP+1WDutyIv8PKZoSc1/u5mNoK+tgQYn
         qjyHDczVIfJaUeErNMvYAYXAJzK9DiQe2CPIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+Q0g4cWBSCHSC+Ozo2/kutzUkLzjJxIG298R3fZU7c=;
        b=t8LYrjJX75Jk9cFLtltRgnuOQe7jN2B2O1nyyyv/ul//lqhaOU0owKFwRvEYUG1en1
         4bPfFZ4xknvC5st8hfRQoBT6zZa9IYl/6RDJFqNWDb1hy9m3yI3wvZplL3V5z4unYvgs
         HMOChBWoi7Va4U519sD2Yja2RX/Z4ZTwIjISBUR/fR7ujNm1yzRpcbwuMLfpJLr6WjzZ
         DsAljfnqs4hb2shRRhE1a4azczecpkJ8ZnX3+qWYLMRJaid4w1/w1ZJF3pAwrT5YLnzP
         mtYhgKZErleXdJovKJm6ZRQlYC/v2S49ombYyZBjzJ5MTIzGoF1DID6xirvMH2Z1Aj+p
         vkiQ==
X-Gm-Message-State: APjAAAVReVctptRGsSZSETz7Bdwq9683dVp8GeEkbWQK/fzFHMOKiw3b
        3PRvLDOAz/hP5tlMW32ULIMuJRNtEco=
X-Google-Smtp-Source: APXvYqwqGFxbQwS0HyhE0koDtqKFp4wmcQBFZITiZgvzYFERkd5nyR2Yg1IZK4AFV54RTgs7J1lhLQ==
X-Received: by 2002:ac8:27b7:: with SMTP id w52mr25764075qtw.78.1571678421936;
        Mon, 21 Oct 2019 10:20:21 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id x13sm7244391qki.9.2019.10.21.10.20.20
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 10:20:20 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id 71so9507194qkl.0
        for <linux-rtc@vger.kernel.org>; Mon, 21 Oct 2019 10:20:20 -0700 (PDT)
X-Received: by 2002:a37:9c0f:: with SMTP id f15mr23614988qke.62.1571678419798;
 Mon, 21 Oct 2019 10:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180521164222.149896-1-briannorris@chromium.org> <20191021161113.GZ3125@piout.net>
In-Reply-To: <20191021161113.GZ3125@piout.net>
From:   Brian Norris <briannorris@chromium.org>
Date:   Mon, 21 Oct 2019 10:20:08 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOXSKoRcuRWZ1FGNcioFKSiazXGxOvMv5=px_pn46vJbw@mail.gmail.com>
Message-ID: <CA+ASDXOXSKoRcuRWZ1FGNcioFKSiazXGxOvMv5=px_pn46vJbw@mail.gmail.com>
Subject: Re: [PATCH] rtc: report time-retrieval errors when updating alarm
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre!

On Mon, Oct 21, 2019 at 9:11 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 21/05/2018 09:42:22-0700, Brian Norris wrote:
> > __rtc_read_time() can fail (e.g., if the RTC uses an unreliable medium).
> > When it does, we don't report the error, but instead calculate a
> > 1-second alarm based on the potentially-garbage 'tm' (in practice,
> > __rtc_read_time() zeroes out the time first, so it's likely to still be
> > all 0).
> >
> > Let's propagate the error instead.
> >
>
> I submitted
> https://lore.kernel.org/linux-rtc/20191021155631.3342-2-alexandre.belloni@bootlin.com/T/#u
> to solve this after looking at all the implication checking the return
> value of __rtc_read_time had.

Only about a year and a half late, nice! Fortunately we have a decent
(albeit time-consuming) process for rebasing our downstream patches in
Chrome OS kernels...

Brian
