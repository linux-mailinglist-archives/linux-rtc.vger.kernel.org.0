Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC5710D812
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 16:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfK2Ps0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 10:48:26 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37351 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfK2Ps0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 Nov 2019 10:48:26 -0500
Received: by mail-qt1-f194.google.com with SMTP id w47so28763776qtk.4
        for <linux-rtc@vger.kernel.org>; Fri, 29 Nov 2019 07:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=k+MY1pE8+wDkc2VX6eKQ+d4ZL/R0nipfT9Ah8/epMAE=;
        b=vF9MfCP8JwWzA6XcHS7q97W3fmbCb6A8wZA0s7AAD7xwW+IM0vpq7t/Ojei9fo1Jsb
         gyT/XHHgyvw1Oxa3DMu8VtWns8Ht2+hmWOypSDmSG+3+9uEOk5r1DqDJnCbXUSvIlD2d
         F+t0epH1AWJzEXHiF1j6p+dQHgt3AwE+YIBjNqdBJ+2Y4OhDv2gjUD4eQhTvs9UWhvF9
         NxBjn25g2mdK1b16NlFNcP6u+RvWnW69Z0A0wL4yDiTpWKQYaYEiP+Fb4hRTofvpEdqX
         Vpy8LAigUQiKGRm2mpkIKiQw4/tJ3nNaYNRa6+JujhUdno5cj55VFfGx2fu1E4mIhIZD
         9Ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=k+MY1pE8+wDkc2VX6eKQ+d4ZL/R0nipfT9Ah8/epMAE=;
        b=US2xiyvI8ZYKKGwbeK1DBcaHlvFoLIBuPxxPuG62DwFQfPm032vYA1/ESezSezAIVm
         8wlK/NWahJXZZW5Wm5mxfHd/5dObRHaMyqBBpDNX043dQV/PzhQ1Pl+Z2i667CTybmiq
         p0BJx49CqD1LtbNuTGvo34qZTXxPa9Skt+kRzjqig7q7XfEBiARNxwybevxJ1QUpEY1q
         QNlZEEv34XYn3KQOfzGgk4UnLupG8HNqMKEyN4Q9e0IZ5zG2zEOLWBcgKfFk4mTzeFoP
         Oi7+08YMCZ18KQSb5XRQy5F8syFGxJYjO7QaWOD3syCZE16CzklIsTvvZm5FF7Ln4mDU
         W4MQ==
X-Gm-Message-State: APjAAAU9BrI9Dr5tKR40mBihzrRROKiwOjwh5OV/3sKq2R/qQLSKcRpc
        V6rmE3sa1Ygq+9x3La8Ozns=
X-Google-Smtp-Source: APXvYqynxtn+lfn+qQyrVwkvMk55DX0wckFRUmv5/3LjQnoi4KTBmG/EZtboR2cI6Dqzgyu2XmnadA==
X-Received: by 2002:ac8:1b02:: with SMTP id y2mr41164285qtj.120.1575042505614;
        Fri, 29 Nov 2019 07:48:25 -0800 (PST)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id r28sm2693001qtu.23.2019.11.29.07.48.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 07:48:25 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 2/2] rtc: zynqmp: fix invalid read_time before 1 second
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20191129151429.GY299836@piout.net>
Date:   Fri, 29 Nov 2019 10:48:24 -0500
Cc:     Michal Simek <michal.simek@xilinx.com>, a.zummo@towertech.it,
        Srinivas Goud <sgoud@xilinx.com>, git@xilinx.com,
        linux-rtc@vger.kernel.org, champagne.guillaume.c@gmail.com,
        =?utf-8?Q?Maxime_Roussin-B=C3=A9langer?= 
        <maxime.roussinbelanger@gmail.com>,
        Mathieu Gallichand <Mathieu.Gallichand@sonatest.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <107BBA0C-2989-4F59-B6A0-7A0313A92E51@gmail.com>
References: <20191128015613.10003-1-jeff.dagenais@gmail.com>
 <20191128015613.10003-2-jeff.dagenais@gmail.com>
 <ca78b7e6-a0c3-745b-1533-6b8424d97623@xilinx.com>
 <CD70064B-5087-4A0F-9197-1F4A3DAA8B50@gmail.com>
 <20191128172957.GS299836@piout.net>
 <6C8E7EEC-A71D-48CE-8128-FACBD77EBD2E@gmail.com>
 <20191129151429.GY299836@piout.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



> On Nov 29, 2019, at 10:14, Alexandre Belloni =
<alexandre.belloni@bootlin.com> wrote:
>=20
>> Bits 30:28 are reserved, and not 0x0 as this reference page suggests, =
so who knows
>> what the bits mean... well someone at Xilinx knows!
>>=20
>=20
> According to this link, bit 24 is Crystal Enable which I would think
> would also enable the RTC.

Yes, my bad.

>=20
>>>=20
>>> I ask because the simpler solution would simply to return -EINVAL in
>>> xlnx_rtc_read_time when you detect a power on condition.
>>=20
>> That could also work, but how would we determine that? Oh, perhaps by =
looking at
>> the Battery_Enable (31) bit. But then we would need to keep it =
disabled during
>> probe so that the time_read could test the bit to see if current_time =
is valid,
>> and then after this, when would we enable it? Perhaps at the first =
call to
>> set_time_write? This is all interesting but for now we have run out =
of time to
>> investigate further. Unless someone comes up with a ready made =
alternative
>> solution, we here are actually going to go into production with our =
patch. It
>> works well.
>=20
> Yes, this is exactly what should be done. leave the RTC in PON state
> until userspace sets the time. Until then, -EINVAL must be returned by
> .read_time.

Mathieu Gallichand pointed out, from ug1085:

IMPORTANT: The control register must be programmed every time the LPD is =
powered
on. Otherwise, the value returned by reading the control register can be
different from the actual control settings stored in the BPD.

So according to this, reading the control register to get bit 31 status =
is not a
recommended way to determine whether current_time is valid or not.=
