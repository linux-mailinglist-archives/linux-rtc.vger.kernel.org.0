Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AC936D715
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Apr 2021 14:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhD1MQ2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Apr 2021 08:16:28 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39593 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhD1MQ2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Apr 2021 08:16:28 -0400
Received: from [192.168.100.1] ([82.142.25.254]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M3UEW-1lcHKj0ad0-000aaE; Wed, 28 Apr 2021 14:15:39 +0200
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20210323221430.3735147-1-laurent@vivier.eu>
 <20210323221430.3735147-3-laurent@vivier.eu>
 <a9c75ae7-6023-6b6c-260f-a0d6841ea4fa@vivier.eu>
 <CAMuHMdW49S_81Oip2p+yUO5YUL1-V3_K_C1WEXux7mQWcb-mKA@mail.gmail.com>
From:   Laurent Vivier <laurent@vivier.eu>
Message-ID: <c28b0c92-a997-6978-890f-4222f4bb8cc6@vivier.eu>
Date:   Wed, 28 Apr 2021 14:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW49S_81Oip2p+yUO5YUL1-V3_K_C1WEXux7mQWcb-mKA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sb/qgeeflS+pkAWZpgXZMoYCtHFwbrXG1VGnq/LMuaMRSKu6LDS
 vB3YfIAphfsGexO647UzjvqLPG+lpt1Vj8Kq4nw9IFT3KJn/rkCp9N3dAuMfqfdHojTYxs3
 QFSA91fRtqe9e7ZQDnJbNRWlciwU25IphJQlILztMW6ljT3mgOE1LIExxKYIYwi4929VYnT
 2bFQhIUdvOQ86a3/8GqJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OHRpabYt+ao=:9GVzQ2AQGBqqENIxAjteiS
 2MBXnYCy4XEZodknBLzXIuwhQLKt4t8xcB5CXhnNTARcduAEE4BONYMzeg4C+LaKYDiR1nTCs
 g3hFCeRcedOUFjKW71XXTo3L17q/BKSVhRuCbwchBPQsSU9xxncXaXzULgBiePckx302+yjBa
 qdwwGDJlPdJnn0fR6WxeUQ0u5AzJbw0jFq6a+yONkUNMxUabWiaZObtymGO7NMDGX3F9q9XBr
 RlcxqDhGxscQwJwaCaEHiHUHVsG6NMs905hkvo9gYsggO5JWWpQjhGhHanJzSy7tBGGdmhE3W
 MSA0RLCn9iy7NGDcgrbH7Ahzd4f6cXpfm/M9ddP0l1CeuJXDfZaYyTBMfOO5F8NHe+B00CDeZ
 zs36zsbolOfCREuWDHcCdPdxy4x8K29m1q1V/zflsYuxFVKrWTa0gqOtamw4ZsQyRVsCeN1z5
 5FFg3feccoXRRg+6/25r6X5OlZ8O7m2ud0JL6Dgc3wyiA7D7CBli2Yd8oIANNFy+SUduTPFgK
 LfMTonS7kuVeaOQgWGK970=
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Le 28/04/2021 à 14:07, Geert Uytterhoeven a écrit :
> Hi Laurent,
> 
> On Tue, Apr 27, 2021 at 7:20 PM Laurent Vivier <laurent@vivier.eu> wrote:
>> Le 23/03/2021 à 23:14, Laurent Vivier a écrit :
>>> This machine allows to have up to 3.2 GiB and 128 Virtio devices.
>>>
>>> It is based on android goldfish devices.
>>>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> 
>> As 5.12 has been released, is this possible to consider having this new machine in the next release?
>>
>> All changes are contained under arch/m68k and protected by the CONFIG_VIRT flag. This should not
>> have any impact on the other m68k machines. In any case, I'll be able to maintain the machine and
>> fix any problem.
> 
> Thanks for the reminder!
> 
> Please accept my apologies: I had completely forgotten about your patch.
> By the time it reappeared on my radar (due to Alexandre's reply), it was
> already too late for v5.13.

No problem.

> I have tested and reviewed your patch, great work!
> I'm confident this can make v5.14, with the small nits fixed.

Thank you for your review.

I will answer to some of your comments and update accordingly my patch.

Thanks,
Laurent
