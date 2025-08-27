Return-Path: <linux-rtc+bounces-4779-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25FB383FA
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 15:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2ED11B25F89
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEAA3451A9;
	Wed, 27 Aug 2025 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEALOf62"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC31DB12E;
	Wed, 27 Aug 2025 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756302479; cv=none; b=UjIa4AWNbAlo78TLtbkgEI/boQCubrPE4LgOaUNL8GqDcZLEIXbAtoUP/eJtqM/0VYDSxwZ9ECpsh/hAIgToWED+qVAsr0e78qBNN+Ge22xybdwxQWZO0ye6MiTbIp0m2rBS09Oopdh4/58vBXAAMloqr6V7g51cDu3Mxkj4vRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756302479; c=relaxed/simple;
	bh=Q2kWy223TtDyBh5b0lBxmJlvbzdjq0H7lgLMA0oDvgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lf1RkeVD3XzzzQ+4K5FGr5MOghPUMUAEfLPBixTbyPH91hG7Zx10kF25L/WRzbSgtuHzG52fmU4vIiRCG/q02W4hXesI0i7JBg0D5jDU14OhHn4EDjD/5n+v5r2Wb5SHnj+RKPi/Vx4mKcRepKvrfoFCbhYQh0pRBHuotqOFcIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEALOf62; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77057266cb8so2885884b3a.0;
        Wed, 27 Aug 2025 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756302477; x=1756907277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+68jqkom7ymf+dc7lhIHptXHMKzlsdjsRXHdgDb0NzE=;
        b=HEALOf62ybMvgO5H0FYE//3uSpwFgaNa9bcUfZzUcPvz4skkRbMyrrL+nzgVzsyd+c
         nZACE6bcR3u+ZtHYSYD0SvaRzb7H9FXT4NLOSAfkrtAE6QDhtvPuOgbmEbiXcovazS/p
         deyV0okqBC1cLUa8GURGBhgOmFlQYWQdg/+wRRxzrpFxpcRpqee2NYtKkOlG5dPPnh7t
         QdGMwqJ3AItYqM74jWmS6RX2GPObJ8YLzLjk88ABKxBAz0rGFX3DuVAl7F/L+3ItXYJk
         VOc0HAxI2C6oPRrFgK9KFBoTjrnC7+7NvGA3W3OgPuTINUfTcZ7GEBo7AMYHCQa5MW83
         G30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756302477; x=1756907277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+68jqkom7ymf+dc7lhIHptXHMKzlsdjsRXHdgDb0NzE=;
        b=ljWfjwLQOkUYkuaOzzuFlP/MSbiU7Bznnzgtecjy71pMJGQuvHs09BbaMXHedl/l+k
         5CtdajRUVVEDgobCthxPCKjoGEhStRlK+ma5QAYBGa9yAFvKx0IrWYgli/6nNtsRFG/z
         Xdh7URdgrohadLifclChYrWgnzykdCe0+bEQsJ6ywFr1McP0PrB5UD7uKVjcx34P0PmS
         BkEL79xcedhVNeb28ZkFr8DNesFv6RS6taI55uvpf1uf5mP/MynAGq42tKAN97kd8Dyx
         gXzwuIitzKnXE2TFH6CWiZAk4XyDaVEDGps0/UlROJRurXAVTfnYmq62ao3a5sRjE7Zs
         0c3w==
X-Forwarded-Encrypted: i=1; AJvYcCUHYteEyeMUGok2xr28LfonLaiU+QcITsLTRmxfp/7anBGJrqnLdippuAU0WDZrWIZdBDTAIzXhOESDT5w=@vger.kernel.org, AJvYcCUKNMxECJvp8ZA3Bhp9o3JAfNo/cB9vVPUnvc4P0l5uWduN010qOxI3j6wuMiX8vRRwLqBMUGwa5yjA@vger.kernel.org, AJvYcCUUY7jaI8KJ5CGnq9XdSWyU4Z8YmNBjU5QSk87bImwwXNMp7Ab/5THrqnWedfKFSl1QFNUVqumFF/ZFRN8=@vger.kernel.org, AJvYcCUf7z81h/2ND+tTK3D0qUA8kYSJQGDGw/LmxHWgXfry230/DafHgsyoAcA6K4rrEY9Rq8cmrxWJdGff@vger.kernel.org, AJvYcCW32oFiAEDnNfOz8BL+8bFZoM0RL9AkYwjhDJg02R08PBNRhVmltylaLm8jSc8lvUE0jcFtt5OMM2wNR6D2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf8NTjofQYOuXi1iakbKVzB0GTr0Rx/ZzeYTiNzXCZI6TWWUnU
	RH+dSt1CMJ3cFOzR324b68i5hz3v+DY21fvi1k8xh6lUSkbJdhdTxNuX
X-Gm-Gg: ASbGncu/Gxwtpe1lBck+JkVevbyILLpwm0/3bVfcTbB48x/+I9797CmhcsQcuni+qPG
	wDfo98WZTQDux/8cUeOlMW6A3JidFD7iFoL3u3WWmt1NzaYcymtt1REMAgR/Fbrh2F/ugyC1N4x
	82byOEkFSngBYXjbsN3JWT/XdyAVCrTbGmZ31mO6c5RIejIXAJw7dK7mSmUT2TYfll2e6lpFYqN
	uIljsJHftrN9UBLg7rRw6fcX8imrnSJMKO2RceORJpBqxsug9uxdawOn5KJqVOSbmBtuSlPYD2W
	o7lDWqTfrzevbJlnOZ8Hx8jO0+/vJyBRlYiji7qGuTQ0XTPeiQusmO0BXsxS5Wu4d5Ulpwrllmd
	Pbg2Fa7rYcRRd99zE6/ykuTcIFQENwLjyri9ehaGsajJOJoIRTmOigS5o1lHsewvTdWDxFh0=
X-Google-Smtp-Source: AGHT+IHik3mb95sJ568CGTsdPS/CQ24nrUfptjUVBYoUytndAsfD759RewY3gwgGvt5dnMPGc3VNlg==
X-Received: by 2002:a05:6a00:1892:b0:770:fd32:f365 with SMTP id d2e1a72fcca58-770fd32f6a9mr13554066b3a.25.1756302476548;
        Wed, 27 Aug 2025 06:47:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401b190asm13360764b3a.74.2025.08.27.06.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 06:47:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net>
Date: Wed, 27 Aug 2025 06:47:52 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
To: James Calligeros <jcalligeros99@gmail.com>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
 Hector Martin <marcan@marcan.st>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/25 04:22, James Calligeros wrote:
> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 
> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> The hwmon function is an interesting one. While each Apple Silicon device
> exposes pretty similar sets of sensors, these all seem to be paired to
> different SMC keys in the firmware interface. This is true even when the
> sensors are on the SoC. For example, an M1 MacBook Pro will use different
> keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
> necessitates describing which keys correspond to which sensors for each
> device individually, and populating the hwmon structs at runtime. We do
> this with a node in the device tree. This series includes only the keys
> for sensors which we know to be common to all devices. The SMC is also
> responsible for monitoring and controlling fan speeds on systems with fans,
> which we expose via the hwmon driver.
> 
> The SMC also handles the hardware power button and lid switch. Power
> button presses and lid opening/closing are emitted as HID events, so we
> add a HID subdevice to handle them.
> 
> Note that this series is based on a branch with three additional commits
> applied to add the parent SMC nodes to the relevant Devicetrees. This
> was done to silence build errors. The series applies cleanly to 6.17-rc1.
> 
> Regards,
> 
> James
> 
> [1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
> Changes in v2:
> - Added Rob's R-b tag to RTC DT binding
> - Removed redundant nesting from hwmon DT binding
> - Dedpulicated property definitions in hwmon DT schema
> - Made label a required property for hwmon DT nodes
> - Clarified semantics in hwmon DT schema definitions
> - Split mfd tree changes into separate commits
> - Fixed numerous style errors in hwmon driver
> - Addressed Guenter's initial feedback on the hwmon driver

Don't you think that is a bit useless ? You might as well say "Addressed
feedback comments" and be done with the change log.

Guenter


