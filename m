Return-Path: <linux-rtc+bounces-180-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E77DE62C
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Nov 2023 19:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C7A1C2082F
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Nov 2023 18:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C121862B;
	Wed,  1 Nov 2023 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cdd3Y9sR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B871429C;
	Wed,  1 Nov 2023 18:54:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97092ED;
	Wed,  1 Nov 2023 11:54:11 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D85CE0003;
	Wed,  1 Nov 2023 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698864850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3sZj6RniyTzoHCodRr2i/ntz4jNs4JFrcHctmS81hg=;
	b=cdd3Y9sRN8ttWyWYp4CktTx2h/eFQ4OzABlsf8uGELdQDyy4ZLTgQpLoQW2XFiinuPJHXW
	RBWEDFR/7TXz2KOELIFqMaFIuN87guCVLfRaEZ2WkYKUJGe2NIcPHSTPUyyxIRW7qLMMpr
	x/l4nfgGrrMf4WWlXWkrokf5igp3s34oN562NLrpUwAeV9atz5NOJFpDWO3LBuqIDzCcCA
	4rIuyKnglUtAkHwI1Xeo8m0/zt3TxovMLAOr7sYgdO1qncnQfbqblUZaLcI22Xf0ay6had
	L5Ltk/H2PXKdO/Tos5XGraWcb+wnP6t8a8mtDv5lB1CBHR/XZZYrx48SbvWPYA==
Date: Wed, 1 Nov 2023 19:54:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Miclaus, Antoniu" <Antoniu.Miclaus@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] rtc: max31335: add driver support
Message-ID: <202311011854099f524c30@mail.local>
References: <20231031153100.92939-1-antoniu.miclaus@analog.com>
 <20231031153100.92939-2-antoniu.miclaus@analog.com>
 <95e41f16-4b5f-4f2a-bc31-17273032312b@roeck-us.net>
 <CY4PR03MB3399DEF73E052036AC7EDBA99BA0A@CY4PR03MB3399.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY4PR03MB3399DEF73E052036AC7EDBA99BA0A@CY4PR03MB3399.namprd03.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 31/10/2023 16:28:07+0000, Miclaus, Antoniu wrote:
> > According to the register map above, the chip does support
> > low and high temperature limits as well as over- and undertemperature
> > alarms and interrupts. I would suggest to add support for all of those.
> > You might also consider adding support for temperature alarm interrupts
> > and report temperature alarm events by calling hwmon_notify_event()
> > if a thermal event occurs.
> 
> I've sent in the first version of this patch series a cover letter:
> 
> "Although the datasheet is not public yet, the driver can be made public (on
> other linux custom trees it is already).
> 
> The driver was tested with actual hardware and works.
> 

Did you run rtctest? Please provide the output.

> Even though the datasheet is not available, if there are any queries about
> the functionality of the part, these can be provided/inserted as code comments
> inside the driver."
> 
> The reason why I am rushing this a bit is because the customer that uses the
> driver wants the driver released and mainline kernel compliant.
> 
> This is an initial version of the driver covering the main use cases (which were
> requested, therefore actually used).
> 
> Additional features can be added afterwards, if requested.
> 
> > 
> > > +
> > > +	hwmon = devm_hwmon_device_register_with_info(&client->dev,
> > client->name,
> > > +						     max31335,
> > > +						     &max31335_chip_info,
> > > +						     NULL);
> > 
> > There is no "depends on HWMON" in the Kconfig entry, meaning this will fail
> > to compile if HWMON=n or if HWMON=m and RTC_DRV_MAX31335=y.
> >
> 
> Will do in v4.
> 
> > Guenter

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

