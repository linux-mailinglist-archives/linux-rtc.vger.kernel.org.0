Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C59341E2F3
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Sep 2021 23:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345623AbhI3VED (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Sep 2021 17:04:03 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:46079 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhI3VEC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Sep 2021 17:04:02 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MS3vJ-1mPDgh22d1-00TRvk; Thu, 30 Sep 2021 23:02:00 +0200
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20210323221430.3735147-1-laurent@vivier.eu>
 <20210323221430.3735147-3-laurent@vivier.eu>
 <a9c75ae7-6023-6b6c-260f-a0d6841ea4fa@vivier.eu>
 <CAMuHMdW49S_81Oip2p+yUO5YUL1-V3_K_C1WEXux7mQWcb-mKA@mail.gmail.com>
 <c28b0c92-a997-6978-890f-4222f4bb8cc6@vivier.eu>
 <9f7ad0df-b58c-1b24-5c48-5ee6478260dd@physik.fu-berlin.de>
From:   Laurent Vivier <laurent@vivier.eu>
Message-ID: <7748de16-1087-1039-a1cc-5a94dc293dbb@vivier.eu>
Date:   Thu, 30 Sep 2021 23:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9f7ad0df-b58c-1b24-5c48-5ee6478260dd@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KwAzeqLKWmeHvbBipaoWRg9gsbROUHqCygHskcptL60d6q9Kp5G
 +ElasxtHFdquzPB+XB8UuXpI0dBToT4jfg/z4/2CedMqcxtR86v1yMdvcCWMxQKCFe6N4VQ
 B9yNxtbzxan6zlCT8wpvoehKXG7Z0/QHg/PPRU5TTKE3k4He+YszGVJIhKrzUDJ75UmCcic
 KpCD9iMY7vy7l+SE+j9jA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IKF5m6Zp7xk=:dlUvunV4r2NsEQ1dBIzuiL
 Hk2Jna+3DuA2CjDSEwx4Tq0IqIevHdqPJ/XYeQllfdZWboVObG2TaqdTfKl2NknvrAVqFsN/x
 EPx/irCs5HZUgGVXL8JXQzVst1pplqpmpiAUqjrOMhU0CIhVgiUFggBYiv1PhtAudEuRT+DF/
 BoN1hb3LQJru92bfNLOa0+l6Kj3ObDy5caxmhCrfITtGn6E9cq7PisvnHXkl81DtnqN/PSbQK
 il173Q6HDhR9Aoi00SEjRxwfh9HXCrMRAtxb/ZELMMXqqOek7DTZIrcxsYK+D4fMSkJeeDwiD
 R5NdALSC9PvTslCAL8ZHhsp8GO2UZYNBA71GjlvXmp8CyMfD8K/wGHms4TdYuqoSjDVF7y+13
 Hef7U/fNXgX4Bde38ND5Q85DaLPz1zMiBcpDC2EUCB1K6GSQLerfxy+Y2WzC58GcsW8yXlHrv
 m1Mxj4P+Zior7rZ9OXSM5z3syNLLHhv0VH17/OjIuDwy4IZL2+YI8k+49ggr8irTlVwTD06/Q
 dPrwWRYuSGg0vWnt8QtTTapaeL9dJt9txhWbPQhzZDj7BkHLOi1zLcc1gJIZWHy8O1Ju/Y9Vx
 exrejKJznItYO0i2Ax7X9Wmq0CpFgLyZOPrVWsLIuasQDD51I6FnqmYeN/UzlH+7PW174Hqfm
 q5Uzx3DEeA9/hhjEi3xuomwQbJx7ZKXvo6X0Wm+7UDRUr+rmKIKeim6A/9SzoaVJVwHkF+OyT
 kEcuitxScfaqOyjdrpASH7y5lfqQI353XRbMig==
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Le 30/09/2021 à 22:56, John Paul Adrian Glaubitz a écrit :
> Hi Laurent!
> 
> On 4/28/21 14:15, Laurent Vivier wrote:
>>> I have tested and reviewed your patch, great work!
>>> I'm confident this can make v5.14, with the small nits fixed.
>>
>> Thank you for your review.
>>
>> I will answer to some of your comments and update accordingly my patch.
> 
> It looks like this patch somehow fell off the table, didn't it?
> 
> I was hoping to be able to build a virt kernel for Debian/m68k by default
> in the near future.

Yes, I started to update my work according to the comments from Geert but didn't have time to finish.

Especially I tried to remove the LEGACY_TIMER_TICK, but it doesn't work, and as it has been tested
like this by you and most of the other m68k targets uses it I think I will let the patch with it.

I'm going to update my patch to have a v2, at least to have fresh reviews.

Thanks,
Laurent
