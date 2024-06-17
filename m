Return-Path: <linux-rtc+bounces-1326-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6824E90A666
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 09:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12C9F1F243B8
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 07:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490CC181CE1;
	Mon, 17 Jun 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dPkeukVi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584D186E47
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 07:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718607852; cv=none; b=WBjIsyTRWXoZk49MLtVvbMQSHgnnFGIMHFnkKYm4TuCsKaMxf2GxdcNSDkgejngtcKkbG32gWF7SmnssgtQgrdD3Doco6+5pbHuw8ToXSAChEBXo2KOO9Y4PZkju2eron4WL5A5xAbKZbf6zX00HgK1X6ptmsbx/IlUya8Yb6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718607852; c=relaxed/simple;
	bh=AktLrWFN6uYaEHm2eLlbIr/ITVmWIbhY3r7zRb7at9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWaaeCneW6Us70pQJMf10YNAhDAnf21gfcuMc3LZnydRhf0Gkj1tG2xzuUGnk8LLVlgxxntpzl1ZOa8xM4Cxv0yakj44YGNNFWXsO0cdCCA/7q1Mcfw6rPPchDzUrS3VWOA63IJX85P0t8J2Dswt2iccWTYg5iaK1zDI3Aa33TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dPkeukVi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00b97so2751328a12.0
        for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718607849; x=1719212649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4op8rIzHP8JvuTAHfHPAy9Ox6rzEQd4/RfOVSiZ2sE=;
        b=dPkeukVimU+Z7QiP8FmUrrJiarxq0ve1JePcKqUhJGQaMpGOHXSRpzbkveFLiTCFdL
         bA8YcAP0vmaH0lgsOtY77R0dbqEuvUYrJIw+xUU7MM7SMxBHgOFMn208adM+mqW1aCLe
         PvEyyXRTlb7X9enYKIJdAIAdyslgOzFd8cjYJMO47U/yCf3Yu7KOfNEYtOOKnWSn458q
         B4SA/sbJy6AdQ2PTYo/m4Imf0NmCq4U0tch/r9IGu/ETrM+LPkWbPRXeHMxIYLB4x1O+
         rKBDPgClJtPh6V5svWDJJFhGyMOGfOuiA3Vh1Se4u6O/EnLjIP2lwr++6yFHWoMolw6t
         ifkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718607849; x=1719212649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4op8rIzHP8JvuTAHfHPAy9Ox6rzEQd4/RfOVSiZ2sE=;
        b=LHF4nlD80aHopM1OcFg/KNjKL7WVdLpEA+jrybLQzrBzm6AELGVRfrdP41/avOsp7D
         p9knjdIDyK2cPCJYozkgMCFyAYI8tH1LQVoTUgKPl5Lf6UkbUYq+kkOXJY6DNSTcqowD
         M2aueHapiAH+bwUk7FnA2N/bKy+aMDgpiGfbM0erkWUs5qpb6zfxAqydPKmqmQW7Hx9h
         t8ScgrIHzvdNFGfFnXJbexjpZZjw7FGe5n23ahb9X+jPxWmiNIPwjqeQZs6UaXm1ZHiS
         3o/hAIQy+grRXo5koayL9OCynC0WQagL2NNj6RccmQjRgxKsmDQerpILe/EDAJYCa3jR
         GXog==
X-Forwarded-Encrypted: i=1; AJvYcCW9gChroinfgVEeoPmn3k2HMvon3cmRBFgdmPf5DEbgK+zX34SGP8Ye1M3HZAh0VN+IICVZkIUgq9dBXOmLXDBIBep7PkC9WjLp
X-Gm-Message-State: AOJu0YxMezwhZzqeH7lCoP1ThNiqvybWFaIxht6HVTnyFDSt7hg/OLfm
	IHGEtVAUzGjbcjb1ShK64BXRyujZp1aompshrCBehzgGD4qqlmQRQhOVegKNOqc=
X-Google-Smtp-Source: AGHT+IF26jBL/MXFko48RwAldivf6KnMYn+dkXyzG1gTNio9sEd7J10HUGxCIpDzL8VV6MHgzlHGig==
X-Received: by 2002:a05:6402:40c5:b0:57c:de6e:75d9 with SMTP id 4fb4d7f45d1cf-57cde6e766dmr2014654a12.32.1718607848890;
        Mon, 17 Jun 2024 00:04:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da785sm5972959a12.28.2024.06.17.00.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:04:08 -0700 (PDT)
Message-ID: <4141ee7f-3f05-48b8-8ea5-97160bb0750d@tuxon.dev>
Date: Mon, 17 Jun 2024 10:04:05 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] dt-bindings: mfd: renesas,rzg3s-vbattb: Document
 VBATTB
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-4-claudiu.beznea.uj@bp.renesas.com>
 <20240615-unhitched-slain-446130658f87@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240615-unhitched-slain-446130658f87@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15.06.2024 15:19, Conor Dooley wrote:
> On Fri, Jun 14, 2024 at 10:19:23AM +0300, Claudiu wrote:
>> +patternProperties:
>> +  "^clock-controller@[0-9a-f]+$":
>> +    $ref: /schemas/clock/renesas,rzg3s-vbattb-clk.yaml#
>> +    description: VBATTCLK clock
> 
> Being a bit of a pedant here, but isn't the address known? 

It is.

> You leaving
> room for future devices with it at a different offset?

Ok, I'll keep it 1c instead.

Thank you for your review,
Claudiu Beznea

