Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025471E1015
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2020 16:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390849AbgEYOHi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 May 2020 10:07:38 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:40481 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388862AbgEYOHi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 May 2020 10:07:38 -0400
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MGi6k-1jptCv2w9i-00Dooc; Mon, 25 May 2020 16:07:35 +0200
Received: by mail-qv1-f41.google.com with SMTP id dh1so8033443qvb.13;
        Mon, 25 May 2020 07:07:35 -0700 (PDT)
X-Gm-Message-State: AOAM532J7R3iKk2l0Cu2g9rkZhOV3ECPfI+WT+zALHVJCdq+YE9WoXin
        FWyvA4sytqxCypv8/2f+e+4H/uEv47FjAxZ5wkc=
X-Google-Smtp-Source: ABdhPJyJE3+5D2P2eciJfPhF3eNV6+3SzFqCA2OwcF7GMOHvyXVwO1X6SdtpNP3N46B8KyPN54jZOCyQb80WM1ktOZ0=
X-Received: by 2002:ad4:58cb:: with SMTP id dh11mr14710142qvb.211.1590415654361;
 Mon, 25 May 2020 07:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com>
 <alpine.LFD.2.21.2005100209340.487915@eddie.linux-mips.org>
 <alpine.LRH.2.02.2005101443290.15420@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005111320220.677301@eddie.linux-mips.org>
 <20200513144128.GA16995@mail.rc.ru> <alpine.LRH.2.02.2005220920020.20970@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005221344530.11126@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005230623410.22664@file01.intranet.prod.int.rdu2.redhat.com>
 <20200523151027.GA10128@mail.rc.ru> <alpine.LRH.2.02.2005231131480.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005231134590.10727@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LFD.2.21.2005241500230.21168@redsun52.ssa.fujisawa.hgst.com> <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2005250944210.26265@file01.intranet.prod.int.rdu2.redhat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 25 May 2020 16:07:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0GVNvM3Sjcujwc0ybfxSftE9PfFBuXdUm1imfpQHmyig@mail.gmail.com>
Message-ID: <CAK8P3a0GVNvM3Sjcujwc0ybfxSftE9PfFBuXdUm1imfpQHmyig@mail.gmail.com>
Subject: Re: [PATCH v5] alpha: fix memory barriers so that they conform to the specification
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     "Maciej W. Rozycki" <macro@wdc.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Richard Henderson <rth@twiddle.net>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:yY3Iu6AZLdWOVwErtfjjNokfQ/7jfdIFf2c/R7/3tyl0mwjS5bK
 J0CKROltOpPvjaouG+9rNOPftNaw9ejJF6UApBVhouFu02rUGrq/4P7V0bVIEHMXSWe1XsV
 mpZNVVO0sSwyTIL1E2s3QoZOOX/PZajW4YhhHILKJI9+gXJ/8rWYaUYwbB4fri3PUX/1Ar3
 C+sty/gI9H87tOqOyeNaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KUaNC1VtFiw=:3LHZYZ3epL/tt/J6uXBNFH
 52/T618ljKRc70kB6XtHj97TLNXAvq2TMecAYH9eEe0yVTf7rosyIz2JM2t25YJBMHLJcSp1s
 mdXA939NNEm0+blj9gOUwoCOWJGEh25S7cMgMEzsyd9aRgM7LzgKNo8yt+w67qd0jTTkn2w6q
 qi16logFk1HhZ/0hnN5nlQ4JiAgOljfIDDkcmeBzJsI+j/AblEHD2NAK/ZkWPw30p7eFp+krF
 N4YWpoGi9UFeaGqO7mr0RXbKv8ieWPpKvl7Lf1Yv8Ln2lklF84nL0Q/Tjnlwz5fvGuMeO0/c8
 MfCCE3aMa4JAh8FZteYm1h3ygfYo9vODzQAX0Q4s4nsZ4L0cLm2Wx8yDZqIVrs7MU14s+/o+6
 qBsFTLQW+I5ovQZnfzv6UZgUMY6QoLu5zQB8Tm6q4ENf+EF488c5lHCJ1fDyi7WMUfs2KBuP+
 EqR8qnLgAi5j6aCNCX/8F95XbWfKaF1Q8nnJEeuJM9Qg9aZEJhsRw3W6qRB2e3DMxStZTLxB1
 KE1PbAuPjYBlD82MYadq2E2gSQp3tDWlz9Pp/eR+HqTqvu9CHjX2oZh2NIKyB7XABOazkLOUd
 RGBID/9WmiBnrmQBV3QWv1LlstM3KVODMGxuBV2kNWN/RBPbkpa3Ne12vVxJWvu0tk1DlzaLB
 2Zpq4aaa6leIAtTVN2daF/gkCacF7dSb5pQEthIEEuYPR1f/nBRdexlZjDbvyNjIBAxJJxtk+
 QdfVSfSeBnjis1NIC83BCUlLQ5yaiKE4927g3HDm5uOETWXqk9FWpiq8PgyfR1y0fHZSdGaJ0
 LCgFY5ONjfBs6fMzSrKKkXP7PoN43hmTN/i/tWYblIhxNGbBLU=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, May 25, 2020 at 3:56 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> On Sun, 24 May 2020, Maciej W. Rozycki wrote:

> >
> > respectively, with corresponding out-of-line entry points available, so
> > that there is no extra inline code produced where the call to the relevant
> > MMIO accessor is going to end up with an actual function call, as this
> > would not help performance in any way and would expand code unnecessarily
> > at all call sites.
> >
> >  Therefore I suggest that your new `static inline' functions follow the
> > pattern, perhaps by grouping them with the corresponding ordinary accessor
> > functions in arch/alpha/include/asm/io.h within the relevant existing
> > #ifdef, and then by making them `extern inline' and providing out-of-line
> > implementations in arch/alpha/kernel/io.c, with the individual symbols
> > exported.  Within arch/alpha/kernel/io.c the compiler will still inline
> > code as it sees fit as it already does, e.g. `__raw_readq' might get
> > inlined in `readq' if it turns out cheaper than arranging for an actual
> > call, including all the stack frame preparation for `ra' preservation;
> > it's less likely with say `writeq' which probably always ends with a tail
> > call to `__raw_writeq' as no stack frame is required in that case.
> >
> >  That for the read accessors.
>
> I think that making the read*_relaxed functions extern inline just causes
> source code bloat with no practical gain - if we make them extern inline,
> we would need two implementations (one in the include file, the other in
> the C file) - and it is not good practice to duplicate code.
>
> The functions __raw_read* are already extern inline, so the compiler will
> inline/noinline them depending on the macros trivial_io_bw and
> trivial_io_lq - so we can just call them from read*_relaxed without
> repeating the extern inline pattern.

You could consider using the helpers in include/asm-generic/io.h
to provide some of the wrappers and only provide the ones that
don't fit in that scheme already.

       Arnd
