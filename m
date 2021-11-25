Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C327645D54D
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Nov 2021 08:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238883AbhKYHUt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 25 Nov 2021 02:20:49 -0500
Received: from mx-out.tlen.pl ([193.222.135.158]:50049 "EHLO mx-out.tlen.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352782AbhKYHSq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 25 Nov 2021 02:18:46 -0500
Received: (wp-smtpd smtp.tlen.pl 28409 invoked from network); 25 Nov 2021 06:28:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1637818132; bh=dm5AajixXHCRSWQL4H2xZWv4TUiiZ2j0GzIFPSh9Avk=;
          h=Subject:To:From:Cc;
          b=kmaaLQ0p+m+BA+aCHCJH2QkxjNBK0NuVTdflOVyTelzjZEKGQSyQ1XCHT9YMOtFeq
           +9TTbFIWKwhsZve//tSpcNv/ArWZyEedYef+IhTkb1pZnLR9jrvmtpMxzjDzST04pk
           fwE9Sqpp0wAsUU1/AhLC89OeVtgSeVtyFM7Jwkd0=
Received: from aaen55.neoplus.adsl.tpnet.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[83.4.117.55])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <alexandre.belloni@bootlin.com>; 25 Nov 2021 06:28:52 +0100
Message-ID: <1b217171-b301-f2fe-f455-9bddabe2e115@o2.pl>
Date:   Thu, 25 Nov 2021 06:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH RESEND v3 3/7] rtc-mc146818-lib: extract
 mc146818_do_avoiding_UIP
Content-Language: en-GB
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20211119204221.66918-1-mat.jonczyk@o2.pl>
 <20211119204221.66918-4-mat.jonczyk@o2.pl> <YZ6/GC3xouzEZmEh@piout.net>
From:   =?UTF-8?Q?Mateusz_Jo=c5=84czyk?= <mat.jonczyk@o2.pl>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>
In-Reply-To: <YZ6/GC3xouzEZmEh@piout.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: fd2290f820c29801a52683fe7f723d61
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000E [QVNk]                               
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

W dniu 24.11.2021 o 23:39, Alexandre Belloni pisze:
> On 19/11/2021 21:42:17+0100, Mateusz Jończyk wrote:
>> Function mc146818_get_time() contains an elaborate mechanism of reading
>> the RTC time while no RTC update is in progress. It turns out that
>> reading the RTC alarm clock also requires avoiding the RTC update (see
>> following patches). Therefore, the mechanism in mc146818_get_time()
>> should be reused - so extract it into a separate function.
>>
>> The logic in mc146818_do_avoiding_UIP() is same as in
>> mc146818_get_time() except that after every
>>
>>         if (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) {
>>
>> there is now "mdelay(1)".
>>
>> To avoid producing an unreadable diff, mc146818_get_time() will be
>> refactored to use mc146818_do_avoiding_UIP() in the next patch.
>>
>> Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>
>> ---
>>  drivers/rtc/rtc-mc146818-lib.c | 69 ++++++++++++++++++++++++++++++++++
>>  include/linux/mc146818rtc.h    |  3 ++
>>  2 files changed, 72 insertions(+)
>>
>> diff --git a/drivers/rtc/rtc-mc146818-lib.c b/drivers/rtc/rtc-mc146818-lib.c
>> index b50612ce1a6d..946ad43a512c 100644
>> --- a/drivers/rtc/rtc-mc146818-lib.c
>> +++ b/drivers/rtc/rtc-mc146818-lib.c
>> @@ -8,6 +8,75 @@
>>  #include <linux/acpi.h>
>>  #endif
>>  
>> +/*
>> + * Execute a function while the UIP (Update-in-progress) bit of the RTC is
>> + * unset.
>> + *
>> + * Warning: callback may be executed more then once.
>> + */
>> +bool mc146818_do_avoiding_UIP(mc146818_callback_t callback, void *param)
> mc146818_avoid_UIP would be a simpler name. 
Right
> Also, I'm pretty sure we can
> avoid the mc146818_callback_t typedef

Do you mean doing something like:

bool mc146818_avoid_UIP(
	void (*callback)(unsigned char seconds, void *param), void *param);

Thanks for reviewing.

Greetings,
Mateusz

>> +{
>> +	int i;
>> +	unsigned long flags;
[snip]
