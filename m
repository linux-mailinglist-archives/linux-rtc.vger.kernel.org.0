Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0B3141279
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 21:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729663AbgAQUuq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 15:50:46 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44372 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgAQUuq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jan 2020 15:50:46 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so23358041oia.11
        for <linux-rtc@vger.kernel.org>; Fri, 17 Jan 2020 12:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/jCNhqVz567vfe+oO2DswXwZ1fuAe0kbZjMedLPEGmo=;
        b=OATJeDj8h7q5Bl2QdzBB8+qGP0QJav7ijHQ27EgBzX8U15S4ZIk+YP/pMVnedj/UOc
         Tacyp6gd4N8lRDBB1eGDXpsQkgCFSW7BQhSK9rmmXr+lPYJ6wJ3idW5m/fUXsREeduT6
         K+ZbtYHauPygV4YfDHJT0VvnexrLDLe8TgZN6MEX1yJevSEXR0kRxiT7rRrOA/sS/iLQ
         J52+p+YVGXMPHHUxeVQrrVXoB3SNOPOc0rDQajEPNX1p+Fy1wiA7ZrdcF6//kgl1iLtm
         BlzlYavPT2h3HSgepK9GxJRcQj1oD2qFhXrSYXQqp9WJRIQdqozaVkFhulXmPS9bhGMO
         0vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/jCNhqVz567vfe+oO2DswXwZ1fuAe0kbZjMedLPEGmo=;
        b=Y/CV0xPw47wM7/luvayFAkSra1NiNaVsup9/gyHBOjQmKWnt1ODkVWEAofEWyyBbOo
         wkCWhB2YERsaSt4xkf+TgOhOkanqFOHBlJi6eGsfZ4pGYXAtXB4MIfb3KhNo4DAZ2n8p
         vQGn9y0+xALH+2ay13yF4zm4QeUejJHs3uv9yLA8gOjoZBFFU2MAgau0kRy1traTSXsI
         BiG2P32sIZPdNLFWEXerwfF3TfeOeA4jBWY2s9w+wWaKCe54+dq1k98vGNqI8LjLDhYM
         /PBn2fu+X1aE+OEHCm3vrf7fT8WTH7E5yUqP1I5EEBjFFAfHk9YfidKA0SXYBehtiHnS
         v6lw==
X-Gm-Message-State: APjAAAXb27NsijFJfLWMtIiYPo2tq8hzIQpTRUareTaO/ij7sA5qEsVV
        vWV5cO27hfsO97mSed/c4uxbEa2kpwTdPcBfVRqOzCsI
X-Google-Smtp-Source: APXvYqwbRnxSJYycdpiyNCSR49Xq0/7bPBksvB5lc9ar7YZmNU+hV+esRzUqronHAwIzr03FPokjhxIPCpuTNHpkq5s=
X-Received: by 2002:aca:1b08:: with SMTP id b8mr4966084oib.62.1579294245331;
 Fri, 17 Jan 2020 12:50:45 -0800 (PST)
MIME-Version: 1.0
References: <1579103618-20217-1-git-send-email-Filip.Bozuta@rt-rk.com>
 <1579103618-20217-9-git-send-email-Filip.Bozuta@rt-rk.com>
 <CAK8P3a187rPhma7Q6o+hCF3h0=5MLZwh49+JqKt6BvVsAB1efQ@mail.gmail.com>
 <ceaf44c0-fd6c-c280-7f95-7bc133553089@vivier.eu> <CAK8P3a36KqWD4fKBLDpFhJg079bNdJDSDUAP2Zu_i1+H62Q6ZQ@mail.gmail.com>
 <518d717d-9f1e-e00e-f2a9-df8861241d1c@rt-rk.com> <cdcce2a3-00f5-f6d1-3083-dc36892ac5b4@vivier.eu>
 <CAL1e-=i3-nYJMo6ptA7fdcK8r6P4vv20x2+LLV6BA9ELO8H53w@mail.gmail.com>
 <CAL1e-=g8X___59zLPKLRjFNAP9bs3rVWhc8+OhMuF3TriBiynw@mail.gmail.com> <CAK8P3a3o1tM__gP0keo0Dg03tiJQt=5hRGhiXWga4B6gjsVbxA@mail.gmail.com>
In-Reply-To: <CAK8P3a3o1tM__gP0keo0Dg03tiJQt=5hRGhiXWga4B6gjsVbxA@mail.gmail.com>
From:   Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date:   Fri, 17 Jan 2020 21:50:34 +0100
Message-ID: <CAL1e-=gv_L0fuq9t8mmOiZ2D-CwpPrZZOjwrDwKwe09jvWJpXQ@mail.gmail.com>
Subject: Re: [PATCH 08/12] linux-user: Add support for setting alsa timer
 enhanced read using ioctl
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Laurent Vivier <laurent@vivier.eu>,
        Filip Bozuta <Filip.Bozuta@rt-rk.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "amarkovic@wavecomp.com" <amarkovic@wavecomp.com>,
        "philmd@redhat.com" <philmd@redhat.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jan 16, 2020 at 1:00 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 16, 2020 at 12:27 PM Aleksandar Markovic
> <aleksandar.m.mail@gmail.com> wrote:
> > On Thursday, January 16, 2020, Aleksandar Markovic <aleksandar.m.mail@g=
mail.com> wrote:
> >> On Wednesday, January 15, 2020, Laurent Vivier <laurent@vivier.eu> wro=
te:
> >>> Le 15/01/2020 =C3=A0 20:17, Filip Bozuta a =C3=A9crit :
> >>> > On 15.1.20. 17:37, Arnd Bergmann wrote:
> >>> >> On Wed, Jan 15, 2020 at 5:32 PM Laurent Vivier <laurent@vivier.eu>=
 wrote:
> >>> >>> Le 15/01/2020 =C3=A0 17:18, Arnd Bergmann a =C3=A9crit :
> >>> >>>> On Wed, Jan 15, 2020 at 4:53 PM Filip Bozuta
> >>> >>>> <Filip.Bozuta@rt-rk.com> wrote:
> >>> >>>>> This patch implements functionality of following ioctl:
> >>> >>>>>
> >>> >>>>> SNDRV_TIMER_IOCTL_TREAD - Setting enhanced time read
> >>> >>>>>
> >>> >>>>>      Sets enhanced time read which is used for reading time wit=
h
> >>> >>>>> timestamps
> >>> >>>>>      and events. The third ioctl's argument is a pointer to an
> >>> >>>>> 'int'. Enhanced
> >>> >>>>>      reading is set if the third argument is different than 0,
> >>> >>>>> otherwise normal
> >>> >>>>>      time reading is set.
> >>> >>>>>
> >>> >>>>> Implementation notes:
> >>> >>>>>
> >>> >>>>>      Because the implemented ioctl has 'int' as its third argum=
ent,
> >>> >>>>> the
> >>> >>>>>      implementation was straightforward.
> >>> >>>>>
> >>> >>>>> Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
> >>> >>>> I think this one is wrong when you go between 32-bit and 64-bit
> >>> >>> kernel uses an "int" and "int" is always 32bit.
> >>> >>> The problem is most likely with timespec I think.
> >>> >>>
> >>> >>>> targets, and it gets worse with the kernel patches that just got
> >>> >>>> merged for linux-5.5, which extends the behavior to deal with
> >>> >>>> 64-bit time_t on 32-bit architectures.
> >>> >>>>
> >>> >>>> Please have a look at
> >>> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git/log/?h=3D80fe7430c70859
> >>> >>>>
> >>> >>> Yes, we already had the same kind of problem with SIOCGSTAMP and
> >>> >>> SIOCGSTAMPNS.
> >>> >>>
> >>> >>> Do the kernel patches add new ioctl numbers to differentiate 32bi=
t and
> >>> >>> 64bit time_t?
> >>> >> Yes, though SNDRV_TIMER_IOCTL_TREAD is worse: the ioctl argument
> >>> >> is a pure 'int' that decides what format you get when you 'read' f=
rom the
> >>> >> same file descriptor.
> >>> >>
> >>> >> For emulating 64-bit on 32-bit kernels, you have to use the new
> >>> >> SNDRV_TIMER_IOCTL_TREAD64, and for emulating 32-bit on
> >>> >> 64-bit kernels, you probably have to return -ENOTTY to
> >>> >> SNDRV_TIMER_IOCTL_TREAD_OLD unless you also want to
> >>> >> emulate the read() behavior.
> >>> >> When a 32-bit process calls SNDRV_TIMER_IOCTL_TREAD64,
> >>> >> you can translate that into the 64-bit
> >>> >> SNDRV_TIMER_IOCTL_TREAD_OLD.
> >>> >
> >>> > Thank you for bringing this up to my attention. Unfortunately i hav=
e
> >>> > some duties of academic nature in next month so i won't have much t=
ime
> >>> > fix this bug. I will try to fix this as soon as possible.
> >>>
> >>> Could you at least to try to have a mergeable series before you have =
to
> >>> stop to work on this?
> >>>
> >>> You can only manage the case before the change reported by Arnd (I wi=
ll
> >>> manage the new case myself later).
>
> >>
> >> Sorry for interjecting myself into this discussion, but I just want to=
 let you know about some related practicalities.
> >>
> >> Filip is a student that is from time to time (usually between two exam=
 seasons) an intern in our company, working 4 hours each work day. He spent=
 his internship in different teams in prevous years, and, from around mid-O=
ctober 2019, was appointed to QEMU team. After some introductory tasks, he =
was assigned his main task: linux-user support for RTCs and ALSA timers. Th=
is series is the result of his work, and, to my great pleasure, is virtuall=
y entirely his independant work. I am positive he can complete the series b=
y himself, even in the light of additional complexities mentioned in this t=
hread.
> >>
> >> However, his exam season just started (Jan. 15th), and lasts till Feb.=
 15th. Our policy, in general, is not to burden the students during exam se=
asons, and that is why we can't expect prompt updates from him for the time=
 being.
> >>
> >> In view of this, Laurent, please take Filip's status into consideratio=
n. As far as mergeability is concerned, my impression is that patches 1-6 a=
nd 13 are ready for merging, while patches 7-12 would require some addition=
al (netlink-support-like) work, that would unfortunately be possible only a=
fter Feb. 15th.
> >>
>
> > Laurent, hi again.
> >
> > I am not completely familiar with all details of Filip's work, since, a=
s I said, he had
> > large degree of independance (which was intentional, and is a desired a=
nd good
> > thing IMHO), but taking a closer look, a question starting lingering: D=
o we need
> > special handling od read() even for RTC devices - not only ALSA timer d=
evices?
>
> Adding Alexandre Belloni and the RTC list to Cc for more expertise. Alexa=
ndre,
> this question is about how qemu-user should emulate the rtc ioctl interfa=
ce when
> running a user binary for a foreign architecture. The ioctl emulation see=
ms fine
> to me, but read() from /dev/rtc is probably not.
>
> As I understand it, reading from /dev/rtc is one of the more obscure feat=
ures.
> This would return either 32 bits or 64 bits of structured data from the k=
ernel,
> depending on how much data was requested and whether the kernel runs
> as 64 bit. A 32-bit process running on a 64-bit kernel will get the corre=
ct
> result when it asks for 4 bytes, but probably not when it asks for 8 byte=
s.
> (we could fix this with an explict check for in_compat_syscall() in the k=
ernel
> function).
>
> A process running on qemu with the opposite endianess will always get the
> wrong result (unless the kernel returns 0), and emulating 64-bit task on
> a 32-bit kernel will result in only four bytes to be read, which also lik=
ely
> results in incorrect behavior.
>


Alexandre (and Arnd too, or any other person knowledgeable in the area),

I just need to clarify a couple of details with you, please.

Firstly, here is what man page rtc(4) says:

"The /dev/rtc (or /dev/rtc0, /dev/rtc1, etc.) device can be opened
only once (until it is closed) and it is read-only. On read(2) and
select(2) the calling process is blocked until the next interrupt from
that RTC is received. Following the interrupt, the process can read a
long integer, of which the least significant byte contains a bit mask
encoding the types of interrupt that occurred, while the remaining 3
bytes contain the number of interrupts since the last read(2)."

So, it looks read() will always return only 4 bytes of useful info
(regardless of host being 32-bit/64-bit).

My questions are:

- Is the description in man page genuinely accurate?

- To me (but I am really an outsider to using RTC in applications),
this feature (blocking read()/select()) even looks very nice and
convenient, in all fairness. But I would like to ask you: Is this
feature used rarely or frequently by other libraries/tools/etc.? In
other words, is the feature "obscure" or "crucial" part of RTC kernel
support? Or, something in between?

- Does MC146818 support this feature?

Thanks a lot in advance for any response!

Aleksandar

P.S. for Arnd: I sent this message only to you, by mistake, around 15
min ago. Now I include everybody.

>        Arnd
