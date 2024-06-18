Return-Path: <linux-rtc+bounces-1349-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E890C86A
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 13:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF0EDB211A3
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 11:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7434205AF4;
	Tue, 18 Jun 2024 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I8Ue0L5e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECFA205AE8;
	Tue, 18 Jun 2024 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718704124; cv=none; b=gOJklyQ0dq58IT2SoZrq80F/ns8yAwUDpObdBaPOHMPhr59JH5dXz0BmB2NXf0eXsE6w31hTI7FhLxR0XXhDAapxQi0of14bIu5wJbZC/6pqw0luPHebJbCqxv8IYyGJHsZojwJCQlbCLEFUnQ3hjddkDMiLA0WdTq1KP81JH5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718704124; c=relaxed/simple;
	bh=H0axk7sYQnFxcFsbFKPt9LR9mO28c9v+ne0HiPTQwUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgC8jyTAz6zixi50CPOOQ75L28u642+4cExBRJCvIT9q0FkhRnh5MX+oyxM510Xky/EzSYVdjP5qq5F4aYfGoF/Ixy8ek0ZYsr45i/hmsb4lObnlcJv6VX2O3EgwAa410WdZw77Go9IFNkVKehwXNmmjyrPQNFu/BFwTcaJsxmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I8Ue0L5e; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 308F1FF804;
	Tue, 18 Jun 2024 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718704114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15inIHt1gmlfPWnF3yZTpAOB2Gu+uRJDd2zBwtmbziQ=;
	b=I8Ue0L5e3NIzh9CsOLnCvaBPR0mPcQu+bdFnltEYUN2+rx6Di3YMP5jxmpxCDGNUYa0ztO
	KNFqY5KTZUQBBRuBSqJu/VRQVGxdA7jnQVDkKohAr5OZlHe8f+3crB1n2GBTeFR7bsOlaa
	LxUo1IQr04WO9Jz1O2nLd1SDUYuDppCoJjCbyxCqyjA/kKFArNeVAXuX8+fiIgSpZpGotY
	pAjCLJMSA+q80aM7Tf7+xyqj4LP1uhYmI+Xi1pKPc9WLhSoOhN/M4AnAbDrOnp0t9b0X8M
	CquidzJe0rZKw+cguaNlfjkQO/FAe3fyHiybBgsYQ6PIjPdp30XQHv54xe47EQ==
Message-ID: <c4ce3a14-fb28-4c34-abc1-9b0ae1c1a82f@bootlin.com>
Date: Tue, 18 Jun 2024 11:48:33 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] rtc: tps6594: Add power management support
To: Thomas Richard <thomas.richard@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Udit Kumar <u-kumar1@ti.com>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Esteban Blanc <eblanc@baylibre.com>, linux-rtc@vger.kernel.org,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org
References: <20240515152827.80185-1-richard.genoud@bootlin.com>
 <20240515152827.80185-2-richard.genoud@bootlin.com>
 <09168a9a-d8a3-43a9-b8cc-fd88cff9db82@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <09168a9a-d8a3-43a9-b8cc-fd88cff9db82@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

Le 14/06/2024 à 15:21, Thomas Richard a écrit :
>> diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
>> index 3f7c5e23cd4c..85933f1519c4 100644
>> --- a/include/linux/mfd/tps6594.h
>> +++ b/include/linux/mfd/tps6594.h
>> @@ -1011,6 +1011,7 @@ struct tps6594 {
>>   	bool use_crc;
>>   	struct regmap *regmap;
>>   	int irq;
>> +	int irq_rtc;
> 
> irq_rtc should be stored in driver data.
I understand your point.
It may indeed be cleaner to separate the rtc-specific data into a 
private struct.

I'll send a v3 with this modification, and I'll let Alexandre decide 
which he prefers.

> 
>>   	struct regmap_irq_chip_data *irq_data;
>>   };
>>   
> 
> Thomas

Thanks !

-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


