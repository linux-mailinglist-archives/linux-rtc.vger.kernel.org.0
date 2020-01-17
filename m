Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D70D14138C
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 22:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgAQVpr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 16:45:47 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:33393 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbgAQVpr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jan 2020 16:45:47 -0500
Received: from mail-qt1-f171.google.com ([209.85.160.171]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M597q-1itftl2Xlk-001CYK for <linux-rtc@vger.kernel.org>; Fri, 17 Jan 2020
 22:45:45 +0100
Received: by mail-qt1-f171.google.com with SMTP id e5so22952400qtm.6
        for <linux-rtc@vger.kernel.org>; Fri, 17 Jan 2020 13:45:45 -0800 (PST)
X-Gm-Message-State: APjAAAUv8xJ/LtGuV/BdSEV9iW2DLokjEyZEOyqyvUkLshBMYa2D/VzI
        D/68bZb53nwaLyimsB6BTludXS033v4YtHWOOHs=
X-Google-Smtp-Source: APXvYqwPGUg2H2r+FAIwNs270IiUt3Q8Te08RmlCLLcJAdJj3kQoY7zwhAIoZXheX7+d59yilF2roefgV6MzK67YWn4=
X-Received: by 2002:ac8:47d3:: with SMTP id d19mr9463965qtr.142.1579297544415;
 Fri, 17 Jan 2020 13:45:44 -0800 (PST)
MIME-Version: 1.0
References: <1579103618-20217-1-git-send-email-Filip.Bozuta@rt-rk.com>
 <1579103618-20217-9-git-send-email-Filip.Bozuta@rt-rk.com>
 <CAK8P3a187rPhma7Q6o+hCF3h0=5MLZwh49+JqKt6BvVsAB1efQ@mail.gmail.com>
 <ceaf44c0-fd6c-c280-7f95-7bc133553089@vivier.eu> <CAK8P3a36KqWD4fKBLDpFhJg079bNdJDSDUAP2Zu_i1+H62Q6ZQ@mail.gmail.com>
 <518d717d-9f1e-e00e-f2a9-df8861241d1c@rt-rk.com> <cdcce2a3-00f5-f6d1-3083-dc36892ac5b4@vivier.eu>
 <CAL1e-=i3-nYJMo6ptA7fdcK8r6P4vv20x2+LLV6BA9ELO8H53w@mail.gmail.com>
 <CAL1e-=g8X___59zLPKLRjFNAP9bs3rVWhc8+OhMuF3TriBiynw@mail.gmail.com>
 <CAK8P3a3o1tM__gP0keo0Dg03tiJQt=5hRGhiXWga4B6gjsVbxA@mail.gmail.com> <CAL1e-=gv_L0fuq9t8mmOiZ2D-CwpPrZZOjwrDwKwe09jvWJpXQ@mail.gmail.com>
In-Reply-To: <CAL1e-=gv_L0fuq9t8mmOiZ2D-CwpPrZZOjwrDwKwe09jvWJpXQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jan 2020 22:45:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1YrK4_Xx13821P58rn1L_xZN5gJYt-Pef+aHdM-_V85g@mail.gmail.com>
Message-ID: <CAK8P3a1YrK4_Xx13821P58rn1L_xZN5gJYt-Pef+aHdM-_V85g@mail.gmail.com>
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
X-Provags-ID: V03:K1:vUWRCywBGr040drpLhxmHHuTqAe0P2lH9aUgU5HuKF0y6/sR0pf
 OayfyakFVtZXPZQHLlVpEaON6vaemEM2CemzdOk2SyrDYAhveQ4LneUfCWvxzGwRxLqAcKQ
 941U7KRrchDL+nQUb3v1mVK0tjwvKOWwF5UIFNH4fSP4WQao/Ou4ynU6aGp/XhhyNbqZ6oQ
 80DrsoJfqfseqVzoscdJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KUEIMCrSPZg=:YvfVaRRTPikB6PuKVsBFaA
 QSIBDGNSmJ2+D1KP4DrT34zO4n826UxjE29vbqsDcrTcroMQ4LBPnW7gJ/yO3X7HnRUt3O7MG
 jJ0U6j17bRsh3AChUhPeqwgwXLPAKColEP/Qhcw/iuQhNNDUvso4mmt59+g0gbwvv/8s2drh5
 6fr8IMPE9Hu+nPpx3oPaksy5MtBSymZ098q/PTmQjajrrgosGouxUcEpvWZocqHkLbBi3gyQQ
 YKUugloI3m7TPJdKEEQ87oZfcSy+w+VVo73BRk1G6vXnT4gsyDWIqZOvLPsRojESy1tnOndeS
 EEw0oTXoKsr59HvPQufoPTWHToXExEoeERyf2mT1if7Oa/1SBf8Dckg8QLnnfQndXp/Ov7IMl
 jAmY19xbXS0vR7d3g/EAIBYXpoPMS6MaiTDBbtaBLGywkFm3vvH8gFbNFLQMMHAAbYMY6utTn
 p811gWPQ0dqAcVZsix6q/D9yiuQm4ma2Ii7OXkBbwg4l3rMtVB84+nEQ+fzntVae7ua3CBjVP
 M9wzugOg2XwOl6WvHID7IJvEkxnfyWNMGSSK/M/qyL7KgWD3ow6qyiSkjmfQxhbLAI5KsECHP
 t/P1MbZYpZFP2/w5hE1EJbfVdZlFBB0D3LDenHdA1f4g+4TLsQLNkuR3LWIlT/qjhP9sWhK3t
 AAVb+Y2WiN6XZDAvrWt4L56E1EyNNE3jV1q+1dFUuqA/w3Jmq+RTCgBzdMX+KyyYU7qpkDBMg
 PRQOagNh7nbG3v05fJsIpquMNuGcQjCk/oBHT0QrSokTAcrB+Id2RGRjBgqDd94YWvKz52uJF
 B5zjQhKn1Lur9bt7yqXIaKhC6a7OmSAM/j5NLpgzcko5d3MpKI7aQDAoUbRn95Z9z88w3yywK
 XNiGGTACtCI5LaivM53w==
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jan 17, 2020 at 9:50 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:

> Alexandre (and Arnd too, or any other person knowledgeable in the area),
>
> I just need to clarify a couple of details with you, please.
>
> Firstly, here is what man page rtc(4) says:
>
> "The /dev/rtc (or /dev/rtc0, /dev/rtc1, etc.) device can be opened
> only once (until it is closed) and it is read-only. On read(2) and
> select(2) the calling process is blocked until the next interrupt from
> that RTC is received. Following the interrupt, the process can read a
> long integer, of which the least significant byte contains a bit mask
> encoding the types of interrupt that occurred, while the remaining 3
> bytes contain the number of interrupts since the last read(2)."
>
> So, it looks read() will always return only 4 bytes of useful info
> (regardless of host being 32-bit/64-bit).

It says "long integer", which is 64-bit on a 64-bit machine.

> My questions are:
>
> - Is the description in man page genuinely accurate?

Starting with linux-2.6.18, there is another possibility: If an
application asks for exactly four bytes on a 64-bit kernel,
it gets the lower four bytes, as it would on a 32-bit kernel.

This is a hack that was introduced for running 32-bit compat
tasks.

For any other size less than sizeof(long), the kernel reports
an EINVAL error, and for anything larger or equal to sizeof(long)
it attempts to output a long word.

> - To me (but I am really an outsider to using RTC in applications),
> this feature (blocking read()/select()) even looks very nice and
> convenient, in all fairness. But I would like to ask you: Is this
> feature used rarely or frequently by other libraries/tools/etc.? In
> other words, is the feature "obscure" or "crucial" part of RTC kernel
> support? Or, something in between?

> - Does MC146818 support this feature?

No idea, I'll leave these for Alexandre or someone else to answer.

      Arnd
