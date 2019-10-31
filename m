Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F28AEAFF9
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2019 13:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfJaMQ7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 31 Oct 2019 08:16:59 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:39392 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaMQ7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 31 Oct 2019 08:16:59 -0400
X-Greylist: delayed 590 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Oct 2019 08:16:58 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=compulab.co.il; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Lo6sngbybV0t4nUjudPXJgI9iQk3RLDVGUyCk7k6nJU=; b=WMPZQqj79vs+7Tp9eo995nIjph
        Aj62DtzMPVI0Wl+6N3buqrhwXhtvQgyFrgWzk7ZXL+YulGrLGhpxP6h+aM/pd0sgQWdrR4PAAKglk
        4cBt2j/3s8ay7LkXhO+3TTOFkJFcXla9ikwMmyZ8dhmCLZKSs3KkcgFjta84OUPvktZCC1aXzFxDL
        elVjEjQPXKS3SWVAln0XpShFCElTptAO5D0QWi2656VaV/FG+AUoWtRl8DD0d0RYvSWsF8s9UpEgC
        hfYWQe0gq21AbI1n505KJVpquB0IOqvEmzAHgN3f9pFFLVQazaMobPtTK5cX45cc5TO4Xh0+i5bL8
        M8c2/lHA==;
Received: from [37.142.126.90] (port=52916 helo=zimbra-mta.compulab.co.il)
        by clab.compulab.co.il with esmtp (Exim 4.92)
        (envelope-from <ilya@compulab.co.il>)
        id 1iQ9Np-0003Dc-EA; Thu, 31 Oct 2019 08:16:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTP id C98A5481B3C;
        Thu, 31 Oct 2019 14:16:56 +0200 (IST)
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
        by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ZAquSMUgSGQd; Thu, 31 Oct 2019 14:16:56 +0200 (IST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 81156481B3D;
        Thu, 31 Oct 2019 14:16:56 +0200 (IST)
X-Virus-Scanned: amavisd-new at zimbra-mta.compulab.co.il
Received: from zimbra-mta.compulab.co.il ([127.0.0.1])
        by localhost (zimbra-mta.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id l5eT2hS3GqO7; Thu, 31 Oct 2019 14:16:56 +0200 (IST)
Received: from [192.168.11.9] (unknown [192.168.11.9])
        by zimbra-mta.compulab.co.il (Postfix) with ESMTP id 52B3B481B3C;
        Thu, 31 Oct 2019 14:16:56 +0200 (IST)
Subject: Re: [PATCH] rtc: em3027: correct month value
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-rtc@vger.kernel.org
References: <20191031073643.19410-1-ilya@compulab.co.il>
 <CABMQnVJ-Y4fiE3LnS=JpGHyGdf11KTf0xnmnd-5h5=zpQAx0TQ@mail.gmail.com>
 <20191031102717.GB2967@piout.net>
From:   Ilya Ledvich <ilya@compulab.co.il>
Message-ID: <3f60699a-9012-14ff-19e8-3961a922c325@compulab.co.il>
Date:   Thu, 31 Oct 2019 14:16:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191031102717.GB2967@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - clab.compulab.co.il
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Get-Message-Sender-Via: clab.compulab.co.il: mailgid via get_recent_authed_mail_ips_entry: ilya@compulab.co.il/cached: full match of from_h in recent_authed_mail_ips_users
X-Authenticated-Sender: clab.compulab.co.il: ilya@compulab.co.il
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 10/31/19 12:27 PM, Alexandre Belloni wrote:
> On 31/10/2019 18:53:00+0900, Nobuhiro Iwamatsu wrote:
>> Hi,
>>
>> 2019=E5=B9=B410=E6=9C=8831=E6=97=A5(=E6=9C=A8) 16:57 Ilya Ledvich <ily=
a@compulab.co.il>:
>>> The RTC month value is 1-indexed, but the kernel assumes it is 0-inde=
xed.
>>> This may result in the RTC not rolling over correctly.
>>>
>>> Signed-off-by: Ilya Ledvich <ilya@compulab.co.il>
>>> ---
>>>   drivers/rtc/rtc-em3027.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
>>> index 77cca1392253..ef3792543f93 100644
>>> --- a/drivers/rtc/rtc-em3027.c
>>> +++ b/drivers/rtc/rtc-em3027.c
>>> @@ -71,7 +71,7 @@ static int em3027_get_time(struct device *dev, stru=
ct rtc_time *tm)
>>>          tm->tm_hour     =3D bcd2bin(buf[2]);
>>>          tm->tm_mday     =3D bcd2bin(buf[3]);
>>>          tm->tm_wday     =3D bcd2bin(buf[4]);
>>> -       tm->tm_mon      =3D bcd2bin(buf[5]);
>>> +       tm->tm_mon      =3D bcd2bin(buf[5]) - 1;
>>>          tm->tm_year     =3D bcd2bin(buf[6]) + 100;
>>>
>>>          return 0;
>>> @@ -94,7 +94,7 @@ static int em3027_set_time(struct device *dev, stru=
ct rtc_time *tm)
>>>          buf[3] =3D bin2bcd(tm->tm_hour);
>>>          buf[4] =3D bin2bcd(tm->tm_mday);
>>>          buf[5] =3D bin2bcd(tm->tm_wday);
>>> -       buf[6] =3D bin2bcd(tm->tm_mon);
>>> +       buf[6] =3D bin2bcd(tm->tm_mon) + 1;
>> I think '+'1 should be set in bin2bcd().
>>
> This is correct.
Thank you for the note. I'll fix it and send v2.
> Ilya, could you also run
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/=
tree/rtc-range.c
> on that rtc? I'm interested in the full output. It seems this RTC
> working range is 2000 to 2079
>
According to the data sheet its range is 2000 to 2079 indeed.
Please find the full output below.
---
Testing 2000-02-28 23:59:59.
OK

Testing 2038-01-19 03:14:07.
OK

Testing 2069-12-31 23:59:59.
OK

Testing 2099-12-31 23:59:59.
KO=C2=A0 Read back 2019-12-31 23:59:59.

Testing 2100-02-28 23:59:59.
KO=C2=A0 Read back 2000-02-28 23:59:59.

Testing 2106-02-07 06:28:15.
KO=C2=A0 Read back 2006-02-07 06:28:15.

Testing 2262-04-11 23:47:16.
KO=C2=A0 Read back 2062-04-11 23:47:16.

---

Kind regards,
