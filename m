Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64202145CD8
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 21:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgAVUFy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 15:05:54 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48572 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgAVUFy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Jan 2020 15:05:54 -0500
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1iuMG7-0003A3-Ud
        for linux-rtc@vger.kernel.org; Wed, 22 Jan 2020 20:05:52 +0000
Received: by mail-wm1-f69.google.com with SMTP id f25so23501wmb.1
        for <linux-rtc@vger.kernel.org>; Wed, 22 Jan 2020 12:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=187nGFfWxQLICvRQLlwuYMh2N7My5KAbadlcIaN54lY=;
        b=PEwV9LCm30AOAJx+2+0i8ZVIlQF87LlgxNrog6a55ZYUjW3Yqnc2cOA9JQ3RZ2zYNS
         PqIcLSSd8NxPe1qPlNAVR3UmEPrN7K5VsXAufUi4Zj6wDeDfxwbnezzrOwjb05QcXwb9
         eyKB92Zladm/qYu9L6bjQcfNwZ1V+WBrXXjNdsoBcmacxwTNxCRBdS+8KcpJ+YQ55/ub
         AeVoM1KrTygcYXNUYgj9QI4xmFvSIdRvP2MXbHKh97iBYy0T0/sAITzR303TCSYA/Kk9
         T4/IwVb8jIJbepPm+dE/CFIW9/WEFoPMQBGY1sPNCmqx/PILD0igd8IlrpAtZLu0D821
         BrcA==
X-Gm-Message-State: APjAAAWSptk8chHBD46/CtsqtAymoDs8mOu4MFVzHW6zwv71hB9JJ2+B
        3QuxhUOzX2gF13v7XDUqdbE6PS0aUoymX5agQ7wGNh8fishsV0kbQDg4EwGnuQsL9l3lhoGwJw9
        jKYbRC2rzWTG4q/t5JRqEzfRzb0vHq3Mnj1b436bvRPrIbDcKlh8m4Q==
X-Received: by 2002:a05:600c:2318:: with SMTP id 24mr13378wmo.48.1579723551555;
        Wed, 22 Jan 2020 12:05:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQthBPG61TEkm6xoIJJ/SM4qY/pe7B0c/jwtKJ4z3wD7PioSwUGNAqqZMv3h0hzbgMwcOPP19SL2w93sm7Hs8=
X-Received: by 2002:a05:600c:2318:: with SMTP id 24mr13353wmo.48.1579723551319;
 Wed, 22 Jan 2020 12:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
 <CAHD1Q_y2+DVPmqVLuSSqi6NQg8cTa2sbOWSQxGA_eqU6gQM5Bg@mail.gmail.com> <20200122195849.GS32742@smile.fi.intel.com>
In-Reply-To: <20200122195849.GS32742@smile.fi.intel.com>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Wed, 22 Jan 2020 17:05:15 -0300
Message-ID: <CAHD1Q_yjtJAd1KMGKD9Oh3BWSM4OzAA8TkBcs7r1ci4FZW+tQg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] rtc: cmos: Stop using shared IRQ
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jan 22, 2020 at 4:58 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> [...]
> > The only oddity here is about the scissors, I'm not sure how it is
> > supposed to work on git, but when I git am'ed the patch, the commit
> > message was only "As reported by Guilherme G. Piccoli:", everything
> > else was dropped.
>
> I didn't read any RFC or document about '--- ' line. But seems either bug in
> git-am, or I have to put something else at the beginning of those lines.
>

Interesting! What I usually do is to add comments
to-be-disregarded-on-merge right below "---", before the diff starts.
Git will discard this full block. I guess probably having the "---" on
top makes Git discard everything below it until the diff.
Anyway, hope your commit message don't get messed in the merge heh

Cheers,


Guilherme
