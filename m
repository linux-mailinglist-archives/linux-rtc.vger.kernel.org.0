Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD12139FD3B
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Jun 2021 19:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbhFHRJo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Jun 2021 13:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhFHRJn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Jun 2021 13:09:43 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8ABC061574
        for <linux-rtc@vger.kernel.org>; Tue,  8 Jun 2021 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=pZaV+Jq0oY4EAWaxraxDcoMmnIcgfLCr6Zwhd/9Cj4A=; b=NpIcNoCzghcLhZSg8miJrBF9yb
        bgQEXXTsrYg0AxJ1GE66Pu+ti+xiG3BCkG3bBN8RZDpQi0LF+vQ3nlniBbvorZVJeiUnw3ae9OYWk
        jMIxgSQ+I0wF9+Is+sQ5YbTOHhe0zzD1K7fxtyn00Gbobh2ejq6kqAoSsXuQU6MWwoSLfxMYl79Y9
        UbNMHou6xq2OmvfDQB1YmKcrwWC6srVNoJcpYsOb2D8N3JphFbJZ+CWaCVe6kgY4so+JBo+F0cY8c
        m6v8JpuVcm+QXUmfucPhraXqkOnUyv8YFukpc+LxJIkzUKsNkGCDSYj6H+dV1rD61p5HBD3O18O1R
        f3n/foGw==;
Received: from [2601:1c0:6280:3f0::bd57]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqfCf-009gyf-BC; Tue, 08 Jun 2021 17:07:49 +0000
Subject: Re: [PATCH] rtc: pcf8523: rename REG_OFFSET register
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     kernel test robot <lkp@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
References: <20210606162423.22235-1-rdunlap@infradead.org>
 <YL9hmwsdfX96ZABp@piout.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e78253f6-88f8-7d9b-416c-c48e70785b41@infradead.org>
Date:   Tue, 8 Jun 2021 10:07:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YL9hmwsdfX96ZABp@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 6/8/21 5:24 AM, Alexandre Belloni wrote:
> On 06/06/2021 09:24:23-0700, Randy Dunlap wrote:
>> REG_OFFSET is defined both here and in arch/arm/mach-ixp4xx/, which
>> causes a build warning, so rename this macro in the RTC driver.
>>
>> ../drivers/rtc/rtc-pcf8523.c:44: warning: "REG_OFFSET" redefined
>>    44 | #define REG_OFFSET   0x0e
>>
>> ../arch/arm/mach-ixp4xx/include/mach/platform.h:25: note: this is the location of the previous definition
>>    25 | #define REG_OFFSET 3
>>
>> Fixes: bc3bee025272 ("rtc: pcf8523: add support for trimming the RTC oscillator")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Cc: Russell King <rmk+kernel@armlinux.org.uk>
>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: linux-rtc@vger.kernel.org
>> ---
>>  drivers/rtc/rtc-pcf8523.c |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> --- linux-next-20210604.orig/drivers/rtc/rtc-pcf8523.c
>> +++ linux-next-20210604/drivers/rtc/rtc-pcf8523.c
>> @@ -41,7 +41,7 @@
>>  #define REG_WEEKDAY_ALARM	0x0d
>>  #define ALARM_DIS BIT(7)
>>  
>> -#define REG_OFFSET   0x0e
>> +#define REG_OFFSET_TUNE   0x0e /* offset register is used for tuning */
> 
> All the other defines are using the names from the datasheet, probably
> ixp4xx should be fixed instead?

That would be something like 25 changes in 14 files instead
of 3 changes in one file.

But for both locations, names like REG_OFFSET are just too generic.
They should be more specific so that name clashes won't happen.

-- 
~Randy

