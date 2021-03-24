Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00193347345
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Mar 2021 09:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236055AbhCXIUL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Mar 2021 04:20:11 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:45821 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236052AbhCXIUK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Mar 2021 04:20:10 -0400
Received: by mail-vs1-f41.google.com with SMTP id 124so10890133vsg.12;
        Wed, 24 Mar 2021 01:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b99vyQcaCpQD3pMXQougjwNkTLQcQ7H7qW0vVRZg68k=;
        b=aJEHB6tfRRbMSsc6eWDmNQPjwEa5QQBZxqYg2zBEhniG7TJ+Fc5gDViUwai+DBLUTz
         paTBJF+FNaa3YnWk+KPYlaHejZUiWnVlS7V3P0WpjSD7G1cwsusD9LFzZD0/OiqsO3/E
         TXrTRHLeI558ifwSwjBFRXRXReg/Abs/ftqgtjE5lEz5ciH9LJV+BW654d6qhh7wLc3q
         PTBIziRnd1mUSfHLi/piVP3QjVeq+7mEX94YqXUDnwrlXMi3ycHj51wflKqUgbOjQJ/K
         GB+QnhiYlZ1wi8tURcgJ+slFVFuQaYti7U6QrTkqPGSqzXVKPB8ka5SbXNrK8VdT9O8A
         xBSw==
X-Gm-Message-State: AOAM532wW9DZLgSRIOt4yqSl6D+fAFU2zkmxue3KqqQk//3frn134ExA
        +tKAREL/Plmkvb0CbumcaAbTInyjKo3QpDXpxmc=
X-Google-Smtp-Source: ABdhPJyjNSyRygty85egDfQ+7ndwN29LWZNv+wRv4AgkR+qa6UdFybjZKqvGwrDgePDt/lvLzh/gWVwzhx66YKHThC4=
X-Received: by 2002:a67:8883:: with SMTP id k125mr950544vsd.18.1616574009774;
 Wed, 24 Mar 2021 01:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210323091257.90054-1-heying24@huawei.com> <YFppJkpZRHMJFay0@piout.net>
In-Reply-To: <YFppJkpZRHMJFay0@piout.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Mar 2021 09:19:58 +0100
Message-ID: <CAMuHMdWfFtJOQQf0b-2QJRd1EMLSW7rDsjNYzjjZhg6=JNZ0AA@mail.gmail.com>
Subject: Re: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     He Ying <heying24@huawei.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michal Suchanek <msuchanek@suse.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        kernelfans@gmail.com, frederic@kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

On Tue, Mar 23, 2021 at 11:18 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 23/03/2021 05:12:57-0400, He Ying wrote:
> > We found these warnings in arch/powerpc/kernel/time.c as follows:
> > warning: symbol 'decrementer_max' was not declared. Should it be static?
> > warning: symbol 'rtc_lock' was not declared. Should it be static?
> > warning: symbol 'dtl_consumer' was not declared. Should it be static?
> >
> > Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
> > Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
> > avoid the conflict with the variable in powerpc asm/time.h.
> > Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
> > is declared there.
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: He Ying <heying24@huawei.com>
> > ---
> > v2:
> > - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
> >   rtc_lock in powerpc asm/time.h.
> >
>
> V1 was actually the correct thing to do. rtc_lock is there exactly
> because chrp and maple are using mc146818 compatible RTCs. This is then
> useful because then drivers/char/nvram.c is enabled. The proper fix
> would be to scrap all of that and use rtc-cmos for those platforms as
> this drives the RTC properly and exposes the NVRAM for the mc146818.
>
> Or at least, if there are no users for the char/nvram driver on those
> two platforms, remove the spinlock and stop enabling CONFIG_NVRAM or
> more likely rename the symbol as it seems to be abused by both chrp and
> powermac.

IIRC, on CHRP LongTrail, NVRAM was inherited from CHRP's Mac ancestry,
not from CHRP's PC ancestry, and thus NVRAM is not the one in the
mc146818-compatible RTC.

http://users.telenet.be/geertu/Linux/PPC/DeviceTree.html confirms that,
showing that nvram is a different device node than rtc.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
