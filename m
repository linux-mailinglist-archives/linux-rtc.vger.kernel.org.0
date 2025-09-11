Return-Path: <linux-rtc+bounces-4871-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FABB53967
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 18:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58B08566CAC
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Sep 2025 16:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF813570CB;
	Thu, 11 Sep 2025 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YYYKreh/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57A288D0
	for <linux-rtc@vger.kernel.org>; Thu, 11 Sep 2025 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608606; cv=none; b=ub7kHpiyZmQYRTpJQ9BTW/S+aSmrR+wc8Ii8Ws918oVXkwTzVKLmY+SuoJn0uMddE0HHwJ4mQIsjoFAaNve7L5qfDyxhiSnSxx+XZXpIus+ePQEvKNbVFwwY7cR0b/gdNEQzsfM0eJAjPN+XBRT0E/LKNHwoXFak5/6gE+n6mhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608606; c=relaxed/simple;
	bh=oGr1NP+FaJpK/sXC8O9G5aKW1G8kNDUhZmWJSBYSlHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jd5Jyv8/X6r+qnw8svvc40hbnPGmQcMTDU8y9P+2kxDaNoR9tgnL/SSu+f7NNgrga8dSQRwgazXHci8XSWeKOMdQnaUOUbxFjc9x+X3qIeO4r27Q7Y7MsblQh7w3OxwbNyjnmS8W7QnHPz6YsCW+i4ilRwFl0v+HGsFLGhhjMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YYYKreh/; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-408929699eeso4426825ab.1
        for <linux-rtc@vger.kernel.org>; Thu, 11 Sep 2025 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1757608604; x=1758213404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vIx9TAJKLDgZyZ0KM8pnfuvTopILKycVYmXw44N/kos=;
        b=YYYKreh/x6tlWFQXNE1kyIaxd3ehSlY9q5uGQ+QbJOPuZ7KC641xz+AyfnkpPEItxV
         HUPMu5rqakOVcXPdVfqMYQ5tU3R+qzO8wnYdnV1WqYwDJDCVQJGvq6tHTmFVtd8bXbwx
         7mn8aNpDtHKJwB2Y2plNbEGCO7UsWllbYTi0GV/PgYfz7Bk9p7MShQ3VslQILQxr4ixb
         YPKXK9Uf7sZhyJhQ+R2gsagAZYSR1E47bSadaVeInfDBa7D0LmWZ+DRglzW5d25H2Gvc
         4duBmjDj9XIcI/0onwY0Cd6rD38A0huxrkMhLhb/W3nelbzxImbOVYCuqMlAuHb+9l1r
         1M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608604; x=1758213404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIx9TAJKLDgZyZ0KM8pnfuvTopILKycVYmXw44N/kos=;
        b=Dl8opWAsmfZAGwGigICQ6D61AX7bFLyY3T9ZMva3ovagV7OYCbwylCde7CmUO9RWD7
         iNjR4GMUu8zWdSQ6Kjw+KKU0LgcFPs3+6AmhDAJxZuPiVwPUnlvBuKSQQOS1ENYLESWs
         2SPj6RuzdIXXtmywLAXPcCFBuldvoM2dGAWzLo8tBbqxAGwOeUKDzH3LAZ07OoNq+83q
         BHwiV6y7la6JBipXgURjwDAIe1LCaLU4/EFwBKLOsk5KOpFLBkvxlbf3zIfn4bOLUjg+
         y7kStR5tjjwvjJAPmOYNUtssmjHxRU90xCMe0LzO1JlC4QJ360PJ1CrIlCc1+tfK2U4c
         Tq3w==
X-Forwarded-Encrypted: i=1; AJvYcCVuDwEIbi5tQzm9jQsIyYLyNdnjAbBx+2fC7tF7rUu6xXy6vmzSyVTGJyO3Sc8Y4XFyiVxNy/S+rSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtWPBNZdDdv9ENaeaiCVJaA1BQZ2UjPTUiRUUjPBMh/DnF5Exu
	M+L+mCJnlhhYAUn88NH3bt0zhhmpZvyDv0zw1HnvA2TaaPMUty/jvqk5/u1Bl7cGggw=
X-Gm-Gg: ASbGncuPBBCJyPQcFb80TINJPtlRbJBqc3ygO3PJl+GjwutMS3KaTzOWSin77en/u/R
	u29HTDRCyCWunkrDcZvXlQezFhK3Cfw6/6DqJsSmoXsl4fYISOGu+Qk8l6e43Vt+0OEXKHVhgFe
	1eRZ7ILcsIh17LOqUhogmix70o21juORePC18D3aWhKGCLlDoBl3j0q1LcfwHgKdiltVS3dlkQw
	e/QhsL2pP6X7NZM5TqEMLhB50Un1+rr/46poNx0i1QkDuUfaKoB9UacgJOs4VP1FYut3Z9bSy5s
	FGExoIp8STZscPX6Iu+g6oQs+woKYqXH8xsj59+d7fsivD8YKfAdgdjG0IcTm8UtHWYVQRTUCmW
	8ypM5NuuqnqZup3ebrlV2NSzkHvw+88YMS+2kN5ihUCIE7sflkCxX5LqndNmqLw==
X-Google-Smtp-Source: AGHT+IESTZWlrQ1ZzOp78ng5g4AamFP7UoV30m4Ba+h4YJCV6xC2C6gMfXuIzAo8ydU1NiPZGPw6eg==
X-Received: by 2002:a05:6e02:17ca:b0:405:5e08:a3e4 with SMTP id e9e14a558f8ab-4209d40ff0emr3215465ab.1.1757608604054;
        Thu, 11 Sep 2025 09:36:44 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-511f2efc55dsm735646173.1.2025.09.11.09.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 09:36:43 -0700 (PDT)
Message-ID: <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
Date: Thu, 11 Sep 2025 11:36:41 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
To: Lee Jones <lee@kernel.org>, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/3/25 7:19 AM, Lee Jones wrote:
> On Mon, 25 Aug 2025 12:20:49 -0500, Alex Elder wrote:
>> The SpacemiT P1 is an I2C-controlled PMIC that implements 6 buck
>> converters and 12 LDOs.  It contains a load switch, ADC channels,
>> GPIOs, a real-time clock, and a watchdog timer.
>>
>> This series introduces a multifunction driver for the P1 PMIC as
>> well as drivers for its regulators and RTC.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/7] dt-bindings: mfd: add support the SpacemiT P1 PMIC
>        commit: baac6755d3e8ddf47eee2be3ca72fe14ebae2143
> [2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
>        commit: 49833495c85f26d070e70148fd9607c6fbf927fd
> 
> --
> Lee Jones [李琼斯]
> 

Yixun Lan plans to merge patches 5-7 of this series.

That leaves patch 3, which enables regulator support, and patch
4, which adds RTC support.

How should these two patches be merged?  Mark has reviewed the
regulator patch 3 and Alexandre has acked the RTC patch 4.

Thank you.

					-Alex

