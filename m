Return-Path: <linux-rtc+bounces-2419-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 238019B8D53
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 09:53:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47AAA1C21F0E
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 08:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA46157A55;
	Fri,  1 Nov 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TB+PxxVa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD215687D
	for <linux-rtc@vger.kernel.org>; Fri,  1 Nov 2024 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730451199; cv=none; b=cNLjst9+5dVPruGUPR5Iwl96B23AvKjc4P0rB6K5NHGEhaTLZdG6cG+isNlz3W1t44S476fVrtlTJ4kYZm2VFkaXcS2eAW6Y8oQZU493NL7TcmDOtvwYZKp9vndPa+1gZRAKvUyB0+ndptsMvyl+JvOiQwGio1xynoFCQqR3f84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730451199; c=relaxed/simple;
	bh=kstV2gF0zr5kBHLp1ywmO2z5iBJT5icL+Gz+lQBY48o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KlizY+od+sh+njflSVcE87fAtXg9hxOjjlA3FqY7cR6rQC/CAbu25oL6+d4k+Eb9kvnhjeUAjtKR1WSnabUMAYg2MtEyLN3sS/qCtX/OTBCUF6EI1eqL6UI4XuKuUQMvrrf5gQsXgN8m5QHettXtHGaz8BIVeqkvsrdKj2h8nFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TB+PxxVa; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a86e9db75b9so238546866b.1
        for <linux-rtc@vger.kernel.org>; Fri, 01 Nov 2024 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730451195; x=1731055995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/lzYU0FpFCkrz0oZB5hrlorKli7TkTBu5tvutCnhvA=;
        b=TB+PxxVaG3g9uidZOe+9BsacVZTjeOgDM3qyml0cXwNvuZeZvjkrZkX46szS0bJI7+
         JlvTk/vQrtt9Pdga2TyDGUlXNRJoYcVDQ7A78RRymSuxLXOc5Ep/wcM8spFZkKnyMj3X
         fz0J71IYv+PVdvljBv4tkdWkWZDbCWSOsnByMyJsZwvQemy7lEZnjFBNuxnu9VdZPEqO
         a37RZsMZrLA3D6cVG9IAukHBeOIWI+SED/XfLcIgUo0MNNkrbJG+HCdf20oYqxS1fD54
         MByGixlGRD1atfKD9qAxi5/66U4UvdTd2ngVjRFvcEq9RzXv1jht20puqmnWegLI9IlC
         8yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730451195; x=1731055995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/lzYU0FpFCkrz0oZB5hrlorKli7TkTBu5tvutCnhvA=;
        b=F9H6zo/79FLQ3P6UYc9sZesjJtrbBA4rQEeOM9XoChdWsGFBBeQBsMx/XRziRZoRPC
         k8odViYHEhQEBp8KpO1u3Mahda26RavNgvhKswK5m3LvoG5NWQ3iI/Eg8IM4piChi+13
         NVn7WVsU6r6dRtYVyR1mYWJdL9VhH8rp8JKhIFNuAQiuT+k4cegkWFSAKpZwSXGQXKau
         XdZl/ZgPlLWfG6nsxvbzw5v2aXQc52kGklQhtUTOGe3RpJLYJKTG73gx2rdg7NTQh7qD
         MxhOUlBP/IZOCJwd5kyRvVx6EXZBdevhYHdiZdQRR38fkhAuT5TXtYQKrKFmINqdMw8r
         1UKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE9/0b5siZlMlUY3EmG0HPDuMYYn4ViqVrBWIgyZPHuPzftVbz6NgRHN45/T9jsqHBKJyt/qm90xg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3UNaKarpFNCF+iVhNiOkoOqYB2UIqEQULv/g4O2TVZ0pIPxAj
	wvZQw1QpF9EvYS3pZhsCyWXmmwF06NQJ+cxjTl0qkBRRYd/VyyxDzOGG58omBOs=
X-Google-Smtp-Source: AGHT+IEj3KxbXi2bqvHFQc5tuBqv3rzxtxnuw/COMIJuYYxNFOMzNrLwH0maLO3jY5NZdwEHAAxYkw==
X-Received: by 2002:a17:906:c113:b0:a9a:533b:56e3 with SMTP id a640c23a62f3a-a9e5092a4b5mr640607366b.26.1730451195054;
        Fri, 01 Nov 2024 01:53:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564e96a9sm156826066b.97.2024.11.01.01.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 01:53:14 -0700 (PDT)
Message-ID: <fa63898a-33f2-44ad-88ae-bd125e48b71e@tuxon.dev>
Date: Fri, 1 Nov 2024 10:53:12 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>
 <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
 <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
 <ee94a802-97ec-4a9b-9ca4-5c14e0eba116@tuxon.dev>
 <bcc49824-b350-45d0-af84-8458a28d5eef@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <bcc49824-b350-45d0-af84-8458a28d5eef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31.10.2024 11:46, Krzysztof Kozlowski wrote:
> On 31/10/2024 10:26, Claudiu Beznea wrote:
>> Hi, Geert, Krzysztof,
>>
>> On 31.10.2024 10:43, Geert Uytterhoeven wrote:
>>> Hi Krzysztof,
>>>
>>> On Thu, Oct 31, 2024 at 8:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
>>>>> by the RTC. The input to the VBATTB could be a 32KHz crystal
>>>>> or an external clock device.
>>>>>
>>>>> The HW block diagram for the clock generator is as follows:
>>>>>
>>>>>            +----------+ XC   `\
>>>>> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>>>>>            | 32K clock|      |  |----->|gate|----------->
>>>>>            | osc      | XBYP |  |      +----+
>>>>> RTXOUT --->|          |----->| /
>>>>>            +----------+      ,
>>>>>
>>>>> After discussions w/ Stephen Boyd the clock tree associated with this
>>>>> hardware block was exported in Linux as:
>>>>>
>>>>> vbattb-xtal
>>>>>    xbyp
>>>>>    xc
>>>>>       mux
>>>>>          vbattbclk
>>>>>
>>>>> where:
>>>>> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
>>>>> - xc, xbyp are mux inputs
>>>>> - mux is the internal mux
>>>>> - vbattclk is the gate clock that feeds in the end the RTC
>>>>>
>>>>> to allow selecting the input of the MUX though assigned-clock DT
>>>>> properties, using the already existing clock drivers and avoid adding
>>>>> other DT properties. If the crystal is connected on RTXIN,
>>>>> RTXOUT pins the XC will be selected as mux input. If an external clock
>>>>> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
>>>>> mux input.
>>>>>
>>>>> The load capacitance of the internal crystal can be configured
>>>>> with renesas,vbattb-load-nanofarads DT property.
>>>>>
>>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>>>> --- a/drivers/clk/renesas/Kconfig
>>>>> +++ b/drivers/clk/renesas/Kconfig
>>>>> @@ -237,6 +237,10 @@ config CLK_RZV2H
>>>>>       bool "RZ/V2H(P) family clock support" if COMPILE_TEST
>>>>>       select RESET_CONTROLLER
>>>>>
>>>>> +config CLK_RENESAS_VBATTB
>>>>> +     bool "Renesas VBATTB clock controller"
>>>>
>>>> tristate
>>>
>>> Good point.
>>> However, does it work as a module, or would that break the RTC?
>>
>> On RZ/G3S the RTC counter needs the clock provided by VBATTB.
>>
>> I'll try with this as a module.
> 
> So it will defer, why would this be a problem? This does not look like

No problems with it. I wrongly phrased it. That being said, I'll set
CLK_RENESAS_VBATTB as module along with RTC and do the proper adjustments
in drivers/clk/renesas/Kconfig.

Thank you,
Claudiu


> critical core component, which would halt the system probe (and even
> then systems like Android put everything as modules).
> 
> Best regards,
> Krzysztof
> 

