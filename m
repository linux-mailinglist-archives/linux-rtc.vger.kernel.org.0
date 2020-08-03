Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B95239DDE
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Aug 2020 05:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgHCDjl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 2 Aug 2020 23:39:41 -0400
Received: from m12-12.163.com ([220.181.12.12]:52209 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgHCDjk (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 2 Aug 2020 23:39:40 -0400
X-Greylist: delayed 935 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 Aug 2020 23:39:37 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=RXW0q
        5HGAPL9lZFOmE/uLbJyaSyjIysQKTRjLLWzOa0=; b=f9laFjhFtK1GNqCQuih0G
        Y9yLyP57akR1wnh4lv2gaatp2fGjcGRBOG4uz1KI2yWGXTF3dHty+EmUxM0O4rKj
        HuLHYZk0q7KAJMb1XX6F1ytPlTGxyPLFtTR7Sfm1dJ6SVTto2rIQrImfHcd1DqST
        w9jmViDIrtoOXJ6vXhdlD4=
Received: from [192.168.1.166] (unknown [58.33.79.51])
        by smtp8 (Coremail) with SMTP id DMCowABXX8N4fydfGnHyGw--.7231S2;
        Mon, 03 Aug 2020 11:07:37 +0800 (CST)
Subject: Re: [PATCH] rtc: interface^ 1969-12-31T23:59:59 is set as rtc_time if
 rtc_time is invalid in __rtc_read_time
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
References: <20200801112007.2148-1-von81@163.com>
 <20200801132813.GE3679@piout.net>
 <a83510fa-54be-8dc1-8ec1-b2957346e402@163.com>
 <20200802130439.GF3679@piout.net>
From:   Grant Feng <von81@163.com>
Message-ID: <cafe8292-4ed6-6839-b5ea-20ae98bb70f9@163.com>
Date:   Mon, 3 Aug 2020 11:07:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <20200802130439.GF3679@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowABXX8N4fydfGnHyGw--.7231S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4xWw4kAFW7Jw1UtFW5KFg_yoW5Ww1rpa
        y5KanFvFyDt3y8Zrnrtr1kXa4Fg347Wa15Ar95t3y2yr1UXryxGFZ3WrnrW34kA3s3AwnI
        yw4kWF4fAFyDuaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bT1vsUUUUU=
X-Originating-IP: [58.33.79.51]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiRBl1OlSIgYma5AAAs4
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Thank you again for your patience to explain.
I get the log and now I get it.

commit 812318a094d0715194d9f686b22ee67e7dc59d93
Author: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date:   Wed Feb 21 11:44:26 2018 +0100

     rtc: cmos: let the core handle invalid time

     Setting the rtc to a valid time when the time is invalid is a bad 
practice,
     because then userspace doesn't know it shouldn't trust the RTC.

     Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

then you removed the following code fragment in "drivers/rtc/rtc-cmos.c":

-       cmos_read_time(&pdev->dev, &time);
-       ret = rtc_valid_tm(&time);
-       if (ret) {
-               struct rtc_time def_time = {
-                       .tm_year = 1,
-                       .tm_mday = 1,
-               };
-               cmos_set_time(&pdev->dev, &def_time);
-       }


On 2020-08-02 21:04, Alexandre Belloni wrote:
> On 02/08/2020 14:51:41+0800, Grant Feng wrote:
>> On 2020-08-01 21:28, Alexandre Belloni wrote:
>>> On 01/08/2020 19:20:07+0800, Grant Feng wrote:
>>>> 1969-12-31T23:59:59 is an error more clear than Invalid argument
>>> Definitively not, 1969-12-31T23:59:59 is a valid date and should not be
>>> returned when it is known the current date is not set in the RTC.
>> 'rtc_valid_tm' is used to check rtc_time and 1969-12-31T23:59:59 is invalid.
>> when the RTC clock is not set, some rtc devices always return '0' or almost
>> random data, and different rtc devices may give different return data.
>> so, I think, it's usful to return a default date when the current date is
>> not set in the RTC.
> You are not solving the issue you mention here. If the RTC doesn't know
> whether the date/time is invalid and the core think it is valid, then
> your code will not run.
>
>>>> For example, when the RTC clock is not set, it will print a kernel
>>>> error log every time someone tries to read the clock:
>>>>           ~ # hwclock -r
>>>>           hwclock: RTC_RD_TIME: Invalid argument
>>>>
>>>> It's clear and easy to understand what happened if print
>>>> 1969-12-31T23:59:59 in this situation：
>>>>           ~ # hwclock -r
>>>>           Wed Dec 31 23:59:59 1969  0.000000 seconds
>>>>
>>> How do you know this is an error an not what is actually set on the RTC?
>> 'rtc_valid_tm' will check rtc_time when someone set the RTC, the time
>> should not be earlier than 1970-1-1T00:00:00. so 1969-12-31T23:59:59
>> can not be actually set on the RTC.
>>      When someone get
>> ~ # hwclock -r
>> Wed Dec 31 23:59:59 1969  0.000000 seconds
>>      he knows: the RTC time doesn't match my watch, change it now.
>> but still lots of people don't know what happened if they see
>> ~ # hwclock -r
>> hwclock: RTC_RD_TIME: Invalid argument
>>
> This makes userspace checking for errors way worse. Think about it, first
> userspace will need to check for an error when calling the ioctl then it
> will have to check the time and consider a vlid date invalid. Seriously,
> if hwclock doesn't do what you want, you can either patch it or use
> another tool.
>

