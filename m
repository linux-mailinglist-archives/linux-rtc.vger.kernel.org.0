Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464162355BD
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Aug 2020 08:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgHBGwI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 2 Aug 2020 02:52:08 -0400
Received: from m12-11.163.com ([220.181.12.11]:39000 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbgHBGwI (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 2 Aug 2020 02:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=r13KD
        EgDWCr7X3hSoZH0nycPa59zKHkE7FQQh8lAqFo=; b=G7HL8RV211krs4XHMSUPS
        n32krnYaKy0W04hKMgmSHhdkteFe4C6G02Y8wDup9uQPvRKKu9FVFuNpKhkuDAJs
        1i0cEvipaixJW4tdrcsUZUlEMeAseIhNuTmhM4pIiysmUnr4/+3dYA/ip/WgavlR
        KeY/G4kCGVUovNc3P2zYGc=
Received: from [192.168.1.6] (unknown [120.204.166.56])
        by smtp7 (Coremail) with SMTP id C8CowACnoiZ8YiZf3_bWBQ--.10559S2;
        Sun, 02 Aug 2020 14:51:43 +0800 (CST)
Subject: Re: [PATCH] rtc: interface^ 1969-12-31T23:59:59 is set as rtc_time if
 rtc_time is invalid in __rtc_read_time
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
References: <20200801112007.2148-1-von81@163.com>
 <20200801132813.GE3679@piout.net>
From:   Grant Feng <von81@163.com>
Message-ID: <a83510fa-54be-8dc1-8ec1-b2957346e402@163.com>
Date:   Sun, 2 Aug 2020 14:51:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <20200801132813.GE3679@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowACnoiZ8YiZf3_bWBQ--.10559S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJryUXr1xGw4rKw43Zr4xZwb_yoW8Wr4Upw
        4xKa1qvFWDKw4jqF1Ut34rXa4Fq343C3Z8CrnYy3sIkryUXr97WFZ5urn0q3y5JryxCwn8
        t393WF4fCFyDCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jMhFxUUUUU=
X-Originating-IP: [120.204.166.56]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/xtbBSR90OlaD7oLWyQAAs+
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,


On 2020-08-01 21:28, Alexandre Belloni wrote:
> On 01/08/2020 19:20:07+0800, Grant Feng wrote:
>> 1969-12-31T23:59:59 is an error more clear than Invalid argument
> Definitively not, 1969-12-31T23:59:59 is a valid date and should not be
> returned when it is known the current date is not set in the RTC.
'rtc_valid_tm' is used to check rtc_time and 1969-12-31T23:59:59 is invalid.
when the RTC clock is not set, some rtc devices always return '0' or almost
random data, and different rtc devices may give different return data.
so, I think, it's usful to return a default date when the current date is
not set in the RTC.
>> For example, when the RTC clock is not set, it will print a kernel
>> error log every time someone tries to read the clock:
>>          ~ # hwclock -r
>>          hwclock: RTC_RD_TIME: Invalid argument
>>
>> It's clear and easy to understand what happened if print
>> 1969-12-31T23:59:59 in this situation：
>>          ~ # hwclock -r
>>          Wed Dec 31 23:59:59 1969  0.000000 seconds
>>
> How do you know this is an error an not what is actually set on the RTC?
'rtc_valid_tm' will check rtc_time when someone set the RTC, the time
should not be earlier than 1970-1-1T00:00:00. so 1969-12-31T23:59:59
can not be actually set on the RTC.
     When someone get
~ # hwclock -r
Wed Dec 31 23:59:59 1969  0.000000 seconds
     he knows: the RTC time doesn't match my watch, change it now.
but still lots of people don't know what happened if they see
~ # hwclock -r
hwclock: RTC_RD_TIME: Invalid argument


Grant Feng
Embedded Linux and Kernel engineering
RTCHIP Information Technology (Shanghai) Co., Ltd.


