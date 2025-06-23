Return-Path: <linux-rtc+bounces-4339-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BFAE4DCB
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 21:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F609189C208
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Jun 2025 19:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CAB2D4B68;
	Mon, 23 Jun 2025 19:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="S+HkMeiw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819EF2D3A68
	for <linux-rtc@vger.kernel.org>; Mon, 23 Jun 2025 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750708645; cv=none; b=TllTbcn30ZDm3EcwA3byPDr+CgcjTYuEb+fR0wXXs/7UOmh6/lWG/KErAMkiAtPuEW9pjI+NawLhirTSGF0JJxy+kWkCjIKrL5npVbAQwNCrGe91DwW0+hpUwJkVqccWexJ5oQEir13HgKw6VVzibjpm+tNEM40GxD73eu8B2Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750708645; c=relaxed/simple;
	bh=Es1Ftq9XeYJygiQJKvxxzs7y3+Oamn8vfWLNo8sYtQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2+0JjOVMjhptzcE9fKWbcKq05FiL4oZRStfUYiKGToZp2iPSO1lAnxOw/8KCCU8fcs4+J4JI9VPpIlytSZGLiMxj9yYJ7e+gA3m9wNpk7ra5gbnL19UP6xKmPP5ERscAmrJsfEbRiwzP8rhIHEy8Zt5/XCB6lG+3b7xSpXXo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=S+HkMeiw; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddff24fdc4so55856075ab.2
        for <linux-rtc@vger.kernel.org>; Mon, 23 Jun 2025 12:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750708642; x=1751313442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhCtv/W1YilWrYjCUxSunc8+8p4TVEIkoBhp1MF2Z8o=;
        b=S+HkMeiwBPBdMsFluvtSTWEPTXqOrB67bKzSFainLjQpRj6DStAdNCF/7Q0E8f/XUp
         wkOn56iDzB/4QnldMEyRkZ5/+xVfqQOE/DugJJ0D8aG/O6nj8TCFrJ8Zh3CHoUsVR64C
         GQQFqxvTYXRBkEuTSQ2dpluLap2l57IyvAtuSSNvX/mrEEv9mHguvHY/TWxRHtKf64pf
         g+vFaNbOU97DSJ8qMPy7Z724wjcL4Fjd0HhL2WXDt02nKLzjtKSQtE9HYBioSNZsqtXJ
         P9BvoM972g5MLHG3xNtsnkvpJaz+eQDqBAGpLVg2E2UnMzK1rE4TJLsi8hby4Mb/PZlF
         Jonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750708643; x=1751313443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhCtv/W1YilWrYjCUxSunc8+8p4TVEIkoBhp1MF2Z8o=;
        b=ZQi6xNhI2iuOB2FDg8nN0fC9gV78QZQLco5Ltexgq1m5rsdR8EbLqAbCocB2hCz6+T
         F+bm9X8PHP/PioQff1JgQR7tRm728tpjr8We2p05ApmTLK8IlqnUv31d/SnovNPkFyd/
         3hhLq5mYDJGHluZyhh0nK6siFxAtyPBN0QvzzHCcj7x+3wwCC8h9ZItntcCjzboIgrBJ
         eD6SFlM4+2xdcscWt5dmw8aMnhjj+hhL0kyHmvntjHlJlqWwpKSCWd7cp2UWBwfz2mn+
         iel+koiclds2p+vl8FxWaQaNvM4tqFwjzrttoH+I3k7yz0XCx6UHx1oFLNoExFltf7zb
         cVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8RVJBS62FI/n/bdlbBU464DwCwJHJGTNhWP2FmDVDLZX7u1Vfn3QL8qRxL90tvnvvGfi7m+YDsk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPO8ncHVpwwhWZKipPnM9Ay4+rb5dEZ/xCQCsQQrxOSJMX75m
	zlHUTfSRfgICwgD/nZVngn2usBN0kPohNSwO/SF4kRuLaBmz+liEKCztChIQZvgkQzs=
X-Gm-Gg: ASbGncuNUKRseF6SjsnafDq0K0c2ct+J3aRktPRpHee+Dt+x1+e1hCY2usMD7yWBQV4
	6Ntow25Slr/dTPQm6UIpPy5lSnP+Pm9fB5adOGKTKpfJKNRT0Bv5MgaKpVebZqRij4PEHnu/hX3
	3jC8XkRCHnaIVo9Pavs6te/qSXQHMTm9gBwNhlYk0AbY6s4Xvs8G4cJz0o7c+QEbcj7LXPjXgSs
	xtdbrfwWRcs1S4Y4f1X/ot2qt2g57XZn/dYlWpkDhsGoQW2IFEzHSrW7FdpJznBF2PRftQRf52D
	HjcaWB0ltIAKZ9b3r0/dADUpOVKHoULHsSv1EPkFcJbXZ3biE3pOMb5XSOr64Suy7oVUpvajqIX
	u3R5xh8Ff7UEKRBTAwMpGFavOVQ==
X-Google-Smtp-Source: AGHT+IEjrZfqFnrATrpmzrnCBPEt3gJFXHl6kwuKElD8eQ70QsQ57w3LAu8TuunEO8GEQ3e+/ulOLg==
X-Received: by 2002:a05:6e02:3c03:b0:3dd:b808:be68 with SMTP id e9e14a558f8ab-3de38cbfe51mr160467165ab.16.1750708642553;
        Mon, 23 Jun 2025 12:57:22 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de37768c8esm30846015ab.68.2025.06.23.12.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:57:22 -0700 (PDT)
Message-ID: <2f66c3ae-bd55-4835-86a1-1f9daa391e09@riscstar.com>
Date: Mon, 23 Jun 2025 14:57:20 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, lee@kernel.org,
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 troymitchell988@gmail.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
 <d35922c4-fbd0-4d13-9bcd-2688b48c0045@o2.pl>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <d35922c4-fbd0-4d13-9bcd-2688b48c0045@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/25 1:54 PM, Mateusz Jończyk wrote:
> W dniu 22.06.2025 o 05:29, Alex Elder pisze:
>> Add support for the RTC found in the SpacemiT P1 PMIC.  Initially
>> only setting and reading the time are supported.
>>
>> The PMIC is implemented as a multi-function device.  This RTC is
>> probed based on this driver being named in a MFD cell in the simple
>> MFD I2C driver.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Added this driver to the series, in response to Lee Jones saying
>>        more than one MFD sub-device was required to be acceptable
> [snip]
>> +static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>> +{
>> +    struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +    u8 time[tu_count];
>> +    int ret;
>> +
>> +    ret = regmap_bulk_read(p1->regmap, RTC_COUNT_BASE, &time, 
>> sizeof(time));
>> +    if (ret)
>> +        return ret;
> 
> Hello,
> 
> Are you sure that you read the time parts consistently here? I mean:
> is there a risk that the clock is updating below you - so that for
> example during the transition

The documentation says this:

   If need to read the calendar value currently recorded inside
   the PMIC, need to read RTC_COUNT_S first. At the same time,
   this operation will latch all current calendar values to the
   registers RTC_COUNT_S ~ RTC_COUNT_Y.

The RTC_COUNT_S register is the first one read in the I2C
bulk request.  So I concluded that the request would record
a consistent timestamp in all 6 registers.

That said, the downstream code did a loop as you describe.  I
will ask the vendor about this.


Related:  I disabled the RTC while updating (which is what the
downstream code did).  But based on what the documentation says
I shouldn't need to do that either.

   If need to reset the current calendar value, need to
   configure each calendar value (RTC_COUNT_S ~ RTC_COUNT_Y)
   in order. After finally writing the register RTC_COUNT_Y,
   PMIC will update the calendar value configured by the
   current user to the internal timer of the RTC module, and
   so on.

Here too, the last register written in the bulk request is
RTC_COUNT_Y, so again I think a consistent value stored in
the 6 registers will be updated at once.

Either way, I'll make an inquiry about both of these.  I'll
explain what I learned in the next version of this series,
and will update the code accordingly.

> 12:59:59 -> 13:00:00
> 
> you are going to read 12:00:00 or 12:59:00?
> 
> If so, you could for example read the time in a loop until you get
> two same readouts.
> 
>> +
>> +    t->tm_sec = time[tu_second] & GENMASK(5, 0);
>> +    t->tm_min = time[tu_minute] & GENMASK(5, 0);
>> +    t->tm_hour = time[tu_hour] & GENMASK(4, 0);
>> +    t->tm_mday = (time[tu_day] & GENMASK(4, 0)) + 1;
>> +    t->tm_mon = time[tu_month] & GENMASK(3, 0);
>> +    t->tm_year = (time[tu_year] & GENMASK(5, 0)) + 100;
> 
> Is it necessary to use the bitmasks here? Are the higher bits undefined
> in hardware? If so, is it necessary to mask them while writing the time
> in p1_rtc_set_time()?

It is probably not necessary to do the bitmask.  But the upper
bits are marked "reserved" and so I the correct thing to do is
to explicitly ignore them (by masking them off).  Is there a
reason you'd rather they not be masked?

There should be no need to mask them in the set_time() function.
The core code verifies all values are in range before it calls
rtc_class_ops->set_time().  So the upper bits should all be zero
by the time p1_rtc_set_time() is called.

>> +    /* tm_wday, tm_yday, and tm_isdst aren't used */
>> +
>> +    return 0;
>> +}
>> +
>> +static int p1_rtc_set_time(struct device *dev, struct rtc_time *t)
>> +{
>> +    struct p1_rtc *p1 = dev_get_drvdata(dev);
>> +    u8 time[tu_count];
>> +    int ret;
>> +
>> +    time[tu_second] = t->tm_sec;
>> +    time[tu_minute] = t->tm_min;
>> +    time[tu_hour] = t->tm_hour;
>> +    time[tu_day] = t->tm_mday - 1;
>> +    time[tu_month] = t->tm_mon;
>> +    time[tu_year] = t->tm_year - 100;
>> +
>> +    /* Disable the RTC to update; re-enable again when done */
>> +    ret = regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, 0);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_bulk_write(p1->regmap, RTC_COUNT_BASE, time, 
>> sizeof(time));
>> +
>> +    (void)regmap_update_bits(p1->regmap, RTC_CTRL, RTC_EN, RTC_EN);

> Perhaps you shouldn't ignore any errors here - failing to restart
> the clock should make p1_rtc_set_time() return an error code.

I intentionally return any error from the bulk write call.

But you're right:  if that doesn't have an error and re-enabling
the RTC does, that error should be returned.

I'm hoping there's no need to disable the clock after all,
and that will simplify things here.  But either way, I'll
take your suggestion (but still return the first error if
more than one occurs).

Thanks a lot for the review.

					-Alex

>> +
>> +    return ret;
>> +}
>> +
> 
> Greetings,
> 
> Mateusz
> 


