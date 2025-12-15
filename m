Return-Path: <linux-rtc+bounces-5568-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B6CBE169
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 14:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A131A3002FF8
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 13:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBBF2D0C97;
	Mon, 15 Dec 2025 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpIBVJNj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258C427815E
	for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805265; cv=none; b=QTLxJHsO24H55jEd9P4HKqVLpHazMxnVDn4vKF6uHI82Lhx3Za+Tvu4YUmnaWvDE2Kn2EDrGZoWM1C6vX+JEFjsYOvAdBdVNEkBoOGHOkqLsOQiu3XGEe8CDGbU22HoS9ZNlL4WYS8cD9HnifYn7/ZXpEjf9i5YWhgJdIVON8KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805265; c=relaxed/simple;
	bh=Bsr8lXOOTjj/n6mLLqWuV51jaTy3lwf0AoraTFJMdPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0W8VHnCNaTU3w7Cj3wsheDLmiEh902SdWNcxcAQ4WegGj7XXTFuuCsfWpUeOsKUBGC1ZnLwv9C5bOmjNDZW1WUNDtvc6eqFUtbeXC3uEPl2bb3Ngj8qjTyBmOy3A+dxBUoU3Tw6Ij4HS8jQV0L0nXk2xQGvYYbdK8ubRmWBwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpIBVJNj; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so3342222e87.0
        for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 05:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765805261; x=1766410061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmBz14k7F2CZy0azsuA9GLkJkSsaTofyi1phzk7lTs8=;
        b=YpIBVJNjZHQ9bdmFAzaABDq5AZRqGMQMW3xYW9+dxDZIfc6REMbe80koFgXWSjR+y5
         j1RgwXGXUyiIQrPLLm7hkm3DmRJ5eIEAr4J4OANjsoESpXh+QwlCt7OUfMKXZewMHZFB
         k4PfyyCzpgplKEhKZbhP5PtMIyrd1+NcU/1MUCgaf495nm5n5zrcjN5HRADDCFwOwwPo
         DUrOvMzZMcMGxw73kBuB8L/ruXXLL5kR/6V9d0OyLK8StwWNGj11vyOyN1v9d02wZTW1
         0Y/XL6/xAUsRdvzS/ZN+JuApylRdMM6IpNlG8GHwNQuMJ4oc1EdqdukkiNl525lsRuRd
         hsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765805261; x=1766410061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmBz14k7F2CZy0azsuA9GLkJkSsaTofyi1phzk7lTs8=;
        b=cF6+8MsbYdxvzFK01FEJaY6e2sFLEsaEN9+QkZqfxa60wPVdOdzwbOLRXgx1lWMQL5
         NjUWrNxzSZlTPOOTKgfBTG4z6PS0GsMzamcdQ6OH639mh7a5KI7+kXc2ps5up5Nbr6m/
         OLSgA5mMVi/cvrhDskONMKW0HcEeO7ns6O56YsKFiC5x7j7/LAEubrKKI6SxcDt2MjV2
         gEFQMK15HVGkThE9ZdyhwyE3/xndF6XpDMWkEaRIMCXfex4IkXAXBXXcJO/NBCV1d2Fe
         jY7rOiaL3E5YfDtIbvD75NofWYiX9TM+fgX5rEwcHaGiZisO0bIJ1JVW+T4UPoz4mT6u
         gJYA==
X-Forwarded-Encrypted: i=1; AJvYcCX4GIviUJpqvMA8tlCZbGCh61HXlyLrb8+fMfoP/+MWAR55THH2oGrFDP8r8Nvb7UfJZRCYKimbDbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdfe5oT3vjuf6eF5LltZGArYAjlrROC7/FgtoixxZ0nIRCnz/2
	tiz/IGKi66J/H8DP2Fjob7q405joYpg7qrA0JMwwIDy6vIwdq1ZPCxtl
X-Gm-Gg: AY/fxX6SVlD04yzEq0jd91vVnNzNpC9Lq2lvl5A/oCQ61kDnzR8iO6YYBIsB6yhRl3K
	xHd8EU78EwGIQAc5Pt//ilhcRiSvRSkSG2wUhJ0EEp9ysgaBRZhp4VW1u61XtU/ZOZq/BY9CWdo
	+A4NakKWIBAmEz21/EgQn09PMMbo37WYbS4UXbSKLLRJFCUXUQXAlIBGtcCdBOgU/CrADjps8lf
	ke6Sg5ts6w8M4mPNn9XKU5VkVRB9g4sVOdQpAtOZOl5zUoD77YzFErR9pRm2mJMo40q+8HcSO0f
	xSo/yyDBdELdFlT/CK527W99KzuaQyf86i8IoDfa+LnjtA498AMUH1mxluC087RP/LgIvaM2VOX
	+9k/NU1kN1H7fB6Tsk/HoXiF4cLTifh/yR3QD8gFYjlm0cNfIPbSQHasJl7vcgS9KZKDu9xnVI1
	DDMdiyi3AbBoQ90njKqEyJEte42BjRieh9KT0Pacm7r0NF8e1tH9DnHV2W6VMQBqpIW4qJVZ9A9
	00Q/QY=
X-Google-Smtp-Source: AGHT+IHtF9/8gCCfZYm0qwIEIZc0jQIgrSD13Q3Kck8IHizEYRr0Rndx3rb7OqBExae0ujerBryxlg==
X-Received: by 2002:a05:6512:3d1e:b0:598:ea79:a5ca with SMTP id 2adb3069b0e04-598fa644a9dmr3696212e87.15.1765805261049;
        Mon, 15 Dec 2025 05:27:41 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f2f37ae8sm5611235e87.15.2025.12.15.05.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 05:27:40 -0800 (PST)
Message-ID: <a52fe6d9-35fd-4046-aa76-ba4051a47ee5@gmail.com>
Date: Mon, 15 Dec 2025 15:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v6 00/17] Support ROHM BD72720 PMIC
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
References: <cover.1765804226.git.mazziesaccount@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <cover.1765804226.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/12/2025 15:16, Matti Vaittinen wrote:
> Resending the v6

// snip

> This series depends on
> 5bff79dad20a ("power: supply: Add bd718(15/28/78) charger driver")
> which is in power-supply tree, for-next. Thus, the series is based on
> it.

I forgot to update this. The 5bff79dad20a is now in v6.19-rc1, and as I 
wrote above, this is now based on v6.19-rc1, not power-supply tree's 
for-next.

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

