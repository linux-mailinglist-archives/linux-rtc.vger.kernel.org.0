Return-Path: <linux-rtc+bounces-5393-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E4C62DEE
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Nov 2025 09:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8005B35044C
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Nov 2025 08:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E12F31C597;
	Mon, 17 Nov 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIM3ltO1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B531B11D
	for <linux-rtc@vger.kernel.org>; Mon, 17 Nov 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763367129; cv=none; b=CIbWMYDDz+SEjZOOFCt3oLmIOGAwHdQtwPU+UlQzmU1aANKZCxFSU+IoDTsuLHLEx5Z8FnMlJ1rVs01C2QYuidPNyc6WCH7gas9QBnCiQD8XY0HWHSc4+hvaDZnFR2+4u1ljaKt6+jxBRFxGhH6O174Tfu6AmbgnIackEIwzhes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763367129; c=relaxed/simple;
	bh=XHwbf6AOIUXsOmRYZriTih9VqIVu3akhJh3HAnKtjAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O15wceGFggAOlwXj9PqzQGidee5X3E9a0mUBQLynYAkpa0ibmElWuJLTS+t6p7kr0OaYptDRMWRednp/fiz6jLfrB+y6q5KrJTuuy2qRc6e2aBsz64dknthbtRwUrtkjzii5L+fIXfQgMDX4y/iO5DqT49H0FQcTPUayQFjwsGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIM3ltO1; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5957db5bdedso3641738e87.2
        for <linux-rtc@vger.kernel.org>; Mon, 17 Nov 2025 00:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763367125; x=1763971925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNezKY4OK1RUkmmO61fiaJ8SOz15t0AD4hDvMzPpJVU=;
        b=mIM3ltO1JCXOTXPJfKEXWf2BSZG2mBHB68G8pBekQdqxWaXxcaf7dto27e8WEippb2
         3wAfyQ8nOvqjsUPIbEglFnCA6DWI9UoQRbsKMqnHNR4QvG7Mp+UzZ0ZADADwx1XrS/t9
         QD+h+UN7jm+heHmecqTGEKdoO1OnubPj7o6cBg7s7ghR1djfIJeZQrDVKxOkVeovEhyQ
         HDVI/XC7kMQw2Ic00mu1TrAzhcCF2vsMVVET4usBPfv9gRuMyBQPdtbi40ScNtC9DTpq
         J6Wjr16nWOf1E/Vm7JRy1m4TW78h5kTzA2HNsMo0Jv8hZwqUiDNuIjyhWQio0BA1o1Rq
         69Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763367125; x=1763971925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNezKY4OK1RUkmmO61fiaJ8SOz15t0AD4hDvMzPpJVU=;
        b=Wr13hd/iwugkb8JoM7CXufHyYytTKAejptHLMyO9p5XZIPZugbWmW8ztWQkby7jiHg
         yRfZnl3dv7xieB4ytPFY3emgKUw7yjTHCOEcsxpoRP8qkfOIDYKp61yE07tfJtWW+rUB
         mIXqALbtCJQbmo2iempKmlLchVRuX9vUFO5mAC2D5+R/deiYJtNsImiK5c87FbTdYCQb
         oAhGSw6ge616gsn61Afsnyh4Vx5mY4WTBBnC/KpaxvZ98ET+bt76hs46sTJMaQNJ0dKt
         xjofzGmKci1ZslUu5Kf7SsXC2kwiJQSy92czsOjmX7r4bPF3NjZZPSIMpdf79nVb7mZm
         jQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO5/Q3Ah8dQVsr4x/uL2aLFItFySV1FCnN7f+pfqMQ5SxGqzaI2UqlWIr8RxRccytVT8hvUTyFE6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlfYnB0TmY38aHYkcrQjiy+sBeVe9cT8LRRjLGAsQR69PvLiJC
	ALaVM4pncLFY3iWjSDmrYPuS9W++S2FCDXPhXiTMEJALlI1CK10y9zpL
X-Gm-Gg: ASbGncsLG2zgQWOMymnSfDBnxEcgVvFR4NMC/D0UERN2SvuGGm7qIzJFlksqWJeU40w
	j/ga4GNOe4PGPoIxVy68117gNjUWnGI2g5nxfT+dVQ4kSbLk78iGS/X/nxGc5Mq5cGDmCskHV1P
	E8rm+RP5QQDEJt17myHk9buYRl6P7LReHOd9zNkNgFCD9jBB6q1XgVk9HQ4N64X1/Vl1mUhAGvq
	lJl9dFRZ66uJlD1VPvAsZtaxwSh5o/jGRjqTPpJTQI1nzQ1VJdaEeayyZhv1HC9wzkOn2u+VGan
	9iEpleY5emE8OXQJXJviEYKpbavzrXJQodbCt/DxcgueFNyF5ndMTC8LAFlytBjjGVmTpqoObuH
	g19Nz9qdoKRxO0KkdEgMmqW6o0hk/BOC+J2G9ObnW8r+AnW0gW5hClg5HC4lH7DPdFzn1KY4U6u
	qX4hvesVlj+gv0aegHsAnQ
X-Google-Smtp-Source: AGHT+IEluVZi6T3T+marIDimIkV/AzoU/n4XMrn+z0vTNbD0dmB4jEXr6UBisTSPipCj2YPh+iwoQw==
X-Received: by 2002:a05:6512:2342:b0:595:8200:9f8f with SMTP id 2adb3069b0e04-595841b7044mr3304921e87.18.1763367124335;
        Mon, 17 Nov 2025 00:12:04 -0800 (PST)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac88bsm3067407e87.12.2025.11.17.00.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:12:03 -0800 (PST)
Message-ID: <32303b95-3fd5-44c4-bb7d-e2957a6064fc@gmail.com>
Date: Mon, 17 Nov 2025 10:12:01 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/16] dt-bindings: power: supply: BD72720 managed
 battery
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
References: <cover.1763022807.git.mazziesaccount@gmail.com>
 <ac5a4e992e4fb9c7bffb1e641a7cd61f74af4cba.1763022807.git.mazziesaccount@gmail.com>
 <176303119683.3716572.16868393928566655866.robh@kernel.org>
 <ee36d7d1-ef47-4a35-9aff-baa6ed32105a@gmail.com>
 <20251114163954.GA3399895-robh@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251114163954.GA3399895-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 18:39, Rob Herring wrote:
> On Fri, Nov 14, 2025 at 11:04:27AM +0200, Matti Vaittinen wrote:
>> On 13/11/2025 12:53, Rob Herring (Arm) wrote:
>>>
>>> On Thu, 13 Nov 2025 10:52:19 +0200, Matti Vaittinen wrote:
>>>> From: Matti Vaittinen <mazziesaccount@gmail.com>

//snip

>>
>> So, as far as I understand, the only viable options are expanding the
>> existing battery.yaml with these properties (which I hoped to avoid, see
>> below)
>>
>>>> The right place for them is the battery node, which is described by the
>>>> generic "battery.yaml". I was not comfortable with adding these
>>>> properties to the generic battery.yaml because they are:
>>>>     - Meaningful only for those charger drivers which have the VDR
>>>>       algorithm implemented. (And even though the algorithm is not charger
>>>>       specific, AFAICS, it is currently only used by some ROHM PMIC
>>>>       drivers).
>>>>     - Technique of measuring the VDR tables for a battery is not widely
>>>>       known. AFAICS, only folks at ROHM are measuring those for some
>>>>       customer products. We do have those tables available for some of the
>>>>       products though (Kobo?).
>>
>> or, to add new compatible for the "vdr-battery".
>> AFAICS, adding new compatible would require us to wither duplicate the used
>> properties from battery.yaml here (as battery.yaml mandates the
>> "simple-battery" - compatible) - or to split the battery.yaml in two files,
>> one containing the generic properties, other containing the "simple-battery"
>> -compatible and referencing the generic one. Then the "vdr-battery" could
>> also reference the generic one.
>>
>> Any suggestions for the next path to follow?
> 
> Probably the latter option. You could do the former and make the new
> properties conditional on the "vdr-battery" compatible. That's fine with
> small differences, but gets messy as there are more properties and
> variations.
> 
> But is "VDR" a type of battery though? Is there a certain type/chemistry
> of battery we should be describing where VDR is applicable?

No. Not that I know. My understanding is that the "VDR (voltage drop 
rate)" refers to measured voltage drop-rates under certain conditions - 
which can be used to (more accurately) estimate the remaining capacity 
when battery is nearly depleted. As far as I know, this is only used 
with Lithium-ion batteries (I am not at all sure of this) - but I 
_assume_ the technique could be applied to other type of batteries as well.

> I don't
> think it scales well if we define battery compatibles for every
> variation of charger algorithm. Honestly I don't mind just adding 1
> property. I care more if we allow undocumented properties than
> allowing documented but invalid for the platform properties.

I see. The "VDR" stuff is really tightly bound to the fuel-gauging 
algorithm. It is measured characteristics of the battery - but those 
values are only usable by the "VDR" algorithm. I don't really have a 
good insight in the amount of fuel-gauging algorithm related properties 
suggested to be added during the years - but don't think there have been 
that many of them. So, I am not that worried about adding the 
compatible. On the other hand, there is no technical reason (other than 
adding properties which are unused on many platforms) why not to add the 
vdr tables in the static-battey node without adding own compatible. And, 
reading reply from Andreas (I'll copy it here to answer it in same mail)

/// Below text is form Andreas:
 > just keep in mind, that several kobo devices have one pmic in one board
 > revision and another one in the other (e.g. Kobo Nia rev A vs rev C).
 > But probably the same battery. So if the "vdr-battery" is a compatible
 > just to allow a more properties,
 > then "simple-battery" should be allowed as fallback.

I didn't know Kobos use multiple chargers. Thanks Andreas! So, in that 
sense, adding the "vdr" tables in static-battery node, without new 
compatible, would maybe be simplest solution. Then the charger(s) 
(fuel-gauge(s)) which implement VDR algorithm, can pick the tables while 
those chargers which don't implement the VDR will just ignore these tables.

> When it
> becomes 10, 20, 30 properties, then I might start to care. 

For VDR there are only:

rohm,voltage-vdr-thresh-microvolt,
rohm,volt-drop-soc-bp,
rohm,volt-drop-temperatures-millicelsius

and

patternProperties:
   '^rohm,volt-drop-[0-9]-microvolt':

So, from the binding point of view (.yaml), it's not _that_ lot. In the 
.dts there will be quite some noise as the tables have several values.


> If that
> happens, either we are doing a poor job of generically describing
> battery parameters or chargers and batteries are tightly coupled and
> can't be described independently.

I am under impression that chargers tend to be pretty flexible, and they 
can be configured to work with many different batteries by altering the 
charging profiles. Most of the battery properties (like and charging 
phases [like pre, CC, CV], their limits, currents and voltages etc) are 
very generally usable. So, large subset of charging functionality can be 
handled with standard properties. I believe it is only the fuel-gauging 
where things get more hairy.

I did prepare a series which does the split and adds new compatible for 
the 'rohm,vdr-battery'. (The power-supply class is not yet modified in 
the series, but we would probably want to modify the battery-info 
getters to also accept the 'rohm,vdr-battery' -compatible.)

I wonder if I should actually prepare also a series where these 
properties are just placed in the existing static battery node without 
adding new compatible. That way it would be easier to see which way is 
better.

If I do that, should I only spin these bindings as RFC to avoid the 
unnecessary noise?

Oh, and a big thanks to both of you Rob and Andreas!  I feel this gained 
more clarity after your feedback :)

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

