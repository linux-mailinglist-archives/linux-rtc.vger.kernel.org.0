Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FC11C9A94
	for <lists+linux-rtc@lfdr.de>; Thu,  7 May 2020 21:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgEGTMh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 May 2020 15:12:37 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:51939 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbgEGTMg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 May 2020 15:12:36 -0400
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M72bv-1jUGiM3xHj-008eKn; Thu, 07 May 2020 21:12:34 +0200
Received: by mail-qv1-f46.google.com with SMTP id w18so1219672qvs.3;
        Thu, 07 May 2020 12:12:33 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ8xsWjKeWVzGhfRhL6Y/+0f9rELs2sUILaTLV6FH8u0ZwbBjoy
        VH4XYT169W0H1sySu/MOgAbXVYioOZDrKc+obls=
X-Google-Smtp-Source: APiQypJBWA4NqhyEiAO/PmDNDXWG/So6DgaAeR8G/KznQhUhlZMcKUy4Qpt3rd0XuX3CQ6hdo6V1+sr2fe/R+fUs+2Y=
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr14850526qvp.197.1588878752616;
 Thu, 07 May 2020 12:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2005060713390.25338@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a2W=foRQ1mX8Gds1GCo+qTRqATV59LyDG5_bNyEKjZybA@mail.gmail.com>
 <alpine.LRH.2.02.2005061308220.18599@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.2005070404420.5006@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a1qN-cpzkcdtNhtMfSwWwxqcOYg9x6DEzt7PWazwr8V=Q@mail.gmail.com>
 <alpine.LRH.2.02.2005070931280.1718@file01.intranet.prod.int.rdu2.redhat.com>
 <CAK8P3a3UdCJL6C07_W7pkipT1Xmr_0G9hOy1S+YXbB4_tKt+gg@mail.gmail.com> <alpine.LRH.2.02.2005071145250.15191@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2005071145250.15191@file01.intranet.prod.int.rdu2.redhat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 7 May 2020 21:12:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3SBg=w72KVgGUGAUcmU-6RxrQW=mnYf8vmFjBL5jbDpg@mail.gmail.com>
Message-ID: <CAK8P3a3SBg=w72KVgGUGAUcmU-6RxrQW=mnYf8vmFjBL5jbDpg@mail.gmail.com>
Subject: Re: [PATCH v4] alpha: add a barrier after outb, outw and outl
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-serial@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DTx3dDahidtuT3r6kP782M1M8Yn1Jrgk/RtA7xup2n0a3AHpx+u
 1KnkJYEJ2N4LBOJlEDL/7V1JJZT3Cmwtl3C4y01Be7KVdsl1h5k9EOIuVnLjX2KbaYljEye
 Gf19OCjeDLyk7Hh+S71EZh1SXGLKu9Qh6Sm77rDFY3vdqxsAWWryUwwiQ34akTqBe9orepU
 xCHFeluZ+0iD2I+AGcs6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mZpHi9qv03w=:N1PWpXGvvCLHZCZuV9yT3p
 qBpSuFE30XZihSKirT/KlraOQb3HRYYP0M2kJPN54wB9k4lNInpraUR2ZOf6OiMcLRxur8Aol
 iqXKqqu3wtqke4fIb7YIRyg/3UJk8zLv0qChcVFBHz+DasmyNnCZa3T7Kjq/wCh8q2vpKOvWn
 gEfwADo7G9y9WRDP4DydPn5Va9krJNOCWOMMiCGGlpXCeVOBDBbOmvemTwgu6DsWlDzwdvz8d
 4WwrGF9Y0sEZ5MlKIi1YzHy7pt+T16uu0iiLyTBXvlNhCBKZeljUFqALqlDxwBfS++sqXjcj4
 0e3tHQ9WrKDieHJDPrwJSkE03C7JQpSaQQSWPpTKZaNeNmB56y0+oyaGhshj9XLgdtWDGtms1
 BEZY5YLc9YRMVqA9BSGcUrczLF2PQ5Bs9F7G4VCYlJ/hGUwAaMy1LeYX2WX/YViGUqtLdWv+p
 C+56XBfj5jkLzxMYMlyX7hxTSKGG94gWGJqTqwYbXcGnHwZDYOltejZHq28QEyb8gK13sJnnQ
 o0aC0Em6hrWjK6u/TqHn0+OGdHBsKixlcBGMpFsoZtuXrdHhZTbjQptykxYLhLd3Yd2xVlTJn
 AOz5ZoERXyxM+BzI6Byi/CJnZ6fFa89DV7HhyToBYGHRN9NtztZTfV7zDsCCayFR/aiOhEx0r
 bZLmUwCTSK62hbaIctXxr7PGvLjmcuiCXPxbYtlgrSlILPkInagRrV0bcKqnFT5QtCOZMb2sT
 9iMU01Y9c6NVl4P1IV3jCNXnOlg0YxbWfe3GaBJlVcAh4u8UBxX/+OVw3tLQllRtGgSiRTS2l
 sLY/NdLbcu7GIaMM1VLpGdUqWzZPXmpRQiSpbFT5XxTo8cKm38=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, May 7, 2020 at 5:46 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> The patch 92d7223a74235054f2aa7227d207d9c57f84dca0 ("alpha: io: reorder
> barriers to guarantee writeX() and iowriteX() ordering #2") broke boot on
> the Alpha Avanti platform.
>
> The patch changes timing between accesses to the ISA bus, in particular,
> it reduces the time between "write" access and a subsequent "read" access.
>
> This causes lock-up when accessing the real time clock and serial ports.
>
> This patch fixes the bug by adding a memory barrier after the functions
> that access the ISA ports - outb, outw, outl. The barrier causes that
> there is some delay between the write to an IO port and a subsequent read.

Based on your earlier explanations, I would mention here that the barrier
avoids the back-to-back I/O instructions on the bus that seem to be causing
the problem. As I understand it (having very little alpha specific knowledge),
they should prevent them by design. However if you are sure it's just the
added delay rather than any actual barrier effect, that would also be worth
pointing out.

> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: 92d7223a7423 ("alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2")
> Cc: stable@vger.kernel.org      # v4.17+

With or without any further clarification

Acked-by: Arnd Bergmann <arnd@arndb.de>
