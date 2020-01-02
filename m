Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0008012E7B0
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jan 2020 16:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbgABO7m (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Jan 2020 09:59:42 -0500
Received: from mail-io1-f43.google.com ([209.85.166.43]:33115 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgABO7m (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Jan 2020 09:59:42 -0500
Received: by mail-io1-f43.google.com with SMTP id z8so38508344ioh.0;
        Thu, 02 Jan 2020 06:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SbJOwHXw4vfZE5TxEI4aCOOsbnyKNkt4sp9tT+NxXPQ=;
        b=W45FbXt0jdFw5R4/KptHImueplu6OsOwANUlORGQJ9H4rKCjCmmhZVbgaPSdpcH6/8
         Bx4Np0c0ishKn7k6cx6ibQVdpRHuf/1+w0kzCpD3DUpL1RiIt+qx5XqAK8Sblkr0M2+M
         POqksZ11t5S91ZqLM6JBpkvyTcI+URPU45h9jfyuqtlCKhcVFyr8Y219a6CmwksEGgsP
         rJBnHykcc2DBcLILKsf6Fx7M+cQZrZoboXjz2g0eZBEYbUBnAXUKIBKTyrMVtY7rj5Nc
         go0guGQwUwNX+3N6ZF2ef/2lzIopry5CiGT3pFVc/HiTVyiKwR1zp/6Ttqd9haqE10CC
         ZTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SbJOwHXw4vfZE5TxEI4aCOOsbnyKNkt4sp9tT+NxXPQ=;
        b=ENgq7qJ/9eJv6SrpEPEunLurTI3zrPeCd9pJfd1DQ+4dHqFO7JtHeoKLTjqz6IsrRR
         azEXKpV/l1OG3OVf61TDtzrYXO19awGvtPPSLF93Gg+IGbPEq3SPgBXGaEMz1ktjmFmZ
         FH22dsi1wN1rcTqpika5MENIzTzyHIPFIEmffa46Scb1E+0Q9AN75uBgXgkl7nw99enF
         Z6ghqkO8XH8PP0u4OztvdWRZBZl74xUrbysvgowMYFb6feWBN1KvsGPeYPmeB2NFMLKk
         P7epzR6EQPv6uuCokvqKF8dZ8obuIjeocwImg9IVvrUTRyDBra6DXDKypsImHiWCMbLL
         MfNA==
X-Gm-Message-State: APjAAAWmThjmTG3A4i3ZMs8IipA+TeaEGeIKbUOGJhhf/cojemhkZfE+
        Z4VrNeS4Lt0RoiID4RGOH7Ynzj6KpCyH3GXRhEI=
X-Google-Smtp-Source: APXvYqwtnVBhFgvdrLrZmgps62Q2fDKSg8rKuzc/RCagPcGTllYeU98rOhGq5p4TeUZHZ757HhKg19VgJpFiLmxhLdE=
X-Received: by 2002:a5e:a614:: with SMTP id q20mr46610554ioi.36.1577977181127;
 Thu, 02 Jan 2020 06:59:41 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsODr3tMpQxJ_nhWQQg5WGakFt4Yu5B8ev6ErOkc+zv9kA@mail.gmail.com>
 <20200101141748.GA191637@mit.edu> <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10> <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
 <20200102131434.tky2hquki23laqqo@10.255.255.10>
In-Reply-To: <20200102131434.tky2hquki23laqqo@10.255.255.10>
From:   Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Thu, 2 Jan 2020 20:00:20 +0500
Message-ID: <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right time
To:     Karel Zak <kzak@redhat.com>
Cc:     util-linux@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 2 Jan 2020 at 18:14, Karel Zak <kzak@redhat.com> wrote:
>
> At first glance it seems hwclock works as expected, I do not see
> anything wrong in the output.
>
> > Demonstration: https://youtu.be/Yx27IH2opEc
>
> What is hw time before reboot? Can you verify that hwclock reset the
> clock? (or is it system reboot?)
>
>     # hwclock -w -v
>     # hwclock -v
>
> Do you see anything interesting in dmesg output before reboot and after
> hwclock -w?
>
>

Yes, before reboot all look like good:

[root@localhost ~]# hwclock -v
hwclock from util-linux 2.35-rc1-20-63f8
System Time: 1577977370.909455
Trying to open: /dev/rtc0
Using the rtc interface to the clock.
Last drift adjustment done at 1577973311 seconds after 1969
Last calibration done at 1577973311 seconds after 1969
Hardware clock is on UTC time
Assuming hardware clock is kept in UTC time.
Waiting for clock tick...
...got clock tick
Time read from Hardware Clock: 2020/01/02 15:02:52
Hw clock time : 2020/01/02 15:02:52 = 1577977372 seconds since 1969
Time since last adjustment is 4061 seconds
Calculated Hardware Clock drift is 0.000000 seconds
2020-01-02 20:02:51.077494+05:00


[root@localhost ~]# hwclock -w -v
hwclock from util-linux 2.35-rc1-20-63f8
System Time: 1577977383.789039
Trying to open: /dev/rtc0
Using the rtc interface to the clock.
Last drift adjustment done at 1577973311 seconds after 1969
Last calibration done at 1577973311 seconds after 1969
Hardware clock is on UTC time
Assuming hardware clock is kept in UTC time.
RTC type: 'rtc_cmos'
Using delay: 0.500000 seconds
missed it - 1577977383.789405 is too far past 1577977383.500000
(0.289405 > 0.001000)
1577977384.500000 is close enough to 1577977384.500000 (0.000000 < 0.002000)
Set RTC to 1577977384 (1577977383 + 1; refsystime = 1577977383.000000)
Setting Hardware Clock to 15:03:04 = 1577977384 seconds since 1969
ioctl(RTC_SET_TIME) was successful.
Not adjusting drift factor because the --update-drift option was not used.
New /etc/adjtime data:
0.000000 1577977383 0.000000
1577977383
UTC


[root@localhost ~]# hwclock -v
hwclock from util-linux 2.35-rc1-20-63f8
System Time: 1577977389.540630
Trying to open: /dev/rtc0
Using the rtc interface to the clock.
Last drift adjustment done at 1577977383 seconds after 1969
Last calibration done at 1577977383 seconds after 1969
Hardware clock is on UTC time
Assuming hardware clock is kept in UTC time.
Waiting for clock tick...
...got clock tick
Time read from Hardware Clock: 2020/01/02 15:03:10
Hw clock time : 2020/01/02 15:03:10 = 1577977390 seconds since 1969
Time since last adjustment is 7 seconds
Calculated Hardware Clock drift is 0.000000 seconds
2020-01-02 20:03:09.718222+05:00

But after reboot, the hwtime is reset:

=== Reboot ===


[root@localhost ~]# hwclock -v
hwclock from util-linux 2.35-rc1-20-63f8
System Time: 1576407103.342223
Trying to open: /dev/rtc0
Using the rtc interface to the clock.
Last drift adjustment done at 1577977383 seconds after 1969
Last calibration done at 1577977383 seconds after 1969
Hardware clock is on UTC time
Assuming hardware clock is kept in UTC time.
Waiting for clock tick...
...got clock tick
Time read from Hardware Clock: 2019/01/01 00:05:31
Hw clock time : 2019/01/01 00:05:31 = 1546301131 seconds since 1969
Time since last adjustment is -31676252 seconds
Calculated Hardware Clock drift is 0.000000 seconds
2019-01-01 05:05:30.170661+05:00

[root@localhost ~]# date
Sun 15 Dec 2019 03:52:01 PM +05


Demonstration: https://youtu.be/X0w2hbAmKmM


--
Best Regards,
Mike Gavrilov.
