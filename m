Return-Path: <linux-rtc+bounces-3836-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB43A81541
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 21:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55B2C1899D3A
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 19:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB7C207E0F;
	Tue,  8 Apr 2025 19:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IT4ocMvV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEC2158553;
	Tue,  8 Apr 2025 19:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138861; cv=none; b=QZXSCsMKXKpPIHIbRTKNCr+w9rSYrAxHTzEx/oJDPXx/Kxh6Ntzq0oSEhXmZYYOad430mpCYn0mdecY2J98kAIxFKSjifJxrCY/tbJ58bLIkEJx64ejHclRCldz006usjJxggzJWqSiZlxsSl4rtV3i6EUPxsv+TDj2DNzmMtro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138861; c=relaxed/simple;
	bh=3XZrPac3Hw5S3fai1epjOKmznTRQIETE0iMgnKYeJK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTI7w8e25olQxVvtcgtYCNvmSIfHpSTtyRWu3B7d87DXRSU9Do+bw2mJevSdVY5iaiG5HFJM8luGP8A6O13lTVll4NnDNNKZFrCU0B3wfSVBFLr+q+bJqi7MnIjN7EJBQU3rGmZviQohMygZLC/6QRYC7ScQaE6Fr51Ez7juSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IT4ocMvV; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac297cbe017so1511066b.0;
        Tue, 08 Apr 2025 12:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744138858; x=1744743658; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86qWtNJK63V7fbnn92M5Wwej+llSZGxK/013fMMqHeY=;
        b=IT4ocMvV7MxY11Uiv0mv0vYxtYc08v8d/4c+7D5mApihMYXvAbKq3+Up5faSdvWwz5
         tFNVdKayd74tAhR0dLHrKCfVOqCByOnPapQAbm7lbi6V+XZc6yveeM5Wc4yOrp45iHXl
         3aoE/ITYgf5ugaT2m7iNX4wIuSV5uc2V9doaQvY+GcSXZZwrR5JieCcASAvmVqeYRrXv
         1aKE5FWSfEBD32aDaz1Z8JJmR2/ff6xUvylEYPv3ZV6QojQjASh0OYhneWsmPef592bM
         B5/LK0x5iw/0FQxTVGqKcIe1MIlzCXGeVK3pBXb/Mz48gcjyjbvWMBRFsLLKdGSe2ZeU
         N0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744138858; x=1744743658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86qWtNJK63V7fbnn92M5Wwej+llSZGxK/013fMMqHeY=;
        b=ry4reHhG1g/mRXJPqTgozScwYABFdR6W+6MOQtJRoZKN6snQuPxhUUVs+3EVGZOZCo
         r8rEaCvjNN69+PqSFR/LD30YSmMSgAk+n/Qd+CmUHJSJBWXo2n+wvkHbcdM9bMxGYCcA
         HJnTMOH2XKA+YENCKbgcgzZsJxcdKjIVoojiS4WFrjhCkXkgl+ChTd+8GnrzF8wH15jo
         RyR9caBMxyFRZDFyFaIrYpxpG3/BR+JVmyvNockjrLw8F9UlZfItrYQOUi4FiKCMYqon
         S8xLm0hDIbryVukh9yHsOvwaNtNBrmfcnDuJE2JxiFtp4uoRv/Ns8ImJSmMiwcVVW1mV
         q5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUlHrGXPsVyWBMcSqHE9eQpLdUB4lBGjULZ4zXjIA2cMpfTOq6bVrg1dKPw5Jk/0aSiMYIOxA3iOBiw1KfE@vger.kernel.org, AJvYcCWYJJOxSDdUC8nwW9AhlG+57IQ55ugO+GkUxFqp5T4HxleYDrA3hIGuSRMoFjoKggQBNhiPjN3d5gkH@vger.kernel.org, AJvYcCX6ecMV8zzM3VpEumN4MS8Nfhuk94Wre0fOgEQZC7zTP0lV+HW7Ou7yXpw7U6BeY3TxZoRgUARYLunh@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/OsRjOeXAQCFYBwzKNetqRip28pOu0xpzTwxfNP/NQJpHGfD
	od3nIk78uKQvjuWXIWb9rh8xCQ/JvnQwV5eIJIsL8c5kik1C1krn
X-Gm-Gg: ASbGncu8+bKqSX9/D98wAYkN33Di143CGdWO5TqrVc85KDdhccVSelnVmSRBxF0qUyO
	Xk6FeLboBeMVH1msDAmfvZF38ZG5m+B0SFDhOH81hlYqJRFjenRTqjDjGuy57o4xY7kEXZTQjvW
	fqmPgddVv2K+3e7HKkSpA9RzSsBD+/5hdMLxv0w6SLOm+s7VSrqzBaHKVAMHCd9/1FFOABQIzcl
	Xj0rs0h6Z0dpCE+0iYZHk/AO+ako2B0hlVSt8nJJ4OIb3ekvfHGHyirgZ3iBeAmf8Y384EC9gB3
	Ld2CWZs0QjS5DYCDI/o7X96CWePhDrVXs2KsFE0SXlvDF0XHOGjsFsNjRPAYlzqMryHFvCkPUJh
	KzrF6FdXTnHEAKw==
X-Google-Smtp-Source: AGHT+IG3OUU8/aAdVJYCK6TAljVtxnmldcMJAlzz9XYOf3SCmOSD/fkTD3Wz1wCPcAqWw1fhUjtzJg==
X-Received: by 2002:a17:907:7f0b:b0:ac7:b8d3:df9c with SMTP id a640c23a62f3a-aca9bfb1039mr16449566b.1.1744138857536;
        Tue, 08 Apr 2025 12:00:57 -0700 (PDT)
Received: from antoni-VivoBook-ASUSLaptop-X512FAY-K512FA ([37.161.107.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d46esm976543366b.19.2025.04.08.12.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:00:56 -0700 (PDT)
Date: Tue, 8 Apr 2025 21:00:27 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: alexandre.belloni@bootlin.com
Subject: Re: [PATCH 2/3] rtc: pcf85063: add support for RV8063
Message-ID: <20250408190027.4odmg77f2f33i5f5@antoni-VivoBook-ASUSLaptop-X512FAY-K512FA>
References: <20250407193521.634807-1-apokusinski01@gmail.com>
 <20250407193521.634807-3-apokusinski01@gmail.com>
 <b42d082e-0568-4d2c-849c-a0b9ab762afd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b42d082e-0568-4d2c-849c-a0b9ab762afd@kernel.org>

On Tue, Apr 08, 2025 at 08:14:36AM +0200, Krzysztof Kozlowski wrote:
> On 07/04/2025 21:35, Antoni Pokusinski wrote:
> > Microcrystal RV8063 is a real-time clock with SPI interface. Its
> > functionality is very similar to the RV8263 rtc.
> > 
> > Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> > ---
> >  drivers/rtc/Kconfig        | 21 ++++++-----
> >  drivers/rtc/rtc-pcf85063.c | 74 +++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 85 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 838bdc138ffe..1b9be96faa13 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -483,15 +483,6 @@ config RTC_DRV_PCF8523
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called rtc-pcf8523.
> >  
> > -config RTC_DRV_PCF85063
> > -	tristate "NXP PCF85063"
> > -	select REGMAP_I2C
> > -	help
> > -	  If you say yes here you get support for the PCF85063 RTC chip
> > -
> > -	  This driver can also be built as a module. If so, the module
> > -	  will be called rtc-pcf85063.
> > -
> >  config RTC_DRV_PCF85363
> >  	tristate "NXP PCF85363"
> >  	select REGMAP_I2C
> > @@ -971,6 +962,18 @@ config RTC_DRV_PCF2127
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called rtc-pcf2127.
> >  
> > +config RTC_DRV_PCF85063
> 
> Why? This breaks the order.
>
I moved this config entry to the "SPI and I2C RTC drivers" section,
because the driver supports now both I2C and SPI devices.

> > +	tristate "NXP PCF85063"
> > +	depends on RTC_I2C_AND_SPI
> > +	select REGMAP_I2C if I2C
> > +	select REGMAP_SPI if SPI_MASTER
> > +	help
> > +	  If you say yes here you get support for the PCF85063 and RV8063
> > +	  RTC chips.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called rtc-pcf85063.
> > +
> 
> 
> ...
> 
> >  module_exit(pcf85063_exit);
> > @@ -740,3 +811,4 @@ module_exit(pcf85063_exit);
> >  MODULE_AUTHOR("Søren Andersen <san@rosetechnology.dk>");
> >  MODULE_DESCRIPTION("PCF85063 RTC driver");
> >  MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("spi:rv8063");
> 
> Drop and use proper ID tables.
> 
Will fix that in v2, thanks.
> 
> Best regards,
> Krzysztof

Kind regards,
Antoni


