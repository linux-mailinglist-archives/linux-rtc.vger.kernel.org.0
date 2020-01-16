Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEB613D974
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2020 13:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgAPMA1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Thu, 16 Jan 2020 07:00:27 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:54699 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgAPMA1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jan 2020 07:00:27 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N7hrw-1jf60g3nYA-014nSO for <linux-rtc@vger.kernel.org>; Thu, 16 Jan 2020
 13:00:25 +0100
Received: by mail-qk1-f169.google.com with SMTP id z14so18804928qkg.9
        for <linux-rtc@vger.kernel.org>; Thu, 16 Jan 2020 04:00:24 -0800 (PST)
X-Gm-Message-State: APjAAAV7zOwZi8Sc1THNiOA4Sk1m9qj2OEOBKCHpLKvzhLV9eFuvnE6Q
        qCy0d6WjJtS7YBgmJW1aMkPkAia8uzLViG9HwdU=
X-Google-Smtp-Source: APXvYqwZg0b1IQ0r0jJ6sDi00Wg2zWkg4fUmnJ8edidSz/TTQ7xQ7/nLDF2iINrfHZDBmICSL1LtVcUuefRNPoW3xxk=
X-Received: by 2002:a37:a8d4:: with SMTP id r203mr27664873qke.394.1579176023627;
 Thu, 16 Jan 2020 04:00:23 -0800 (PST)
MIME-Version: 1.0
References: <1579103618-20217-1-git-send-email-Filip.Bozuta@rt-rk.com>
 <1579103618-20217-9-git-send-email-Filip.Bozuta@rt-rk.com>
 <CAK8P3a187rPhma7Q6o+hCF3h0=5MLZwh49+JqKt6BvVsAB1efQ@mail.gmail.com>
 <ceaf44c0-fd6c-c280-7f95-7bc133553089@vivier.eu> <CAK8P3a36KqWD4fKBLDpFhJg079bNdJDSDUAP2Zu_i1+H62Q6ZQ@mail.gmail.com>
 <518d717d-9f1e-e00e-f2a9-df8861241d1c@rt-rk.com> <cdcce2a3-00f5-f6d1-3083-dc36892ac5b4@vivier.eu>
 <CAL1e-=i3-nYJMo6ptA7fdcK8r6P4vv20x2+LLV6BA9ELO8H53w@mail.gmail.com> <CAL1e-=g8X___59zLPKLRjFNAP9bs3rVWhc8+OhMuF3TriBiynw@mail.gmail.com>
In-Reply-To: <CAL1e-=g8X___59zLPKLRjFNAP9bs3rVWhc8+OhMuF3TriBiynw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 16 Jan 2020 13:00:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3o1tM__gP0keo0Dg03tiJQt=5hRGhiXWga4B6gjsVbxA@mail.gmail.com>
Message-ID: <CAK8P3a3o1tM__gP0keo0Dg03tiJQt=5hRGhiXWga4B6gjsVbxA@mail.gmail.com>
Subject: Re: [PATCH 08/12] linux-user: Add support for setting alsa timer
 enhanced read using ioctl
To:     Aleksandar Markovic <aleksandar.m.mail@gmail.com>
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
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:5kpDgVeBZ6jRjdNQ9karfKhIk0SHnBZULlomPjqABinxdmFFkNV
 2dcgXfqW2C9FJDIt7QuGE2y9+vNOMJ6L/YcVyDX963Os8UoEwEAdknPW43ov5CJt4U9QSM1
 CJNdOxPQ6a9X7UindMXiGQ5FbTXLAUytasEo8heYKsY9MyHZRDxFpAtKM6oibLnAd+SxrYT
 p4gGfR2O2pJMtS72Y/srQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aaHxfe1MqGg=:fVuj47K7/S6Zl1hu2gflzP
 wjRK2TD0hzkeQOMIs7gzKDGqIq6+A85W2kkGi1wP+7F4RsIvHIaMGTwaxGbMnwSRLBlBk4uS1
 uGV/1IzQy6MGh3hu13oPJk83HdKmzb4a9NQGK9dkYgrHdI1TamW/pdMtw8D8wZUPQg6QUXs3v
 LWAWEDA6GH5qsFC4RSTWGSxOJZf8k71r3if0dODVR7Cwfi0c1KQ5+EIyoO5IBmCaZXzjDFKuF
 2baiwSkZEk4XDAnSL+rFB2aYswN9Z2zs6xFxCObsBSJcmi2GWa+Lj2x5dSFnccM6Xb7aEch+Z
 S5YYtkd8P9E2Ox2zVXEFarhsJD5DnmBbdqsIffXB5VxLlwrQiEqrJLCgyUVXCZsbe/A3ECYV8
 kkg+1emcsnjAYKVs7zio25oLjYn/kKai0RqeoW/U5jpghP/+M1CuBCPg/Zfa8sj83tux7yjtd
 8JpaOobV5yj67Q5oBrRV1IwrcwD6oPyhxktnGyI2wcyqcwuRklO+T3Bml6kJTgG1FbVGj6nhR
 hBQm2nu2kXEB7LBdOlzjU4Jxq1T+p4BUNcIA+h/iVo+JNM8Z3ofeaAcOqTcF5YX8PJW2LrDgU
 BCGTE2y5/6sUxNzXNUPDnh7A6Q/2UydZX0BlQ34etRRKmda3Coyg/d7y9Lod2hat/CS2Aad5+
 kYJr8fzC9grvLyXrG8Ra+YfyY+iWVoUSGCgrvSXYo3oOLDWa0Iu4yrTuANw74MD3QFFYpr+V1
 YxCPQw9m2g7zaQeODi/JddVGVf2z04PM8bHpLRYoiURcTa9SPVB54XvU0aaWbZVjCND1xNHYq
 OcnFKxLVUPFpVp2SS8fz4OphGcaDGHnitFX3ZB4i8Vmbsx4sVtw9ogW2xbS2TPemQMMwdLIzH
 sLGSjtyAUPyhXpuyrgSQ==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jan 16, 2020 at 12:27 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> On Thursday, January 16, 2020, Aleksandar Markovic <aleksandar.m.mail@gmail.com> wrote:
>> On Wednesday, January 15, 2020, Laurent Vivier <laurent@vivier.eu> wrote:
>>> Le 15/01/2020 à 20:17, Filip Bozuta a écrit :
>>> > On 15.1.20. 17:37, Arnd Bergmann wrote:
>>> >> On Wed, Jan 15, 2020 at 5:32 PM Laurent Vivier <laurent@vivier.eu> wrote:
>>> >>> Le 15/01/2020 à 17:18, Arnd Bergmann a écrit :
>>> >>>> On Wed, Jan 15, 2020 at 4:53 PM Filip Bozuta
>>> >>>> <Filip.Bozuta@rt-rk.com> wrote:
>>> >>>>> This patch implements functionality of following ioctl:
>>> >>>>>
>>> >>>>> SNDRV_TIMER_IOCTL_TREAD - Setting enhanced time read
>>> >>>>>
>>> >>>>>      Sets enhanced time read which is used for reading time with
>>> >>>>> timestamps
>>> >>>>>      and events. The third ioctl's argument is a pointer to an
>>> >>>>> 'int'. Enhanced
>>> >>>>>      reading is set if the third argument is different than 0,
>>> >>>>> otherwise normal
>>> >>>>>      time reading is set.
>>> >>>>>
>>> >>>>> Implementation notes:
>>> >>>>>
>>> >>>>>      Because the implemented ioctl has 'int' as its third argument,
>>> >>>>> the
>>> >>>>>      implementation was straightforward.
>>> >>>>>
>>> >>>>> Signed-off-by: Filip Bozuta <Filip.Bozuta@rt-rk.com>
>>> >>>> I think this one is wrong when you go between 32-bit and 64-bit
>>> >>> kernel uses an "int" and "int" is always 32bit.
>>> >>> The problem is most likely with timespec I think.
>>> >>>
>>> >>>> targets, and it gets worse with the kernel patches that just got
>>> >>>> merged for linux-5.5, which extends the behavior to deal with
>>> >>>> 64-bit time_t on 32-bit architectures.
>>> >>>>
>>> >>>> Please have a look at
>>> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?h=80fe7430c70859
>>> >>>>
>>> >>> Yes, we already had the same kind of problem with SIOCGSTAMP and
>>> >>> SIOCGSTAMPNS.
>>> >>>
>>> >>> Do the kernel patches add new ioctl numbers to differentiate 32bit and
>>> >>> 64bit time_t?
>>> >> Yes, though SNDRV_TIMER_IOCTL_TREAD is worse: the ioctl argument
>>> >> is a pure 'int' that decides what format you get when you 'read' from the
>>> >> same file descriptor.
>>> >>
>>> >> For emulating 64-bit on 32-bit kernels, you have to use the new
>>> >> SNDRV_TIMER_IOCTL_TREAD64, and for emulating 32-bit on
>>> >> 64-bit kernels, you probably have to return -ENOTTY to
>>> >> SNDRV_TIMER_IOCTL_TREAD_OLD unless you also want to
>>> >> emulate the read() behavior.
>>> >> When a 32-bit process calls SNDRV_TIMER_IOCTL_TREAD64,
>>> >> you can translate that into the 64-bit
>>> >> SNDRV_TIMER_IOCTL_TREAD_OLD.
>>> >
>>> > Thank you for bringing this up to my attention. Unfortunately i have
>>> > some duties of academic nature in next month so i won't have much time
>>> > fix this bug. I will try to fix this as soon as possible.
>>>
>>> Could you at least to try to have a mergeable series before you have to
>>> stop to work on this?
>>>
>>> You can only manage the case before the change reported by Arnd (I will
>>> manage the new case myself later).

>>
>> Sorry for interjecting myself into this discussion, but I just want to let you know about some related practicalities.
>>
>> Filip is a student that is from time to time (usually between two exam seasons) an intern in our company, working 4 hours each work day. He spent his internship in different teams in prevous years, and, from around mid-October 2019, was appointed to QEMU team. After some introductory tasks, he was assigned his main task: linux-user support for RTCs and ALSA timers. This series is the result of his work, and, to my great pleasure, is virtually entirely his independant work. I am positive he can complete the series by himself, even in the light of additional complexities mentioned in this thread.
>>
>> However, his exam season just started (Jan. 15th), and lasts till Feb. 15th. Our policy, in general, is not to burden the students during exam seasons, and that is why we can't expect prompt updates from him for the time being.
>>
>> In view of this, Laurent, please take Filip's status into consideration. As far as mergeability is concerned, my impression is that patches 1-6 and 13 are ready for merging, while patches 7-12 would require some additional (netlink-support-like) work, that would unfortunately be possible only after Feb. 15th.
>>

> Laurent, hi again.
>
> I am not completely familiar with all details of Filip's work, since, as I said, he had
> large degree of independance (which was intentional, and is a desired and good
> thing IMHO), but taking a closer look, a question starting lingering: Do we need
> special handling od read() even for RTC devices - not only ALSA timer devices?

Adding Alexandre Belloni and the RTC list to Cc for more expertise. Alexandre,
this question is about how qemu-user should emulate the rtc ioctl interface when
running a user binary for a foreign architecture. The ioctl emulation seems fine
to me, but read() from /dev/rtc is probably not.

As I understand it, reading from /dev/rtc is one of the more obscure features.
This would return either 32 bits or 64 bits of structured data from the kernel,
depending on how much data was requested and whether the kernel runs
as 64 bit. A 32-bit process running on a 64-bit kernel will get the correct
result when it asks for 4 bytes, but probably not when it asks for 8 bytes.
(we could fix this with an explict check for in_compat_syscall() in the kernel
function).

A process running on qemu with the opposite endianess will always get the
wrong result (unless the kernel returns 0), and emulating 64-bit task on
a 32-bit kernel will result in only four bytes to be read, which also likely
results in incorrect behavior.

       Arnd
