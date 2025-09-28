Return-Path: <linux-rtc+bounces-5033-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C9BA6615
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Sep 2025 04:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BC807A2821
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Sep 2025 02:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311A124887E;
	Sun, 28 Sep 2025 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGzJMNKh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18634BA2D
	for <linux-rtc@vger.kernel.org>; Sun, 28 Sep 2025 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759025363; cv=none; b=BteearGogt76PSTzriXzNW5aWn6h9iwQw//jeNsu12J7+cUt240bHG+H2zBEm4sifxlJVGzvgLxaZbV42rmFs3wdP/UElI/vm4bIPunmSIrQvjtBMeWI8QmPwyfc4mMp9JOiaR2pubgDGoWYbnUrqGKLp8KAOqEYqL0lIPYvNb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759025363; c=relaxed/simple;
	bh=GUSKUxYpWhOeHcuugkxc4tLA+jsAQdmXAEPQQnQote8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2fWmHWXlBwwUi4a4qyJo/wYdEtAa3eKp18Ih7zPuEKhL+fgyae1yMWbufEP2FKspIya+26ceoATYegjxxzM9u83FZvQ6GySuSc/ahzPRhdGYW9C8JIBncZNdMO6M2Z/DabcjLItQ8CzmQFCj1T+zglsrl0E7AuUTGUn2dDytlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGzJMNKh; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b556b3501easo2956938a12.3
        for <linux-rtc@vger.kernel.org>; Sat, 27 Sep 2025 19:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759025361; x=1759630161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eFwFGuMoBlO4UnFHFhFZsqW80xbz11TQVfcLYBTWIYY=;
        b=ZGzJMNKhIk1nOdF7BfCPPGuBRUrfVRjFSlz6r2f8RhUP+gWm0hIT5aTYeG3ABgvUhE
         XrLpTqw1a1i0w+GYv3UlXKt4JT7RgBQwRDRY9ClsFR3cx+52m2qaVE8hCxkeHeURt5UA
         VgYymq9YURpH7mdV9nZGW22F2xjQ12CrzLhtFz8sjWRv5nqkoTYsd0WYWROKBnEKYUXU
         L/aat4XOhYTzLnkcF5KBx3jzbs20X90aH2VWXe7zzS9OtBsCxqNzZGk6Tg7QyxABaQyU
         2eJpD5zIVxEWNG+XdQlR11EqANm74xRiFIP8lFOrL/xA0ar2u6ll2S3HEa9mInTwSufJ
         Mewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759025361; x=1759630161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFwFGuMoBlO4UnFHFhFZsqW80xbz11TQVfcLYBTWIYY=;
        b=XgwCz5Z/uQ29mmJoISDqAZXD6QuvwpATnVONI9J4ZnYsPBS4aGlXUqf74X8k5KxO0U
         d4SzryyO0e0wl65pb/S6jHYRPMQN+HeoJqoLP8vKWSnx4ovWkH8zuXYbUjFbXnthu9Sm
         hMOmM9rh63cBjzmAu9XNCaIHYgVUT50r9tXilGv9pEmDf8YoWXBQPXKqaOqIIyVd3xwx
         9Gw8aWnTYHKjxuZ8f0uOFOlX4UWzsxTAnznFaAf8rjHnin9riq6NJFmGFVokMfcIKIGa
         p/dG0GK/gBbMPA6VT2iK99xXpiJ6EQ2RUAtv9Ns3DeNjUj3Pf1OiLSsLSqHp0imOTjc3
         ZLcw==
X-Forwarded-Encrypted: i=1; AJvYcCXgjAZ3LCqN1uzJenzwySCLaQnNfBm8zop1MZfA1920+juFbclWLMv7XQmm4q8BKun6weWtPDUpFkY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Ja95QLAYyvPNAsWy22jn7LivmjmTs/dqRCGND5n0rPzFoJWj
	j8tOKswCc1A1wBISsuauGgPRuPCdFtGIhXf2EYdtLMG8ehzHYjaYGUTb
X-Gm-Gg: ASbGncuT17Mxg3e39NNbGuOeoF/ZFUMMajGZHW4jXzgcMKfVXVWVrwsXM+L5Z9g4GQJ
	cO/jy9DijfP7IcpqlG4+7IjgmEE7ldGHv8z/+ZIFDsTnQLbutSHeepPzDvliQmFSdjdccUhgpjf
	EOIgmiaR3ZarCMoKnI4hQBoUkl8dmkQKqgi5Am58AQ4amNoRj4HOHLZk0NSfuQeK5tX2ufUiTz7
	uIUMeqQ1Hj6fnOgJwEsT7i99A3tGoNRnq4tYBSZuVxQJSiV0nKLwl4UfFEjk9VCtZ6e8WrseipQ
	LA0xG3La7TZVBSQLFgh0CBtqvKF8KDn4B02HDPvUApaJPn6MAUos0AYOucx782rFOG7cVKxuwoJ
	qPBz2m9GhgLbr+W3goXjG6rr9/R6UpwNmPY70Il7Ig3WPC7MfpdqkqklGUZy++iChlTfT0Hg=
X-Google-Smtp-Source: AGHT+IENLcEnP9fle5P0/XBhhJQoZV1aQkW9RdCjU8CtjMNudeKurmLux3aZ05laluYZdZcozVy1ig==
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr131587345ad.61.1759025360628;
        Sat, 27 Sep 2025 19:09:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ae693fsm90315405ad.152.2025.09.27.19.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 19:09:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <827f50ac-9994-4e04-bf48-51774f5d504b@roeck-us.net>
Date: Sat, 27 Sep 2025 19:09:18 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
To: James Calligeros <jcalligeros99@gmail.com>, Janne Grunau <j@jannau.net>,
 Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250925204925.GA637503@robin.jannau.net>
 <CAL_JsqK-9n3_H6vS80bZuZiSPi9UNuMzHEPFL_EzYTeyNS1cYg@mail.gmail.com>
 <2537878.PYKUYFuaPT@setsuna>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2537878.PYKUYFuaPT@setsuna>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/27/25 17:36, James Calligeros wrote:
> Hi Rob,
> 
> On Friday, 26 September 2025 7:43:23 am Australian Eastern Standard Time Rob
> Herring wrote:
>> On Thu, Sep 25, 2025 at 3:49 PM Janne Grunau <j@jannau.net> wrote:
>>> On Fri, Aug 29, 2025 at 11:40:57AM -0500, Rob Herring wrote:
>>>>
>>>> This should be something like this:
>>>>
>>>> "^current-[A-Za-z0-9]{4}$":
>>>>    $ref: "#/$defs/sensor"
>>>>    unevaluatedProperties: false
>>>>
>>>> With the $defs/sensor being:
>>>>
>>>> $defs:
>>>>    sensor:
>>>>      type: object
>>>>      
>>>>      properties:
>>>>        apple,key-id:
>>>>          $ref: /schemas/types.yaml#/definitions/string
>>>>          pattern: "^[A-Za-z0-9]{4}$"
>>>>          
>>>>          description:
>>>>            The SMC FourCC key of the desired sensor. Must match the
>>>>            node's suffix.
>>>>        
>>>>        label:
>>>>          description: Human-readable name for the sensor
>>>>      
>>>>      required:
>>>>        - apple,key-id
>>>>        - label
>>>>
>>>> Though in general, 'label' should never be required being just for human
>>>> convenience.
>>>
>>> That does not sound as it would be compatible with skipping nodes in the
>>> driver if the node misses label. The driver could of course fall back
>>> to create a hwmon sensors without labels.
>>
>> The driver absolutely should.
> 
> The original submission (and our downstream version) do this, but I changed
> it for v2 per Sven's feedback [1]. Outside of development/experimentation,
> we will (should) never have a sensor in the Devicetree of uknown utility.
> If we know what a sensor is for, then we should have a label for it.
> 

Label attributes are optional in hwmon drivers. Period.

Guenter


