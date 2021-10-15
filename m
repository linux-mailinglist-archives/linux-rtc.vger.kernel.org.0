Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4499342FD2C
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 23:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243034AbhJOVCC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 17:02:02 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:37390 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231621AbhJOVCC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 17:02:02 -0400
Received: from [77.244.183.192] (port=63076 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mbUIz-007DZ3-HN; Fri, 15 Oct 2021 22:59:53 +0200
Subject: Re: [PATCH 4/8] rtc: max77686: remove useless variable
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-5-luca@lucaceresoli.net> <YWm7VpFY3LABdKmn@piout.net>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <61be8df2-cec5-8df0-425d-aae458710112@lucaceresoli.net>
Date:   Fri, 15 Oct 2021 22:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWm7VpFY3LABdKmn@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 15/10/21 19:33, Alexandre Belloni wrote:
> On 11/10/2021 17:56:11+0200, Luca Ceresoli wrote:
>>> rtc_24hr_mode is set to 1 in max77686_rtc_probe()->max77686_rtc_init_reg()
>> before being read and is never set back to 0 again. As such, it is de facto
>> a constant.
>>
>> Remove the variable and the unreachable code.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>  drivers/rtc/rtc-max77686.c | 11 +----------
>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
>> index 7e765207f28e..9901c596998a 100644
>> --- a/drivers/rtc/rtc-max77686.c
>> +++ b/drivers/rtc/rtc-max77686.c
>> @@ -99,7 +99,6 @@ struct max77686_rtc_info {
>>  
>>  	int rtc_irq;
>>  	int virq;
>> -	int rtc_24hr_mode;
>>  };
>>  
>>  enum MAX77686_RTC_OP {
>> @@ -278,13 +277,7 @@ static void max77686_rtc_data_to_tm(u8 *data, struct rtc_time *tm,
>>  
>>  	tm->tm_sec = data[RTC_SEC] & mask;
>>  	tm->tm_min = data[RTC_MIN] & mask;
>> -	if (info->rtc_24hr_mode) {
>> -		tm->tm_hour = data[RTC_HOUR] & 0x1f;
>> -	} else {
>> -		tm->tm_hour = data[RTC_HOUR] & 0x0f;
>> -		if (data[RTC_HOUR] & HOUR_PM_MASK)
> 
> So I guess HOUR_PM_SHIFT and HOUR_PM_MASK can also be removed

Sure. Coming in v2.

Thanks.
-- 
Luca
