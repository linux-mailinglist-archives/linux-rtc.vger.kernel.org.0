Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120AF235733
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Aug 2020 15:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgHBNvA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 2 Aug 2020 09:51:00 -0400
Received: from m12-15.163.com ([220.181.12.15]:34301 "EHLO m12-15.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbgHBNu7 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 2 Aug 2020 09:50:59 -0400
X-Greylist: delayed 922 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 Aug 2020 09:50:53 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=+ShfK
        DomNN2s+qqsQ0CQGRdmi9HK6wq+fW2+8HB1wYY=; b=k2eykX5ug1a9am0J+1pBE
        lTtuS8X+4ZBWYOLf86Nf+Djbwa118Gw3qdHKavcqssbdU+Uq2xT5lVVutiU1naAV
        3sEhXK4CVAYvmE9g61mzIzv0fvVnBP8SnMBeEYUTS2Tpotce60c5Y6Xcotnp3bEY
        Q4PBEDH2i7UPrDjNgvdaqM=
Received: from [192.168.1.6] (unknown [120.204.166.56])
        by smtp11 (Coremail) with SMTP id D8CowAA3K6MMwSZfDXulDw--.55911S2;
        Sun, 02 Aug 2020 21:35:09 +0800 (CST)
Subject: Re: [PATCH] rtc: interface^ 1969-12-31T23:59:59 is set as rtc_time if
 rtc_time is invalid in __rtc_read_time
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
References: <20200801112007.2148-1-von81@163.com>
 <20200801132813.GE3679@piout.net>
 <a83510fa-54be-8dc1-8ec1-b2957346e402@163.com>
 <20200802130439.GF3679@piout.net>
From:   Grant Feng <von81@163.com>
Message-ID: <6775e458-d563-5e2a-91ee-9b6e96ab965c@163.com>
Date:   Sun, 2 Aug 2020 21:35:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <20200802130439.GF3679@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowAA3K6MMwSZfDXulDw--.55911S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF18Ary7Xr4fAF1fZF13urg_yoW8uw1rp3
        yUKanFvFWDt3y8ZFnrtw18Xa4rK347W3Z8Ar9Yy3sFyryDXryxGFZ3WrsIg3yDJw1fAwn0
        v3ykWF4fAFyDuaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j_jjgUUUUU=
X-Originating-IP: [120.204.166.56]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/xtbBLQx0OlziY7htqgAAsN
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Thank you for explaining that.


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

