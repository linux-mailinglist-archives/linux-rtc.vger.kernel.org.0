Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4446B41E30C
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Sep 2021 23:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348785AbhI3VNH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Sep 2021 17:13:07 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49089 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348777AbhI3VNG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Sep 2021 17:13:06 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbAYo-1n7b0j2wqO-00bel8; Thu, 30 Sep 2021 23:11:13 +0200
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20210323221430.3735147-1-laurent@vivier.eu>
 <20210323221430.3735147-3-laurent@vivier.eu>
 <CAMuHMdUFh2W-bY5Ez1aOTZQjq0=THvmOf22JdxWoNNtFLskSzw@mail.gmail.com>
From:   Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
Message-ID: <90ab81cd-0d83-9537-b7d8-40e4bffa152e@vivier.eu>
Date:   Thu, 30 Sep 2021 23:11:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUFh2W-bY5Ez1aOTZQjq0=THvmOf22JdxWoNNtFLskSzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MvX4RX6N5TWXkBxTvXsqxo5ukgEyP4aE7u4NNYBlkHd1ZOJA1if
 2aowt1q5k3thQGS8dCf6HPA6UApo/YcHKUDZVWMniFujuxdstYsAf3qhZxDVJLnvm47Ckb+
 fGJVOJXxHZhyPK6txJmDWuwAt/ByHIXCJGzCUkg4A2RiRMAMxHjBDgCDQ0wlEFGg4Xzo1ye
 SLhjpQYUK1dORP4TzEn/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KSk2j04gCJU=:Nrq8OClLxONIuuVB80d+kd
 sYB7YSMurnBkixuBqbzL0B6x21srE1IlNq6zGCMy4BxnrclSuTROTGBhmVrYATlHF2N974K7t
 LhbHuEL/2jNWENViHZHuMyhCogvez9pmVHQ7v6GmJtP44B47ic6kMsp3odEpRbLeQQklKbTrR
 NKRN8YojUcJyhT4pz0tB1rPBgI522dojFtDhzjem33JdgWU6hgpgkX0LmfpCRqVUDlf0H6Hat
 V7zxH94JTY/zHHjytpNLw4YgNP11wIckd7Skp7scvyh49377yMzICLuiROOQiuevkOIaNhbCT
 FQCAonszYgSnBI+VgvISo7uV+tmepQqRC4Z0GMtlwhqhUI9joEi4hgCf6jXDLrK1aX2nOG4Zk
 9iPHMPXwq/Re+AkCsCLuf1I/xCYWmHdANtof0hJq3eK3pYNEYs5eN7RP3NabfbYIGMyUygkzW
 UNo5xmE2duCGFnjK4x280g7YmAR0dwIzeDH1cFxzxSnz45ZZ4RoGLNfa1wlqpoYPy/CPjDfsY
 n+1BzwoXmTUk0GfZJpVc2P4pKpheROexeLE5Zf2OA2aKaOLIlXCTaTb2R2T6oR11VqvcZVi12
 BQs4qSnUjh3orfNUcWam5eQDAcdLkErNsWGBGHQ3IQr5OPA+8Mjhiy99/ydYNT2/l/L+mWB72
 F0/W35WbFPbuwZ6U+yTmmQpYeV8pt5+N9TQGeGPzlccYRcG9b6HCYZH1k5sS8/fpZGfabNc0V
 ghiVVYdDVEhNAStujIFuIeuDlztpvr/ButRZqg==
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Le 28/04/2021 à 14:04, Geert Uytterhoeven a écrit :
> Hi Laurent,
> 
> On Tue, Mar 23, 2021 at 11:14 PM Laurent Vivier <laurent@vivier.eu> wrote:
>> This machine allows to have up to 3.2 GiB and 128 Virtio devices.
>>
>> It is based on android goldfish devices.
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> 
> Thanks for your patch!

Thank you for the review, sorry for the very late answer.

Only two comments before I send a v2.

>> --- a/arch/m68k/Kconfig.machine
>> +++ b/arch/m68k/Kconfig.machine
>> @@ -145,6 +145,23 @@ config SUN3
>>
>>           If you don't want to compile a kernel exclusively for a Sun 3, say N.
>>
>> +config VIRT
>> +       bool "Virtual M68k Machine support"
>> +       depends on MMU
>> +       select MMU_MOTOROLA if MMU
>> +       select M68040
>> +       select LEGACY_TIMER_TICK
> 
> Can we avoid selecting this for a new platform?
> 

I tried but I was not able to have a working scheduler.

As the machine has been tested with this option and most of the other m68k machines uses it, I will
keep it.

...
>> --- /dev/null
>> +++ b/arch/m68k/virt/platform.c
>> @@ -0,0 +1,80 @@
...
>> +
>> +       if (!MACH_IS_VIRT)
>> +               return -ENODEV;
>> +
>> +       min_low_pfn = 0;
> 
> Why is this needed?
> 

This is needed to be able to have working DMA in goldfish_tty.

Without this, memory provided for the buffer in goldish_tty_rw() are not usable with DMA and we
cannot transfer the data. If I remember correctly dma_map_single() fails.

I think this is because the memory provided by the kernel is not in the DMA area. But the virt
machine has no DMA...

Perhaps you can propose better solution?

Thanks,
Laurent
