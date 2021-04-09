Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABA035A427
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Apr 2021 18:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbhDIQ5B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Apr 2021 12:57:01 -0400
Received: from clab.compulab.co.il ([66.147.238.35]:44228 "EHLO
        clab.compulab.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbhDIQ5B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Apr 2021 12:57:01 -0400
Received: from [37.142.126.90] (port=59202 helo=zimbra01.compulab.co.il)
        by clab.compulab.co.il with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <kirill.kapranov@compulab.co.il>)
        id 1lUuR4-00DNMd-MJ; Fri, 09 Apr 2021 12:56:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id D46C5E81CB015;
        Fri,  9 Apr 2021 19:56:44 +0300 (IDT)
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 07rZaVU9yM8f; Fri,  9 Apr 2021 19:56:44 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
        by zimbra01.compulab.co.il (Postfix) with ESMTP id 0B934E81CB016;
        Fri,  9 Apr 2021 19:56:44 +0300 (IDT)
X-Virus-Scanned: amavisd-new at zimbra01.compulab.co.il
Received: from zimbra01.compulab.co.il ([127.0.0.1])
        by localhost (zimbra01.compulab.co.il [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id op_cb5Yi9Y2L; Fri,  9 Apr 2021 19:56:43 +0300 (IDT)
Received: from [192.168.11.10] (lifshitz-linux.compulab.local [192.168.11.10])
        by zimbra01.compulab.co.il (Postfix) with ESMTPSA id C1D49E81CB015;
        Fri,  9 Apr 2021 19:56:43 +0300 (IDT)
Subject: Re: [PATCH 4/4] rtc:abx80x: Enable xt digital calibration
To:     Pavel Machek <pavel@denx.de>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        phdm@macqel.be, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210328210232.10395-1-kirill.kapranov@compulab.co.il>
 <20210328210232.10395-5-kirill.kapranov@compulab.co.il>
 <20210409104617.GB10988@amd>
From:   Kirill Kapranov <kirill.kapranov@compulab.co.il>
Organization: CompuLab Ltd.
Message-ID: <f18afc2d-a098-0577-12e2-e3f1c0805c45@compulab.co.il>
Date:   Fri, 9 Apr 2021 19:56:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210409104617.GB10988@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - clab.compulab.co.il
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - compulab.co.il
X-Get-Message-Sender-Via: clab.compulab.co.il: mailgid no entry from get_recent_authed_mail_ips_entry
X-Authenticated-Sender: clab.compulab.co.il: 
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Pavel,

Thank you very much for pointing out the issues.
I redesign all the code deeply, as Alexandre Belloni suggested [1], and 
the lines you have mentioned are to be fixed too.
Unfortunately, it takes more time than I supposed.

Thank you again!

-- 
Best Regards,
Kirill Kapranov
Software Engineer
CompuLab Ltd.
[1] https://marc.info/?l=linux-rtc&m=161696606727215&w=2

On 4/9/21 1:46 PM, Pavel Machek wrote:
> Hi!
> 
>> The XT digital calibration feature allows to improve the RTC accuracy,
>> using a Distributed Digital Calibration function.
>> See ch. 5.9.1 of AB08XX Series Ultra Low Power RTC IC User's Guide
>> https://abracon.com/realtimeclock/AB08XX-Application-Manual.pdf
>>
>> Signed-off-by: Kirill Kapranov <kirill.kapranov@compulab.co.il>
>> ---
>>   drivers/rtc/rtc-abx80x.c | 145 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 145 insertions(+)
> 
> 
>>   
>> +static const int xt_freq_nom = 32768000; //Nominal XT frequency 32 kHz in mHz
> 
> C-style comment?
> 
> is it 32 kHz or 32.768 kHz?
> 
>> +{
>> +	int retval;
>> +	long Adj;
> 
> Adj -> adj.
> 
>> +
>> +static DEVICE_ATTR_WO(xt_frequency);
> 
> You are adding new user interface, you sould add documentation.
> 
> Best regards,
> 								Pavel
> 								
> 


-- 
Best Regards,
Kirill Kapranov
Software Engineer
CompuLab Ltd.
Tel.: (+972) 48-290-100.Ext 227
Cel.: (+972) 53-9332508
