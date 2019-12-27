Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23FF612BB1C
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Dec 2019 21:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfL0U1B (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Dec 2019 15:27:01 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45230 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfL0U1B (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Dec 2019 15:27:01 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so15213852pfg.12
        for <linux-rtc@vger.kernel.org>; Fri, 27 Dec 2019 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GkUIVOSRB0ui7Tj6XXdW1tapEpmmQozsPyWQm0I5SNk=;
        b=LHI9vvVJi2FkSw3sqZyRb6OmkyjLywchf1TQDsZ3J4vUuI0a4l1RCbrksgR73xsP3I
         u+4sLkRTGpqMUXuyr1xxYf+8QwrizUvbrbX0yJjHVjYV8R6yW2fCkAaGPmCDi87C8nUi
         vm5xWe9ELj1DsGUYw9AwpnXvBICfdEVR1goh70myIVVhAjNur3y4qMsJ13rY6e9vj+LP
         uajymLh5LrI+QNZjbSbU6MzyEaJCXHf4VURcU5KvjNLA9oVL3Dfszxfl+lEZ84fv88zL
         +W+jRKf7a9QJUFtG1lqmE/FsPFaai0Q4yPXnVXayONgcscKaYoKRp06GewcGTZxFpVzu
         Th6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GkUIVOSRB0ui7Tj6XXdW1tapEpmmQozsPyWQm0I5SNk=;
        b=uUczkEjy0SuwIL5MJc7y1ezHO+FRFGNoTXt68ix77/T2N568fszbdSDx/xqx2DK7mE
         a+jcEPnc9sH1VQStEX5DZak10VUfuK7AwrJDjf6j/hQ0NFJlN6/KaWhMfOGDhvUY+rKG
         Zfcd4ZHid4q22QXO9f/TLp2cR9PAqevxm9EFn2LRsAhFBYW6o8P8r0G+1GhS4Xg4/gMt
         uCo2G8tjOcxHDZTwS3LHZGnsJRKlVsZtM1RVLHwSN3Lk1S1zBMmdRhFnR/wqZOix1L0i
         0mLlQXlHmM8ie1l2alTrmOXACWU8QwxtZC7Zi+ZgccKlSvIKjb4BBAG8xQx1GIMjCqCs
         wgsA==
X-Gm-Message-State: APjAAAVFpNaK7h2XbYCyRcKza9Vlf0hggM/YpjDd9lKjpJJjOCpq5PBU
        dHKrN+qCl3cWB6FDnYzaX/5wdg==
X-Google-Smtp-Source: APXvYqzMFuyFFX1cCQquvaHxVqERuVRKvWiCGeNTeYX+5Z9dpHxR068mYwZLO5ITa/OtBjQVFIouOQ==
X-Received: by 2002:a63:f901:: with SMTP id h1mr56630767pgi.445.1577478420181;
        Fri, 27 Dec 2019 12:27:00 -0800 (PST)
Received: from smuckle.san.corp.google.com ([2620:15c:2d:3:8fbe:ee3b:c81d:238d])
        by smtp.gmail.com with ESMTPSA id t63sm42038315pfb.70.2019.12.27.12.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2019 12:26:59 -0800 (PST)
Subject: Re: [PATCH] rtc: class: support hctosys from modular RTC drivers
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        kernel-team@android.com
References: <20191106194625.116692-1-smuckle@google.com>
 <20191106231923.GK8309@piout.net>
 <b96f085b-8a0c-7c71-4fde-8af83d49823a@google.com>
 <20191115133627.GT3572@piout.net>
From:   Steve Muckle <smuckle@google.com>
Message-ID: <e43fd369-f0ad-f8bb-be8a-1a3ca038af44@google.com>
Date:   Fri, 27 Dec 2019 12:26:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115133627.GT3572@piout.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

(accidentally sent as HTML, resending in text)

On 11/15/19 5:36 AM, Alexandre Belloni wrote:
> On 06/11/2019 15:37:49-0800, Steve Muckle wrote:
>> On 11/6/19 3:19 PM, Alexandre Belloni wrote:
>>> On 06/11/2019 11:46:25-0800, Steve Muckle wrote:
>>>> Due to distribution constraints it may not be possible to statically
>>>> compile the required RTC driver into the kernel.
>>>>
>>>> Expand RTC_HCTOSYS support to cover all RTC devices (statically compiled
>>>> or not) by checking at the end of RTC device registration whether the
>>>> time should be synced.
>>>>
>>>
>>> This does not really help distributions because most of them will still
>>> have "rtc0" hardcoded and rtc0 is often the rtc that shouldn't be used.
>>
>> Just for my own edification, why is that? Is rtc0 normally useless on PC for
>> some reason?
>>
> 
> On PC, rtc0 is probably fine which is not the case for other
> architectures where rtc0 is the SoC RTC and is often not battery backed.
> 
>> On the platforms I'm working with I believe it can be assured that rtc0 will
>> be the correct rtc. That doesn't help typical distributions though.
>>
>> What about a kernel parameter to optionally override the rtc hctosys device
>> at runtime?
>>
> 
> What about keeping that in userspace instead which is way easier than
> messing with kernel parameters?

This should ideally happen before file systems are mounted so I don't 
see many alternatives for communicating which RTC should be used. 
Android uses the kernel command line for userspace parameters as well 
and that's an option but that defeats part of the value of doing it in 
userspace IMO. There's also device tree but I'm not sure this belongs there.

Hctosys is also saving and restoring the system time on suspend/resume. 
It seems more efficient to me to do this (which happens very frequently 
on an Android device) in the kernel as opposed to in userspace.

If I set the initial system time from the rtc in userspace but continue 
to rely on the hctosys suspend/resume code, as it stands there will be a 
window after the rtc driver is loaded but before the system time is set 
where if suspend is entered, the correct time in the rtc will be lost.
>>> Can't you move away from HCTOSYS and do the correct thing in userspace
>>> instead of the crap hctosys is doing?
>>
>> Yes, I just figured it's a small change, and if hctosys can be made to work
>> might as well use that.
> 
> The fact is that hctosys is more related to time keeping than it is to
> the RTC subsytem. It also does a very poor job setting the system time
> because adding 0.5s is not the smartest thing to do. The rtc granularity
> is indeed 1 second but is can be very precisely set.
No argument with that, but millions of devices successfully rely on it 
today. AFAICT this simple patch doesn't make anything worse. Together 
with a change to support a kernel parameter for runtime rtc selection, 
it should allow RTC drivers to be modularized on many systems. Can it be 
adopted as a stopgap measure?
