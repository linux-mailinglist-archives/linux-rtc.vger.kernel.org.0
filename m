Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8FE12E906
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jan 2020 17:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgABQ7n (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Jan 2020 11:59:43 -0500
Received: from mout.gmx.net ([212.227.17.20]:38663 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728847AbgABQ7n (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 2 Jan 2020 11:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1577984379;
        bh=hcI6wgTi27byyWYFcz27dZvX9Phw0PngcFwLpTBjcPM=;
        h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:References;
        b=ML/UuW2n9l6NupSxIADzOdTEy+WRFAtWJwCaH1OgCdy2frs9YgXa9dEXDqoGjJ7Js
         mrVbf/Yb8rIULnvhPPqAdun8BRFITuzOtzmyQS00dYSzOgwEVf6J5K0zJOTHTdj4c+
         y0nG6pUeq7JwGgQlSV9o7S139TAKu2iJu6WTgZd8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mua.gmx.com ([68.56.186.98]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MG9kC-1iwxIk2BLA-00GagB; Thu, 02
 Jan 2020 17:59:38 +0100
Date:   Thu, 2 Jan 2020 11:58:58 -0500 (EST)
From:   J William Piggott <elseifthen@gmx.com>
To:     Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
cc:     Karel Zak <kzak@redhat.com>, util-linux@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right
 time
In-Reply-To: <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
Message-ID: <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz>
References: <CABXGCsODr3tMpQxJ_nhWQQg5WGakFt4Yu5B8ev6ErOkc+zv9kA@mail.gmail.com> <20200101141748.GA191637@mit.edu> <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com> <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10> <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com> <20200102131434.tky2hquki23laqqo@10.255.255.10> <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:5TKx8xy8qmJ5E+yAhTBZmCtFGJoSkJpie1Qt3VBe/Tavy+gRvc7
 5iqoebB26dYO0+4/FrORDmCEnOYMTsO8QNXdKwGJDYloBFhfjQIiwh+/0YDSxI9KQS0ZGza
 3VAfF8MjvN6PyrPanEEKD1o1Qqx0qpqQGWKQOqM7J2s5eZgXkqz2Jz/Lw7acxXoFn6/AEf2
 hSljVHNLGPDJasPcpUvAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4KLlH8Xrhbg=:jKm4kAyJv5bnbCsEvxiIb1
 e0d4DoC8WAalR58tA03fniy+0Ta4h1jrcFT0AdlLjjZ6bK/vka8Hk6S2J19X397Vq+ciGk3zW
 xHO7zVGjTuHZYh6fx/IO+OmZsN4f2gqbQxMhe+mNdO9vjqdG8mnwcFq6AT0lEq/1WeSFDeA6m
 yAEzeQbCHv65JtW5OYAMdXPwAMSNmEcVheNm4dB8mR1RDP3yxJC89K+65KmD2+/34He07XvtB
 nkEM4Op5yiNLf+kpcnAy701moY2u9rHMfAhIpYyXrUfk8Rv9dHt1ttMoN88OjNB77woWKtIyg
 bL/oY7e3HGH4GaLQepFx5PqYO+FiRIWQ+T3Xd+HDMqJvPA7XoDBd88HbsvzDNlPqRKMGBtans
 JkclYRa0j2e+XCLv9oh4boQukeLi908WenQwBpZMFpX2+pTVerQzvoFV466Jd1U8HagEy6QD2
 Ocm6c9rkm2jHfLqNnZSygC/+5DRjOXb+JZfb0iPiKisDDy2XyGSFDl/RryOERk1XlrfJfJEfe
 Easp7iM3ja+ywJ+maKXuIrjaZTJiW2GFY4qbvbeaCctqhLCKRPf4Kfh0KYnAL7/lXvpD3A4M5
 a9a73cT8Ruyc/uVdcJslh/3bViouvBktidt6Vhc23gR5ZlBDinGN9fbEyIlO5w062AxWUHy/i
 b/25EoLejtyGi60BIBvLn4uNWdRVN2fKNwp9i4KtFEA1mhNCbxgMLwkXJ91AZGIAGg8Cr4z8F
 ao0d4ObtxRQl8MGfwhPPtvi5EFM4yQux7lli/RewuxTrumsYSMTX24Ll/4Z5iuGHnUfrbo2p4
 87lXegX6oQMmoY1gkbP5tQaDgbafE6zhZD58SS7sQsx0Aa8ZWwKPwjZYTBKCidUatGrmzTMWt
 N9mNATlpJ2ejOp7TE6rbYYQ7arBdHCbmX7pPIE+PK9JPDg/w8KGxW237xwpszRKd1AsV4N8vW
 pdSIq0fyr6TsblVutQ4jxtbBLaIeZtZ0RQaLHL1Wq9DvO/Ww4yUSurEluo4xaBmwLc4BCFLru
 2sYImBhDm6DP4W1mOT5SPc5oEfO/6Nnrec5Hym6YHA3hL2OIZ4Wok81kCib+K0NsmJFFD/S3L
 J9m6SGoi5Vd/ce5fgFhtBu4o9QRTEredmhelbI7TckqbhQdG4n6F40RsTJ4EaXDH9HyZrVOSq
 DGqrQ+lehd3+oscKYOZqtx5Is1H+EDS4pNsv+ZyYiPIcdHErJht5D7SR2Iw72W4+tRCZUlBKz
 N4o8hq8FWnfsCl5lm0T71O8jVOgVNAXns4jLZSqPi3CfBNS9l70rndhYCazA=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Thu, 2 Jan 2020, Mikhail Gavrilov wrote:

> On Thu, 2 Jan 2020 at 18:14, Karel Zak <kzak@redhat.com> wrote:
>>
>> At first glance it seems hwclock works as expected, I do not see
>> anything wrong in the output.
>>
>>> Demonstration: https://youtu.be/Yx27IH2opEc
>>
>> What is hw time before reboot? Can you verify that hwclock reset the
>> clock? (or is it system reboot?)
>>
>>     # hwclock -w -v
>>     # hwclock -v
>>
>> Do you see anything interesting in dmesg output before reboot and after
>> hwclock -w?
>>
>>
>
> Yes, before reboot all look like good:
>
> [root@localhost ~]# hwclock -v
> hwclock from util-linux 2.35-rc1-20-63f8
> System Time: 1577977370.909455
> Trying to open: /dev/rtc0
> Using the rtc interface to the clock.
> Last drift adjustment done at 1577973311 seconds after 1969
> Last calibration done at 1577973311 seconds after 1969
> Hardware clock is on UTC time
> Assuming hardware clock is kept in UTC time.
> Waiting for clock tick...
> ...got clock tick
> Time read from Hardware Clock: 2020/01/02 15:02:52
> Hw clock time : 2020/01/02 15:02:52 = 1577977372 seconds since 1969
> Time since last adjustment is 4061 seconds
> Calculated Hardware Clock drift is 0.000000 seconds
> 2020-01-02 20:02:51.077494+05:00
>
>
> [root@localhost ~]# hwclock -w -v
> hwclock from util-linux 2.35-rc1-20-63f8
> System Time: 1577977383.789039
> Trying to open: /dev/rtc0
> Using the rtc interface to the clock.
> Last drift adjustment done at 1577973311 seconds after 1969
> Last calibration done at 1577973311 seconds after 1969
> Hardware clock is on UTC time
> Assuming hardware clock is kept in UTC time.
> RTC type: 'rtc_cmos'
> Using delay: 0.500000 seconds
> missed it - 1577977383.789405 is too far past 1577977383.500000
> (0.289405 > 0.001000)
> 1577977384.500000 is close enough to 1577977384.500000 (0.000000 < 0.002000)
> Set RTC to 1577977384 (1577977383 + 1; refsystime = 1577977383.000000)
> Setting Hardware Clock to 15:03:04 = 1577977384 seconds since 1969
> ioctl(RTC_SET_TIME) was successful.
> Not adjusting drift factor because the --update-drift option was not used.
> New /etc/adjtime data:
> 0.000000 1577977383 0.000000
> 1577977383
> UTC
>
>
> [root@localhost ~]# hwclock -v
> hwclock from util-linux 2.35-rc1-20-63f8
> System Time: 1577977389.540630
> Trying to open: /dev/rtc0
> Using the rtc interface to the clock.
> Last drift adjustment done at 1577977383 seconds after 1969
> Last calibration done at 1577977383 seconds after 1969
> Hardware clock is on UTC time
> Assuming hardware clock is kept in UTC time.
> Waiting for clock tick...
> ...got clock tick
> Time read from Hardware Clock: 2020/01/02 15:03:10
> Hw clock time : 2020/01/02 15:03:10 = 1577977390 seconds since 1969
> Time since last adjustment is 7 seconds
> Calculated Hardware Clock drift is 0.000000 seconds
> 2020-01-02 20:03:09.718222+05:00
>
> But after reboot, the hwtime is reset:
>
> === Reboot ===
>
>
> [root@localhost ~]# hwclock -v
> hwclock from util-linux 2.35-rc1-20-63f8
> System Time: 1576407103.342223
> Trying to open: /dev/rtc0
> Using the rtc interface to the clock.
> Last drift adjustment done at 1577977383 seconds after 1969
> Last calibration done at 1577977383 seconds after 1969
> Hardware clock is on UTC time
> Assuming hardware clock is kept in UTC time.
> Waiting for clock tick...
> ...got clock tick
> Time read from Hardware Clock: 2019/01/01 00:05:31
> Hw clock time : 2019/01/01 00:05:31 = 1546301131 seconds since 1969
> Time since last adjustment is -31676252 seconds
> Calculated Hardware Clock drift is 0.000000 seconds
> 2019-01-01 05:05:30.170661+05:00
>
> [root@localhost ~]# date
> Sun 15 Dec 2019 03:52:01 PM +05
>
>
> Demonstration: https://youtu.be/X0w2hbAmKmM

You've demonstrated that 'hwclock -w' does not 'reset' the RTC.

Does your new motherboard use a battery backup for the RTC?
Is the battery good?

>
>
> --
> Best Regards,
> Mike Gavrilov.
>
