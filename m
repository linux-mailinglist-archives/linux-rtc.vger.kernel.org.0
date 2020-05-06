Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6501C72AF
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 16:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgEFOU7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 10:20:59 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:43649 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgEFOU6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 May 2020 10:20:58 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N7zW7-1j16Z13mx1-014z6D; Wed, 06 May 2020 16:20:57 +0200
Received: by mail-qk1-f173.google.com with SMTP id f13so2080270qkh.2;
        Wed, 06 May 2020 07:20:56 -0700 (PDT)
X-Gm-Message-State: AGi0PuaFK71bYSa1gufG+QjdDPiYfBlm7+S53VcCoaPvswI424tQPZcp
        tLVf91fdjNA/5e9Bs8ecmz5tCNsiB8TnP17ZcgQ=
X-Google-Smtp-Source: APiQypKgaluquciflnBcztR1WN9teptLeSIWzng6zhGKuokJY8nJLdN0sgdbAFnBGd3XVoUkDA88FSzspEE+6sGwvLc=
X-Received: by 2002:a05:620a:3c5:: with SMTP id r5mr9076074qkm.138.1588774855617;
 Wed, 06 May 2020 07:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 6 May 2020 16:20:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
Message-ID: <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha: add a delay between RTC port write and read
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Sinan Kaya <okaya@codeaurora.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ODdZcuhx4O1OqlUVtvGTL+/T4HDL0HaWhlYX8QrlhAYTuPqcQen
 v3tE9VT698mp45ej1a5pC3uCKyhUPUrEqEiAsRXAd8kJdsiOI10q9KyrlRF3kbYKrZPlpOP
 /42VbPsVBD/3V0QcThzLG9y+uhHft/Yqiw2en80oIt5Bze5++4xIgNMAaKsqGBKeP1rfWnM
 KhBWlB1d67oBCY14BfGhQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BQMkoMeXna0=:+EkJRWs27VHfOCbmAdw+uW
 7EieW0z9uPcLy1V+z4cGJwACUycFb0iuEgfBSIa7H36SYKmDc6NSQb44ZvqbfDkd7oQEyUioW
 dSMVNmRVEJJ2hObCv/0UR5rDcZbQXsNqx8N+jcZUF9cQ9ODr0+Z144X9i32T+F7OR7KKWMNk7
 0zQNsYrzUQBe8RrfOTyQHxY++KvXo9ysSgUzhkCh3JBmPXmuDVAFVVI2htA25sgNBpDMLmPKp
 esrRq9A8dju6TAYxBESZQVyF5VUlFPWpVo2xTW06EI8UlzUv49LdFPW3aDxpygjWWNTtwNd/R
 QYAY1AbO3sNHOpB/2U44sw5/+DwexzgRh/dwmywdvU6p1+HrGKDikY34cCFJ6yhCsdH9nJGFy
 cOi+xmj59CeJkofreqn1DfVHCdnTQr5twI3gmgmdVhDBFqyaJF+UTiZxPaE0TL3YUhapQJhos
 6RC1I7/zG8m85kza48cu84XZKUU/Y03XNok7cIE0g24K5/XsWKnObiF+axxRhdsrlOiT9rZEx
 9UdAqC0XGKnEQmYLfhZLpR7+K/3ovS+5l7/E4fKfHgojhug3ksY+gBHSSp9qrwcCt7enJwdqb
 gqbO+5AoDhtrJVfrektjAnAG2T64i9F1trO3ROwFRsRNx2bdWfwMqybTTRF9hiC2ZmcUkrVDu
 zqfWB/9dmd56HlJeKRM4iCs8sEOPYfurqyYNzQIzXhPF98TKXcAA8HiTrtMh+yS7rA1OfL+/X
 KJ7AqYPvkIcYio5RlF5vp6H2p1mF8cL5P0ZIVXTv5xj/84VgtUNpM54zWK9L06kex40C7OPIO
 lgKvviJ4Sndf+AFoVRUMH4jFWf5Nifx4W9e0zgFxfnJe62XyzI=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, May 6, 2020 at 1:21 PM Mikulas Patocka <mpatocka@redhat.com> wrote:

>  /*
>   * The yet supported machines all access the RTC index register via
>   * an ISA port access but the way to access the date register differs ...
> + *
> + * The ISA bus on Alpha Avanti doesn't like back-to-back accesses,
> + * we need to add a small delay.
>   */
>  #define CMOS_READ(addr) ({ \
>  outb_p((addr),RTC_PORT(0)); \
> +udelay(2); \
>  inb_p(RTC_PORT(1)); \


The inb_p() / outb_p() functions are meant to already have a delay in them,
maybe we should just add it there for alpha?

     Arnd
