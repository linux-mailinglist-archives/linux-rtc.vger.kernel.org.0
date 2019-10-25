Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42BD4E48B8
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2019 12:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392797AbfJYKmI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 25 Oct 2019 06:42:08 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53835 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730471AbfJYKmI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 25 Oct 2019 06:42:08 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N1u2b-1hzrbb2og5-012Ep5; Fri, 25 Oct 2019 12:42:06 +0200
Received: by mail-qk1-f182.google.com with SMTP id f18so1290312qkm.1;
        Fri, 25 Oct 2019 03:42:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVLC2FIsJIdM1fMSJDuCck3en4dmzQqmmPcMOz9f8gqIBP/vBN1
        WmledsWWy6iTJLG9ffbx9oNnPXZ+40kAGe14FN4=
X-Google-Smtp-Source: APXvYqxI6dezxK6sXX9nX4PhPDdDApdJ0O4YhP9ibTLjyxglotNogMKPpNlF6D2BCoswO2YF56qq9iWcNTYt5q0q+Uw=
X-Received: by 2002:a05:620a:4f:: with SMTP id t15mr2285922qkt.286.1572000125364;
 Fri, 25 Oct 2019 03:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191023150311.844123-1-arnd@arndb.de> <20191023184616.GA17078@agluck-desk2.amr.corp.intel.com>
 <20191023200135.GT3125@piout.net> <3908561D78D1C84285E8C5FCA982C28F7F4AD7F7@ORSMSX115.amr.corp.intel.com>
 <20191023232004.GV3125@piout.net> <CAK8P3a2=9dw2YN-sc7yxwwnRi-6Bos32==523qPaqW=avLs60Q@mail.gmail.com>
 <3908561D78D1C84285E8C5FCA982C28F7F4AEDED@ORSMSX115.amr.corp.intel.com>
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F7F4AEDED@ORSMSX115.amr.corp.intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 25 Oct 2019 12:41:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a28aRv5TpRn1xhjZFO9n=+CBG6V276Roqm=bE_eQZkw_w@mail.gmail.com>
Message-ID: <CAK8P3a28aRv5TpRn1xhjZFO9n=+CBG6V276Roqm=bE_eQZkw_w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc/ia64: remove legacy efirtc driver
To:     "Luck, Tony" <tony.luck@intel.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "Yu, Fenghua" <fenghua.yu@intel.com>,
        Stephane Eranian <eranian@google.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:AQJYad2nzIMeigdvbY44ZK9T/iQdV1L1xSiR8DuyrfaDgPZfSJ4
 knCb7zpCXzcBxbKCZQQntmOnld6x/aBxTci6ZXjbXGlOP8In5kbzG1/nTVDdAsbhbiy/jZo
 zBcUOod4JMtuQ1FoHdrdFNAHuGPrLXaho/cDsF8CqIhrxyY+oFlSE/UuLzDAAb5UD0AzoJ7
 59LrVLPnUUOyxon66pOLA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AKUuhn2oHmo=:RN18oMQsgWRk+4XLcDS3hH
 relJMhlrq8wGAgjG8wmwyZ85ZOl2Ha8FLKSX41TBRHnYAd5wsOhMq4CzqivRfeCgBjzfLWyVG
 AGaXeHXtNeqVROGCj1OhNFSIcNVlLgfhaAPiJ4Mn0B+n6XkgxRc7bTyxdl3FHKr9poP6dytde
 pCCQBbUDtGeEwABgfCHOD5+VjgurfeG+ycWvauVB5AqZZUyd6ea+1b9m4fzH91kT0fqahU6en
 vrVmo6h5WZZIk6WOS3cFIqEO8T0jlyW7WVE++mMDitbfvCtFF9Wjm/qrL/pl6Bn84f0L/TepN
 hAmfoBpPigD+BwvWOIKLJwrCLzL6rOfdzQsMHg8NlBkBls/Jz1kmIc6HJBaftC3au/44tQXYC
 LYD4r6Mgo+n5Wk8hXyxqAw8sFSfMygVJ0gyyM9Sd3xzpQ87TOtHx7CKkgCnKvhhFoHONfQUMC
 1AOXJKNYQZw6hwP0AHPhopPDlltlvq2vMfCjZ8rgyJ4yDljhX8PVAVwTmkU4QGnCE5As1yDYx
 P3apa/tOHcQltQR38ojnnmk0BV1IUD8lgla+6AuXXAVvm487jIjAkR/ALwicB97E30lmOqdT3
 i09BuodtDMxsCzBsDDrryJJyyDDkf8oyRVxGywHFEKT2fMqfDQFTXTb0JfsfZ9cEGvEhULEWi
 OoH1Y8QFeQs6p1KvW2SCXdPmrjTUhHL/O47Mewp8F5ch9N2+MEJame44wDmkETUTYLsHruuXI
 0aemIABVYyXObB86WTXolthxUYNignlOzp119VYCN+HG1gPcSOn/+NSRJoRPLxa+9xggX/q0M
 nHNdTcpznQCOuyujC2pVPdTfGXET0k4eg2J1Qhr8i3iVntKSg5ljKyl0mmhc4Hx3GeG3L5uhV
 zr/iBR1AR5HDAW/SchFQ==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Oct 24, 2019 at 6:57 PM Luck, Tony <tony.luck@intel.com> wrote:
>
> > arch/ia64 has a read_persistent_clock64() function, so it ends up reading
> > the system time regardless of the RTC driver or CONFIG_RTC_HCTOSYS.
> >
> > As ia64 sets neither ARCH_HIBERNATION_POSSIBLE nor
> > ARCH_SUSPEND_POSSIBLE, so we could just remove the
> > read_persistent_clock64() and efi_gettimeofday(), relying instead
> > on user space (/sbin/hwclock) or CONFIG_RTC_HCTOSYS.
>
> Seems weird. ia64 has always assumed from day 1 that it is running
> on a UEFI capable platorm (well at day 1 it was called "EFI", the "U"
> came later).
>
> So read_persistent_clock64() just calls EFI directly to get the time.
>
> Seems simpler than worrying about having the right drivers and CONFIG
> bits set.

It would just be a little more consistent. Most architectures cannot
implement  read_persistent_clock64()  or CONFIG_RTC_HCTOSYS
when the RTC driver is a loadable module, so distros normally have to
set the system time after loading modules already. If some architectures
have a reliable platform interface that allows setting the time at early
boot, that doesn't mean we have to rely on that.

       Arnd
