Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87600E2B2F
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2019 09:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408629AbfJXHcy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Oct 2019 03:32:54 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37333 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404582AbfJXHcy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Oct 2019 03:32:54 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MC2k1-1iHoRV3KKT-00CNHc; Thu, 24 Oct 2019 09:32:53 +0200
Received: by mail-qt1-f169.google.com with SMTP id o49so28651062qta.7;
        Thu, 24 Oct 2019 00:32:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWGINaDe8ol/UwyTv9HgKMFja1GIduS6vsReq+qnlVD+/WVKLhW
        GuCBDKj+V4k+iQH+eRuaieaFX7hDZ19QHNEReX8=
X-Google-Smtp-Source: APXvYqx1cA8lBd//hr4TKLK7AQtBX96tkofnWY9zBPmAYj1KZ565pVhrlW2ugtviYRug2qZGIpWMC0k0qlMq7Tgu76s=
X-Received: by 2002:ac8:6956:: with SMTP id n22mr2674085qtr.7.1571902371561;
 Thu, 24 Oct 2019 00:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191023150311.844123-1-arnd@arndb.de> <20191023184616.GA17078@agluck-desk2.amr.corp.intel.com>
 <20191023200135.GT3125@piout.net> <3908561D78D1C84285E8C5FCA982C28F7F4AD7F7@ORSMSX115.amr.corp.intel.com>
 <20191023232004.GV3125@piout.net>
In-Reply-To: <20191023232004.GV3125@piout.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 24 Oct 2019 09:32:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2=9dw2YN-sc7yxwwnRi-6Bos32==523qPaqW=avLs60Q@mail.gmail.com>
Message-ID: <CAK8P3a2=9dw2YN-sc7yxwwnRi-6Bos32==523qPaqW=avLs60Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "Luck, Tony" <tony.luck@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "Yu, Fenghua" <fenghua.yu@intel.com>,
        Stephane Eranian <eranian@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4eXsFs4CIvbbc7uKuyIn8zaZjVfgTi4fUEVkFFVzJhTl+N9P8w8
 H6zNpanw4PjjxXbPT5TskFJYr4EFNBR7LtkjZ9W9I4dhzg7Okh4vq6Q18OBmgng/NMLbCSt
 HAIRs0EiSZYefTW1i5BX6mkBHgfbnbBRY8BARYI58bvnaTUK0oRTkCZ8ue8AtXex6BKn56y
 uDWWp4T49PKfF57+KezoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KbBrZDxhHZs=:lPmtFM8GM8bl1A1w51t65C
 Uc+Cxlzn6+BGbsZf2DXfxe3FGASK3VVeRB4IRrGD/IY/Lt2vq7EdlVIpBB4ZSCAhHGKIphBq/
 Moqvx7mm5Bj+YcnIUZBjVEGR/wU85ceXAoo9R9nq5x18QGxoSrv4EM7KzA9L/jFyMUBMoA7+h
 +pcjO23sw43psO0pZx64P1554BYcrn1oTzUp+m78vPosWtAxzWchSSTNsU2w7I26+A/v5hhar
 DyrsOsCqEvAWb/Z1twEtMaSkwzROZ7gQ4qAJDNeJ8BVMLejtqaOFLK7y+FcII7ymLTT5sCjiZ
 fC75qLwKxK+w5UszLgQzSikKo01BEUJnOxR8fyl0xBRZEXg3nFYVWY80X8VRG+E7vK8YERcHC
 5nvmb40sMec08i/HFdMWtcqjmOBBnyu9qGhI8PmTbaKYhj+276y544np9m1SkArnBYaLfUWp0
 LW2fQaI+LExIz+5M9D0o0CKUcJ8TzCHK4pDJI79j0bCtnTxobjtUXbxzcR5OQ0+1ZAYRAK1vR
 a8WjKG3DTsmmPDpAKqdZgM2gAp9iy6/jLGS0luW87XBvkL79CBJJayJT/4d3Yl4Ad5nUiOQ9C
 RjqDuAxh7/7IvRHv2Mv0hCWIhR4OuJeFpHDMhzkvX7Q1tWDzmLowm7H6JHe//o25NEW2/YUm9
 ZJ367aveqldjWA8tby7WQGkmbeEJK3K2RA/R3MrxPAFOn7enC1nkXR+sQ/VQv120H+QuU1weA
 gfRRqX+VS/FJnFYY11NTjMS08teMMU7XrBHtkl+K+OjlkmUphoYBrL7f1vbwxxyacaQ2RvSDx
 8zDOLZEsilojlfH3sdOIOIbmU4ghgmkck6qozkuFRUysD9SjrYysBXvgYgy6+dDfZP/Wb0162
 p//VsAppEmHrByIc7CDA==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Oct 24, 2019 at 1:20 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 23/10/2019 21:30:29+0000, Luck, Tony wrote:
> > >> rtc-efi rtc-efi: setting system clock to 2019-10-23T18:30:23 UTC (1571855423)
> >
> > > You can remove CONFIG_RTC_HCTOSYS, this line will disappear, systemd
> > > will not like that but efirtc was not setting the system time anyway so
> > > this shouldn't change the behaviour.
> >
> >
> > Wait ... that message says "setting system clock"
> >
> > but then you say " efirtc was not setting the system time anyway".
> >
> > So did the time get set, or not?
> >
> > If it wasn't set, why does the message say that it was set?
> >
>
> What I meant was that drivers/char/efirtc.c was not setting the system
> time but when using drivers/rtc/rtc-efi.c with CONFIG_RTC_HCTOSYS, the
> kernel will use the rtc to set the system time.

arch/ia64 has a read_persistent_clock64() function, so it ends up reading
the system time regardless of the RTC driver or CONFIG_RTC_HCTOSYS.

As ia64 sets neither ARCH_HIBERNATION_POSSIBLE nor
ARCH_SUSPEND_POSSIBLE, so we could just remove the
read_persistent_clock64() and efi_gettimeofday(), relying instead
on user space (/sbin/hwclock) or CONFIG_RTC_HCTOSYS.

         Arnd
