Return-Path: <linux-rtc+bounces-862-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362388B34F
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Mar 2024 22:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8510B44FA1
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Mar 2024 20:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626C33C6A4;
	Mon, 25 Mar 2024 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qsIxgB6H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2291C6B6
	for <linux-rtc@vger.kernel.org>; Mon, 25 Mar 2024 20:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711397005; cv=none; b=AjBSp9SEi2Kae8A62TyL3r432L+uwbpRNiZwRe4IkSWNUjAb6WqQtDqgcbG+DWvsDCwkljLmeSpT9HdNGW98zcF4K9NQjWnGsooLwDbgZ1hYIYrTa8/bbYmiN9jS3MLVVdaRz/wkUs8hlN0BzPmt3SxApHAqcskM8/3XJcFnNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711397005; c=relaxed/simple;
	bh=TwMkeWpclzXCBkaal+VQMnS9QReh1wKoO0peqGbyf/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwVwwPqGQYRoILfudl1nSRs3NEsgvATFdIdf0xp4V6KiLrFCKDBr0bzP0YVauE9lJFRsZpjLb0aynQ7zRs/bvAnzkCjP/JRK2hdzALzA/JPoIyiW86KfETua0IcnGrsPmuZiWgaJ7XFAkH6QozxtdbToAbk9+c/jEwjAjlQV5zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qsIxgB6H; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5101cd91017so5653423e87.2
        for <linux-rtc@vger.kernel.org>; Mon, 25 Mar 2024 13:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711397002; x=1712001802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6S8/Z0ZYfA3UwpibszhHRIh0e1eVZX+vgAmFfeoHkFo=;
        b=qsIxgB6H2VHeu7571Vlfbumm8s2uaSsOGiQO4rilLYb/gp+dUuhXkmMH+MpU9x83wg
         C83erg6tKEvWbOQF0N8bOj+sspwibZ1mP9M8Ev3ifr3kSINoszmSJMB9vEHfs8ARcadV
         3JuOcayCBe6WyfvpNZbjWDzoKPzI6J33Oza/f1dV0F7/dpKWLJkUZcxbHhYiGhzZMG4j
         MrWNG3lMNH9QZ/UvO058iAJBRmPH3oST1Gpdygtog13O/unBxrFHADBm/OPnl/LX1N8z
         1j6n8lgdegoFe9uIkvSHNeMPKAVGvEp3AVomUmNmebOK2Eka6Z3SS5k1RhHgy0QK8UtQ
         GJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711397002; x=1712001802;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S8/Z0ZYfA3UwpibszhHRIh0e1eVZX+vgAmFfeoHkFo=;
        b=jSqVLSoFh6bpcSZ8UO5walQjxnOws9xTjAn3JO0wALlTmc52etxle9meRu3z/nRQEc
         2C0AiJl4G1pW86qoJ0j/sk1tiJH4U3jCGddTpxyaRhw1jA1SgX2iRFyCDRMC7W3IJr9L
         hOtBjIYfAN9enZaWnsB9ujANxkRfUtk3v3C5VPl5Pn2SgrcVq5ykl9dS4rOM34qYqMOJ
         A/6PuIjroSFsCzzJTjm5rInzPjiIQjd0o53U2UE7TSDnCYrhDdASGfDQMSR9w2kNJwj4
         LXOOOzP/ggcHCGOh47llq1QO11IpQLZ/wQbDTa2wMN2x/QjHkJ+BWysBpI5cb0tr+0Xb
         2/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU/WRz3sLIhOly7IAlwn01FmbkQGZaO6xvF/Y3w4yzHrKPTyDvjSgrYwKWsygJG1FtAx0l0SAPEysIOeQwwfca3FxwlWpQZKr+k
X-Gm-Message-State: AOJu0YxDEJjB+/I9sbIOeM6Y8P7iT5CSZ2ka0A+7zEYY9kes5hEORbNs
	ntQXpH2RuvBymysMNGzdtjhsIiMrsbX2kIT4WfNPdAu0GKwsbWH6jMf/GREup2Q=
X-Google-Smtp-Source: AGHT+IHrybv2fqHhJdRG93g9c2PPfKonICcZTLUfioe8ulodjCCsGaBWJUrjag++cCzvT4P64Ykvtw==
X-Received: by 2002:a05:6512:44b:b0:513:d49a:7a0d with SMTP id y11-20020a056512044b00b00513d49a7a0dmr5366460lfk.42.1711397001502;
        Mon, 25 Mar 2024 13:03:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709061ecc00b00a46d04b6117sm3385907ejj.64.2024.03.25.13.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 13:03:20 -0700 (PDT)
Message-ID: <82e54af1-c2d2-4cc3-b8cc-a90a4f74795e@linaro.org>
Date: Mon, 25 Mar 2024 21:03:19 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: rtc: digicolor-rtc: convert to dtschema
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Rob Herring <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240323-rtc-yaml-v1-0-0c5d12b1b89d@gmail.com>
 <20240323-rtc-yaml-v1-3-0c5d12b1b89d@gmail.com>
 <20240325160152.GA4035876-robh@kernel.org>
 <f765a609-529c-4987-812f-9135041f63d5@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f765a609-529c-4987-812f-9135041f63d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2024 20:46, Javier Carrasco wrote:
> On 3/25/24 17:01, Rob Herring wrote:
>> On Sat, Mar 23, 2024 at 11:46:15PM +0100, Javier Carrasco wrote:
>>> Convert existing binding to dtschema to support validation.
>>>
>>> The binding has been renamed to match its compatible. Apart from that,
>>> it is a direct conversion with no additions.
>>>
>>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>> ---
>>>  .../devicetree/bindings/rtc/cnxt,cx92755-rtc.yaml  | 37 ++++++++++++++++++++++
>>>  .../devicetree/bindings/rtc/digicolor-rtc.txt      | 17 ----------
>>>  2 files changed, 37 insertions(+), 17 deletions(-)
>>
>> This could probably just go into trivial-rtc.yaml.
>>
>> Rob
> 
> Does it make no difference if the reg property is a single address or
> address + size? trivial-rtc.yaml does no specify that ('an address' is
> mentioned), and I don't know if it is obvious for someone who wants to
> use this device.

First, you can answer to this by yourself: where do you have the "size"
documented? You will see that nowhere, because your description is
actually redundant and should be dropped. So if "nowhere", then your
binding is the same as trivial-rtc.

The presence of size is defined by the bus, not by this binding.
Therefore you do not have to tell anyone that it is address+size,
because it is obvious from the bus. And from device datasheet (bindings
are not replacement of datasheets).

Best regards,
Krzysztof


