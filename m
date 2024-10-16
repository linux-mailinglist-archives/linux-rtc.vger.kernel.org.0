Return-Path: <linux-rtc+bounces-2219-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8069A0B27
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 15:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD2911C2296F
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Oct 2024 13:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97336208D7D;
	Wed, 16 Oct 2024 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="Lw5HtMEg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576A25234
	for <linux-rtc@vger.kernel.org>; Wed, 16 Oct 2024 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084539; cv=none; b=I+2vG2LEr5x6n38sNtTZb9FqdL77oAyM6DX+8fJ80Yve+rsqvT6udcDjgOVHhr4Q+0jESNeFpHRYFZNvBeYvX4d7LHvOA1aPjxPgiboRbAEsPCS5bUcfctWG6nbNrMVfWRukljhQdSwemxnbpjjWVjM5Re7UN2c8z3PO3pRHFjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084539; c=relaxed/simple;
	bh=pbHJdYq3Cl6bsiTqD2H2t0/S+/hLDft0ZLgCKnlO4+U=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MgvF2olkRMoQisIaywINl+FkNeKTFV0eGDnSz0VmJGp4PVFYToYTiTO2G0FL7H+E/gxR57+dSv8IKl8SjQ+l727+cooBian8d8chrW6qNtyjq3Pm0WibSd2DtGEUQFll2fic0xgniKWXA07a/VLG+LbYHvYLIQog7yP6w1VHYss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=Lw5HtMEg; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b14077ec5aso72571385a.1
        for <linux-rtc@vger.kernel.org>; Wed, 16 Oct 2024 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1729084536; x=1729689336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnXUgF95/LKVBB0GjZAyL4bfQKFXiH3SHgWxlYsd26k=;
        b=Lw5HtMEgtKKgdH4eyuePsNtzM375boN+RAI5i+ophGeBNWrJF0qRGUN19VTE56a1O9
         +tU4X6ad7Y8CR4n4zf2uiTb8RwmVFPIS/9Pbsofh5T2d415gyyjC3gkwMLmILDJZqHhJ
         dnHATqJ9fpM/jlRmZ7EeqZZI0Yrmis2z4P9zi4mBDIbrWNhy5sB7Woww6JDCI3TPZVVv
         xx3RKlg8NyXFGQathvxiX4G13A5AdXzbkOFlDzt0c/0t4udC+LPDc4wTox/f28OxkD6A
         i36iIwCObRlh61WxD7wDGeRZGQ6+2Hv1cirWhL26pbhkBvn1RCISgLN27Sr1RUn/1YM9
         lGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729084536; x=1729689336;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnXUgF95/LKVBB0GjZAyL4bfQKFXiH3SHgWxlYsd26k=;
        b=HNkEAu6SiWCf1ciTN9nfyInXfrPLE4ym5dvpkEvNvXWw1ja7wpu1DqIUMXglF6gNvo
         aZ0MrWKZkkBXnglXQTxxoXf/ESWDKAOOl8wLd1CATMqkiwkmrfqi7bxeIFy2KlvWdEsp
         Y/lZjjdgF7Og+H9kaZ6bagf3YWBBz0TQsldJ/rH75TIgncuRSKk2SsuJjVgnai+VwEkb
         qKIf9gtgQwoyps0gbiQFqOxOuAqUdDmj5UrYilpuqC80XkibMC9wBfibeOvVn3WsE3hR
         a+FW0rLetCOlqns4aZ9vPHFQMTVTVPztxhz6dG01a6JNoAXUXwVsdM0NgExycfhuQqj2
         t6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVygDRgm9DHFPglQT8tMpd818keDATAnO0i3BDuWrWFvkoX591xRueXbDBH4APrVnf4UDVGatSaDUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIRu3Vm5mSSptEvtygvIbAHn61QFBcYbmHjI6MB68g9/HA0eDl
	dc3Heae7ZpYhw0K9S6F/LW3WJgqnUMp4RmapHOn8fMeSHhkS3b113XyBPWhIZzRBrxM6f8FI4zr
	ADb0=
X-Google-Smtp-Source: AGHT+IGS5fUx6e6JC++mu954E0arTgZMh5pUZB0wjKyczky28hg9nAS8gt4UigcgEiM5CHpaQq/Idg==
X-Received: by 2002:a05:620a:29c3:b0:7a9:ae0c:b6d5 with SMTP id af79cd13be357-7b11a3792b9mr3022886585a.9.1729084536316;
        Wed, 16 Oct 2024 06:15:36 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1418e4725sm127984985a.125.2024.10.16.06.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 06:15:35 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] rtc: pm8xxx: implement qcom,no-alarm flag for
 non-HLOS owned alarm
To: Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-2-jonathan@marek.ca>
 <Zw9gZkLPMB9ZBQlh@hovoldconsulting.com>
 <682acd15-58c5-6bdf-f913-0940a2733451@marek.ca>
 <Zw-5TA9SZtZ_gSIP@hovoldconsulting.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <8c8df288-cb8c-2e59-a570-e8dcf39a367f@marek.ca>
Date: Wed, 16 Oct 2024 09:12:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Zw-5TA9SZtZ_gSIP@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/16/24 9:02 AM, Johan Hovold wrote:
>>>>    	int alarm_irq;
>>>>    	const struct pm8xxx_rtc_regs *regs;
>>>>    	struct device *dev;
>>>> @@ -473,9 +474,14 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>>>>    	if (!rtc_dd->regmap)
>>>>    		return -ENXIO;
>>>>    
>>>> -	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
>>>> -	if (rtc_dd->alarm_irq < 0)
>>>> -		return -ENXIO;
>>>> +	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node,
>>>> +						 "qcom,no-alarm");
>>>> +
>>>
>>> Stray newline.
>>>
>>
>> That's not a stray newline?
> 
> There was no empty line between the assignment and check before this
> change, but now there is even though there should not be.
>   

There was no empty line between the "alarm_irq" assignment and check, 
and there still isn't. That empty line separating the new 
of_property_read_bool() line.

I could move both of_property_read_bool() lines together to make it look 
better.

>>>> +	if (!rtc_dd->no_alarm) {
>>>> +		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
>>>> +		if (rtc_dd->alarm_irq < 0)
>>>> +			return -ENXIO;
>>>> +	}
> 
> Johan
> 

